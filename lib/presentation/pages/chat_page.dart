import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../core/utils/time_format_utils.dart';
import '../models/pending_attachment.dart';
import '../providers/chat_notifier.dart';
import '../providers/input_draft_provider.dart';
import '../themes/app_tokens.dart';
import '../widgets/attachment_list.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/thought_bubble.dart';
import '../widgets/common/app_card.dart';
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
  late final PageController _pageController;
  bool _initialMessageHandled = false;
  bool _isSyncingPageFromState = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

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
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _copyText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('已复制到剪贴板')),
    );
  }

  void _enterEditMode(String roundId, String text) {
    ref.read(globalInputDraftProvider.notifier).state = text;
    ref.read(globalEditSourceRoundIdProvider.notifier).state = roundId;
    FocusScope.of(context).unfocus();
  }

  void _cancelEditMode() {
    ref.read(globalEditSourceRoundIdProvider.notifier).state = null;
  }

  void _syncPageController(int targetIndex) {
    if (!_pageController.hasClients) return;
    final currentPage = _pageController.page?.round() ?? _pageController.initialPage;
    if (currentPage == targetIndex) return;

    _isSyncingPageFromState = true;
    _pageController
        .animateToPage(
          targetIndex,
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOutCubic,
        )
        .whenComplete(() {
      _isSyncingPageFromState = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider(widget.fileName));
    final notifier = ref.read(chatProvider(widget.fileName).notifier);
    final editSourceRoundId = ref.watch(globalEditSourceRoundIdProvider);
    final isEditMode = editSourceRoundId != null;

    final hasPages =
        state.pageList != null && state.pageList!.pages.isNotEmpty;
    final currentIndex = hasPages ? state.pageList!.currentPageIndex : 0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (!hasPages) return;
      if (_isSyncingPageFromState) return;
      _syncPageController(currentIndex);
    });

    return AppPageScaffold(
      appBar: AppBar(
        title: Text(
          state.session?.title ?? '对话',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          if (state.session != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                tooltip: isEditMode ? '编辑模式下不可切换页面' : '查看分支树',
                icon: const Icon(Icons.account_tree_outlined),
                onPressed: isEditMode
                    ? null
                    : () {
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
          if (state.pageList != null && state.pageList!.totalPages > 0)
            _PaginationBar(
              currentIndex: state.pageList!.currentPageIndex,
              totalPages: state.pageList!.totalPages,
              onPrev: isEditMode
                  ? null
                  : state.pageList!.currentPageIndex > 0
                      ? () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeOutCubic,
                          )
                      : null,
              onNext: isEditMode
                  ? null
                  : state.pageList!.currentPageIndex <
                          state.pageList!.totalPages - 1
                      ? () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeOutCubic,
                          )
                      : null,
              isEditMode: isEditMode,
            ),
          if (isEditMode)
            _EditModeBanner(
              onCancel: _cancelEditMode,
            ),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.session == null
                    ? _buildErrorState(state.error ?? '会话不存在')
                    : !hasPages && state.activeStreams.isEmpty
                        ? _buildWelcomeEmpty(context)
                        : PageView.builder(
                            controller: _pageController,
                            physics: isEditMode
                                ? const NeverScrollableScrollPhysics()
                                : const PageScrollPhysics(),
                            itemCount: state.pageList?.pages.length ?? 0,
                            onPageChanged: (index) {
                              if (state.pageList == null) return;
                              if (index == state.pageList!.currentPageIndex) {
                                return;
                              }
                              notifier.changePage(index);
                            },
                            itemBuilder: (context, index) {
                              final round = state.pageList!.pages[index].round;
                              final canEdit =
                                  !state.activeStreams.containsKey(round.id);

                              return _ChatRoundPage(
                                key: ValueKey(round.id),
                                fileName: widget.fileName,
                                round: round,
                                canEdit: canEdit,
                                errorMessage:
                                    index == currentIndex ? state.error : null,
                                onRetryReply: () =>
                                    notifier.retryFromRound(round.id),
                                onEdit: canEdit
                                    ? () => _enterEditMode(
                                          round.id,
                                          round.userContent,
                                        )
                                    : null,
                                onCopyText: _copyText,
                              );
                            },
                          ),
          ),
          InputBar(
            hintText: isEditMode ? '修改文本后发送（保留原附件）' : '发送消息',
            isStreaming: hasPages
                ? state.activeStreams.containsKey(
                    state.pageList!.pages[state.pageList!.currentPageIndex].round.id,
                  )
                : false,
            onStop: notifier.stopGeneration,
            onSend: (text, attachments) async {
              if (editSourceRoundId != null) {
                await notifier.editAndResendFromRound(
                  editSourceRoundId,
                  text,
                  attachments: attachments,
                );
                ref.read(globalEditSourceRoundIdProvider.notifier).state = null;
                ref.read(globalInputDraftProvider.notifier).state = '';
                ref.read(globalAttachmentDraftProvider.notifier).state = [];
                return;
              }
              await notifier.sendMessage(text, attachments: attachments);
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
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatRoundPage extends StatelessWidget {
  final String fileName;
  final ChatRound round;
  final bool canEdit;
  final String? errorMessage;
  final VoidCallback onRetryReply;
  final VoidCallback? onEdit;
  final Future<void> Function(String text) onCopyText;

  const _ChatRoundPage({
    super.key,
    required this.fileName,
    required this.round,
    required this.canEdit,
    required this.errorMessage,
    required this.onRetryReply,
    required this.onEdit,
    required this.onCopyText,
  });

  @override
  Widget build(BuildContext context) {
    final hasUser = round.userContent.trim().isNotEmpty;
    final hasAttachments = round.userAttachments.isNotEmpty;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      children: [
        AppCard(
          padding: const EdgeInsets.all(AppTokens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RoundHeader(createdAt: round.createdAt),
              const SizedBox(height: AppTokens.space16),
              const _SectionLabel(
                icon: Icons.person_outline,
                text: '你的输入',
              ),
              const SizedBox(height: AppTokens.space10),
              if (hasUser)
                MessageBubble(
                  content: round.userContent,
                  isUser: true,
                  onCopy: () => onCopyText(round.userContent),
                  onRetryReply: onRetryReply,
                  onEdit: onEdit,
                ),
              if (hasAttachments) ...[
                if (hasUser) const SizedBox(height: AppTokens.space8),
                AttachmentList(
                  attachments: round.userAttachments,
                  rightAligned: true,
                ),
              ],
              _RoundAnswerSection(
                fileName: fileName,
                roundId: round.id,
                savedThinking: round.assistantThinking,
                savedAssistantContent: round.assistantContent,
                onRetryReply: onRetryReply,
                onCopyText: onCopyText,
              ),
            ],
          ),
        ),
        if ((errorMessage ?? '').trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: _InlineErrorCard(message: errorMessage!),
          ),
      ],
    );
  }
}

class _RoundAnswerSection extends ConsumerWidget {
  final String fileName;
  final String roundId;
  final String? savedThinking;
  final String? savedAssistantContent;
  final VoidCallback onRetryReply;
  final Future<void> Function(String text) onCopyText;

  const _RoundAnswerSection({
    required this.fileName,
    required this.roundId,
    required this.savedThinking,
    required this.savedAssistantContent,
    required this.onRetryReply,
    required this.onCopyText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider(fileName));
    final streamStatus = state.activeStreams[roundId];
    final isStreaming = streamStatus != null;

    final thinking = isStreaming ? streamStatus.reasoning : savedThinking;
    final assistantContent =
        isStreaming ? streamStatus.content : savedAssistantContent;

    final hasThinking = (thinking ?? '').trim().isNotEmpty;
    final hasAssistant = (assistantContent ?? '').trim().isNotEmpty;

    if (!hasThinking && !hasAssistant && !isStreaming) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          const _SectionLabel(
            icon: Icons.smart_toy_outlined,
            text: '回答',
          ),
          const SizedBox(height: AppTokens.space10),
          if (hasAssistant)
            MessageBubble(
              content: assistantContent!,
              isUser: false,
              onCopy: () => onCopyText(assistantContent),
              onRetryReply: onRetryReply,
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppTokens.space16),
              decoration: BoxDecoration(
                color: AppTokens.surfaceSoft,
                borderRadius: AppTokens.brLg,
                border: Border.all(color: AppTokens.border),
              ),
              child: Row(
                children: const [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  SizedBox(width: AppTokens.space12),
                  Text(
                    '正在生成回答...',
                    style: TextStyle(
                      color: AppTokens.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ],
    );
  }
}

class _EditModeBanner extends StatelessWidget {
  final VoidCallback onCancel;

  const _EditModeBanner({
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppTokens.warningSoft,
        borderRadius: AppTokens.brMd,
        border: Border.all(
          color: AppTokens.warning.withOpacity(0.18),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.edit_outlined,
            size: 16,
            color: AppTokens.warning,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '正在编辑重试，发送前不可切换页面，发送时将保留原附件',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTokens.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          TextButton(
            onPressed: onCancel,
            child: const Text('取消编辑'),
          ),
        ],
      ),
    );
  }
}

class _RoundHeader extends StatelessWidget {
  final int createdAt;

  const _RoundHeader({
    required this.createdAt,
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
  final bool isEditMode;

  const _PaginationBar({
    required this.currentIndex,
    required this.totalPages,
    required this.onPrev,
    required this.onNext,
    required this.isEditMode,
  });

  @override
  Widget build(BuildContext context) {
    final progress =
        totalPages == 0 ? 0.0 : (currentIndex + 1).clamp(0, totalPages) / totalPages;

    return Container(
      decoration: const BoxDecoration(
        color: AppTokens.surface,
        border: Border(
          bottom: BorderSide(color: AppTokens.border),
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
                  isEditMode
                      ? '编辑中｜第 ${currentIndex + 1} 页 / 共 $totalPages 页'
                      : '第 ${currentIndex + 1} 页 / 共 $totalPages 页',
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
          color: enabled ? AppTokens.textPrimary : AppTokens.textTertiary,
        ),
      ),
    );
  }
}