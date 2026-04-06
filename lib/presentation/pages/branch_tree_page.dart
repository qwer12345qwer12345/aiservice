// presentation/pages/branch_tree_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphview/GraphView.dart';
import '../../core/models/chat_round.dart';
import '../../core/utils/time_format_utils.dart';
import '../../di/providers.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart' show chatSessionProvider, chatTopologyProvider, roundDetailProvider;
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

// ==========================================
// 🟢 第一层：结构层 Provider
// ==========================================

/// 1. 拓扑数据提取器：
/// 将无关内容的字段剔除，使得 AI 回复文本时，该 Provider 产出的 List 完全一样（利用 Freezed 相等性）。
/// 从而切断流式更新向下游的传递。
final _sessionTopologyProvider = Provider.family<List<ChatRound>, String>((ref, fileName) {
  final topology = ref.watch(chatTopologyProvider(fileName)).valueOrNull ?? [];
  return topology.map((t) => ChatRound(
    id: t.id,
    parentId: t.parentId,
    createdAt: 0,
    userContent: '',
    assistantContent: null,
    assistantThinking: null,
    userAttachments: const [],
    isIncomplete: false,
    hasUnseenUpdate: false,
  )).toList();
});

/// 2. 结构树 Provider：
/// 仅依赖干净的拓扑数据。只要新增、删除分支，才会重建整棵树。
final branchTreeStructureProvider = Provider.family<List<TreeNode>, String>((ref, fileName) {
  final topologyRounds = ref.watch(_sessionTopologyProvider(fileName));
  if (topologyRounds.isEmpty) return const [];
  return TreeBuilder.buildTree(topologyRounds);
});

// ==========================================
// 📄 页面主结构
// ==========================================

class BranchTreePage extends ConsumerStatefulWidget {
  final String fileName;
  final String initialFocusRoundId;

  const BranchTreePage({
    super.key,
    required this.fileName,
    required this.initialFocusRoundId,
  });

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

  Set<String> _collectSubtreeIds(TreeNode node) {
    final ids = <String>{node.id};
    for (final child in node.children) {
      ids.addAll(_collectSubtreeIds(child));
    }
    return ids;
  }

  TreeNode? _findTreeNodeById(List<TreeNode> roots, String nodeId) {
    for (final root in roots) {
      final result = _findTreeNodeByIdRecursive(root, nodeId);
      if (result != null) return result;
    }
    return null;
  }

  TreeNode? _findTreeNodeByIdRecursive(TreeNode node, String nodeId) {
    if (node.id == nodeId) return node;
    for (final child in node.children) {
      final result = _findTreeNodeByIdRecursive(child, nodeId);
      if (result != null) return result;
    }
    return null;
  }

