import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/model_info.dart';
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
import '../utils/page_utils.dart';
import 'global_streaming_provider.dart';
import 'session_card_provider.dart';
import 'session_list_notifier.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;
  final String fileName;
  final Set<String> _stoppingRoundIds = <String>{};

  ChatNotifier(this.ref, this.fileName) : super(ChatState.initial());

  GlobalStreamCacheNotifier get _streamCache =>
      ref.read(globalStreamCacheProvider.notifier);

  StreamStatus? _getRoundStream(String roundId) {
    final globalMap = ref.read(globalStreamCacheProvider);
    return globalMap[fileName]?[roundId];
  }

  Future<void> ensureRoundLoaded(String roundId) async {
    final session = state.session;
    if (session == null) return;
    final round = session.rounds.firstWhereOrNull((r) => r.id == roundId);
    if (round == null) return;
    _streamCache.ensureRoundLoaded(fileName, round);
  }

  Future<void> ensureRoundsLoaded(List<String> roundIds) async {
    final session = state.session;
    if (session == null || roundIds.isEmpty) return;
    final ids = roundIds.toSet();
    final rounds = session.rounds.where((r) => ids.contains(r.id)).toList();
    _streamCache.ensureRoundsLoaded(fileName, rounds);
  }

  Future<void> loadSession({String? initialRoundId}) async {
    state = ChatState.initial().copyWithLoading(true);
    try {
      final repository = ref.read(conversationRepositoryProvider);
      var session = await repository.getSession(fileName);
      if (session.hasUnseenUpdate) {
        final cleared = session.copyWith(hasUnseenUpdate: false);
        await repository.saveSession(fileName, cleared);
        session = cleared;
        await ref.read(sessionListProvider.notifier).refresh();
      }
      final viewState = initialRoundId != null
          ? ChatViewStateBuilder.buildForRound(session, initialRoundId)
          : ChatViewStateBuilder.buildInitial(session);
      state = state.copyWithSession(session).copyWith(
            currentRoundId: viewState.currentRoundId,
            pageList: viewState.pageList,
            error: null,
          );
      if (viewState.currentRoundId != null) {
        await ensureRoundLoaded(viewState.currentRoundId!);
      }
      ref.invalidate(sessionCardProvider(fileName));
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
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

  Future<void> markRoundSeen(String roundId) async {
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
      hasUnseenUpdate:
          session.rounds.any((r) => r.id != roundId && r.hasUnseenUpdate),
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
    await ref.read(sessionListProvider.notifier).refresh();
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
    state = state.copyWithSession(updatedSession).copyWith(
          currentRoundId: viewState.currentRoundId,
          pageList: viewState.pageList,
          error: null,
        );
    _streamCache.setRoundStream(
      fileName,
      round.id,
      const StreamStatus(
        content: '',
        reasoning: '',
        isStreaming: true,
      ),
    );
    ref.invalidate(sessionCardProvider(fileName));
    await ref.read(sessionListProvider.notifier).refresh();
  }

  String _appendStoppedSuffix(String content) {
    final trimmed = content.trim();
    if (trimmed.isEmpty) return '[已停止]';
    return '$trimmed\n\n[已停止]';
  }

  String _appendErrorSuffix(String content, String? message) {
    final trimmed = content.trim();
    final cleanMessage = (message ?? '').trim();
    final errorText = cleanMessage.isEmpty ? '[错误]' : '[错误]\n$cleanMessage';
    if (trimmed.isEmpty) return errorText;
    return '$trimmed\n\n$errorText';
  }

  Future<void> _handleStreamTask(
    ChatRound round,
    List<ApiMessage> apiContext,
    AppConfig config,
  ) async {
    final apiSource = ref.read(remoteApiSourceProvider);
    final accumulator = ChatStreamAccumulator();
    var hasError = false;
    String? errorMessage;
    var wasStopped = false;
    try {
      final stream = apiSource.chatStream(
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
          hasError = true;
          errorMessage = chunk.error;
          break;
        }
        if (!chunk.isDone) {
          accumulator.add(chunk);
          _streamCache.updateRoundStream(
            fileName,
            round.id,
            content: accumulator.content,
            reasoning: accumulator.reasoning,
            isStreaming: true,
          );
          continue;
        }
        if (_stoppingRoundIds.contains(round.id)) {
          wasStopped = true;
        }
        break;
      }
    } catch (e) {
      if (_stoppingRoundIds.contains(round.id)) {
        wasStopped = true;
      } else {
        hasError = true;
        errorMessage = e.toString();
      }
    } finally {
      var finalContent = accumulator.content;
      final finalReasoning = accumulator.reasoning;
      if (hasError) {
        finalContent = _appendErrorSuffix(finalContent, errorMessage);
      } else if (wasStopped) {
        finalContent = _appendStoppedSuffix(finalContent);
      }
      _streamCache.updateRoundStream(
        fileName,
        round.id,
        content: finalContent,
        reasoning: finalReasoning,
        isStreaming: true,
      );
      await _finalizeRoundPersistence(round.id);
      _stoppingRoundIds.remove(round.id);
    }
  }

  Future<void> _finalizeRoundPersistence(String roundId) async {
    final repository = ref.read(conversationRepositoryProvider);
    final session = state.session;
    if (session == null) return;
    final stream = _getRoundStream(roundId);
    if (stream == null) return;
    final updatedRounds = session.rounds.map((round) {
      if (round.id != roundId) return round;
      return round.copyWith(
        assistantContent: stream.content.trim().isEmpty ? null : stream.content,
        assistantThinking:
            stream.reasoning.trim().isEmpty ? null : stream.reasoning,
        isIncomplete: false,
        hasUnseenUpdate: true,
      );
    }).toList();
    final updatedRound = updatedRounds.firstWhere((r) => r.id == roundId);
    final updatedSession = session.copyWith(
      rounds: updatedRounds,
      hasUnseenUpdate: true,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
    await repository.saveSession(fileName, updatedSession);
    state = state.copyWith(
      session: updatedSession,
      pageList: _replaceRoundInCurrentPages(updatedRound),
      error: null,
    );
    _streamCache.updateRoundStream(
      fileName,
      roundId,
      isStreaming: false,
    );
    ref.invalidate(sessionCardProvider(fileName));
    await ref.read(sessionListProvider.notifier).refresh();
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
    // ✅ 简化逻辑，无需处理 pageIndex
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
    // ✅ 直接使用 currentPageIndex 获取当前页
    final viewingRound = state.pageList!.pages[state.pageList!.currentPageIndex].round;
    final stream = _getRoundStream(viewingRound.id);
    if (stream?.isStreaming != true) return;
    _stoppingRoundIds.add(viewingRound.id);
    final apiSource = ref.read(remoteApiSourceProvider);
    apiSource.cancelRequest(viewingRound.id);
  }

  Future<void> switchBranch(String targetRoundId) async {
    if (state.session == null) return;
    final session = state.session!;
    final newRoundId = BranchNavigator.switchBranch(session, targetRoundId);
    final viewState = ChatViewStateBuilder.buildForRound(session, newRoundId);
    state = state.copyWithCurrentRoundId(newRoundId).copyWith(
          pageList: viewState.pageList,
        );
    await ensureRoundLoaded(newRoundId);
  }

  void changePage(int pageIndex) {
    if (state.pageList == null) return;
    
    final pages = state.pageList!.pages;
    
    // ✅ 使用工具类验证索引
    if (!PageUtils.isValidIndex(pageIndex, pages.length)) return;
    
    final targetPage = pages[pageIndex];
    final newRoundId = targetPage.round.id;
    
    state = state.copyWithCurrentRoundId(newRoundId).copyWith(
          pageList: state.pageList!.copyWith(currentPageIndex: pageIndex),
        );
    
    ensureRoundLoaded(newRoundId);
  }
}

final chatProvider =
    StateNotifierProvider.family<ChatNotifier, ChatState, String>(
  (ref, fileName) {
    return ChatNotifier(ref, fileName);
  },
);