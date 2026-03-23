import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/attachment.dart';
import '../../core/utils/time_format_utils.dart';
import '../models/pending_attachment.dart';
import '../providers/chat_notifier.dart';
import '../themes/app_tokens.dart';
import '../widgets/attachment_list.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/thought_bubble.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/app_badge.dart';
import '../widgets/common/app_page_scaffold.dart';
import 'branch_tree_page.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String fileName;
  final String? initialMessage;
  final List<PendingAttachment>? initialAttachments;

  const ChatPage({
    super.key,
    required this.fileName,
    this.initialMessage,
    this.initialAttachments,
  });

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  bool _initialMessageHandled = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(chatProvider(widget.fileName).notifier).loadSession();

      final message = widget.initialMessage?.trim() ?? '';
      final attachments =
          widget.initialAttachments ?? const <PendingAttachment>[];
      final hasMessage = message.isNotEmpty;
      final hasAttachments = attachments.isNotEmpty;

      if (!_initialMessageHandled &&
          (hasMessage || hasAttachments) &&
          mounted) {
        _initialMessageHandled = true;
        await ref.read(chatProvider(widget.fileName).notifier).sendMessage(
              message,
              attachments: attachments,
            );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.jumpTo(0);
    });
  }

  Future<void> _copyText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('已复制到剪贴板')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider(widget.fileName));
    final notifier = ref.read(chatProvider(widget.fileName).notifier);

    final hasPages =
        state.pageList != null && state.pageList!.pages.isNotEmpty;
    final currentPage = hasPages
        ? state.pageList!.pages[state.pageList!.currentPageIndex]
        : null;
    final round = currentPage?.round;

    final currentStreamStatus =
        round != null ? state.activeStreams[round.id] : null;
    final isViewingStreamingRound = currentStreamStatus != null;

    return AppPageScaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.session?.title ?? '对话',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              'AI 对话工作台',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          if (state.session != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                tooltip: '查看分支树',
                icon: const Icon(Icons.account_tree_outlined),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BranchTreePage(
                        session: state.session!,
                        fileName: widget.fileName,
                      ),
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
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.session == null
                    ? _buildErrorState(state.error ?? '会话不存在')
                    : !hasPages && state.activeStreams.isEmpty
                        ? _buildWelcomeEmpty(context)
                        : ListView(
                            controller: _scrollController,
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            children: [
                              if (round != null)
                                _buildRoundCard(
                                  context,
                                  userContent: round.userContent,
                                  attachments: round.userAttachments,
                                  createdAt: round.createdAt,
                                  onRetryReply: () =>
                                      notifier.retryFromRound(round.id),
                                  thinking: isViewingStreamingRound
                                      ? currentStreamStatus.reasoning
                                      : round.assistantThinking,
                                  assistantContent: isViewingStreamingRound
                                      ? currentStreamStatus.content
                                      : round.assistantContent,
                                  isStreaming: isViewingStreamingRound,
                                ),
                              if ((state.error ?? '').trim().isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: _InlineErrorCard(
                                    message: state.error!,
                                  ),
                                ),
                            ],
                          ),
          ),
          if (state.pageList != null && state.pageList!.totalPages > 0)
            _PaginationBar(
              currentIndex: state.pageList!.currentPageIndex,
              totalPages: state.pageList!.totalPages,
              onPrev: state.pageList!.currentPageIndex > 0
                  ? () {
                      notifier.changePage(
                        state.pageList!.currentPageIndex - 1,
                      );
                      _scrollToTop();
                    }
                  : null,
              onNext: state.pageList!.currentPageIndex <
                      state.pageList!.totalPages - 1
                  ? () {
                      notifier.changePage(
                        state.pageList!.currentPageIndex + 1,
                      );
                      _scrollToTop();
                    }
                  : null,
            ),
          InputBar(
            hintText: '发送消息，或附加图片/文件...',
            isStreaming: isViewingStreamingRound,
            onStop: notifier.stopGeneration,
            onSend: (text, attachments) {
              notifier.sendMessage(text, attachments: attachments);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
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
                '无法加载会话',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeEmpty(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AppCard(
          padding: const EdgeInsets.all(24),
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
                  Icons.auto_awesome_outlined,
                  size: 30,
                  color: AppTokens.primary,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                '开始一段新的对话',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                '你可以输入问题、上传图片或文件，并在不同分支中回看每一轮回复。',
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
                    '多轮上下文',
                    icon: Icons.chat_bubble_outline,
                  ),
                  AppBadge.info(
                    '附件输入',
                    icon: Icons.attach_file_outlined,
                  ),
                  AppBadge.warning(
                    '分支切换',
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

  Widget _buildRoundCard(
    BuildContext context, {
    required String userContent,
    required List<Attachment> attachments,
    required int createdAt,
    required VoidCallback onRetryReply,
    String? thinking,
    String? assistantContent,
    bool isStreaming = false,
  }) {
    final hasUser = userContent.trim().isNotEmpty;
    final hasAttachments = attachments.isNotEmpty;
    final hasThinking = (thinking ?? '').trim().isNotEmpty;
    final hasAssistant = (assistantContent ?? '').trim().isNotEmpty;

    return AppCard(
      padding: const EdgeInsets.all(AppTokens.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RoundHeader(
            createdAt: createdAt,
            isStreaming: isStreaming,
          ),
          const SizedBox(height: AppTokens.space16),
          const _SectionLabel(
            icon: Icons.person_outline,
            text: '你的输入',
          ),
          const SizedBox(height: AppTokens.space10),
          if (hasUser)
            MessageBubble(
              content: userContent,
              isUser: true,
              onCopy: () => _copyText(userContent),
              onRetryReply: onRetryReply,
            ),
          if (hasAttachments) ...[
            if (hasUser) const SizedBox(height: AppTokens.space8),
            AttachmentList(attachments: attachments),
          ],
          if (hasThinking) ...[
            const SizedBox(height: AppTokens.space20),
            const Divider(),
            const SizedBox(height: AppTokens.space16),
            const _SectionLabel(
              icon: Icons.psychology_alt_outlined,
              text: '推理过程',
            ),
            const SizedBox(height: AppTokens.space10),
            ThoughtBubble(content: thinking!),
          ],
          if (hasAssistant || isStreaming) ...[
            const SizedBox(height: AppTokens.space20),
            const Divider(),
            const SizedBox(height: AppTokens.space16),
            Row(
              children: [
                const Expanded(
                  child: _SectionLabel(
                    icon: Icons.smart_toy_outlined,
                    text: '回答',
                  ),
                ),
                if (isStreaming)
                  AppBadge.info(
                    '生成中',
                    icon: Icons.bolt_outlined,
                  ),
              ],
            ),
            const SizedBox(height: AppTokens.space10),
            if (hasAssistant)
              MessageBubble(
                content: assistantContent!,
                isUser: false,
                onCopy: () => _copyText(assistantContent),
                onRetryReply: onRetryReply,
              )
            else
              _buildTypingPlaceholder(),
          ],
        ],
      ),
    );
  }

  Widget _buildTypingPlaceholder() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTokens.space16),
      decoration: BoxDecoration(
        color: AppTokens.surfaceSoft,
        borderRadius: AppTokens.brLg,
        border: Border.all(color: AppTokens.border),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: AppTokens.space12),
          Text(
            '正在生成回答...',
            style: const TextStyle(
              color: AppTokens.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundHeader extends StatelessWidget {
  final int createdAt;
  final bool isStreaming;

  const _RoundHeader({
    required this.createdAt,
    required this.isStreaming,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTokens.space12,
            vertical: AppTokens.space6,
          ),
          decoration: BoxDecoration(
            color: AppTokens.surfaceMuted,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppTokens.border),
          ),
          child: Text(
            TimeFormatUtils.formatTimestamp(createdAt),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const Spacer(),
        if (isStreaming)
          AppBadge.info(
            '实时生成',
            icon: Icons.graphic_eq_outlined,
          ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SectionLabel({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: AppTokens.primary,
        ),
        const SizedBox(width: AppTokens.space6),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppTokens.textPrimary,
              ),
        ),
      ],
    );
  }
}

class _InlineErrorCard extends StatelessWidget {
  final String message;

  const _InlineErrorCard({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTokens.space12),
      decoration: BoxDecoration(
        color: AppTokens.dangerSoft,
        borderRadius: AppTokens.brMd,
        border: Border.all(
          color: AppTokens.danger.withOpacity(0.18),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1),
            child: Icon(
              Icons.error_outline,
              size: 16,
              color: AppTokens.danger,
            ),
          ),
          const SizedBox(width: AppTokens.space8),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTokens.danger,
                    height: 1.55,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaginationBar extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  const _PaginationBar({
    required this.currentIndex,
    required this.totalPages,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final progress =
        totalPages == 0 ? 0.0 : (currentIndex + 1).clamp(0, totalPages) / totalPages;

    return Container(
      decoration: const BoxDecoration(
        color: AppTokens.surface,
        border: Border(
          top: BorderSide(color: AppTokens.border),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Row(
        children: [
          _PagerButton(
            icon: Icons.chevron_left_rounded,
            onTap: onPrev,
          ),
          const SizedBox(width: AppTokens.space10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '第 ${currentIndex + 1} 页 / 共 $totalPages 页',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppTokens.textPrimary,
                      ),
                ),
                const SizedBox(height: AppTokens.space8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: AppTokens.surfaceMuted,
                    valueColor:
                        const AlwaysStoppedAnimation(AppTokens.primary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppTokens.space10),
          _PagerButton(
            icon: Icons.chevron_right_rounded,
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}

class _PagerButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _PagerButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;

    return InkWell(
      onTap: onTap,
      borderRadius: AppTokens.brMd,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: enabled ? AppTokens.surfaceSoft : AppTokens.surfaceMuted,
          borderRadius: AppTokens.brMd,
          border: Border.all(color: AppTokens.border),
        ),
        child: Icon(
          icon,
          color: enabled
              ? AppTokens.textPrimary
              : AppTokens.textTertiary,
        ),
      ),
    );
  }
}