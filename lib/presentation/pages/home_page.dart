import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../core/utils/time_format_utils.dart';
import '../../domain/models/session_list_item.dart';
import '../providers/session_list_notifier.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/input_bar.dart';
import 'chat_page.dart';
import 'settings_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Future<void> _showRenameDialog(
    BuildContext context,
    SessionListNotifier notifier,
    SessionListItem item,
  ) async {
    final controller = TextEditingController(text: item.title);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('重命名会话'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '输入新的会话名称',
          ),
          onSubmitted: (value) => Navigator.of(ctx).pop(value.trim()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.of(ctx).pop(controller.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );
    if (result != null &&
        result.isNotEmpty &&
        result != item.title) {
      await notifier.updateSessionTitle('${item.id}.json', result);
    }
  }

  Future<void> _showDeleteConfirmDialog(
    BuildContext context,
    SessionListNotifier notifier,
    SessionListItem item,
  ) async {
    final colorScheme = Theme.of(context).colorScheme;
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('删除会话'),
            content: Text('确定要删除 “${item.title}” 吗？\n此操作无法撤销。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.error,
                  foregroundColor: colorScheme.onError,
                ),
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;

    if (confirmed == true) {
      await notifier.deleteSession('${item.id}.json');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(sessionListProvider);
    final notifier = ref.read(sessionListNotifierProvider);

    return AppPageScaffold(
      appBar: AppBar(
        title: const Text('AI Chat'),
        actions: [
          IconButton(
            tooltip: '设置',
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: sessionsAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (e, st) => _HomeErrorState(
                message: '加载会话失败：$e',
                onRetry: () async {
                  await notifier.refresh();
                },
              ),
              data: (items) {
                if (items.isEmpty) {
                  return const _HomeEmptyState();
                }
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _SessionCard(
                      item: item,
                      notifier: notifier,
                      onRename: (item) =>
                          _showRenameDialog(context, notifier, item),
                      onDelete: (item) =>
                          _showDeleteConfirmDialog(context, notifier, item),
                    );
                  },
                );
              },
            ),
          ),
          InputBar(
            hintText: '发送消息',
            onSend: (content, attachments) async {
              final newFileName = await notifier.createSession('新对话');
              if (context.mounted) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatPage(
                      fileName: newFileName,
                      initialMessage: content,
                      initialAttachments: attachments,
                    ),
                  ),
                );
                if (context.mounted) {
                  await notifier.refresh();
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

class _HomeEmptyState extends StatelessWidget {
  const _HomeEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.auto_awesome_outlined, size: 40),
                SizedBox(height: 16),
                Text(
                  '开始你的第一段对话',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                Text(
                  '在下方输入问题，系统会自动创建一个新会话。\n你也可以附加图片或文件开始交流。',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeErrorState extends StatelessWidget {
  final String message;
  final Future<void> Function() onRetry;

  const _HomeErrorState({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 40,
                  color: colorScheme.error,
                ),
                const SizedBox(height: 12),
                const Text(
                  '出现了一点问题',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  label: const Text('重试'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  final SessionListItem item;
  final SessionListNotifier notifier;
  final Future<void> Function(SessionListItem item) onRename;
  final Future<void> Function(SessionListItem item) onDelete;

  const _SessionCard({
    required this.item,
    required this.notifier,
    required this.onRename,
    required this.onDelete,
  });

  Widget _buildMetaChip(String label, {IconData? icon}) {
    return Chip(
      avatar: icon == null ? null : Icon(icon, size: 16),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }

  @override
  Widget build(BuildContext context) {
    final fileName = '${item.id}.json';
    final updatedAt = TimeFormatUtils.formatTimestamp(item.updatedAt);

    return Slidable(
      key: ValueKey(fileName),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.34,
        children: [
          CustomSlidableAction(
            onPressed: (_) => onRename(item),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ),
          CustomSlidableAction(
            onPressed: (_) => onDelete(item),
            backgroundColor: Theme.of(context).colorScheme.error,
            child: Icon(
              Icons.delete_outline,
              color: Theme.of(context).colorScheme.onError,
            ),
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatPage(
                  fileName: fileName,
                  initialRoundId: item.previewRoundId,
                ),
              ),
            );
            if (context.mounted) {
              await notifier.refresh();
            }
          },
          leading: const Icon(Icons.forum_outlined),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (item.isStreaming) ...[
                const SizedBox(width: 8),
                _buildMetaChip('生成中', icon: Icons.bolt_outlined),
              ],
              if (item.hasUnseen) ...[
                const SizedBox(width: 8),
                _buildMetaChip('未查看', icon: Icons.mark_chat_unread_outlined),
              ],
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PreviewLine(
                  label: 'YOU',
                  text: item.userPreview,
                ),
                const SizedBox(height: 4),
                _PreviewLine(
                  label: 'AI',
                  text: item.aiPreview,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildMetaChip(
                      '${item.roundCount} 轮',
                      icon: Icons.chat_bubble_outline,
                    ),
                    _buildMetaChip(
                      updatedAt,
                      icon: Icons.schedule_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),
      ),
    );
  }
}

class _PreviewLine extends StatelessWidget {
  final String label;
  final String text;

  const _PreviewLine({
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label  ',
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}