import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../di/providers.dart';
import '../../domain/services/attachment_preparer.dart';
import '../../domain/services/chat_context_builder.dart';
import 'package:uuid/uuid.dart';

final sessionTitleProvider = StreamProvider.family<String, String>((ref, sessionId) {
  return ref.watch(conversationRepositoryProvider).watchSessionTitle(sessionId)
      .map((title) => title ?? '对话');
});

final chatTopologyProvider =
    StreamProvider.family<List<({String id, String? parentId})>, String>(
  (ref, sessionId) {
    return ref.watch(conversationRepositoryProvider).watchSessionTopology(sessionId);
  },
);

final roundDetailProvider = StreamProvider.family<ChatRound?, String>((ref, roundId) {
  return ref.watch(conversationRepositoryProvider).watchSingleRound(roundId);
});

final visibleRoundIdsProvider =
    Provider.family<List<String>, ({String sessionId, String? roundId})>(
  (ref, args) {
    final topology = ref.watch(chatTopologyProvider(args.sessionId)).valueOrNull ?? [];
    if (args.roundId == null) return const [];

    final idToParent = {for (var t in topology) t.id: t.parentId};
    final path = <String>[];
    String? currentId = args.roundId;

    while (currentId != null && idToParent.containsKey(currentId)) {
      path.add(currentId);
      currentId = idToParent[currentId];
    }
    return path.reversed.toList();
  },
);

class ChatController {
  final Ref ref;
  final String sessionId;
  final Set<String> _stoppingRoundIds = {};

  ChatController(this.ref, this.sessionId);

  Future<String> sendMessage({
    required String content,
    required String? parentRoundId,
    List<dynamic>? attachments,
  }) async {
    final repository = ref.read(conversationRepositoryProvider);
    final saved = await savePendingAttachments(
      repository,
      attachments?.cast() ?? [],
    );

    final newRound = ChatRound(
      id: const Uuid().v4(),
      parentId: parentRoundId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      userContent: content,
      userAttachments: saved,
      isIncomplete: true,
      hasUnseenUpdate: false,
    );

    await repository.appendRound(sessionId, newRound);

    () async {
      final apiSource = ref.read(remoteApiSourceProvider);
      final contentBuffer = StringBuffer();
      final reasoningBuffer = StringBuffer();
      String? error;
      DateTime? lastDbUpdateTime;
      const updateInterval = Duration(seconds: 1);

      try {
        final contextRounds = await repository.getContextRounds(
          newRound.id,
        );
        final apiContext = await buildApiContextFromRounds(
          contextRounds,
          repository,
        );

        final currentConfig = await ref.read(configServiceProvider).loadConfig();
        final selectedId = currentConfig.selectedModel;
        final selectedModel = currentConfig.availableModels
            ?.where((m) => m.id == selectedId)
            .firstOrNull;
        final enableReasoning = selectedModel?.supportsReasoning == true;

        final stream = apiSource.chatStream(
          taskId: newRound.id,
          loadConfig: () async => currentConfig,
          context: apiContext,
          enableReasoning: enableReasoning,
        );

        await for (final chunk in stream) {
          if (chunk.error != null) {
            error = chunk.error;
            break;
          }
          if (chunk.isDone) break;

          if (chunk.content != null) contentBuffer.write(chunk.content);
          if (chunk.reasoningContent != null) reasoningBuffer.write(chunk.reasoningContent);

          final now = DateTime.now();
          if (lastDbUpdateTime == null ||
              now.difference(lastDbUpdateTime) >= updateInterval) {
            await repository.updateRound(
              sessionId,
              newRound.id,
              newRound.copyWith(
                assistantContent: contentBuffer.toString(),
                assistantThinking: reasoningBuffer.toString(),
              ),
            );
            lastDbUpdateTime = now;
          }
        }
      } catch (e) {
        error = e.toString();
      } finally {

        String finalContent = contentBuffer.toString();
        if (error != null) {
          finalContent += '\n\n[错误]\n$error';
        } else if (_stoppingRoundIds.contains(newRound.id)) {
          finalContent += '\n\n[已停止]';
        }

        await repository.updateRound(
          sessionId,
          newRound.id,
          newRound.copyWith(
            assistantContent: finalContent.trim().isEmpty ? null : finalContent,
            assistantThinking: reasoningBuffer.toString().trim().isEmpty
                ? null
                : reasoningBuffer.toString(),
            isIncomplete: false,
            hasUnseenUpdate: true,
          ),
        );
        _stoppingRoundIds.remove(newRound.id);
      }
    }();

    return newRound.id;
  }

  Future<String> retryFromRound(String roundId) async {
    final source = await ref.read(roundDetailProvider(roundId).future);
    if (source == null) throw Exception('找不到对应的对话轮次');

    return sendMessage(
      content: source.userContent,
      parentRoundId: source.parentId,
      attachments: source.userAttachments,
    );
  }

  void stopGeneration(String roundId) {
    _stoppingRoundIds.add(roundId);
    ref.read(remoteApiSourceProvider).cancelRequest(roundId);
  }

  Future<void> markRoundSeen(ChatRound round) async {
    await ref.read(conversationRepositoryProvider).updateRound(
      sessionId,
      round.id,
      round.copyWith(hasUnseenUpdate: false),
    );
  }
}

final chatControllerProvider =
    Provider.family<ChatController, String>((ref, sessionId) {
  return ChatController(ref, sessionId);
});