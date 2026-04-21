import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../di/providers.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart' show chatTopologyProvider, roundDetailProvider;
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

const double _nodeWidth = 300.0;
const double _nodeHeight = 200.0;
const double _levelSeparation = 120.0;
const double _siblingSeparation = 40.0;
const double _canvasPadding = 2000.0;

class BranchTreePage extends ConsumerStatefulWidget {
  final String sessionId;
  final String initialFocusRoundId;

  const BranchTreePage({
    super.key,
    required this.sessionId,
    required this.initialFocusRoundId,
  });

  @override
  ConsumerState<BranchTreePage> createState() => _BranchTreePageState();
}

class _BranchTreePageState extends ConsumerState<BranchTreePage> {
  final TransformationController _transformationController = TransformationController();
  final GlobalKey _viewerKey = GlobalKey();
  final Map<String, double> _nodeWidthCache = {};
  bool _hasFocused = false;

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _computeWidthsForTree(TreeNode root) {
    void postOrder(TreeNode node) {
      if (node.children.isEmpty) {
        _nodeWidthCache[node.id] = _nodeWidth;
        return;
      }
      double total = 0;
      for (final child in node.children) {
        postOrder(child);
        total += _nodeWidthCache[child.id]!;
      }
      // 加上兄弟节点之间的间距
      total += (node.children.length - 1) * _siblingSeparation;
      _nodeWidthCache[node.id] = total;
    }
    postOrder(root);
  }
  // ==================== 布局算法 ====================

  double _subtreeWidth(TreeNode node) {
    return _nodeWidthCache[node.id] ?? _nodeWidth;
  }

  void _layoutNode(TreeNode node, double x, double y, Map<String, Offset> positions) {
    positions[node.id] = Offset(x, y);
    if (node.children.isEmpty) return;

    final childWidths = node.children.map((c) => _subtreeWidth(c)).toList();
    final totalChildrenWidth = childWidths.fold(0.0, (a, b) => a + b) +
        (node.children.length - 1) * _siblingSeparation;
    double startX = x + (_nodeWidth - totalChildrenWidth) / 2;
    for (int i = 0; i < node.children.length; i++) {
      final child = node.children[i];
      final childWidth = childWidths[i];
      final childX = startX + childWidth / 2 - _nodeWidth / 2;
      _layoutNode(child, childX, y + _nodeHeight + _levelSeparation, positions);
      startX += childWidth + _siblingSeparation;
    }
  }

  _TreeLayout _computeLayout(List<TreeNode> roots) {
    _nodeWidthCache.clear();
    for (final root in roots) {
      _computeWidthsForTree(root);
    }
    final positions = <String, Offset>{};
    double currentX = 0;
    double maxHeight = 0;

    for (final root in roots) {
      final tempPositions = <String, Offset>{};
      _layoutNode(root, currentX, 0, tempPositions);

      double minX = double.infinity, maxX = -double.infinity;
      double minY = double.infinity, maxY = -double.infinity;
      for (final pos in tempPositions.values) {
        minX = min(minX, pos.dx);
        maxX = max(maxX, pos.dx + _nodeWidth);
        minY = min(minY, pos.dy);
        maxY = max(maxY, pos.dy + _nodeHeight);
      }
      final width = maxX - minX;
      final height = maxY - minY;

      final offsetX = currentX - minX;
      for (final entry in tempPositions.entries) {
        positions[entry.key] = Offset(entry.value.dx + offsetX, entry.value.dy);
      }

      currentX += width + _siblingSeparation;
      maxHeight = max(maxHeight, height);
    }

    final canvasWidth = currentX + _canvasPadding * 2;
    final canvasHeight = maxHeight + _canvasPadding * 2;
    return _TreeLayout(positions: positions, canvasSize: Size(canvasWidth, canvasHeight));
  }

  // ==================== 连线 ====================

