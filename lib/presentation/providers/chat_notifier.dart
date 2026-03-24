import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/model_info.dart';
import '../../core/models/session.dart';
import '../../di/providers.dart';
import '../../domain/models/chat_page.dart';
import '../../domain/services/attachment_preparer.dart';
import '../../domain/services/branch_navigator.dart';
import '../../domain/services/chat_context_builder.dart';
import '../../domain/services/chat_round_factory.dart';
import '../../domain/services/chat_stream_accumulator.dart';
import '../../domain/services/chat_view_state_builder.dart';
import '../../domain/states/chat_state.dart';
import '../models/pending_attachment.dart';
import 'global_streaming_provider.dart';
import 'session_card_provider.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;
  final String fileName;

  ChatNotifier(this.ref, this.fileName) : super(ChatState.initial());

  Future<void> loadSession() async {
    state = state.copyWithLoading(true);
    try {
      final repository = ref.read(conversationRepositoryProvider);
      var session = await repository.getSession(fileName);

      if (session.hasUnseenUpdate) {
        final cleared = session.copyWith(hasUnseenUpdate: false);
        await repository.saveSession(fileName, cleared);
        session = cleared;
      }

      final viewState = ChatViewStateBuilder.buildInitial(session);

      state = state.copyWithSession(session).copyWith(
            currentRoundId: viewState.currentRoundId,
            pageList: viewState.pageList,
            error: null,
          );

      if (viewState.currentRoundId != null) {
        await _markRoundSeen(viewState.currentRoundId!);
      }
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }

  void _markSessionStreaming(bool streaming) {
    final notifier = ref.read(globalStreamingSessionsProvider.notifier);
    final current = <String>{...notifier.state};
    if (streaming) {
      current.add(fileName);
    } else {
      current.remove(fileName);
    }
    notifier.state = current;
  }

  void _updateStreamingPreview({
    required String roundId,
    required String content,
    required String reasoning,
  }) {
    final notifier = ref.read(globalStreamingPreviewProvider.notifier);
    final current = <String, StreamingPreview>{...notifier.state};
    current[fileName] = StreamingPreview(
      roundId: roundId,
      content: content,
      reasoning: reasoning,
    );
    notifier.state = current;
  }

  void _clearStreamingPreview() {
    final notifier = ref.read(globalStreamingPreviewProvider.notifier);
    final current = <String, StreamingPreview>{...notifier.state};
    current.remove(fileName);
    notifier.state = current;
  }

  ModelInfo? _findSelectedModelInfo(AppConfig config) {
    final selectedId = config.selectedModel;
    if (selectedId == null || selectedId.trim().isEmpty) return null;
    final models = config.availableModels ?? const <ModelInfo>[];
    return models.firstWhereOrNull((m) => m.id == selectedId);
  }

  bool _shouldEnableReasoning(AppConfig config) {
    final selectedModel = _findSelectedModelInfo(config);
    return selectedModel?.supportsReasoning == true;
  }

  void _validateRequestCapability({
    required AppConfig config,
    required List<PendingAttachment> attachments,
  }) {
    final selectedModel = _findSelectedModelInfo(config);
    if (selectedModel == null) return;
    final hasImage = attachments.any((a) => a.isImage);
    if (hasImage && selectedModel.supportsVision != true) {
      throw Exception('当前模型未声明支持图片输入');
    }
  }

  Future<void> _markRoundSeen(String roundId) async {
    final session = state.session;
    if (session == null) return;

    final target = session.rounds.firstWhereOrNull((r) => r.id == roundId);
    if (target == null || !target.hasUnseenUpdate) return;

    final updatedRound = target.copyWith(hasUnseenUpdate: false);
    final updatedSession = session.copyWith(
      rounds: session.rounds.map((r) {
        if (r.id == roundId) return updatedRound;
        return r;
      }).toList(),
    );

    final repository = ref.read(conversationRepositoryProvider);
    await repository.saveSession(fileName, updatedSession);

    final updatedPageList = _replaceRoundInPageList(
      state.pageList,
      updatedRound,
    );

    state = state.copyWith(
      session: updatedSession,
      pageList: updatedPageList,
    );

    ref.invalidate(sessionCardProvider(fileName));
  }

  Future<void> sendMessage(
    String content, {
    List<PendingAttachment>? attachments,
  }) async {
    if (state.session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }

    try {
      final pendingAttachments = attachments ?? const <PendingAttachment>[];
      final repository = ref.read(conversationRepositoryProvider);
      final config = await ref.read(configRepositoryProvider).getConfig();

      _validateRequestCapability(
        config: config,
        attachments: pendingAttachments,
      );

      final savedAttachments = await AttachmentPreparer.savePendingAttachments(
        repository,
        pendingAttachments,
      );

      final round = ChatRoundFactory.createUserRound(
        content: content,
        parentId: state.currentRoundId,
        attachments: savedAttachments,
      );

      await _appendRoundAndEnterStreaming(round);

      final updatedSession = await repository.getSession(fileName);
      final contextRounds =
          BranchNavigator.getCurrentBranchPath(updatedSession, round.id);

      final apiContext = await ChatContextBuilder.buildFromRounds(
        contextRounds,
        repository,
      );

      _handleStreamTask(round, apiContext, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }

  Future<void> retryFromRound(String roundId) async {
    if (state.session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }

    try {
      final repository = ref.read(conversationRepositoryProvider);
      final config = await ref.read(configRepositoryProvider).getConfig();

      final sourceRound =
          state.session!.rounds.firstWhereOrNull((round) => round.id == roundId);

      if (sourceRound == null) {
        state = state.copyWithError('未找到要重新回复的对话');
        return;
      }

      final selectedModel = _findSelectedModelInfo(config);
      if (selectedModel != null) {
        final hasImage = sourceRound.userAttachments.any((a) => a.isImage);
        if (hasImage && selectedModel.supportsVision != true) {
          state = state.copyWithError('当前模型未声明支持图片输入');
          return;
        }
      }

      final newRound = ChatRoundFactory.createRetryRound(
        sourceRound: sourceRound,
      );

      await _appendRoundAndEnterStreaming(newRound);

      final updatedSession = await repository.getSession(fileName);
      final contextRounds =
          BranchNavigator.getCurrentBranchPath(updatedSession, newRound.id);

      final apiContext = await ChatContextBuilder.buildFromRounds(
        contextRounds,
        repository,
      );

      _handleStreamTask(newRound, apiContext, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }

  Future<void> editAndResendFromRound(
    String roundId,
    String newContent, {
    List<PendingAttachment>? attachments,
  }) async {
    if (state.session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }

    try {
      final repository = ref.read(conversationRepositoryProvider);
      final config = await ref.read(configRepositoryProvider).getConfig();
      final pendingAttachments = attachments ?? const <PendingAttachment>[];

      _validateRequestCapability(
        config: config,
        attachments: pendingAttachments,
      );

      final sourceRound =
          state.session!.rounds.firstWhereOrNull((round) => round.id == roundId);

      if (sourceRound == null) {
        state = state.copyWithError('未找到要编辑重试的对话');
        return;
      }

      final selectedModel = _findSelectedModelInfo(config);
      if (selectedModel != null) {
        final hasImage = sourceRound.userAttachments.any((a) => a.isImage) ||
            pendingAttachments.any((a) => a.isImage);
        if (hasImage && selectedModel.supportsVision != true) {
          state = state.copyWithError('当前模型未声明支持图片输入');
          return;
        }
      }

      final savedAttachments = await AttachmentPreparer.savePendingAttachments(
        repository,
        pendingAttachments,
      );

      final mergedAttachments = [
        ...sourceRound.userAttachments,
        ...savedAttachments,
      ];

      final newRound = ChatRoundFactory.createEditedRetryRound(
        sourceRound: sourceRound,
        newContent: newContent,
        attachments: mergedAttachments,
      );

      await _appendRoundAndEnterStreaming(newRound);

      final updatedSession = await repository.getSession(fileName);
      final contextRounds =
          BranchNavigator.getCurrentBranchPath(updatedSession, newRound.id);

      final apiContext = await ChatContextBuilder.buildFromRounds(
        contextRounds,
        repository,
      );

      _handleStreamTask(newRound, apiContext, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }

  Future<void> _appendRoundAndEnterStreaming(ChatRound round) async {
    final repository = ref.read(conversationRepositoryProvider);
    await repository.appendRound(fileName, round);

    final updatedSession = await repository.getSession(fileName);
    final viewState = ChatViewStateBuilder.buildForRound(updatedSession, round.id);

    final newActiveStreams = Map<String, StreamStatus>.from(state.activeStreams);
    newActiveStreams[round.id] = const StreamStatus();

    _markSessionStreaming(true);

    state = state.copyWithSession(updatedSession).copyWith(
          currentRoundId: viewState.currentRoundId,
          pageList: viewState.pageList,
          activeStreams: newActiveStreams,
          error: null,
        );

    ref.invalidate(sessionCardProvider(fileName));
  }

  Future<void> _handleStreamTask(
    ChatRound round,
    List<ApiMessage> apiContext,
    AppConfig config,
  ) async {
    final apiService = ref.read(apiServiceProvider);
    final accumulator = ChatStreamAccumulator();

    try {
      final stream = apiService.chatStream(
        taskId: round.id,
        baseUrl: config.baseUrl,
        apiKey: config.apiKey,
        chatPath: config.chatPath,
        apiMode: config.apiMode,
        model: config.selectedModel ?? 'unknown-model',
        context: apiContext,
        enableReasoning: _shouldEnableReasoning(config),
      );

      await for (final chunk in stream) {
        if (chunk.error != null) {
          _markSessionStreaming(false);
          _clearStreamingPreview();
          ref.invalidate(sessionCardProvider(fileName));
          state = state.copyWithStreaming(round.id, error: chunk.error);
          return;
        }

        if (!chunk.isDone) {
          accumulator.add(chunk);

          _updateStreamingPreview(
            roundId: round.id,
            content: accumulator.content,
            reasoning: accumulator.reasoning,
          );

          state = state.copyWithStreaming(
            round.id,
            content: accumulator.content,
            reasoning: accumulator.reasoning,
            isDone: false,
          );
        } else {
          break;
        }
      }

      final completedRound = ChatRoundFactory.completeRound(
        round: round,
        content: accumulator.content,
        reasoning: accumulator.reasoning,
      ).copyWith(
        hasUnseenUpdate: true,
      );

      final repository = ref.read(conversationRepositoryProvider);
      await repository.updateRound(fileName, round.id, completedRound);

      final finalSessionRaw = await repository.getSession(fileName);
      final finalSession = finalSessionRaw.copyWith(
        hasUnseenUpdate: true,
        rounds: finalSessionRaw.rounds.map((r) {
          if (r.id == completedRound.id) return completedRound;
          return r;
        }).toList(),
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );

      await repository.saveSession(fileName, finalSession);

      final finalPageList = _replaceRoundInCurrentPages(completedRound);

      _markSessionStreaming(false);
      _clearStreamingPreview();
      ref.invalidate(sessionCardProvider(fileName));

      state = state.copyWithStreaming(round.id, isDone: true).copyWith(
            session: finalSession,
            pageList: finalPageList,
            error: null,
          );
    } catch (e) {
      _markSessionStreaming(false);
      _clearStreamingPreview();
      ref.invalidate(sessionCardProvider(fileName));
      state = state.copyWithStreaming(round.id, error: e.toString());
    }
  }

  ChatPageList? _replaceRoundInCurrentPages(ChatRound updatedRound) {
    final currentPageList = state.pageList;
    if (currentPageList == null) return null;
    return _replaceRoundInPageList(currentPageList, updatedRound);
  }

  ChatPageList? _replaceRoundInPageList(
    ChatPageList? pageList,
    ChatRound updatedRound,
  ) {
    if (pageList == null) return null;

    final updatedPages = pageList.pages.map((page) {
      if (page.round.id == updatedRound.id) {
        return page.copyWith(round: updatedRound);
      }
      return page;
    }).toList();

    return pageList.copyWith(pages: updatedPages);
  }

  void stopGeneration() {
    if (state.pageList == null || state.pageList!.pages.isEmpty) return;

    final viewingRound =
        state.pageList!.pages[state.pageList!.currentPageIndex].round;

    if (!state.activeStreams.containsKey(viewingRound.id)) return;

    final apiService = ref.read(apiServiceProvider);
    apiService.cancelRequest(viewingRound.id);

    _markSessionStreaming(false);
    _clearStreamingPreview();
    ref.invalidate(sessionCardProvider(fileName));
  }

  Future<void> switchBranch(String targetRoundId) async {
    if (state.session == null) return;

    final session = state.session!;
    final newRoundId = BranchNavigator.switchBranch(session, targetRoundId);
    final viewState = ChatViewStateBuilder.buildForRound(session, newRoundId);

    state = state.copyWithCurrentRoundId(newRoundId).copyWith(
          pageList: viewState.pageList,
        );

    await _markRoundSeen(newRoundId);
  }

  Future<void> changePage(int pageIndex) async {
    if (state.pageList == null) return;

    final pages = state.pageList!.pages;
    if (pageIndex < 0 || pageIndex >= pages.length) return;

    final targetPage = pages[pageIndex];
    final newRoundId = targetPage.round.id;

    state = state.copyWithCurrentRoundId(newRoundId).copyWith(
          pageList: state.pageList!.copyWith(currentPageIndex: pageIndex),
        );

    await _markRoundSeen(newRoundId);
  }
}

final chatProvider =
    StateNotifierProvider.family<ChatNotifier, ChatState, String>(
  (ref, fileName) {
    return ChatNotifier(ref, fileName);
  },
);