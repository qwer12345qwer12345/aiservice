import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphview/GraphView.dart';
import 'package:intl/intl.dart';

import '../../di/providers.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart' show chatTopologyProvider, roundDetailProvider;
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

extension SpacedIterable on Iterable<Widget> {
  List<Widget> spaced(double spacing) {
    if (isEmpty) return [];
    return expand((widget) => [widget, SizedBox(width: spacing)]).toList()..removeLast();
  }
}

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
  final GlobalKey _viewerKey = GlobalKey();
  final GlobalKey _targetNodeKey = GlobalKey();
  final TransformationController _transformationController = TransformationController();
  
  final BuchheimWalkerConfiguration _builder = BuchheimWalkerConfiguration()
    ..siblingSeparation = 40
    ..levelSeparation = 78
    ..subtreeSeparation = 50
    ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;

  bool _hasFocused = false;

  @override
  void didUpdateWidget(covariant BranchTreePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sessionId != widget.sessionId || oldWidget.initialFocusRoundId != widget.initialFocusRoundId) {
      _hasFocused = false; // 切换文件/目标时重置聚焦状态
    }
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  String _buildGraphSignature(List<({String id, String? parentId})> topology) {
    if (topology.isEmpty) return 'empty';
    return topology.map((t) => '${t.id}:${t.parentId ?? 'root'}').join('|');
  }

  void _onTargetLaidOut() {
    if (_hasFocused) return;
    
    final targetCtx = _targetNodeKey.currentContext;
    final viewerCtx = _viewerKey.currentContext;
    if (targetCtx == null || viewerCtx == null) return;

    final targetBox = targetCtx.findRenderObject() as RenderBox?;
    final viewerBox = viewerCtx.findRenderObject() as RenderBox?;
    if (targetBox == null || viewerBox == null || !targetBox.hasSize || !viewerBox.hasSize) return;

    final targetCenter = targetBox.localToGlobal(targetBox.size.center(Offset.zero), ancestor: viewerBox);
    final viewerCenter = viewerBox.size.center(Offset.zero);

    _transformationController.value = Matrix4.identity()
      ..translate(viewerCenter.dx - targetCenter.dx, viewerCenter.dy - targetCenter.dy);

    _hasFocused = true;
    setState(() {});
  }

  Future<void> _deleteNode(String nodeId) async {
    final topology = await ref.read(chatTopologyProvider(widget.sessionId).future);
    final roots = buildTree(topology);
    final target = _findIterative(roots, nodeId);
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

  TreeNode? _findIterative(List<TreeNode> roots, String targetId) {
    final stack = [...roots];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      if (node.id == targetId) return node;
      stack.addAll(node.children);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final topology = ref.watch(chatTopologyProvider(widget.sessionId)).valueOrNull ?? [];
    final roots = buildTree(topology);
    final graphSignature = _buildGraphSignature(topology);
    final targetId = widget.initialFocusRoundId;

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('分支树')
      ),
      body: roots.isEmpty
          ? const Center(child: Text('暂无分支结构'))
          : InteractiveViewer(
              key: _viewerKey,
              constrained: false,
              boundaryMargin: const EdgeInsets.all(1000),
              minScale: 0.1,
              maxScale: 3.0,
              transformationController: _transformationController,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: RepaintBoundary( // 🔑 隔离 setState 重建，保护 InteractiveViewer 手势状态
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: roots.map((root) => _RootTreeGroup(
                      key: ValueKey('root-${root.id}-$graphSignature'),
                      root: root,
                      graphSignature: graphSignature,
                      builderConfig: _builder,
                      targetNodeId: targetId,
                      targetNodeKey: _targetNodeKey,
                      onTargetLaidOut: _onTargetLaidOut,
                      onSwitch: (id) => Navigator.of(context).pop(id),
                      onDelete: (id) async {
                        if (await _confirmDelete()) await _deleteNode(id);
                      },
                    )).spaced(40),
                  ),
                ),
              ),
            ),
    );
  }
}

class _RootTreeGroup extends StatelessWidget {
  final TreeNode root;
  final String graphSignature;
  final BuchheimWalkerConfiguration builderConfig;
  final void Function(String id) onSwitch;
  final void Function(String id) onDelete;
  final String? targetNodeId;
  final GlobalKey? targetNodeKey;
  final VoidCallback? onTargetLaidOut;

  const _RootTreeGroup({
    super.key,
    required this.root,
    required this.graphSignature,
    required this.builderConfig,
    required this.onSwitch,
    required this.onDelete,
    this.targetNodeId,
    this.targetNodeKey,
    this.onTargetLaidOut,
  });

