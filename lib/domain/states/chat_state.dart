import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/models/session.dart';
import '../models/chat_page.dart';

part 'chat_state.freezed.dart';

/// 独立的流状态记录
@freezed
class StreamStatus with _$StreamStatus {
  const factory StreamStatus({
    @Default('') String content,
    @Default('') String reasoning,
    @Default(false) bool isDone,
    String? error,
  }) = _StreamStatus;
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    Session? session,
    String? currentRoundId,
    ChatPageList? pageList,
    @Default({}) Map<String, StreamStatus> activeStreams,
    String? error,
    @Default(false) bool isLoading,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState(
        activeStreams: {},
        error: null,
        isLoading: false,
      );
}

extension ChatStateX on ChatState {
  ChatState copyWithSession(Session session) {
    return copyWith(
      session: session,
      isLoading: false,
    );
  }

  ChatState copyWithCurrentRoundId(String roundId) {
    return copyWith(currentRoundId: roundId);
  }

  /// 更新或移除指定 roundId 的流状态
  ChatState copyWithStreaming(
    String roundId, {
    String? content,
    String? reasoning,
    bool isDone = false,
    String? error,
  }) {
    final newStreams = Map<String, StreamStatus>.from(activeStreams);
    
    if (isDone || error != null) {
      // 完成或报错时移除该流，实际内容由 session.rounds 接管
      newStreams.remove(roundId);
    } else {
      final current = newStreams[roundId] ?? const StreamStatus();
      newStreams[roundId] = current.copyWith(
        content: content ?? current.content,
        reasoning: reasoning ?? current.reasoning,
      );
    }

    return copyWith(
      activeStreams: newStreams,
      error: error ?? this.error,
    );
  }

  ChatState copyWithError(String error) {
    return copyWith(
      error: error,
      isLoading: false,
    );
  }

  ChatState copyWithLoading(bool loading) {
    return copyWith(isLoading: loading);
  }
}