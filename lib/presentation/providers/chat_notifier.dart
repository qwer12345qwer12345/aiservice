// presentation/providers/chat_notifier.dart

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/model_info.dart';
import '../../core/models/session.dart';
import '../../core/models/attachment.dart';
import '../../di/providers.dart';
import '../../domain/models/chat_page.dart';
import '../../domain/services/attachment_preparer.dart';
import '../../domain/services/branch_navigator.dart';
import '../../domain/services/chat_context_builder.dart';
import '../../domain/services/chat_stream_accumulator.dart';
import '../../domain/states/chat_state.dart';
import '../models/pending_attachment.dart';
import '../utils/page_utils.dart';
import 'global_streaming_provider.dart';
import '../../core/utils/id_generator.dart';
import 'config_notifier.dart';

/// 辅助函数
T? _firstWhereOrNull<T>(List<T> list, bool Function(T) test) {
  for (final element in list) {
    if (test(element)) return element;
  }
  return null;
}

class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;
  final String fileName;
  final Set<String> _stoppingRoundIds = {};

  StreamSubscription? _sessionSubscription;
  int _currentPageIndex = 0;

  ChatNotifier(this.ref, this.fileName) : super(ChatState.initial()) {
    _initWatch();
  }

  bool _sessionContainsRound(Session session, String roundId) {
    return session.rounds.any((r) => r.id == roundId);
  }

  String? _resolveCurrentRoundId(Session session, String? preferredRoundId) {
    if (preferredRoundId != null &&
        _sessionContainsRound(session, preferredRoundId)) {
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

  void _initWatch() {
    final repository = ref.read(conversationRepositoryProvider);

    _sessionSubscription = repository.watchSession(fileName).listen((session) {
      if (session == null) {
        state = state.copyWith(
          session: null,
          error: '会话不存在',
          isLoading: false,
        );
        return;
      }

      final resolvedRoundId = _resolveCurrentRoundId(
        session,
        state.currentRoundId,
      );

      final branchPath = resolvedRoundId == null
          ? <ChatRound>[]
          : BranchNavigator.getCurrentBranchPath(session, resolvedRoundId);

      int targetPageIndex = 0;
      if (resolvedRoundId != null && branchPath.isNotEmpty) {
        final foundIndex =
            branchPath.indexWhere((round) => round.id == resolvedRoundId);
        targetPageIndex = foundIndex >= 0 ? foundIndex : branchPath.length - 1;
      }

      _currentPageIndex = targetPageIndex;
      final chatPages = branchPath.map((round) => ChatPage(round: round)).toList();

      state = state.copyWith(
        session: session,
        currentRoundId: resolvedRoundId,
        pageList: ChatPageList.fromPages(chatPages, _currentPageIndex),
        error: null,
        isLoading: false,
      );

      if (resolvedRoundId != null) {
        final round =
            _firstWhereOrNull(branchPath, (r) => r.id == resolvedRoundId);
        if (round != null) {
          _streamCache.ensureRoundLoaded(fileName, round);
        }
      }
    });
  }

  GlobalStreamCacheNotifier get _streamCache =>
      ref.read(globalStreamCacheProvider.notifier);


  Future<void> ensureRoundLoaded(String roundId) async {
    final session = state.session;
    if (session == null) return;
    final round = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
    if (round == null) return;
    _streamCache.ensureRoundLoaded(fileName, round);
  }

  Future<void> loadSession({String? initialRoundId}) async {
    if (initialRoundId != null) {
      state = state.copyWith(currentRoundId: initialRoundId);
    }
  }

  /// 从配置流获取最新的模型信息，避免缓存导致切换配置后用旧模型
  ModelInfo? _findSelectedModelInfo() {
    // 从 StreamProvider 获取最新配置
    final configAsync = ref.read(configProvider);
    final config = configAsync.valueOrNull;
    if (config == null) return null;

    final selectedId = config.selectedModel;
    if (selectedId == null || selectedId.trim().isEmpty) return null;

    final models = config.availableModels ?? const <ModelInfo>[];
    return _firstWhereOrNull(models, (m) => m.id == selectedId);
  }

  /// 从配置流获取最新的配置，避免缓存导致切换配置后用旧配置请求
  Future<AppConfig> _getCurrentConfig() async {
    // 优先从 Stream 获取最新配置
    final configAsync = ref.read(configProvider);
    if (configAsync.hasValue) {
      return configAsync.valueOrNull!;
    }
    // 如果 Stream 还没值，降级使用同步方法
    return await ref.read(configRepositoryProvider).getConfig();
  }

  bool _shouldEnableReasoning(AppConfig config) {
    final selectedModel = _findSelectedModelInfo();
    return selectedModel?.supportsReasoning == true;
  }

  void _validateRequestCapability({
    required AppConfig config,
    required List<PendingAttachment> attachments,
  }) {
    final selectedModel = _findSelectedModelInfo();
    if (selectedModel == null) return;

    final hasImage = attachments.any((a) => a.isImage);
    if (hasImage && selectedModel.supportsVision != true) {
      throw Exception('当前模型未声明支持图片输入');
    }
  }

  Future<void> sendMessage(
    String content, {
    List<PendingAttachment>? attachments,
  }) async {
    final session = state.session;
    if (session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }

    try {
      final pendingAttachments = attachments ?? const <PendingAttachment>[];
      final repository = ref.read(conversationRepositoryProvider);

      // 从流获取最新配置
      final config = await _getCurrentConfig();

      _validateRequestCapability(config: config, attachments: pendingAttachments);

      final savedAttachments = await AttachmentPreparer.savePendingAttachments(
        repository,
        pendingAttachments,
      );

      final newRound = ChatRound(
        id: IdGenerator.generate(),
        parentId: state.currentRoundId,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        userContent: content,
        userAttachments: savedAttachments,
        isIncomplete: true,
        hasUnseenUpdate: false,
      );

      await repository.appendRound(fileName, newRound);
      state = state.copyWith(currentRoundId: newRound.id);

      _streamCache.setRoundStream(
        fileName,
        newRound.id,
        const StreamStatus(content: '', reasoning: '', isStreaming: true),
      );

      _handleStreamTask(newRound, session, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }

  Future<void> retryFromRound(String roundId) async {
    final session = state.session;
    if (session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }

    try {
      final repository = ref.read(conversationRepositoryProvider);
      final config = await _getCurrentConfig();

      final sourceRound = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
      if (sourceRound == null) {
        state = state.copyWithError('未找到要重新回复的对话');
        return;
      }

      final selectedModel = _findSelectedModelInfo();
      if (selectedModel != null) {
        final hasImage = sourceRound.userAttachments.any((a) => a.isImage);
        if (hasImage && selectedModel.supportsVision != true) {
          state = state.copyWithError('当前模型未声明支持图片输入');
          return;
        }
      }

      final newRound = ChatRound(
        id: IdGenerator.generate(),
        parentId: sourceRound.parentId,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        userContent: sourceRound.userContent,
        userAttachments: sourceRound.userAttachments,
        isIncomplete: true,
        hasUnseenUpdate: false,
      );

      await repository.appendRound(fileName, newRound);
      state = state.copyWith(currentRoundId: newRound.id);

      _streamCache.setRoundStream(
        fileName,
        newRound.id,
        const StreamStatus(content: '', reasoning: '', isStreaming: true),
      );

      _handleStreamTask(newRound, session, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }

  Future<void> editAndResendFromRound(
    String roundId,
    String newContent, {
    List<PendingAttachment>? attachments,
  }) async {
    final session = state.session;
    if (session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }

    try {
      final repository = ref.read(conversationRepositoryProvider);
      final config = await _getCurrentConfig();
      final pendingAttachments = attachments ?? const <PendingAttachment>[];

      _validateRequestCapability(config: config, attachments: pendingAttachments);

      final sourceRound = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
      if (sourceRound == null) {
        state = state.copyWithError('未找到要编辑重试的对话');
        return;
      }

      final selectedModel = _findSelectedModelInfo();
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

      final mergedAttachments = <Attachment>[
        ...sourceRound.userAttachments,
        ...savedAttachments,
      ];

      final newRound = ChatRound(
        id: IdGenerator.generate(),
        parentId: sourceRound.parentId,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        userContent: newContent,
        userAttachments: mergedAttachments,
        isIncomplete: true,
        hasUnseenUpdate: false,
      );

      await repository.appendRound(fileName, newRound);
      state = state.copyWith(currentRoundId: newRound.id);

      _streamCache.setRoundStream(
        fileName,
        newRound.id,
        const StreamStatus(content: '', reasoning: '', isStreaming: true),
      );

      _handleStreamTask(newRound, session, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }

  Future<void> _handleStreamTask(
    ChatRound round,
    Session session,
    AppConfig config,
  ) async {
    final apiSource = ref.read(remoteApiSourceProvider);
    final repository = ref.read(conversationRepositoryProvider);
    final accumulator = ChatStreamAccumulator();
    var hasError = false;
    String? errorMessage;
    var wasStopped = false;

    try {
      final contextRounds = BranchNavigator.getCurrentBranchPath(session, round.id);
      final apiContext = await ChatContextBuilder.buildFromRounds(
        contextRounds,
        repository,
      );

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

          final updatedRound = round.copyWith(
            assistantThinking:
                accumulator.reasoning.isEmpty ? null : accumulator.reasoning,
            assistantContent:
                accumulator.content.isEmpty ? null : accumulator.content,
            isIncomplete: true,
            hasUnseenUpdate: false,
          );

          await repository.updateRound(fileName, round.id, updatedRound);
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

      await _finalizeRoundPersistence(round.id, finalContent, finalReasoning);

      _stoppingRoundIds.remove(round.id);
    }
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

  Future<void> _finalizeRoundPersistence(
    String roundId,
    String content,
    String reasoning,
  ) async {
    final repository = ref.read(conversationRepositoryProvider);
    final session = state.session;
    if (session == null) return;

    final originalRound = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
    if (originalRound == null) return;

    final updatedRound = originalRound.copyWith(
      assistantContent: content.trim().isEmpty ? null : content,
      assistantThinking: reasoning.trim().isEmpty ? null : reasoning,
      isIncomplete: false,
      hasUnseenUpdate: true,
    );

    await repository.updateRound(fileName, roundId, updatedRound);

    _streamCache.updateRoundStream(fileName, roundId, isStreaming: false);
  }

  void stopGeneration() {
    final pageList = state.pageList;
    if (pageList == null || pageList.pages.isEmpty) return;

    if (!PageUtils.isValidIndex(_currentPageIndex, pageList.pages.length)) {
      return;
    }

    final viewingRound = pageList.pages[_currentPageIndex].round;

    if (!viewingRound.isIncomplete) return;

    _stoppingRoundIds.add(viewingRound.id);
    final apiSource = ref.read(remoteApiSourceProvider);
    apiSource.cancelRequest(viewingRound.id);
  }

  Future<void> switchBranch(String targetRoundId) async {
    final session = state.session;
    if (session == null) return;

    final newRoundId = BranchNavigator.switchBranch(session, targetRoundId);

    state = state.copyWithCurrentRoundId(newRoundId);

    await ensureRoundLoaded(newRoundId);
  }

  void changePage(int pageIndex) {
    if (state.pageList == null) return;

    final pages = state.pageList!.pages;
    if (!PageUtils.isValidIndex(pageIndex, pages.length)) return;

    final targetPage = pages[pageIndex];
    final newRoundId = targetPage.round.id;

    _currentPageIndex = pageIndex;

    state = state.copyWith(
      currentRoundId: newRoundId,
      pageList: state.pageList!.copyWith(currentPageIndex: pageIndex),
    );

    ensureRoundLoaded(newRoundId);
  }

  Future<void> markRoundSeen(String roundId) async {
    final session = state.session;
    if (session == null) return;

    final target = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
    if (target == null || !target.hasUnseenUpdate) return;

    final repository = ref.read(conversationRepositoryProvider);
    final updatedRound = target.copyWith(hasUnseenUpdate: false);
    await repository.updateRound(fileName, roundId, updatedRound);
  }

  @override
  void dispose() {
    _sessionSubscription?.cancel();
    super.dispose();
  }
}

final chatProvider = StateNotifierProvider.family<ChatNotifier, ChatState, String>(
  (ref, fileName) {
    return ChatNotifier(ref, fileName);
  },
);