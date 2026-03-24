import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphview/GraphView.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../../core/utils/time_format_utils.dart';
import '../../di/providers.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart';
import '../providers/global_streaming_provider.dart';
import '../themes/app_tokens.dart';
import '../widgets/common/app_badge.dart';
import '../widgets/common/app_page_scaffold.dart';

class BranchTreePage extends ConsumerStatefulWidget {
  final Session session;
  final String fileName;

  const BranchTreePage({
    super.key,
    required this.session,
    required this.fileName,
  });

  @override
  ConsumerState<BranchTreePage> createState() => _BranchTreePageState();
}

class _BranchTreePageState extends ConsumerState<BranchTreePage> {
  final TransformationController _transformationController =
      TransformationController();

  Graph _graph = Graph()..isTree = true;
  final BuchheimWalkerConfiguration _builder =
      BuchheimWalkerConfiguration();

  final Map<String, Node> _nodeMap = {};
  final Map<Node, TreeNode> _graphNodeToTreeNodeMap = {};

  List<TreeNode> _roots = [];
  String _lastRootsSignature = '';

  @override
  void initState() {
    super.initState();
    _builder
      ..siblingSeparation = 40
      ..levelSeparation = 78
      ..subtreeSeparation = 50
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
    _reloadTree(widget.session.rounds);
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _reloadTree(List<ChatRound> rounds) {
    final roots = rounds.isEmpty ? <TreeNode>[] : TreeBuilder.buildTree(rounds);
    final signature = _buildRootsSignature(roots);
    setState(() {
      _roots = roots;
      _lastRootsSignature = signature;
      _rebuildGraph(_roots);
    });
  }

  String _buildRootsSignature(List<TreeNode> roots) {
    dynamic toJsonNode(TreeNode node) {
      return {
        'id': node.id,
        'children': node.children.map(toJsonNode).toList(),
      };
    }

    return jsonEncode(roots.map(toJsonNode).toList());
  }

  void _rebuildGraph(List<TreeNode> roots) {
    _graph = Graph()..isTree = true;
    _nodeMap.clear();
    _graphNodeToTreeNodeMap.clear();
    for (final root in roots) {
      _addTreeToGraph(root, null);
    }
  }

  void _addTreeToGraph(TreeNode treeNode, TreeNode? parent) {
    final currentNode = Node.Id(treeNode.id);
    _nodeMap[treeNode.id] = currentNode;
    _graphNodeToTreeNodeMap[currentNode] = treeNode;
    _graph.addNode(currentNode);

    if (parent != null) {
      final parentNode = _nodeMap[parent.id];
      if (parentNode != null) {
        _graph.addEdge(parentNode, currentNode);
      }
    }

    for (final child in treeNode.children) {
      _addTreeToGraph(child, treeNode);
    }
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
    final repository = ref.read(conversationRepositoryProvider);
    final chatState = ref.read(chatProvider(widget.fileName));
    final session = chatState.session ?? widget.session;

    final roots = session.rounds.isEmpty
        ? <TreeNode>[]
        : TreeBuilder.buildTree(session.rounds);

    final targetNode = _findTreeNodeById(roots, nodeId);
    if (targetNode == null) {
      throw Exception('未找到要删除的节点');
    }

    final idsToDelete = _collectSubtreeIds(targetNode);

    final updatedRounds = session.rounds
        .where((round) => !idsToDelete.contains(round.id))
        .toList();

    final updatedSession = session.copyWith(
      rounds: updatedRounds,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );

    await repository.saveSession(widget.fileName, updatedSession);
    _reloadTree(updatedRounds);
    await ref.read(chatProvider(widget.fileName).notifier).loadSession();
  }

  @override
  Widget build(BuildContext context) {
    final chatNotifier = ref.read(chatProvider(widget.fileName).notifier);
    final streamingSessions = ref.watch(globalStreamingSessionsProvider);
    final isStreaming = streamingSessions.contains(widget.fileName);

    return AppPageScaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                widget.session.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            if (isStreaming)
              AppBadge.info(
                '生成中',
                icon: Icons.bolt_outlined,
              ),
          ],
        ),
      ),
      body: _roots.isEmpty
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
                  onReset: () {
                    _transformationController.value = Matrix4.identity();
                  },
                ),
                Expanded(
                  child: InteractiveViewer(
                    constrained: false,
                    boundaryMargin: const EdgeInsets.all(double.infinity),
                    minScale: 0.1,
                    maxScale: 3.0,
                    transformationController: _transformationController,
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      color: AppTokens.bg,
                      child: GraphView(
                        key: ValueKey(_lastRootsSignature),
                        graph: _graph,
                        animated: false,
                        algorithm: BuchheimWalkerAlgorithm(
                          _builder,
                          TreeEdgeRenderer(_builder),
                        ),
                        paint: Paint()
                          ..color = const Color(0xFFD8DEE8)
                          ..strokeWidth = 1.6
                          ..style = PaintingStyle.stroke,
                        builder: (Node node) {
                          final treeNode = _graphNodeToTreeNodeMap[node];
                          if (treeNode == null) {
                            return const SizedBox.shrink();
                          }
                          return _GraphNodeCard(
                            key: ValueKey(treeNode.id),
                            treeNode: treeNode,
                            onSwitch: () async {
                              await chatNotifier.switchBranch(treeNode.id);
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            },
                            onDelete: () async {
                              final confirmed =
                                  await _showDeleteDialog(context, treeNode);
                              if (!confirmed) return;
                              try {
                                await _deleteNode(treeNode.id);
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('节点及其后续分支已删除'),
                                    ),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('删除失败：$e'),
                                    ),
                                  );
                                }
                              }
                            },
                          );
                        },
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTokens.surface,
            borderRadius: AppTokens.brLg,
            border: Border.all(color: AppTokens.border),
            boxShadow: AppTokens.shadowMd,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: AppTokens.primarySoft,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Icon(
                  Icons.account_tree_outlined,
                  size: 30,
                  color: AppTokens.primary,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                '暂无分支结构',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '当你对历史轮次重新生成回复时，这里会显示完整的分支关系。',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTokens.textSecondary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _showDeleteDialog(
    BuildContext context,
    TreeNode node,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: AppTokens.brLg,
            ),
            title: Text(
              '删除节点',
              style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            content: Text(
              '确定删除这一轮及其后续全部分支吗？\n\n${node.round.userContent}',
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTokens.danger,
                ),
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppTokens.surface,
          borderRadius: AppTokens.brLg,
          border: Border.all(color: AppTokens.border),
          boxShadow: AppTokens.shadowSm,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.tune_outlined,
              size: 18,
              color: AppTokens.textSecondary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '缩放、拖拽查看对话分支结构',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTokens.textSecondary,
                    ),
              ),
            ),
            _ToolbarIconButton(
              icon: Icons.remove_rounded,
              tooltip: '缩小',
              onTap: onZoomOut,
            ),
            const SizedBox(width: 6),
            _ToolbarIconButton(
              icon: Icons.add_rounded,
              tooltip: '放大',
              onTap: onZoomIn,
            ),
            const SizedBox(width: 6),
            _ToolbarTextButton(
              icon: Icons.center_focus_strong_outlined,
              label: '重置',
              onTap: onReset,
            ),
          ],
        ),
      ),
    );
  }
}

