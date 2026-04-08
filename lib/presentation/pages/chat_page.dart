import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/app_route_observer.dart';
import 'package:intl/intl.dart';
import '../providers/chat_notifier.dart';
import '../providers/config_notifier.dart';
import '../providers/input_draft_provider.dart';
import '../widgets/attachment_list.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/thought_bubble.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import 'branch_tree_page.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String fileName;
  final String? initialRoundId;
  final String? initialMessage;
  final List<dynamic>? initialAttachments;

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
  bool _initialMessageHandled = false;
  bool _isRouteVisible = false;
  ModalRoute<dynamic>? _route;

  String? _branchLeafId;
  String? _currentRoundId;

  @override
  void initState() {
    super.initState();
    _branchLeafId = widget.initialRoundId;
    _currentRoundId = widget.initialRoundId;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _subscribeRoute();
    _handleInitialMessage();
  }

  void _handleInitialMessage() async {
    if (_initialMessageHandled || widget.initialMessage == null) return;
    _initialMessageHandled = true;

    try {
      final newId =
          await ref.read(chatControllerProvider(widget.fileName)).sendMessage(
                content: widget.initialMessage!,
                parentRoundId: _currentRoundId,
                attachments: widget.initialAttachments?.cast() ?? [],
              );
      _updateBranch(newId);
    } catch (e) {
      AppToast.show('发送失败：$e');
    }
  }

  void _subscribeRoute() {
    final route = ModalRoute.of(context);
    if (route != _route && route is PageRoute) {
      if (_route != null) appRouteObserver.unsubscribe(this);
      _route = route;
      appRouteObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
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
    final sessionTitle = ref.watch(sessionTitleProvider(widget.fileName)).valueOrNull ?? '未加载';
    final currentRoundAsync = ref.watch(roundDetailProvider(_currentRoundId ?? ''));
    final isIncomplete = currentRoundAsync.valueOrNull?.isIncomplete ?? false;
    final configAsync = ref.watch(configProvider);
    final editSourceRoundId = ref.watch(globalEditSourceRoundIdProvider);
    final isEditMode = editSourceRoundId != null;

    final currentConfig = configAsync.valueOrNull;
    final selectedModelId = currentConfig?.selectedModel;
    final selectedModel = currentConfig?.availableModels
        ?.where((m) => m.id == selectedModelId)
        .firstOrNull;
    final allowImages = selectedModel?.supportsVision == true;

    if (_branchLeafId == null) {
      final topology = ref.watch(chatTopologyProvider(widget.fileName)).valueOrNull;
      if (topology != null && topology.isNotEmpty) {
        _branchLeafId = topology.last.id;
        _currentRoundId = _branchLeafId;
      }
    }

    final visibleRoundIds = ref.watch(visibleRoundIdsProvider((
      fileName: widget.fileName,
      roundId: _branchLeafId,
    )));

    int currentIndex = visibleRoundIds.indexOf(_currentRoundId ?? '');

    if (currentIndex != -1) {
      _pageController ??= PageController(initialPage: currentIndex);
      if (_pageController!.hasClients &&
          _pageController!.page?.round() != currentIndex) {
        _pageController!.jumpToPage(currentIndex);
      }
    } else {
      _pageController ??= PageController(initialPage: 0);
    }

    return AppPageScaffold(
      appBar: AppBar(
        title: Text(sessionTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_tree_outlined),
            onPressed: (isEditMode || _currentRoundId == null)
                ? null
                : () async {
                    final selectedId =
                        await Navigator.of(context).push<String>(
                      MaterialPageRoute(
                        builder: (_) => BranchTreePage(
                          fileName: widget.fileName,
                          initialFocusRoundId: _currentRoundId!,
                        ),
                      ),
                    );
                    if (selectedId != null) _updateBranch(selectedId);
                  },
          ),
        ],
      ),
      body: Column(
        children: [
          if (visibleRoundIds.isNotEmpty)
            _PaginationBar(
              currentIndex: currentIndex,
              totalPages: visibleRoundIds.length,
              onPrev: (currentIndex > 0 && !isEditMode)
                  ? () => _pageController?.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutCubic,
                      )
                  : null,
              onNext: (currentIndex < visibleRoundIds.length - 1 && !isEditMode)
                  ? () => _pageController?.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutCubic,
                      )
                  : null,
              isEditMode: isEditMode,
            ),
          if (isEditMode)
            MaterialBanner(
              content: const Text('正在编辑，发送前不可切换页面'),
              actions: [
                TextButton(
                  onPressed: () => _setEditMode(null, ''),
                  child: const Text('取消'),
                ),
              ],
            ),
          Expanded(
            child: visibleRoundIds.isEmpty
                ? const Center(child: Text('加载中'))
                : PageView.builder(
                    controller: _pageController,
                    physics: isEditMode
                        ? const NeverScrollableScrollPhysics()
                        : const PageScrollPhysics(),
                    itemCount: visibleRoundIds.length,
                    onPageChanged: (index) {
                      final targetId = visibleRoundIds[index];
                      setState(() => _currentRoundId = targetId);
                      _markAsSeen(targetId);
                    },
                    itemBuilder: (_, index) => _ChatRoundPage(
                      key: ValueKey(visibleRoundIds[index]),
                      fileName: widget.fileName,
                      roundId: visibleRoundIds[index],
                      onRetryReply: () => _retry(visibleRoundIds[index]),
                      onEdit: (text) => _setEditMode(visibleRoundIds[index], text),
                    ),
                  ),
          ),
          InputBar(
            hintText: isEditMode ? '编辑并重试' : '发送消息',
            allowImages: allowImages,
            isIncomplete: isIncomplete,
            onStop: () => ref
                .read(chatControllerProvider(widget.fileName))
                .stopGeneration(_currentRoundId!),
            onSend: (text, attachments) async {
              final controller = ref.read(chatControllerProvider(widget.fileName));
              final newId = isEditMode
                  ? await controller.editAndResendFromRound(
                      editSourceRoundId,
                      text,
                      attachments: attachments,
                    )
                  : await controller.sendMessage(
                      content: text,
                      parentRoundId: _currentRoundId,
                      attachments: attachments,
                    );
              _updateBranch(newId);
              _setEditMode(null, '');
            },
          ),
        ],
      ),
    );
  }

  void _markAsSeen(String roundId) {
    if (!_isRouteVisible) return;
    final roundAsync = ref.read(roundDetailProvider(roundId));
    final round = roundAsync.valueOrNull;  
    if (round?.hasUnseenUpdate == true) {
      ref.read(chatControllerProvider(widget.fileName)).markRoundSeen(round!);
    }
  }

  void _retry(String roundId) async {
    final newId =
        await ref.read(chatControllerProvider(widget.fileName)).retryFromRound(roundId);
    _updateBranch(newId);
  }

  void _setEditMode(String? roundId, String text) {
    ref.read(globalEditSourceRoundIdProvider.notifier).state = roundId;
    ref.read(globalInputDraftProvider.notifier).state = text;
  }

  @override
  void didPush() => _isRouteVisible = true;

  @override
  void didPopNext() {
    _isRouteVisible = true;
    if (_currentRoundId != null) _markAsSeen(_currentRoundId!);
  }

  @override
  void didPushNext() => _isRouteVisible = false;
}

