import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphview/GraphView.dart';
import '../../core/utils/time_format_utils.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart' show chatTopologyProvider, roundDetailProvider;
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import '../../di/providers.dart';

class BranchTreePage extends ConsumerStatefulWidget {
  final String fileName;
  final String initialFocusRoundId;

  const BranchTreePage({super.key, required this.fileName, required this.initialFocusRoundId});

  @override
  ConsumerState<BranchTreePage> createState() => _BranchTreePageState();
}

class _BranchTreePageState extends ConsumerState<BranchTreePage> {
  final GlobalKey _viewerKey = GlobalKey();
  final TransformationController _transformationController = TransformationController();
  final BuchheimWalkerConfiguration _builder = BuchheimWalkerConfiguration();

  GlobalKey? _targetNodeKey;
  bool _hasFocused = false;
  int _focusRetryCount = 0;

  @override
  void initState() {
    super.initState();
    _builder
      ..siblingSeparation = 40
      ..levelSeparation = 78
      ..subtreeSeparation = 50
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
    _targetNodeKey = GlobalKey();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _resetViewport() {
    _transformationController.value = Matrix4.identity();
    _hasFocused = false;
    _focusRetryCount = 0;
    _scheduleFocusToTarget();
  }

  void _scheduleFocusToTarget() {
    if (_hasFocused || _targetNodeKey == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focusOnTargetNode();
    });
  }

  void _focusOnTargetNode() {
    if (_hasFocused || _targetNodeKey == null) return;
    final targetContext = _targetNodeKey!.currentContext;
    final viewerContext = _viewerKey.currentContext;

    if (targetContext == null || viewerContext == null) {
      _retryFocus();
      return;
    }

    final targetBox = targetContext.findRenderObject() as RenderBox?;
    final viewerBox = viewerContext.findRenderObject() as RenderBox?;

    if (targetBox == null || viewerBox == null || !targetBox.hasSize || !viewerBox.hasSize) {
      _retryFocus();
      return;
    }

    final targetTopLeft = targetBox.localToGlobal(Offset.zero, ancestor: viewerBox);
    final targetSize = targetBox.size;
    final viewerSize = viewerBox.size;

    final targetCenter = Offset(
      targetTopLeft.dx + targetSize.width / 2,
      targetTopLeft.dy + targetSize.height / 2,
    );
    final viewerCenter = Offset(
      viewerSize.width / 2,
      viewerSize.height / 2,
    );

    final dx = viewerCenter.dx - targetCenter.dx;
    final dy = viewerCenter.dy - targetCenter.dy;

    _transformationController.value = Matrix4.identity()
      ..translate(dx, dy)
      ..scale(1.0);

    _hasFocused = true;
  }

