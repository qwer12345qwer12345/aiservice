import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/providers.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart' show chatTopologyProvider;
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import '../widgets/tree_widgets.dart';

class BranchTreePage extends ConsumerStatefulWidget {
  final String sessionId;
  final String? initialFocusRoundId;

  const BranchTreePage({
    super.key,
    required this.sessionId,
    this.initialFocusRoundId,
  });

  @override
  ConsumerState<BranchTreePage> createState() => _BranchTreePageState();
}

class _BranchTreePageState extends ConsumerState<BranchTreePage> {
  final TransformationController _transformationController =
      TransformationController();
  final GlobalKey _viewerKey = GlobalKey();
  bool _hasFocused = false;

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  List<Widget> _buildAllNodeWidgets(
    List<TreeNode> roots,
    Map<String, Offset> positions,
  ) {
    final widgets = <Widget>[];
    void addNode(TreeNode node) {
      final pos = positions[node.id];
      if (pos != null) {
        widgets.add(
          Positioned(
            left: pos.dx,
            top: pos.dy,
            child: RepaintBoundary(
              child: TreeNodeCard(
                roundId: node.id,
                onSwitch: () => Navigator.of(context).pop(node.id),
                onDelete: () async {
                  if (await _confirmDelete()) {
                    await _deleteNode(node.id);
                  }
                },
              ),
            ),
          ),
        );
      }
      for (final child in node.children) {
        addNode(child);
      }
    }

    for (final root in roots) {
      addNode(root);
    }
    return widgets;
  }

  Future<void> _deleteNode(String nodeId) async {
    final topology =
        await ref.read(chatTopologyProvider(widget.sessionId).future);
    final roots = buildTree(topology);
    final target = _findNodeById(roots, nodeId);
    if (target == null) return;
    final ids = _collectSubtreeIds(target).toList();
    try {
      await ref
          .read(conversationRepositoryProvider)
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

  void _focusOnNode(String nodeId, Map<String, Offset> positions) {
    if (_hasFocused) return;
    final nodePos = positions[nodeId];
    if (nodePos == null) return;
    final viewerBox =
        _viewerKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewerBox == null) return;
    final viewerSize = viewerBox.size;
    final nodeCenter = Offset(
      nodePos.dx + kTreeNodeWidth / 2,
      nodePos.dy + kTreeNodeHeight / 2,
    );
    final targetOffset = Offset(
      viewerSize.width / 2 - nodeCenter.dx,
      viewerSize.height / 2 - nodeCenter.dy,
    );
    _transformationController.value = Matrix4.translationValues(
      targetOffset.dx,
      targetOffset.dy,
      0.0,
    );
    _hasFocused = true;
    setState(() {});
  }

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
          final layout = TreeLayoutComputer.compute(roots);
          final positions = layout.positions;
          final canvasSize = layout.canvasSize;
          final pairs = TreeLayoutComputer.buildParentChildPairs(roots, positions);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!_hasFocused && widget.initialFocusRoundId != null) {
              _focusOnNode(widget.initialFocusRoundId!, positions);
            }
          });
          return InteractiveViewer(
            key: _viewerKey,
            transformationController: _transformationController,
            minScale: 0.2,
            maxScale: 3.0,
            constrained: false,
            boundaryMargin: const EdgeInsets.all(kTreeCanvasPadding),
            child: RepaintBoundary(
              child: SizedBox(
                width: canvasSize.width,
                height: canvasSize.height,
                child: Stack(
                  children: [
                    RepaintBoundary(
                      child: CustomPaint(
                        painter: OrthogonalLinePainter(pairs: pairs),
                        size: canvasSize,
                      ),
                    ),
                    ..._buildAllNodeWidgets(roots, positions),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}