  Future<void> _deleteNode(String nodeId) async {
    final roots = ref.read(branchTreeStructureProvider(widget.fileName));
    final targetNode = _findTreeNodeById(roots, nodeId);
    if (targetNode == null) throw Exception('未找到要删除的节点');

    final idsToDelete = _collectSubtreeIds(targetNode).toList();
    final repository = ref.read(conversationRepositoryProvider);
    
    try {
      await repository.deleteRoundsAndCleanupOrphanAttachments(
        widget.fileName,
        idsToDelete,
      );
    } catch (e) {
      await AppToast.show('删除失败：$e');
      rethrow;
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
    // 基础状态监听：标题、加载状态（这些几乎不会频繁改变）
    final sessionTitle = ref.watch(chatSessionProvider(widget.fileName).select((s) => s.valueOrNull?.title ?? '分支树'));
    final hasError = ref.watch(chatSessionProvider(widget.fileName).select((s) => s.hasError));

    if (hasError) {
      return AppPageScaffold(
        appBar: AppBar(title: Text(sessionTitle)),
        body: const Center(child: Text('加载失败')),
      );
    }

    final topologyRounds = ref.watch(_sessionTopologyProvider(widget.fileName));
    final roots = ref.watch(branchTreeStructureProvider(widget.fileName));
    
    final structKey = topologyRounds.length.toString();

    if (!_hasFocused && roots.isNotEmpty) {
      _scheduleFocusToTarget();
    }

    return AppPageScaffold(
      appBar: AppBar(
        title: Text(sessionTitle, overflow: TextOverflow.ellipsis),
      ),
      body: roots.isEmpty
          ? _buildEmptyState(context)
          : Column(
              children: [
                _GraphToolbar(
                  onZoomIn: () {
                    final current = _transformationController.value.clone();
                    current.scale(1.1);
                    _transformationController.value = current;
                  },
                  onZoomOut: () {
                    final current = _transformationController.value.clone();
                    current.scale(0.9);
                    _transformationController.value = current;
                  },
                  onReset: _resetViewport,
                ),
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
                        spacing: 40,
                        runSpacing: 40,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: roots.map((root) => _RootTreeGroup(
                          key: ValueKey('root-tree-${root.id}-$structKey'), // 锁定算法
                          root: root,
                          fileName: widget.fileName,
                          graphSignature: structKey,
                          builderConfig: _builder,
                          targetNodeId: widget.initialFocusRoundId,
                          targetNodeKey: _targetNodeKey,
                          onSwitch: (roundId) => Navigator.of(context).pop(roundId),
                          onDelete: (roundId) async {
                            if (await _confirmDelete()) {
                              try {
                                await _deleteNode(roundId);
                              } catch (e) {
                                await AppToast.show('删除失败：$e');
                              }
                            }
                          },
                        )).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.account_tree_outlined, size: 40),
                SizedBox(height: 16),
                Text('暂无分支结构', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                SizedBox(height: 8),
                Text('当你对历史轮次重新生成回复时，这里会显示完整的分支关系。', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 🎨 Graph 布局层
// ==========================================

class _RootTreeGroup extends StatelessWidget {
  final TreeNode root;
  final String fileName;
  final String graphSignature;
  final BuchheimWalkerConfiguration builderConfig;
  final Function(String roundId) onSwitch;
  final Function(String roundId) onDelete;
  final String? targetNodeId;
  final GlobalKey? targetNodeKey;

  const _RootTreeGroup({
    super.key,
    required this.root,
    required this.fileName,
    required this.graphSignature,
    required this.builderConfig,
    required this.onSwitch,
    required this.onDelete,
    this.targetNodeId,
    this.targetNodeKey,
  });

  @override
  Widget build(BuildContext context) {
    final graph = Graph()..isTree = true;
    final nodeMap = <String, Node>{};
    final graphNodeToTreeNodeMap = <Node, TreeNode>{};

    void addTree(TreeNode treeNode, TreeNode? parent) {
      final currentNode = Node.Id('${root.id}-${treeNode.id}-$graphSignature');
      nodeMap[treeNode.id] = currentNode;
      graphNodeToTreeNodeMap[currentNode] = treeNode;
      graph.addNode(currentNode);

      if (parent != null) {
        final parentNode = nodeMap[parent.id];
        if (parentNode != null) {
          graph.addEdge(parentNode, currentNode);
        }
      }

      for (final child in treeNode.children) {
        addTree(child, treeNode);
      }
    }

    addTree(root, null);

    return GraphView(
      key: ValueKey('graph-${root.id}-$graphSignature'), // 图布局器不再因节点文本变化而销毁重建
      graph: graph,
      animated: false,
      algorithm: BuchheimWalkerAlgorithm(builderConfig, TreeEdgeRenderer(builderConfig)),
      paint: Paint()
        ..color = Theme.of(context).dividerColor
        ..strokeWidth = 1.6
        ..style = PaintingStyle.stroke,
      builder: (Node node) {
        final treeNode = graphNodeToTreeNodeMap[node];
        if (treeNode == null) return const SizedBox.shrink();

        final isTarget = targetNodeId != null && treeNode.id == targetNodeId;

        // 向下传递必需的关键参数，不再传递可能变化的完整 TreeNode
        return _GraphNodeCard(
          key: isTarget ? targetNodeKey : ValueKey('${treeNode.id}-$graphSignature'),
          fileName: fileName,
          roundId: treeNode.id,
          depth: treeNode.depth,
          onSwitch: () => onSwitch(treeNode.id),
          onDelete: () => onDelete(treeNode.id),
        );
      },
    );
  }
}

// ==========================================
// 🔵 第二层：卡片内容层（精细化监听重绘点）
// ==========================================

class _GraphNodeCard extends ConsumerWidget {
  final String fileName;
  final String roundId;
  final int depth;
  final VoidCallback onSwitch;
  final VoidCallback onDelete;

  const _GraphNodeCard({
    super.key,
    required this.fileName,
    required this.roundId,
    required this.depth,
    required this.onSwitch,
    required this.onDelete,
  });

  Widget _buildChip(String label, {IconData? icon}) {
    return Chip(
      avatar: icon == null ? null : Icon(icon, size: 16),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId)).valueOrNull;
    if (round == null) return const SizedBox.shrink();

    final isIncomplete = round.isIncomplete;
    final hasUnseenUpdate = round.hasUnseenUpdate;
    final aiContent = (round.assistantContent ?? '').trim().isEmpty
        ? '（等待回复）'
        : round.assistantContent!;

    return Card(
      child: SizedBox(
        width: 290,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildChip('深度 ${depth + 1}', icon: Icons.layers_outlined),
                  if (isIncomplete) _buildChip('未完成', icon: Icons.hourglass_empty_outlined),
                  if (hasUnseenUpdate) _buildChip('未查看', icon: Icons.mark_chat_unread_outlined),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                TimeFormatUtils.formatTimestamp(round.createdAt),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              _PreviewBlock(
                label: 'YOU',
                content: round.userContent.trim().isEmpty ? '（空输入）' : round.userContent,
              ),
              const SizedBox(height: 8),
              _PreviewBlock(
                label: 'AI',
                content: aiContent,
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: onSwitch,
                      child: const Text('切换到此分支'),
                    ),
                  ),
                  IconButton(
                    tooltip: '删除',
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline),
                  ),
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
  final String label;
  final String content;

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
            Text('$label  ', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700)),
            Expanded(
              child: Text(
                content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GraphToolbar extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onReset;

  const _GraphToolbar({
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onReset,
  });

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
            IconButton(tooltip: '缩小', onPressed: onZoomOut, icon: const Icon(Icons.remove_rounded)),
            IconButton(tooltip: '放大', onPressed: onZoomIn, icon: const Icon(Icons.add_rounded)),
            TextButton.icon(onPressed: onReset, icon: const Icon(Icons.center_focus_strong_outlined, size: 18), label: const Text('重置')),
          ],
        ),
      ),
    );
  }
}