class _ChatRoundPage extends StatelessWidget {
  final String fileName;
  final String roundId;
  final VoidCallback onRetryReply;
  final Function(String) onEdit;

  const _ChatRoundPage({
    super.key,
    required this.fileName,
    required this.roundId,
    required this.onRetryReply,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _UserSection(
                  roundId: roundId,
                  onEdit: onEdit,
                  onRetryReply: onRetryReply,
                ),
                _ThinkingSection(roundId: roundId),
                _AiReplySection(
                  roundId: roundId,
                  onRetryReply: onRetryReply,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _UserSection extends ConsumerWidget {
  final String roundId;
  final Function(String) onEdit;
  final VoidCallback onRetryReply;

  const _UserSection({
    required this.roundId,
    required this.onEdit,
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
        Chip(label: Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(round.time)))),
        const SizedBox(height: 12),
        MessageBubble(
          content: round.content,
          isUser: true,
          onEdit: round.inc ? null : () => onEdit(round.content),
          onCopy: () => Clipboard.setData(ClipboardData(text: round.content)),
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
    return Column(
      children: [
        const Divider(height: 32),
        ThoughtBubble(content: thinking),
      ],
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
        const Divider(height: 32),
        if (ai.content != null)
          MessageBubble(
            content: ai.content!,
            isUser: false,
            onRetryReply: ai.isIncomplete ? null : onRetryReply,
            onCopy: () => Clipboard.setData(ClipboardData(text: ai.content!)),
          )
        else
          const Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
      ],
    );
  }
}

class _PaginationBar extends StatelessWidget {
  final int currentIndex, totalPages;
  final VoidCallback? onPrev, onNext;
  final bool isEditMode;

  const _PaginationBar({
    required this.currentIndex,
    required this.totalPages,
    this.onPrev,
    this.onNext,
    required this.isEditMode,
  });

  @override
  Widget build(BuildContext context) {
    final displayPage = currentIndex + 1;
    final progress = totalPages == 0 ? 0.0 : displayPage.clamp(1, totalPages) / totalPages;
    final pageText = totalPages == 0 ? '0 / 0' : '$displayPage / $totalPages';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: [
          IconButton(onPressed: onPrev, icon: const Icon(Icons.chevron_left)),
          Expanded(
            child: Column(
              children: [
                Text(
                  pageText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(value: progress),
              ],
            ),
          ),
          IconButton(onPressed: onNext, icon: const Icon(Icons.chevron_right)),
        ],
      ),
    );
  }
}