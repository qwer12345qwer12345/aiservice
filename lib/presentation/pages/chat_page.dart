import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../../core/utils/app_route_observer.dart';
import '../../core/utils/time_format_utils.dart';
import '../models/pending_attachment.dart';
import '../providers/chat_notifier.dart';
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
import '../../domain/services/branch_navigator.dart';

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
  late final ProviderSubscription<AsyncValue<Session?>> _sessionSubscription;

  bool _initialMessageHandled = false;
  bool _isMarkingSeen = false;
  bool _isRouteVisible = false;
  ModalRoute<dynamic>? _route;

  String? _branchRoundId;
  String? _currentRoundId;

  @override
  void initState() {
    super.initState();

    _branchRoundId = widget.initialRoundId;
    _currentRoundId = widget.initialRoundId;

    _sessionSubscription = ref.listenManual<AsyncValue<Session?>>(
      chatSessionProvider(widget.fileName),
      (previous, next) {
        next.whenData((session) async {
          _reconcileSession(session);

          if (_initialMessageHandled || session == null || !mounted) {
            return;
          }

          final message = widget.initialMessage?.trim() ?? '';
          final attachments =
              widget.initialAttachments ?? const <PendingAttachment>[];
          final hasContent = message.isNotEmpty || attachments.isNotEmpty;

          if (!hasContent) return;

          _initialMessageHandled = true;
          try {
            final newRoundId =
                await ref.read(chatControllerProvider(widget.fileName)).sendMessage(
                      content: message,
                      parentRoundId: _currentRoundId,
                      attachments: attachments,
                    );

            if (!mounted) return;
            setState(() {
              _branchRoundId = newRoundId;
              _currentRoundId = newRoundId;
            });
          } catch (e) {
            if (mounted) {
              AppToast.show('发送失败：${e.toString()}');
            }
          }
        });
      },
    );
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
    _sessionSubscription.close();
    appRouteObserver.unsubscribe(this);
    _pageController?.dispose();
    super.dispose();
  }

  List<ChatRound> _buildVisibleRounds(
    Session? session,
    String? branchRoundId,
  ) {
    if (session == null || branchRoundId == null) {
      return const <ChatRound>[];
    }
    return BranchNavigator.getCurrentBranchPath(session, branchRoundId);
  }

  int _resolveCurrentIndex(List<ChatRound> visibleRounds, String? currentRoundId) {
    if (visibleRounds.isEmpty || currentRoundId == null) return 0;
    final index = visibleRounds.indexWhere((round) => round.id == currentRoundId);
    if (index < 0) return visibleRounds.length - 1;
    return index;
  }

  String? _resolveBranchRoundId(Session session, String? preferredRoundId) {
    if (preferredRoundId != null &&
        session.rounds.any((r) => r.id == preferredRoundId)) {
      return preferredRoundId;
    }

    final leaves = BranchNavigator.getAllBranchLeaves(session);
    if (leaves.isNotEmpty) {
      return leaves.last.id;
    }

    if (session.rounds.isNotEmpty) {
      return session.rounds.first.id;
    }

    return null;
  }

  String? _resolveCurrentRoundId(
    List<ChatRound> visibleRounds,
    String? preferredRoundId,
  ) {
    if (preferredRoundId != null &&
        visibleRounds.any((r) => r.id == preferredRoundId)) {
      return preferredRoundId;
    }

    return visibleRounds.isNotEmpty ? visibleRounds.last.id : null;
  }

  void _reconcileSession(Session? session) {
    if (!mounted) return;

    if (session == null) {
      setState(() {
        _branchRoundId = null;
        _currentRoundId = null;
      });
      return;
    }

    final nextBranchRoundId = _resolveBranchRoundId(session, _branchRoundId);

    final visibleRounds = nextBranchRoundId == null
        ? const <ChatRound>[]
        : BranchNavigator.getCurrentBranchPath(session, nextBranchRoundId);

    final nextCurrentRoundId =
        _resolveCurrentRoundId(visibleRounds, _currentRoundId);

    final nextIndex = _resolveCurrentIndex(visibleRounds, nextCurrentRoundId);

    final shouldUpdateState = nextBranchRoundId != _branchRoundId ||
        nextCurrentRoundId != _currentRoundId;

    if (shouldUpdateState) {
      setState(() {
        _branchRoundId = nextBranchRoundId;
        _currentRoundId = nextCurrentRoundId;
      });
    }

    if (visibleRounds.isNotEmpty && _pageController == null) {
      _pageController = PageController(initialPage: nextIndex);
      if (mounted) {
        setState(() {});
      }
      return;
    }

    final controller = _pageController;
    if (controller != null && controller.hasClients) {
      final currentPage = controller.page?.round() ?? controller.initialPage;
      if (currentPage != nextIndex) {
        controller.jumpToPage(nextIndex);
      }
    }
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

    final session = ref.read(chatSessionProvider(widget.fileName)).valueOrNull;
    final visibleRounds = _buildVisibleRounds(session, _branchRoundId);
    if (visibleRounds.isEmpty) return;

    final currentIndex = _resolveCurrentIndex(visibleRounds, _currentRoundId);
    final currentPage = controller.page;
    final index = currentPage != null
        ? currentPage.round().clamp(0, visibleRounds.length - 1)
        : currentIndex;

    final round = visibleRounds[index];
    if (!round.hasUnseenUpdate) return;

    _isMarkingSeen = true;
    try {
      await ref
          .read(chatControllerProvider(widget.fileName))
          .markRoundSeen(round.id);
    } finally {
      _isMarkingSeen = false;
    }
  }

  Future<void> _retryFromRound(String roundId) async {
    try {
      final newRoundId =
          await ref.read(chatControllerProvider(widget.fileName)).retryFromRound(
                roundId,
              );

      if (!mounted) return;
      setState(() {
        _branchRoundId = newRoundId;
        _currentRoundId = newRoundId;
      });
    } catch (e) {
      if (mounted) {
        await AppToast.show('重新生成失败：$e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sessionAsync = ref.watch(chatSessionProvider(widget.fileName));
    final chatController = ref.read(chatControllerProvider(widget.fileName));
    final editSourceRoundId = ref.watch(globalEditSourceRoundIdProvider);
    final isEditMode = editSourceRoundId != null;

    return sessionAsync.when(
      loading: () => AppPageScaffold(
        appBar: AppBar(
          title: const Text('对话'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => AppPageScaffold(
        appBar: AppBar(
          title: const Text('对话'),
        ),
        body: _buildErrorState('加载会话失败：$e'),
      ),
      data: (session) {
        final visibleRounds = _buildVisibleRounds(session, _branchRoundId);
        final currentIndex =
            _resolveCurrentIndex(visibleRounds, _currentRoundId);
        final hasPages = visibleRounds.isNotEmpty;
        final textTheme = Theme.of(context).textTheme;
        final currentRound =
            hasPages && PageUtils.isValidIndex(currentIndex, visibleRounds.length)
                ? visibleRounds[currentIndex]
                : null;
        final currentIsStreaming = currentRound?.isIncomplete == true;

        return AppPageScaffold(
          appBar: AppBar(
            title: Text(
              session?.title ?? '对话',
              style: textTheme.titleMedium,
            ),
            actions: [
              if (session != null && _currentRoundId != null)
                IconButton(
                  tooltip: isEditMode ? '编辑模式下不可切换页面' : '查看分支树',
                  icon: const Icon(Icons.account_tree_outlined),
                  onPressed: isEditMode
                      ? null
                      : () async {
                          final selectedRoundId =
                              await Navigator.of(context).push<String?>(
                            MaterialPageRoute(
                              builder: (_) => BranchTreePage(
                                fileName: widget.fileName,
                                initialFocusRoundId: _currentRoundId!,
                              ),
                            ),
                          );

                          if (!mounted ||
                              selectedRoundId == null) {
                            return;
                          }

                          setState(() {
                            _branchRoundId = selectedRoundId;
                            _currentRoundId = selectedRoundId;
                          });

                          final nextVisibleRounds =
                              _buildVisibleRounds(session, _branchRoundId);
                          final nextIndex = _resolveCurrentIndex(
                            nextVisibleRounds,
                            _currentRoundId,
                          );

                          if (_pageController != null &&
                              _pageController!.hasClients) {
                            _pageController!.jumpToPage(nextIndex);
                          }
                        },
                ),
            ],
          ),
          body: Column(
            children: [
              if (hasPages)
                _PaginationBar(
                  currentIndex: currentIndex,
                  totalPages: visibleRounds.length,
                  onPrev: isEditMode
                      ? null
                      : currentIndex > 0
                          ? () => _pageController?.previousPage(
                                duration: const Duration(milliseconds: 260),
                                curve: Curves.easeOutCubic,
                              )
                          : null,
                  onNext: isEditMode
                      ? null
                      : currentIndex < visibleRounds.length - 1
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
                child: session == null
                    ? _buildErrorState('会话不存在')
                    : !hasPages
                        ? _buildWelcomeEmpty(context)
                        : _pageController == null
                            ? const Center(child: CircularProgressIndicator())
                            : PageView.builder(
                                controller: _pageController,
                                physics: isEditMode
                                    ? const NeverScrollableScrollPhysics()
                                    : const PageScrollPhysics(),
                                itemCount: visibleRounds.length,
                                onPageChanged: (index) async {
                                  if (!PageUtils.isValidIndex(
                                    index,
                                    visibleRounds.length,
                                  )) {
                                    return;
                                  }

                                  final round = visibleRounds[index];
                                  setState(() {
                                    _currentRoundId = round.id;
                                  });

                                  await _syncSeenWithVisiblePage();
                                },
                                itemBuilder: (context, index) {
                                  final round = visibleRounds[index];
                                  final canEdit = !round.isIncomplete;
                                  return _ChatRoundPage(
                                    key: ValueKey(round.id),
                                    fileName: widget.fileName,
                                    round: round,
                                    canEdit: canEdit,
                                    onRetryReply: () => _retryFromRound(round.id),
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
                hintText: isEditMode ? '修改文本后发送' : '发送消息',
                isStreaming: currentIsStreaming,
                onStop: currentRound == null
                    ? null
                    : () => chatController.stopGeneration(currentRound.id),
                onSend: (text, attachments) async {
                  try {
                    if (editSourceRoundId != null) {
                      final newRoundId =
                          await chatController.editAndResendFromRound(
                        editSourceRoundId,
                        text,
                        attachments: attachments,
                      );

                      if (!mounted) return;
                      setState(() {
                        _branchRoundId = newRoundId;
                        _currentRoundId = newRoundId;
                      });
                      _cancelEditMode();
                      return;
                    }

                    final newRoundId = await chatController.sendMessage(
                      content: text,
                      parentRoundId: _currentRoundId,
                      attachments: attachments,
                    );

                    if (!mounted) return;
                    setState(() {
                      _branchRoundId = newRoundId;
                      _currentRoundId = newRoundId;
                    });
                  } catch (e) {
                    if (mounted) {
                      await AppToast.show('发送失败：$e');
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
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