  List<(Offset, Offset)> _buildParentChildPairs(List<TreeNode> roots, Map<String, Offset> positions) {
    final pairs = <(Offset, Offset)>[];
    void traverse(TreeNode node) {
      final parentPos = positions[node.id];
      if (parentPos == null) return;
      for (final child in node.children) {
        final childPos = positions[child.id];
        if (childPos != null) {
          pairs.add((parentPos, childPos));
        }
        traverse(child);
      }
    }
    for (final root in roots) traverse(root);
    return pairs;
  }

  // ==================== 节点构建 ====================

  List<Widget> _buildAllNodeWidgets(List<TreeNode> roots, Map<String, Offset> positions) {
    final widgets = <Widget>[];
    void addNode(TreeNode node) {
      final pos = positions[node.id];
      if (pos != null) {
        widgets.add(
          Positioned(
            left: pos.dx,
            top: pos.dy,
            child: _TreeNodeCard(
              roundId: node.id,
              onSwitch: () => Navigator.of(context).pop(node.id),
              onDelete: () async {
                if (await _confirmDelete()) await _deleteNode(node.id);
              },
            ),
          ),
        );
      }
      for (final child in node.children) addNode(child);
    }
    for (final root in roots) addNode(root);
    return widgets;
  }

  // ==================== 删除逻辑 ====================

  Future<void> _deleteNode(String nodeId) async {
    final topology = await ref.read(chatTopologyProvider(widget.sessionId).future);
    final roots = buildTree(topology);
    final target = _findNodeById(roots, nodeId);
    if (target == null) return;
    final ids = _collectSubtreeIds(target).toList();
    try {
      await ref.read(conversationRepositoryProvider)
          .deleteRoundsAndCleanupOrphanAttachments(widget.sessionId, ids);
    } catch (e) {
      if (mounted) AppToast.show('删除失败：$e');
    }
  }

  Future<bool> _confirmDelete() async {
    return await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('删除节点'),
            content: const Text('确定删除这一轮及其后续全部分支吗？'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(true),
                isDestructiveAction: true,
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Set<String> _collectSubtreeIds(TreeNode root) {
    final ids = <String>{};
    final stack = <TreeNode>[root];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      ids.add(node.id);
      stack.addAll(node.children);
    }
    return ids;
  }

  TreeNode? _findNodeById(List<TreeNode> roots, String targetId) {
    final stack = [...roots];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      if (node.id == targetId) return node;
      stack.addAll(node.children);
    }
    return null;
  }

  // ==================== 聚焦 ====================

