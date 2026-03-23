import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../core/models/session.dart';
import '../../core/utils/time_format_utils.dart';
import '../providers/session_list_notifier.dart';
import '../themes/app_tokens.dart';
import '../widgets/common/app_badge.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/input_bar.dart';
import 'chat_page.dart';
import 'settings_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Future<void> _showRenameDialog(
    BuildContext context,
    SessionListNotifier notifier,
    Session session,
  ) async {
    final controller = TextEditingController(text: session.title);

    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.brLg,
        ),
        title: Text(
          '重命名会话',
          style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
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
            onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty && result != session.title) {
      await notifier.updateSessionTitle('${session.id}.json', result);
    }
  }

  Future<void> _showDeleteConfirmDialog(
    BuildContext context,
    SessionListNotifier notifier,
    Session session,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.brLg,
        ),
        title: Text(
          '删除会话',
          style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        content: Text(
          '确定要删除 “${session.title}” 吗？\n此操作无法撤销。',
          style: Theme.of(ctx).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: AppTokens.danger,
            ),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await notifier.deleteSession('${session.id}.json');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionListState = ref.watch(sessionListProvider);
    final notifier = ref.read(sessionListProvider.notifier);

    return AppPageScaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AI Chat',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              '你的对话工作区',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
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
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: sessionListState.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (e, st) => _HomeErrorState(
                message: '加载会话失败：$e',
                onRetry: notifier.refresh,
              ),
              data: (sessions) {
                if (sessions.isEmpty) {
                  return const _HomeEmptyState();
                }

                return RefreshIndicator(
                  onRefresh: notifier.refresh,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    children: [
                      _HomeHeaderSummary(
                        sessionCount: sessions.length,
                      ),
                      const SizedBox(height: AppTokens.space16),
                      ...sessions.map((session) {
                        final fileName = '${session.id}.json';
                        return Padding(
                          padding:
                              const EdgeInsets.only(bottom: AppTokens.space12),
                          child: Slidable(
                            key: ValueKey(fileName),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              extentRatio: 0.34,
                              children: [
                                CustomSlidableAction(
                                  onPressed: (_) => _showRenameDialog(
                                    context,
                                    notifier,
                                    session,
                                  ),
                                  backgroundColor: AppTokens.info,
                                  borderRadius: AppTokens.brLg,
                                  child: const Icon(
                                    Icons.edit_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                CustomSlidableAction(
                                  onPressed: (_) => _showDeleteConfirmDialog(
                                    context,
                                    notifier,
                                    session,
                                  ),
                                  backgroundColor: AppTokens.danger,
                                  borderRadius: AppTokens.brLg,
                                  child: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            child: _SessionCard(
                              session: session,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChatPage(
                                      fileName: fileName,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 12),
                    ],
                  ),
                );
              },
            ),
          ),
          InputBar(
            hintText: '开启一个新对话...',
            onSend: (content, attachments) async {
              final newFileName = await notifier.createSession('新对话');
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatPage(
                      fileName: newFileName,
                      initialMessage: content,
                      initialAttachments: attachments,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _HomeHeaderSummary extends StatelessWidget {
  final int sessionCount;

  const _HomeHeaderSummary({
    required this.sessionCount,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppTokens.primarySoft,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.forum_outlined,
              color: AppTokens.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: AppTokens.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '最近会话',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  '共 $sessionCount 个会话，可左滑进行重命名或删除。',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          AppBadge.primary(
            '$sessionCount',
            icon: Icons.layers_outlined,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AppCard(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppTokens.primarySoft,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.auto_awesome_outlined,
                  size: 32,
                  color: AppTokens.primary,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                '开始你的第一段对话',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                '在下方输入问题，系统会自动创建一个新会话。\n你也可以附加图片或文件开始交流。',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTokens.textSecondary,
                    ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  AppBadge.primary(
                    '快速提问',
                    icon: Icons.bolt_outlined,
                  ),
                  AppBadge.info(
                    '支持附件',
                    icon: Icons.attach_file_outlined,
                  ),
                  AppBadge.warning(
                    '多分支对话',
                    icon: Icons.account_tree_outlined,
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

class _HomeErrorState extends StatelessWidget {
  final String message;
  final Future<void> Function() onRetry;

  const _HomeErrorState({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AppCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 40,
                color: AppTokens.danger,
              ),
              const SizedBox(height: 12),
              Text(
                '出现了一点问题',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
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
    );
  }
}

class _SessionCard extends StatelessWidget {
  final Session session;
  final VoidCallback onTap;

  const _SessionCard({
    required this.session,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final roundCount = session.rounds.length;
    final updatedAt = TimeFormatUtils.formatTimestamp(session.updatedAt);
    final preview = _buildLatestPreview(session);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppTokens.brLg,
        child: AppCard(
          padding: const EdgeInsets.all(16),
          boxShadow: AppTokens.shadowSm,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppTokens.surfaceSoft,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTokens.border),
                ),
                child: const Icon(
                  Icons.forum_outlined,
                  color: AppTokens.textSecondary,
                ),
              ),
              const SizedBox(width: AppTokens.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _PreviewLine(
                          label: 'YOU',
                          text: preview.userPreview,
                          color: AppTokens.info,
                        ),
                        const SizedBox(height: 4),
                        _PreviewLine(
                          label: 'AI',
                          text: preview.aiPreview,
                          color: AppTokens.success,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        AppBadge.info(
                          '$roundCount 轮',
                          icon: Icons.chat_bubble_outline,
                        ),
                        AppBadge.primary(
                          updatedAt,
                          icon: Icons.schedule_outlined,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppTokens.space8),
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppTokens.surfaceSoft,
                  borderRadius: AppTokens.brMd,
                  border: Border.all(color: AppTokens.border),
                ),
                child: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppTokens.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _SessionPreview _buildLatestPreview(Session session) {
    if (session.rounds.isEmpty) {
      return const _SessionPreview(
        userPreview: '点击开始新的对话',
        aiPreview: '等待助手回复',
      );
    }

    final latest = session.rounds.last;

    final user = latest.userContent.trim().isEmpty
        ? '（空输入）'
        : latest.userContent.trim();

    final ai = (latest.assistantContent ?? '').trim().isEmpty
        ? '（等待回复）'
        : latest.assistantContent!.trim();

    return _SessionPreview(
      userPreview: user,
      aiPreview: ai,
    );
  }
}

class _SessionPreview {
  final String userPreview;
  final String aiPreview;

  const _SessionPreview({
    required this.userPreview,
    required this.aiPreview,
  });
}

class _PreviewLine extends StatelessWidget {
  final String label;
  final String text;
  final Color color;

  const _PreviewLine({
    required this.label,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label  ',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
              ),
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  color: AppTokens.textSecondary,
                  height: 1.4,
                ),
          ),
        ),
      ],
    );
  }
}