import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../core/utils/app_route_observer.dart';
import '../../core/utils/time_format_utils.dart';
import '../../domain/states/chat_state.dart';
import '../models/pending_attachment.dart';
import '../providers/chat_notifier.dart';
import '../providers/global_streaming_provider.dart';
import '../providers/input_draft_provider.dart';
import '../widgets/attachment_list.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/thought_bubble.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import 'branch_tree_page.dart';
import '../utils/page_utils.dart';
import '../../domain/models/chat_page.dart';
class ChatPage extends ConsumerStatefulWidget {
  final String fileName;
  final String? initialRoundId;
  final String? initialMessage;
  final List<PendingAttachment>? initialAttachments;

  const ChatPage({
    super.key,
    required this.fileName,
    this.initialRoundId,
    this.initialMessage,
    this.initialAttachments,
  });

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> with RouteAware {
  PageController? _pageController;
  late final ProviderSubscription<ChatState> _chatSubscription;
  bool _initialMessageHandled = false;
  bool _isMarkingSeen = false;
  bool _isRouteVisible = false;
  ModalRoute<dynamic>? _route;

  @override
  void initState() {
    super.initState();

    _chatSubscription = ref.listenManual<ChatState>(
      chatProvider(widget.fileName),
      (previous, next) {
        // 原有分页逻辑保持不变
        final nextPageList = next.pageList;
        if (nextPageList != null && nextPageList.pages.isNotEmpty) {
          if (_pageController == null) {
            final initialIndex = nextPageList.currentPageIndex;
            _pageController = PageController(initialPage: initialIndex);
            if (mounted) {
              setState(() {});
            }
            return;
          }

          final controller = _pageController!;
          if (controller.hasClients) {
            final prevIndex = previous?.pageList?.currentPageIndex;
            final nextIndex = nextPageList.currentPageIndex;
            if (prevIndex != nextIndex) {
              final currentPage = controller.page?.round() ?? controller.initialPage;
              if (currentPage != nextIndex) {
                controller.jumpToPage(nextIndex);
              }
            }
          }
        }

        // ========== 新增：会话加载完成后处理初始消息 ==========
        if (next.session != null && !_initialMessageHandled && mounted) {
          final message = widget.initialMessage?.trim() ?? '';
          final attachments = widget.initialAttachments ?? const <PendingAttachment>[];
          final hasContent = message.isNotEmpty || attachments.isNotEmpty;

          if (hasContent) {
            _initialMessageHandled = true;
            // 异步发送不阻塞UI，添加错误捕获
            ref.read(chatProvider(widget.fileName).notifier)
                .sendMessage(message, attachments: attachments)
                .catchError((e) {
                  if (mounted) AppToast.show('发送失败：${e.toString()}');
                });
          }
        }
      },
    );

    // 原有微任务逻辑删除初始消息处理部分
    Future.microtask(() async {
      final notifier = ref.read(chatProvider(widget.fileName).notifier);
      await notifier.loadSession(initialRoundId: widget.initialRoundId);

      final state = ref.read(chatProvider(widget.fileName));
      final currentRoundId = state.currentRoundId;
      if (currentRoundId != null) {
        await notifier.ensureRoundLoaded(currentRoundId);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null && route != _route) {
      if (_route != null) {
        appRouteObserver.unsubscribe(this);
      }
      _route = route;
      appRouteObserver.subscribe(this, route as PageRoute);
    }
  }

  @override
  void dispose() {
    _chatSubscription.close();
    appRouteObserver.unsubscribe(this);
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void didPush() {
    _isRouteVisible = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await _syncSeenWithVisiblePage();
    });
  }

  @override
  void didPopNext() {
    _isRouteVisible = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await _syncSeenWithVisiblePage();
    });
  }

  @override
  void didPushNext() {
    _isRouteVisible = false;
  }

  @override
  void didPop() {
    _isRouteVisible = false;
    if (_isInEditMode()) {
      _cancelEditMode();
    }
  }

