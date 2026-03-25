import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../domain/states/chat_state.dart';

typedef SessionStreamMap = Map<String, StreamStatus>;
typedef GlobalStreamMap = Map<String, SessionStreamMap>;

class GlobalStreamCacheNotifier extends StateNotifier<GlobalStreamMap> {
  GlobalStreamCacheNotifier() : super(const {});

  StreamStatus? getRoundStream(String fileName, String roundId) {
    return state[fileName]?[roundId];
  }

  bool hasRoundStream(String fileName, String roundId) {
    return state[fileName]?.containsKey(roundId) ?? false;
  }

  void setRoundStream(
    String fileName,
    String roundId,
    StreamStatus status,
  ) {
    final sessionMap = Map<String, StreamStatus>.from(state[fileName] ?? {});
    sessionMap[roundId] = status;
    state = {
      ...state,
      fileName: sessionMap,
    };
  }

  void updateRoundStream(
    String fileName,
    String roundId, {
    String? content,
    String? reasoning,
    bool? isStreaming,
  }) {
    final sessionMap = Map<String, StreamStatus>.from(state[fileName] ?? {});
    final current = sessionMap[roundId] ?? const StreamStatus();
    sessionMap[roundId] = current.copyWith(
      content: content ?? current.content,
      reasoning: reasoning ?? current.reasoning,
      isStreaming: isStreaming ?? current.isStreaming,
    );
    state = {
      ...state,
      fileName: sessionMap,
    };
  }

  void ensureRoundLoaded(String fileName, ChatRound round) {
    if (hasRoundStream(fileName, round.id)) return;
    final sessionMap = Map<String, StreamStatus>.from(state[fileName] ?? {});
    sessionMap[round.id] = StreamStatus(
      content: round.assistantContent ?? '',
      reasoning: round.assistantThinking ?? '',
      isStreaming: false,
    );
    state = {
      ...state,
      fileName: sessionMap,
    };
  }

  void ensureRoundsLoaded(String fileName, List<ChatRound> rounds) {
    if (rounds.isEmpty) return;
    final sessionMap = Map<String, StreamStatus>.from(state[fileName] ?? {});
    var changed = false;

    for (final round in rounds) {
      if (sessionMap.containsKey(round.id)) continue;
      sessionMap[round.id] = StreamStatus(
        content: round.assistantContent ?? '',
        reasoning: round.assistantThinking ?? '',
        isStreaming: false,
      );
      changed = true;
    }

    if (!changed) return;

    state = {
      ...state,
      fileName: sessionMap,
    };
  }

  void clearNonStreamingForSession(String fileName) {
    final sessionMap = state[fileName];
    if (sessionMap == null) return;

    final retained = <String, StreamStatus>{};
    for (final entry in sessionMap.entries) {
      if (entry.value.isStreaming) {
        retained[entry.key] = entry.value;
      }
    }

    state = {
      ...state,
      fileName: retained,
    };
  }

  void clearSession(String fileName) {
    final next = Map<String, SessionStreamMap>.from(state);
    next.remove(fileName);
    state = next;
  }
}

final globalStreamCacheProvider =
    StateNotifierProvider<GlobalStreamCacheNotifier, GlobalStreamMap>((ref) {
  return GlobalStreamCacheNotifier();
});

final sessionStreamMapProvider =
    Provider.family<SessionStreamMap, String>((ref, fileName) {
  final globalMap = ref.watch(globalStreamCacheProvider);
  return globalMap[fileName] ?? const {};
});

final roundStreamProvider =
    Provider.family<StreamStatus?, ({String fileName, String roundId})>(
  (ref, args) {
    final sessionMap = ref.watch(sessionStreamMapProvider(args.fileName));
    return sessionMap[args.roundId];
  },
);