  void _focusOnNode(String nodeId, Map<String, Offset> positions) {
    if (_hasFocused) return;
    final nodePos = positions[nodeId];
    if (nodePos == null) return;
    final viewerBox = _viewerKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewerBox == null) return;
    final viewerSize = viewerBox.size;
    final nodeCenter = Offset(nodePos.dx + _nodeWidth / 2, nodePos.dy + _nodeHeight / 2);
    final targetOffset = Offset(viewerSize.width / 2 - nodeCenter.dx, viewerSize.height / 2 - nodeCenter.dy);
    _transformationController.value = Matrix4.identity()..translate(targetOffset.dx, targetOffset.dy);
    _hasFocused = true;
    setState(() {});
  }

  // ==================== 构建 ====================

  @override
  Widget build(BuildContext context) {
    final topology = ref.watch(chatTopologyProvider(widget.sessionId));
    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: const Text('分支树')),
      body: topology.when(
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (err, _) => Center(child: Text('加载分支结构失败：$err')),
        data: (topology) {
          final roots = buildTree(topology);
          if (roots.isEmpty) return const Center(child: Text('暂无分支结构'));
          final layout = _computeLayout(roots);
          final positions = layout.positions;
          final canvasSize = layout.canvasSize;
          final pairs = _buildParentChildPairs(roots, positions);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!_hasFocused) _focusOnNode(widget.initialFocusRoundId, positions);
          });
          return InteractiveViewer(
            key: _viewerKey,
            transformationController: _transformationController,
            minScale: 0.2,
            maxScale: 3.0,
            constrained: false,
            boundaryMargin: const EdgeInsets.all(_canvasPadding),
            child: SizedBox(
              width: canvasSize.width,
              height: canvasSize.height,
              child: Stack(
                children: [
                  CustomPaint(
                    painter: _OrthogonalLinePainter(pairs: pairs),
                    size: canvasSize,
                  ),
                  ..._buildAllNodeWidgets(roots, positions),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TreeLayout {
  final Map<String, Offset> positions;
  final Size canvasSize;
  _TreeLayout({required this.positions, required this.canvasSize});
}

class _OrthogonalLinePainter extends CustomPainter {
  final List<(Offset, Offset)> pairs;
  _OrthogonalLinePainter({required this.pairs});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CupertinoColors.separator
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke;
    for (final pair in pairs) {
      final parentCenter = Offset(pair.$1.dx + _nodeWidth / 2, pair.$1.dy + _nodeHeight / 2);
      final childCenter = Offset(pair.$2.dx + _nodeWidth / 2, pair.$2.dy + _nodeHeight / 2);
      final start = Offset(parentCenter.dx, parentCenter.dy + _nodeHeight / 2);
      final end = Offset(childCenter.dx, childCenter.dy - _nodeHeight / 2);
      final midY = (start.dy + end.dy) / 2;
      final path = Path()
        ..moveTo(start.dx, start.dy)
        ..lineTo(start.dx, midY)
        ..lineTo(end.dx, midY)
        ..lineTo(end.dx, end.dy);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _OrthogonalLinePainter oldDelegate) => true;
}

class _TreeNodeCard extends ConsumerWidget {
  final String roundId;
  final VoidCallback onSwitch;
  final VoidCallback onDelete;

  const _TreeNodeCard({
    required this.roundId,
    required this.onSwitch,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId)).valueOrNull;
    final dateText = round == null
        ? null
        : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(round.createdAt));
    final userText = round?.userContent;
    final aiText = round == null
        ? null
        : ((round.assistantContent ?? '').trim().isEmpty ? '（等待回复）' : round.assistantContent!);

    return Container(
      width: _nodeWidth,
      height: _nodeHeight,
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        border: Border.all(color: CupertinoColors.separator, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateText ?? '加载中...',
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (round != null && (round.isIncomplete || round.hasUnseenUpdate))
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                if (round.isIncomplete)
                  const Text('生成中', style: TextStyle(color: CupertinoColors.systemOrange, fontSize: 12)),
                if (round.hasUnseenUpdate && round.isIncomplete) const SizedBox(width: 8),
                if (round.hasUnseenUpdate)
                  const Text('未查看', style: TextStyle(color: CupertinoColors.systemBlue, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: _PreviewSlot(label: 'YOU', content: userText, loading: round == null)),
          const SizedBox(height: 4),
          Expanded(child: _PreviewSlot(label: 'AI', content: aiText, loading: round == null)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: CupertinoButton.filled(
                  onPressed: onSwitch,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text('切换到此分支'),
                ),
              ),
              const SizedBox(width: 8),
              CupertinoButton(
                onPressed: onDelete,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: const Icon(CupertinoIcons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PreviewSlot extends StatelessWidget {
  final String label;
  final String? content;
  final bool loading;

  const _PreviewSlot({
    required this.label,
    required this.content,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    final style = CupertinoTheme.of(context).textTheme.textStyle;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 34,
          child: Text('$label ', style: style.copyWith(fontWeight: FontWeight.w700)),
        ),
        Expanded(
          child: loading
              ? const Text('加载中...', maxLines: 2, overflow: TextOverflow.ellipsis)
              : Text(
                  (content == null || content!.trim().isEmpty) ? '（空）' : content!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
        ),
      ],
    );
  }
}