  void _retryFocus() {
    if (_hasFocused || _focusRetryCount >= 8) return;
    _focusRetryCount++;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusOnTargetNode();
    });
  }

  Set<String> _collectSubtreeIds(TreeNode root) {
    final ids = <String>{};
    final stack = <TreeNode>[root];
    
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      ids.add(node.id);
      // 将子节点压入栈中，继续向下遍历
      stack.addAll(node.children);
    }
    
    return ids;
  }

  TreeNode? _findIterative(List<TreeNode> roots, String targetId) {
    final stack = [...roots];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      if (node.id == targetId) return node;
      stack.addAll(node.children);
    }
    return null;
  }

  Future<void> _deleteNode(String nodeId) async {
    final topology = ref.read(chatTopologyProvider(widget.fileName)).valueOrNull ?? [];
    final roots = TreeBuilder.buildTree(topology);
    final target = _findIterative(roots, nodeId);
    if (target == null) return;

    final ids = _collectSubtreeIds(target).toList();
    try {
      await ref.read(conversationRepositoryProvider)
          .deleteRoundsAndCleanupOrphanAttachments(widget.fileName, ids);
    } catch (e) {
      await AppToast.show('删除失败：$e');
    }
  }

  Future<bool> _confirmDelete() async {
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('删除节点'),
            content: const Text('确定删除这一轮及其后续全部分支吗？'),
            actions: [
              TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
              FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('删除')),
            ],
          ),
        ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // ✅ 第一条：复用聊天页框架 Provider，构建整体树框架
    final topology = ref.watch(chatTopologyProvider(widget.fileName)).valueOrNull ?? [];
    final roots = TreeBuilder.buildTree(topology);
    final structKey = roots.length.toString();

    if (!_hasFocused && roots.isNotEmpty) _scheduleFocusToTarget();

    return AppPageScaffold(
      appBar: AppBar(title: const Text('分支树')),
      body: roots.isEmpty
          ? _buildEmptyState(context)
          : Column(
              children: [
                _GraphToolbar(onZoomIn: () {}, onZoomOut: () {}, onReset: _resetViewport),
                Expanded(
                  child: InteractiveViewer(
                    key: _viewerKey,
                    constrained: false,
                    boundaryMargin: const EdgeInsets.all(double.infinity),
                    minScale: 0.1,
                    maxScale: 3.0,
                    transformationController: _transformationController,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Wrap(
                        spacing: 40, runSpacing: 40,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: roots.map((root) => _RootTreeGroup(
                          key: ValueKey('root-${root.id}-$structKey'),
                          root: root,
                          graphSignature: structKey,
                          builderConfig: _builder,
                          targetNodeId: widget.initialFocusRoundId,
                          targetNodeKey: _targetNodeKey,
                          onSwitch: (id) => Navigator.of(context).pop(id),
                          onDelete: (id) async { if (await _confirmDelete()) await _deleteNode(id); },
                        )).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) => const Center(child: Text('暂无分支结构'));
}

// ==========================================
// 🎨 布局层
// ==========================================
class _RootTreeGroup extends StatelessWidget {
  final TreeNode root;
  final String graphSignature;
  final BuchheimWalkerConfiguration builderConfig;
  final Function(String) onSwitch;
  final Function(String) onDelete;
  final String? targetNodeId;
  final GlobalKey? targetNodeKey;

  const _RootTreeGroup({
    super.key, required this.root, required this.graphSignature,
    required this.builderConfig, required this.onSwitch, required this.onDelete,
    this.targetNodeId, this.targetNodeKey,
  });

  @override
  Widget build(BuildContext context) {
    final graph = Graph()..isTree = true;
    final nodeMap = <String, Node>{};
    final graphToTree = <Node, TreeNode>{};

    // 替换为显式栈遍历
    final stack = <TreeNode>[root];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      
      final gNode = Node.Id('${root.id}-${node.id}-$graphSignature');
      nodeMap[node.id] = gNode;
      graphToTree[gNode] = node;
      graph.addNode(gNode);
      
      if (node.parentId != null) {
        final p = nodeMap[node.parentId!];
        if (p != null) graph.addEdge(p, gNode);
      }
      
      // 逆序入栈，保持与原递归一致的从左到右渲染顺序
      stack.addAll(node.children.reversed);
    }

    return GraphView(
      key: ValueKey('graph-${root.id}-$graphSignature'),
      graph: graph,
      animated: false,
      algorithm: BuchheimWalkerAlgorithm(builderConfig, TreeEdgeRenderer(builderConfig)),
      paint: Paint()..color = Theme.of(context).dividerColor..strokeWidth = 1.6..style = PaintingStyle.stroke,
      builder: (Node node) {
        final tree = graphToTree[node];
        if (tree == null) return const SizedBox.shrink();
        final isTarget = targetNodeId != null && tree.id == targetNodeId;

        // ✅ 第二条：复用每页 Provider，构建每个卡片的文字
        return _GraphNodeCard(
          key: isTarget ? targetNodeKey : ValueKey('${tree.id}-$graphSignature'),
          roundId: tree.id,
          depth: tree.depth,
          onSwitch: () => onSwitch(tree.id),
          onDelete: () => onDelete(tree.id),
        );
      },
    );
  }
}

// ==========================================
// 🔵 内容层
// ==========================================
class _GraphNodeCard extends ConsumerWidget {
  final String roundId;
  final int depth;
  final VoidCallback onSwitch;
  final VoidCallback onDelete;

  const _GraphNodeCard({
    super.key, required this.roundId, required this.depth,
    required this.onSwitch, required this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId)).valueOrNull;
    if (round == null) return const SizedBox.shrink();

    final aiText = (round.assistantContent ?? '').trim().isEmpty ? '（等待回复）' : round.assistantContent!;

    return Card(
      child: SizedBox(
        width: 290,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(label: Text('深度 ${depth + 1}'), visualDensity: VisualDensity.compact),
              const SizedBox(height: 10),
              Text(TimeFormatUtils.formatTimestamp(round.createdAt), style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 12),
              _PreviewBlock(label: 'YOU', content: round.userContent),
              const SizedBox(height: 8),
              _PreviewBlock(label: 'AI', content: aiText),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(child: FilledButton.tonal(onPressed: onSwitch, child: const Text('切换到此分支'))),
                  IconButton(onPressed: onDelete, icon: const Icon(Icons.delete_outline)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewBlock extends StatelessWidget {
  final String label, content;
  const _PreviewBlock({required this.label, required this.content});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$label ', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700)),
            Expanded(child: Text(content, maxLines: 3, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall)),
          ],
        ),
      ),
    );
  }
}

class _GraphToolbar extends StatelessWidget {
  final VoidCallback onZoomIn, onZoomOut, onReset;
  const _GraphToolbar({required this.onZoomIn, required this.onZoomOut, required this.onReset});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            const Icon(Icons.tune_outlined, size: 18),
            const SizedBox(width: 8),
            const Expanded(child: Text('缩放、拖拽查看对话分支结构')),
            IconButton(onPressed: onZoomOut, icon: const Icon(Icons.remove_rounded)),
            IconButton(onPressed: onZoomIn, icon: const Icon(Icons.add_rounded)),
            TextButton.icon(onPressed: onReset, icon: const Icon(Icons.center_focus_strong_outlined, size: 18), label: const Text('重置')),
          ],
        ),
      ),
    );
  }
}