  @override
  Widget build(BuildContext context) {
    final graph = Graph()..isTree = true;
    final nodeMap = <String, Node>{};
    final graphToTree = <Node, TreeNode>{};
    final stack = <TreeNode>[root];

    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      final gNode = Node.Id('${root.id}-${node.id}-$graphSignature');
      nodeMap[node.id] = gNode;
      graphToTree[gNode] = node;
      graph.addNode(gNode);
      if (node.parentId != null) {
        final parent = nodeMap[node.parentId!];
        if (parent != null) graph.addEdge(parent, gNode);
      }
      stack.addAll(node.children.reversed);
    }

    return GraphView(
      key: ValueKey('graph-${root.id}-$graphSignature'),
      graph: graph,
      animated: false,
      algorithm: BuchheimWalkerAlgorithm(builderConfig, TreeEdgeRenderer(builderConfig)),
      paint: Paint()
        ..color = Theme.of(context).dividerColor
        ..strokeWidth = 1.6
        ..style = PaintingStyle.stroke,
      builder: (Node node) {
        final tree = graphToTree[node];
        if (tree == null) return const SizedBox.shrink();

        final isTarget = targetNodeId != null && tree.id == targetNodeId;
        final child = _GraphNodeShell(
          roundId: tree.id,
          onSwitch: () => onSwitch(tree.id),
          onDelete: () => onDelete(tree.id),
        );

        return isTarget
            ? _NodeAnchor(key: targetNodeKey, onLaidOut: onTargetLaidOut, child: child)
            : child;
      },
    );
  }
}

class _NodeAnchor extends StatefulWidget {
  final Widget child;
  final VoidCallback? onLaidOut;
  const _NodeAnchor({super.key, required this.child, this.onLaidOut});

  @override
  State<_NodeAnchor> createState() => _NodeAnchorState();
}

class _NodeAnchorState extends State<_NodeAnchor> {
  Size? _lastSize;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || widget.onLaidOut == null) return;
      final box = context.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize || box.size.isEmpty) return;
      if (_lastSize == box.size) return;
      _lastSize = box.size;
      widget.onLaidOut!();
    });
    return widget.child;
  }
}

class _GraphNodeShell extends ConsumerWidget {
  final String roundId;
  final VoidCallback onSwitch;
  final VoidCallback onDelete;

  const _GraphNodeShell({required this.roundId, required this.onSwitch, required this.onDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId)).valueOrNull;
    final dateText = round == null ? null : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(round.createdAt));
    final userText = round?.userContent;
    final aiText = round == null ? null : ((round.assistantContent ?? '').trim().isEmpty ? '（等待回复）' : round.assistantContent!);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 290,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                child: dateText == null
                    ? const _SkeletonBar(width: 160, height: 14)
                    : Align(alignment: Alignment.centerLeft, child: Text(dateText, style: Theme.of(context).textTheme.bodySmall)),
              ),
              const SizedBox(height: 12),
              _PreviewSlot(label: 'YOU', content: userText, loading: round == null),
              const SizedBox(height: 8),
              _PreviewSlot(label: 'AI', content: aiText, loading: round == null),
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

class _PreviewSlot extends StatelessWidget {
  final String label;
  final String? content;
  final bool loading;
  const _PreviewSlot({required this.label, required this.content, required this.loading});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 78,
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 34, child: Text('$label ', style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700))),
              Expanded(
                child: loading
                    ? const _PreviewSkeleton()
                    : Text((content == null || content!.trim().isEmpty) ? '（空）' : content!, maxLines: 3, overflow: TextOverflow.ellipsis, style: textTheme.bodySmall),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewSkeleton extends StatelessWidget {
  const _PreviewSkeleton();
  @override
  Widget build(BuildContext context) {
    return const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _SkeletonBar(widthFactor: 0.92), SizedBox(height: 8), _SkeletonBar(widthFactor: 0.76), SizedBox(height: 8), _SkeletonBar(widthFactor: 0.58),
    ]);
  }
}

class _SkeletonBar extends StatelessWidget {
  final double? width;
  final double height;
  final double? widthFactor;
  const _SkeletonBar({this.width, this.height = 12, this.widthFactor});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;
    Widget child = Container(width: width, height: height, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)));
    if (widthFactor != null) child = FractionallySizedBox(widthFactor: widthFactor, alignment: Alignment.centerLeft, child: child);
    return child;
  }
}