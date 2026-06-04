import 'dart:async';
import 'package:aiservice/core/models/attachment.dart';
import 'package:aiservice/presentation/models/pending_attachment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../di/providers.dart';
import '../../domain/services/attachment_preparer.dart';
import 'chat_generation_provider.dart';
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

  ChatController(this.ref, this.sessionId);

  Future<String> sendMessage({
    required String content,
    required String? parentRoundId,
    List<PendingAttachment>? attachments,
  }) async {
    final repository = ref.read(conversationRepositoryProvider);
    
    // 仅对新建消息执行文件持久化
    final saved = await savePendingAttachments(
      repository,
      attachments ?? [],
    );

    return _createAndGenerateRound(
      content: content,
      parentRoundId: parentRoundId,
      attachments: saved,
    );
  }

  Future<String> retryFromRound(String roundId) async {
    final source = await ref.read(roundDetailProvider(roundId).future);
    if (source == null) {
      throw Exception('找不到对应的对话轮次');
    }

    // 直接传入已持久化的 Attachment 列表
    return _createAndGenerateRound(
      content: source.userContent,
      parentRoundId: source.parentId,
      attachments: source.userAttachments,
    );
  }

  Future<String> _createAndGenerateRound({
    required String content,
    required String? parentRoundId,
    required List<Attachment> attachments,
  }) async {
    final repository = ref.read(conversationRepositoryProvider);

    final newRound = ChatRound(
      id: const Uuid().v4(),
      parentId: parentRoundId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      userContent: content,
      userAttachments: attachments,
      isIncomplete: true,
      hasUnseenUpdate: false,
    );

    await repository.appendRound(sessionId, newRound);

    ref.listen(
      chatGenerationProvider(newRound.id),
      (previous, next) {},
    );

    return newRound.id;
  }

  void stopGeneration(String roundId) {
    ref.invalidate(chatGenerationProvider(roundId));
  }
}

final chatControllerProvider =
    Provider.family<ChatController, String>((ref, sessionId) {
  return ChatController(ref, sessionId);
});