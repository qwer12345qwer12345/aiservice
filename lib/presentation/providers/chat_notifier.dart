import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../core/utils/id_generator.dart';
import '../../di/providers.dart';
import '../../domain/services/attachment_preparer.dart';
import '../../domain/services/chat_context_builder.dart';

final sessionTitleProvider = StreamProvider.family<String, String>((ref, fileName) {
  return ref.watch(conversationRepositoryProvider).watchSessionTitle(fileName)
      .map((title) => title ?? '对话');
});

final chatTopologyProvider =
    StreamProvider.family<List<({String id, String? parentId})>, String>(
  (ref, fileName) {
    return ref.watch(conversationRepositoryProvider).watchSessionTopology(fileName);
  },
);

final roundDetailProvider = StreamProvider.family<ChatRound?, String>((ref, roundId) {
  return ref.watch(conversationRepositoryProvider).watchSingleRound(roundId);
});

final visibleRoundIdsProvider =
    Provider.family<List<String>, ({String fileName, String? roundId})>(
  (ref, args) {
    final topology = ref.watch(chatTopologyProvider(args.fileName)).valueOrNull ?? [];
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
  final String fileName;
  final Set<String> _stoppingRoundIds = {};

  ChatController(this.ref, this.fileName);

  Future<String> sendMessage({
    required String content,
    required String? parentRoundId,
    List<dynamic>? attachments,
  }) async {
    final repository = ref.read(conversationRepositoryProvider);
    final saved = await AttachmentPreparer.savePendingAttachments(
      repository,
      attachments?.cast() ?? [],
    );

    final newRound = ChatRound(
      id: IdGenerator.generate(),
      parentId: parentRoundId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      userContent: content,
      userAttachments: saved,
      isIncomplete: true,
      hasUnseenUpdate: false,
    );

    await repository.appendRound(fileName, newRound);

    () async {
      final apiSource = ref.read(remoteApiSourceProvider);
      final contentBuffer = StringBuffer();
      final reasoningBuffer = StringBuffer();
      String? error;
      DateTime? lastDbUpdateTime;
      const updateInterval = Duration(seconds: 1);

      try {
        final contextRounds = await repository.getContextRounds(
          fileName,
          newRound.id,
        );
        final apiContext = await ChatContextBuilder.buildFromRounds(
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
              fileName,
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
          fileName,
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
    );
  }

  Future<String> editAndResendFromRound(
    String roundId,
    String content, {
    List<dynamic>? attachments,
  }) async {
    final source = await ref.read(roundDetailProvider(roundId).future);
    if (source == null) throw Exception('找不到对应的对话轮次');
    return sendMessage(
      content: content,
      parentRoundId: source.parentId,
      attachments: attachments,
    );
  }

  void stopGeneration(String roundId) {
    _stoppingRoundIds.add(roundId);
    ref.read(remoteApiSourceProvider).cancelRequest(roundId);
  }

  Future<void> markRoundSeen(ChatRound round) async {
    await ref.read(conversationRepositoryProvider).updateRound(
      fileName,
      round.id,
      round.copyWith(hasUnseenUpdate: false),
    );
  }
}

final chatControllerProvider =
    Provider.family<ChatController, String>((ref, fileName) {
  return ChatController(ref, fileName);
});