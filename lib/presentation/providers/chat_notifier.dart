import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../di/providers.dart';

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