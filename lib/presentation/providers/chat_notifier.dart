// presentation/providers/chat_notifier.dart

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/model_info.dart';
import '../../core/models/session.dart';
import '../../core/models/attachment.dart';
import '../../di/providers.dart';
import '../../domain/services/attachment_preparer.dart';
import '../../domain/services/branch_navigator.dart';
import '../../domain/services/chat_context_builder.dart';
import '../../domain/services/chat_stream_accumulator.dart';
import '../models/pending_attachment.dart';
import '../../core/utils/id_generator.dart';
import 'config_notifier.dart';

T? _firstWhereOrNull<T>(List<T> list, bool Function(T) test) {
  for (final element in list) {
    if (test(element)) return element;
  }
  return null;
}

/// 会话事实数据完全来自数据库 watch
final chatSessionProvider =
    StreamProvider.family<Session?, String>((ref, fileName) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSession(fileName);
});

class ChatController {
  final Ref ref;
  final String fileName;
  final Set<String> _stoppingRoundIds = {};

  ChatController(this.ref, this.fileName);

  ModelInfo? _findSelectedModelInfo() {
    final configAsync = ref.read(configProvider);
    final config = configAsync.valueOrNull;
    if (config == null) return null;

    final selectedId = config.selectedModel;
    if (selectedId == null || selectedId.trim().isEmpty) return null;

    final models = config.availableModels ?? const <ModelInfo>[];
    return _firstWhereOrNull(models, (m) => m.id == selectedId);
  }

