import 'package:aiservice/di/providers.dart';
import 'package:aiservice/domain/services/character_card_parser.dart';
import 'package:aiservice/domain/services/chat_service.dart';
import 'package:aiservice/presentation/models/pending_attachment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/chat_notifier.dart';
import '../widgets/attachment_list.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/thought_bubble.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import 'branch_tree_page.dart';
import '../providers/character_provider.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String sessionId;
  final String? initialRoundId;
  final String? initialMessage;
  final List<PendingAttachment>? initialAttachments;

  const ChatPage({
    super.key,
    required this.sessionId,
    this.initialRoundId,
    this.initialMessage,
    this.initialAttachments,
  });

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  PageController? _pageController;
  bool _initialMessageHandled = false;

  String? _branchLeafId;
  String? _currentRoundId;
  
  @override
  void initState() {
    super.initState();
    _branchLeafId = widget.initialRoundId;
    _currentRoundId = widget.initialRoundId;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ensureInitialRoundId();
    });
  }

  String _getTitleWithPage(String sessionTitle, List<String> visibleRoundIds, String? currentRoundId) {
    final total = visibleRoundIds.length;
    final currentIndex = visibleRoundIds.indexOf(currentRoundId ?? '');
    if (currentIndex == -1) return sessionTitle;
    return '$sessionTitle (${currentIndex + 1}/$total)';
  }

  Future<void> _ensureInitialRoundId() async {
    if (_branchLeafId != null) return;
    final topology = await ref.read(chatTopologyProvider(widget.sessionId).future);
    if (topology.isNotEmpty && mounted) {
      setState(() {
        _branchLeafId = topology.last.id;
        _currentRoundId = _branchLeafId;
      });
    }
  }

  Future<void> _maybeSendGreeting() async {
    final character = ref.read(currentCharacterProvider);
    final greetingSent = ref.read(characterGreetingSentProvider);
    
    if (character != null && !greetingSent && character.firstMes.isNotEmpty) {
      ref.read(characterGreetingSentProvider.notifier).state = true;
      
      final newId = await character.appendGreeting(
        repository: ref.read(conversationRepositoryProvider),
        sessionId: widget.sessionId,
      );
      _updateBranch(newId);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleInitialMessage();
  }

  void _handleInitialMessage() async { 
    if (_initialMessageHandled || widget.initialMessage == null) return;
    _initialMessageHandled = true;

    try {
      final newId = await ChatService.sendMessage(
        repository: ref.read(conversationRepositoryProvider),
        configService: ref.read(configServiceProvider),
        sourceRouter: ref.read(chatSourceRouterProvider),
        sessionId: widget.sessionId,
        content: widget.initialMessage!,
        parentRoundId: _currentRoundId,
        pendingAttachments: widget.initialAttachments ?? [],
        character: ref.read(currentCharacterProvider),
      );
      _updateBranch(newId);
    } catch (e) {
      AppToast.show('发送失败：$e');
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void _updateBranch(String leafId) {
    if (!mounted) return;
    setState(() {
      _branchLeafId = leafId;
      _currentRoundId = leafId;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(chatTopologyProvider(widget.sessionId), (prev, next) {
      final topology = next.valueOrNull;
      if (topology != null && _currentRoundId != null && !topology.any((t) => t.id == _currentRoundId)) {
        setState(() => _currentRoundId = topology.isNotEmpty ? topology.last.id : null);
      }
    });
    
    final hasUnseen = ref.watch(
      roundDetailProvider(_currentRoundId ?? '').select(
        (round) => round.valueOrNull?.hasUnseenUpdate ?? false,
      ),
    );

    if (hasUnseen && ModalRoute.of(context)?.isCurrent == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref.read(conversationRepositoryProvider).updateRound(
                roundId: _currentRoundId!,
                hasUnseenUpdate: false,
              );
        }
      });
    }

    final sessionTitle = ref.watch(sessionTitleProvider(widget.sessionId)).valueOrNull ?? '未加载';
    final currentRoundAsync = ref.watch(roundDetailProvider(_currentRoundId ?? ''));
    final isIncomplete = currentRoundAsync.valueOrNull?.isIncomplete ?? false;
    
    ref.listen<CharacterData?>(
      currentCharacterProvider,
      (previous, next) {
        if (previous?.name != next?.name) {
          ref.read(characterGreetingSentProvider.notifier).state = false;
        }
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maybeSendGreeting();
    });

    final visibleRoundIds = ref.watch(visibleRoundIdsProvider(( 
      sessionId: widget.sessionId,
      roundId: _branchLeafId,
    )));

    int currentIndex = visibleRoundIds.indexOf(_currentRoundId ?? '');

    if (currentIndex != -1) {
      _pageController ??= PageController(initialPage: currentIndex);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageController!.jumpToPage(currentIndex);
      });
    } else {
      _pageController ??= PageController(initialPage: 0);
    }

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_getTitleWithPage(sessionTitle, visibleRoundIds, _currentRoundId)),
        trailing: CupertinoButton(
          onPressed: () async {
            final selectedId = await Navigator.of(context).push<String>(
              CupertinoPageRoute(
                builder: (_) => BranchTreePage(
                  sessionId: widget.sessionId,
                  initialFocusRoundId: _currentRoundId!,
                ),
              ),
            );
            if (selectedId != null) _updateBranch(selectedId);
          },
          child: const Icon(CupertinoIcons.arrow_branch),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: visibleRoundIds.isEmpty
                ? const Center(child: Text('加载中'))
                : PageView.builder(
                    controller: _pageController,
                    physics: const PageScrollPhysics(),
                    itemCount: visibleRoundIds.length,
                    onPageChanged: (index) {
                      final targetId = visibleRoundIds[index];
                      setState(() => _currentRoundId = targetId);
                    },
                    itemBuilder: (_, index) => _ChatRoundPage(
                      key: ValueKey(visibleRoundIds[index]),
                      sessionId: widget.sessionId,
                      roundId: visibleRoundIds[index],
                      onRetryReply: () => _retry(visibleRoundIds[index]),
                    ),
                  ),
          ),
          InputBar(
            hintText: '发送消息',
            isIncomplete: isIncomplete, 
            onStop: () {
              ChatService.stopGeneration(
                _currentRoundId!, 
                ref.read(conversationRepositoryProvider),
              );
            },
            onSend: (text, attachments) async {
              final newId = await ChatService.sendMessage(
                repository: ref.read(conversationRepositoryProvider),
                configService: ref.read(configServiceProvider),
                sourceRouter: ref.read(chatSourceRouterProvider),
                sessionId: widget.sessionId,
                content: text,
                parentRoundId: _currentRoundId,
                pendingAttachments: attachments,
                character: ref.read(currentCharacterProvider),
              );
              _updateBranch(newId);
            },
          ),
        ],
      ),
    );
  }

  void _retry(String roundId) async {
    final sourceRound = await ref.read(roundDetailProvider(roundId).future);
    if (sourceRound == null) return;

    final newId = await ChatService.retryFromRound(
      repository: ref.read(conversationRepositoryProvider),
      configService: ref.read(configServiceProvider),
      sourceRouter: ref.read(chatSourceRouterProvider),
      sessionId: widget.sessionId,
      sourceRound: sourceRound,
      character: ref.read(currentCharacterProvider),
    );
    _updateBranch(newId);
  }
}