  Future<void> _copyText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    await AppToast.show('已复制到剪贴板');
  }

  void _enterEditMode(String roundId, String text) {
    ref.read(globalInputDraftProvider.notifier).state = text;
    ref.read(globalEditSourceRoundIdProvider.notifier).state = roundId;
    FocusScope.of(context).unfocus();
  }

  void _cancelEditMode() {
    ref.read(globalEditSourceRoundIdProvider.notifier).state = null;
    ref.read(globalInputDraftProvider.notifier).state = '';
    ref.read(globalAttachmentDraftProvider.notifier).state = [];
  }

  bool _isInEditMode() {
    return ref.read(globalEditSourceRoundIdProvider) != null;
  }

  Future<void> _syncSeenWithVisiblePage() async {
    if (!_isRouteVisible) return;
    if (_isMarkingSeen) return;
    
    final controller = _pageController;
    if (controller == null || !controller.hasClients) return;

    final state = ref.read(chatProvider(widget.fileName));
    final pageList = state.pageList;
    if (pageList == null || pageList.pages.isEmpty) return;

    final currentPage = controller.page;
    final index = currentPage != null 
        ? currentPage.round().clamp(0, pageList.pages.length - 1)
        : pageList.currentPageIndex;
        
    final round = pageList.pages[index].round;
    if (!round.hasUnseenUpdate) return;

    _isMarkingSeen = true;
    try {
      await ref
          .read(chatProvider(widget.fileName).notifier)
          .markRoundSeen(round.id);
    } finally {
      _isMarkingSeen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider(widget.fileName));
    final notifier = ref.read(chatProvider(widget.fileName).notifier);
    final editSourceRoundId = ref.watch(globalEditSourceRoundIdProvider);
    final isEditMode = editSourceRoundId != null;
    final hasPages = state.pageList != null && state.pageList!.pages.isNotEmpty;
    final textTheme = Theme.of(context).textTheme;
    final currentRound = state.pageList?.currentPage?.round;
    final currentIsStreaming = currentRound?.isIncomplete == true;

    return AppPageScaffold(
      appBar: AppBar(
        title: Text(
          state.session?.title ?? '对话',
          style: textTheme.titleMedium,
        ),
        actions: [
          if (state.session != null)
            IconButton(
              tooltip: isEditMode ? '编辑模式下不可切换页面' : '查看分支树',
              icon: const Icon(Icons.account_tree_outlined),
              onPressed: isEditMode
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BranchTreePage(
                            fileName: widget.fileName,
                            initialFocusRoundId: state.currentRoundId!,
                          ),
                        ),
                      );
                    },
            ),
        ],
      ),
      body: Column(
        children: [
          if (state.pageList != null && state.pageList!.totalPages > 0)
            _PaginationBar(
              currentIndex: state.pageList!.currentPageIndex,  // ✅ 直接传递 0-based
              totalPages: state.pageList!.totalPages,
              onPrev: isEditMode
                  ? null
                  : state.pageList!.currentPageIndex > 0
                      ? () => _pageController?.previousPage(
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeOutCubic,
                          )
                      : null,
              onNext: isEditMode
                  ? null
                  : state.pageList!.currentPageIndex < state.pageList!.totalPages - 1
                      ? () => _pageController?.nextPage(
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
                    : !hasPages
                        ? _buildWelcomeEmpty(context)
                        : _pageController == null
                            ? const Center(child: CircularProgressIndicator())
                            : PageView.builder(
                                controller: _pageController,
                                physics: isEditMode
                                    ? const NeverScrollableScrollPhysics()
                                    : const PageScrollPhysics(),
                                itemCount: state.pageList?.pages.length ?? 0,
                                onPageChanged: (index) async {
                                  // ✅ index 已经是 0-based，无需转换
                                  if (state.pageList == null) return;
                                  if (index != state.pageList!.currentPageIndex) {
                                    notifier.changePage(index);  // ✅ 直接传递 0-based
                                  }
                                  final round = state.pageList!.pages[index].round;
                                  await notifier.ensureRoundLoaded(round.id);
                                  await _syncSeenWithVisiblePage();
                                },
                                itemBuilder: (context, index) {
                                  final round = state.pageList!.pages[index].round;
                                  final stream = ref.watch(
                                    roundStreamProvider(
                                      (fileName: widget.fileName, roundId: round.id),
                                    ),
                                  );
                                  final canEdit = stream?.isStreaming != true;                              
                                  return _ChatRoundPage(
                                    key: ValueKey(round.id),
                                    fileName: widget.fileName,
                                    round: round,
                                    canEdit: canEdit,
                                    onRetryReply: () => notifier.retryFromRound(round.id),
                                    onEdit: canEdit 
                                        ? () => _enterEditMode(round.id, round.userContent) 
                                        : null,
                                    onCopyText: _copyText,
                                  );
                                },
                              ),
          ),
          InputBar(
            hintText: isEditMode ? '修改文本后发送' : '发送消息',
            isStreaming: currentIsStreaming,
            onStop: notifier.stopGeneration,
            onSend: (text, attachments) async {
              if (editSourceRoundId != null) {
                await notifier.editAndResendFromRound(
                  editSourceRoundId,
                  text,
                  attachments: attachments,
                );
                _cancelEditMode();
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AppCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 40,
                color: colorScheme.error,
              ),
              const SizedBox(height: 12),
              Text(
                '无法加载会话',
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeEmpty(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AppCard(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_awesome_outlined,
                size: 36,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 18),
              Text(
                '开始一段新的对话',
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                '你可以输入问题、上传图片或文件，并在不同分支中回看每一轮回复。',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
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
  final VoidCallback onRetryReply;
  final VoidCallback? onEdit;
  final Future<void> Function(String text) onCopyText;

  const _ChatRoundPage({
    super.key,
    required this.fileName,
    required this.round,
    required this.canEdit,
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RoundHeader(createdAt: round.createdAt),
              const SizedBox(height: 16),
              const _SectionLabel(
                icon: Icons.person_outline,
                text: '你的输入',
              ),
              const SizedBox(height: 10),
              if (hasUser)
                MessageBubble(
                  content: round.userContent,
                  isUser: true,
                  onCopy: () => onCopyText(round.userContent),
                  onRetryReply: onRetryReply,
                  onEdit: onEdit,
                ),
              if (hasAttachments) ...[
                if (hasUser) const SizedBox(height: 8),
                AttachmentList(
                  attachments: round.userAttachments,
                  rightAligned: true,
                ),
              ],
              _RoundAnswerSection(
                round: round,
                onRetryReply: onRetryReply,
                onCopyText: onCopyText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoundAnswerSection extends StatelessWidget {
  final ChatRound round;
  final VoidCallback onRetryReply;
  final Future<void> Function(String text) onCopyText;

  const _RoundAnswerSection({
    required this.round,
    required this.onRetryReply,
    required this.onCopyText,
  });

  @override
  Widget build(BuildContext context) {
    final thinking = round.assistantThinking ?? '';
    final assistantContent = round.assistantContent ?? '';
    final hasThinking = thinking.trim().isNotEmpty;
    final hasAssistant = assistantContent.trim().isNotEmpty;
    final isStreaming = round.isIncomplete;

    if (!hasThinking && !hasAssistant && !isStreaming) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasThinking) ...[
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 16),
          const _SectionLabel(
            icon: Icons.psychology_alt_outlined,
            text: '推理过程',
          ),
          const SizedBox(height: 10),
          ThoughtBubble(content: thinking),
        ],
        if (hasAssistant || isStreaming) ...[
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 16),
          const _SectionLabel(
            icon: Icons.smart_toy_outlined,
            text: '回答',
          ),
          const SizedBox(height: 10),
          if (hasAssistant)
            MessageBubble(
              content: assistantContent,
              isUser: false,
              onCopy: () => onCopyText(assistantContent),
              onRetryReply: isStreaming ? null : onRetryReply,
            )
          else
            const Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    SizedBox(width: 12),
                    Text('正在生成回答...'),
                  ],
                ),
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
    return MaterialBanner(
      content: const Text('正在编辑重试，发送前不可切换页面，发送时将保留原附件'),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text('取消编辑'),
        ),
      ],
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
    return Chip(
      label: Text(TimeFormatUtils.formatTimestamp(createdAt)),
      visualDensity: VisualDensity.compact,
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
        Icon(icon, size: 18),
        const SizedBox(width: 6),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}

class _PaginationBar extends StatelessWidget {
  final int currentIndex;    // ✅ 0-based 索引
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
    // ✅ 使用统一工具类计算进度
    final progress = PageUtils.calculateProgress(currentIndex, totalPages);
    final textTheme = Theme.of(context).textTheme;

    return Material(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Row(
          children: [
            IconButton(
              onPressed: onPrev,
              icon: const Icon(Icons.chevron_left_rounded),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    // ✅ 使用统一工具类格式化
                    isEditMode
                        ? '编辑中｜${PageUtils.format(currentIndex, totalPages)}'
                        : PageUtils.format(currentIndex, totalPages),
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: progress),
                ],
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: onNext,
              icon: const Icon(Icons.chevron_right_rounded),
            ),
          ],
        ),
      ),
    );
  }
}