  Future<AppConfig> _getCurrentConfig() async {
    final configAsync = ref.read(configProvider);
    if (configAsync.hasValue) {
      return configAsync.valueOrNull!;
    }
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

  Future<String> sendMessage({
    required String content,
    required String? parentRoundId,
    List<PendingAttachment>? attachments,
  }) async {
    final session = ref.read(chatSessionProvider(fileName)).valueOrNull ??
        await ref.read(chatSessionProvider(fileName).future);
    if (session == null) {
      throw Exception('会话未初始化');
    }

    if (parentRoundId != null &&
        !session.rounds.any((r) => r.id == parentRoundId)) {
      throw Exception('当前引用的轮次不存在');
    }

    final pendingAttachments = attachments ?? const <PendingAttachment>[];
    final repository = ref.read(conversationRepositoryProvider);
    final config = await _getCurrentConfig();

    _validateRequestCapability(config: config, attachments: pendingAttachments);

    final savedAttachments = await AttachmentPreparer.savePendingAttachments(
      repository,
      pendingAttachments,
    );

    final newRound = ChatRound(
      id: IdGenerator.generate(),
      parentId: parentRoundId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      userContent: content,
      userAttachments: savedAttachments,
      isIncomplete: true,
      hasUnseenUpdate: false,
    );

    final contextRounds = BranchNavigator.getCurrentBranchPath(
      session.copyWith(rounds: [...session.rounds, newRound]),
      newRound.id,
    );

    await repository.appendRound(fileName, newRound);
    unawaited(_handleStreamTask(newRound, config, contextRounds));

    return newRound.id;
  }

  Future<String> retryFromRound(String roundId) async {
    final session = ref.read(chatSessionProvider(fileName)).valueOrNull ??
        await ref.read(chatSessionProvider(fileName).future);
    if (session == null) {
      throw Exception('会话未初始化');
    }

    final repository = ref.read(conversationRepositoryProvider);
    final config = await _getCurrentConfig();

    final sourceRound = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
    if (sourceRound == null) {
      throw Exception('未找到要重新回复的对话');
    }

    final selectedModel = _findSelectedModelInfo();
    if (selectedModel != null) {
      final hasImage = sourceRound.userAttachments.any((a) => a.isImage);
      if (hasImage && selectedModel.supportsVision != true) {
        throw Exception('当前模型未声明支持图片输入');
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

    final contextRounds = BranchNavigator.getCurrentBranchPath(
      session.copyWith(rounds: [...session.rounds, newRound]),
      newRound.id,
    );

    await repository.appendRound(fileName, newRound);
    unawaited(_handleStreamTask(newRound, config, contextRounds));

    return newRound.id;
  }

  Future<String> editAndResendFromRound(
    String roundId,
    String newContent, {
    List<PendingAttachment>? attachments,
  }) async {
    final session = ref.read(chatSessionProvider(fileName)).valueOrNull ??
        await ref.read(chatSessionProvider(fileName).future);
    if (session == null) {
      throw Exception('会话未初始化');
    }

    final repository = ref.read(conversationRepositoryProvider);
    final config = await _getCurrentConfig();
    final pendingAttachments = attachments ?? const <PendingAttachment>[];

    _validateRequestCapability(config: config, attachments: pendingAttachments);

    final sourceRound = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
    if (sourceRound == null) {
      throw Exception('未找到要编辑重试的对话');
    }

    final selectedModel = _findSelectedModelInfo();
    if (selectedModel != null) {
      final hasImage = sourceRound.userAttachments.any((a) => a.isImage) ||
          pendingAttachments.any((a) => a.isImage);
      if (hasImage && selectedModel.supportsVision != true) {
        throw Exception('当前模型未声明支持图片输入');
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

    final contextRounds = BranchNavigator.getCurrentBranchPath(
      session.copyWith(rounds: [...session.rounds, newRound]),
      newRound.id,
    );

    await repository.appendRound(fileName, newRound);
    unawaited(_handleStreamTask(newRound, config, contextRounds));

    return newRound.id;
  }

  Future<void> _handleStreamTask(
    ChatRound round,
    AppConfig config,
    List<ChatRound> contextRounds,
  ) async {
    final apiSource = ref.read(remoteApiSourceProvider);
    final repository = ref.read(conversationRepositoryProvider);
    final accumulator = ChatStreamAccumulator();
    var hasError = false;
    String? errorMessage;
    var wasStopped = false;

    int lastUpdateTimestamp = 0;
    const throttleMs = 1000;

    Future<void> _flushProgress(bool isIncomplete) async {
      final updatedRound = round.copyWith(
        assistantThinking:
            accumulator.reasoning.isEmpty ? null : accumulator.reasoning,
        assistantContent:
            accumulator.content.isEmpty ? null : accumulator.content,
        isIncomplete: isIncomplete,
        hasUnseenUpdate: false,
      );
      await repository.updateRound(fileName, round.id, updatedRound);
    }

    try {
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

          final now = DateTime.now().millisecondsSinceEpoch;
          if (now - lastUpdateTimestamp >= throttleMs) {
            await _flushProgress(true);
            lastUpdateTimestamp = now;
          }
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

      await _finalizeRoundPersistence(round, finalContent, finalReasoning);
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
    ChatRound round,
    String content,
    String reasoning,
  ) async {
    final repository = ref.read(conversationRepositoryProvider);

    final updatedRound = round.copyWith(
      assistantContent: content.trim().isEmpty ? null : content,
      assistantThinking: reasoning.trim().isEmpty ? null : reasoning,
      isIncomplete: false,
      hasUnseenUpdate: true,
    );

    await repository.updateRound(fileName, round.id, updatedRound);
  }

  void stopGeneration(String roundId) {
    _stoppingRoundIds.add(roundId);
    final apiSource = ref.read(remoteApiSourceProvider);
    apiSource.cancelRequest(roundId);
  }

  Future<void> markRoundSeen(ChatRound round) async {
    if (!round.hasUnseenUpdate) return;

    final repository = ref.read(conversationRepositoryProvider);
    await repository.updateRound(
      fileName,
      round.id,
      round.copyWith(hasUnseenUpdate: false),
    );
  }
}

final chatControllerProvider = Provider.family<ChatController, String>(
  (ref, fileName) {
    return ChatController(ref, fileName);
  },
);