class _ChatRoundPage extends StatelessWidget {
  final String sessionId;
  final String roundId;
  final VoidCallback onRetryReply;

  const _ChatRoundPage({
    super.key,
    required this.sessionId,
    required this.roundId,
    required this.onRetryReply,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _UserSection(
              roundId: roundId,
              onRetryReply: onRetryReply,
            ),
            _ThinkingSection(roundId: roundId),
            _AiReplySection(
              roundId: roundId,
              onRetryReply: onRetryReply,
            ),
          ],
        ),
      ],
    );
  }
}

class _UserSection extends ConsumerWidget {
  final String roundId;
  final VoidCallback onRetryReply;

  const _UserSection({
    required this.roundId,
    required this.onRetryReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId).select((s) {
      final r = s.valueOrNull;
      return r == null
          ? null
          : (
              content: r.userContent,
              time: r.createdAt,
              attach: r.userAttachments,
              inc: r.isIncomplete
            );
    }));

    if (round == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(round.time)),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.88,
            ),
            child: MessageBubble(
              content: round.content,
              isUser: true,
              onCopy: () {
                Clipboard.setData(ClipboardData(text: round.content));
                AppToast.show('已复制');
              },
              onRetryReply: onRetryReply,
            ),
          ),
        ),
        if (round.attach.isNotEmpty) ...[
          const SizedBox(height: 8),
          AttachmentList(attachments: round.attach),
        ],
      ],
    );
  }
}

class _ThinkingSection extends ConsumerWidget {
  final String roundId;

  const _ThinkingSection({required this.roundId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thinking = ref.watch(
      roundDetailProvider(roundId).select((s) => s.valueOrNull?.assistantThinking),
    );
    if (thinking == null || thinking.trim().isEmpty) {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.88,
        ),
        child: ThoughtBubble(content: thinking),
      ),
    );
  }
}

class _AiReplySection extends ConsumerWidget {
  final String roundId;
  final VoidCallback onRetryReply;

  const _AiReplySection({
    required this.roundId,
    required this.onRetryReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ai = ref.watch(roundDetailProvider(roundId).select((s) {
      final r = s.valueOrNull;
      return r == null
          ? null
          : (content: r.assistantContent, isIncomplete: r.isIncomplete);
    }));

    if (ai == null || (ai.content == null && !ai.isIncomplete)) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ai.content != null)
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.88,
              ),
              child: MessageBubble(
                content: ai.content!,
                isUser: false,
                onCopy: () {
                  Clipboard.setData(ClipboardData(text: ai.content!));
                  AppToast.show('已复制');
                },
                onRetryReply: ai.isIncomplete ? null : onRetryReply,
              ),
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.all(8),
            child: CupertinoActivityIndicator(),
          ),
      ],
    );
  }
}