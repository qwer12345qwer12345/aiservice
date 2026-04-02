// presentation/providers/global_streaming_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../domain/states/chat_state.dart';

typedef SessionStreamMap = Map<String, StreamStatus>;
typedef GlobalStreamMap = Map<String, SessionStreamMap>;

// 这个 Provider 持有正在流式生成的数据
// 当流式结束时，数据会写入数据库，UI 通过 watch 获取
// 此 Provider 主要用于避免重复请求和实时显示
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

  void ensureRoundLoadedWithContent(
    String fileName,
    String roundId,
    String content,
    String reasoning,
  ) {
    final sessionMap = Map<String, StreamStatus>.from(state[fileName] ?? {});
    if (!sessionMap.containsKey(roundId)) {
      sessionMap[roundId] = StreamStatus(
        content: content,
        reasoning: reasoning,
        isStreaming: false,
      );
    }
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

  void clearRoundStream(String fileName, String roundId) {
    final sessionMap = state[fileName];
    if (sessionMap == null) return;

    final next = Map<String, StreamStatus>.from(sessionMap);
    next.remove(roundId);

    if (next.isEmpty) {
      final global = Map<String, SessionStreamMap>.from(state);
      global.remove(fileName);
      state = global;
    } else {
      state = {
        ...state,
        fileName: next,
      };
    }
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
  // 当没有任何监听时可以自动清理
  ref.onDispose(() {
    // 可以在这里做一些清理工作
  });
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