class _ToolbarIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _ToolbarIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppTokens.brMd,
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppTokens.surfaceSoft,
            borderRadius: AppTokens.brMd,
            border: Border.all(color: AppTokens.border),
          ),
          child: Icon(
            icon,
            size: 18,
            color: AppTokens.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _ToolbarTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ToolbarTextButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppTokens.brMd,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppTokens.surfaceSoft,
          borderRadius: AppTokens.brMd,
          border: Border.all(color: AppTokens.border),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: AppTokens.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTokens.textPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GraphNodeCard extends StatelessWidget {
  final TreeNode treeNode;
  final VoidCallback onSwitch;
  final VoidCallback onDelete;

  const _GraphNodeCard({
    super.key,
    required this.treeNode,
    required this.onSwitch,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isRoot = treeNode.parentId == null;
    final isIncomplete = treeNode.round.isIncomplete;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: 290,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppTokens.surface,
          borderRadius: AppTokens.brLg,
          border: Border.all(
            color: isIncomplete
                ? AppTokens.warning.withOpacity(0.25)
                : AppTokens.border,
          ),
          boxShadow: AppTokens.shadowMd,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppBadge.primary(
                  '深度 ${treeNode.depth + 1}',
                  icon: Icons.layers_outlined,
                ),
                const SizedBox(width: 8),
                if (isRoot)
                  AppBadge.info(
                    '根节点',
                    icon: Icons.flag_outlined,
                  ),
                if (isIncomplete) ...[
                  const SizedBox(width: 8),
                  AppBadge.warning(
                    '未完成',
                    icon: Icons.hourglass_empty_outlined,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 10),
            Text(
              TimeFormatUtils.formatTimestamp(treeNode.round.createdAt),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: AppTokens.textSecondary,
                  ),
            ),
            const SizedBox(height: 12),
            _PreviewBlock(
              label: 'YOU',
              content: treeNode.round.userContent.trim().isEmpty
                  ? '（空输入）'
                  : treeNode.round.userContent,
              labelColor: AppTokens.info,
            ),
            const SizedBox(height: 8),
            _PreviewBlock(
              label: 'AI',
              content: (treeNode.round.assistantContent ?? '').trim().isEmpty
                  ? '（等待回复）'
                  : treeNode.round.assistantContent!,
              labelColor: AppTokens.success,
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: onSwitch,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppTokens.primarySoft,
                      foregroundColor: AppTokens.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: AppTokens.brMd,
                      ),
                    ),
                    child: const Text('切换到此分支'),
                  ),
                ),
                const SizedBox(width: 8),
                if (treeNode.parentId != null)
                  InkWell(
                    onTap: onDelete,
                    borderRadius: AppTokens.brMd,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppTokens.dangerSoft,
                        borderRadius: AppTokens.brMd,
                        border: Border.all(
                          color: AppTokens.danger.withOpacity(0.15),
                        ),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: AppTokens.danger,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewBlock extends StatelessWidget {
  final String label;
  final String content;
  final Color labelColor;

  const _PreviewBlock({
    required this.label,
    required this.content,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTokens.surfaceSoft,
        borderRadius: AppTokens.brMd,
        border: Border.all(color: AppTokens.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label  ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: labelColor,
                ),
          ),
          Expanded(
            child: Text(
              content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    height: 1.5,
                    color: AppTokens.textPrimary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}