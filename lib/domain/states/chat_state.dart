import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/models/session.dart';
import '../models/chat_page.dart';

part 'chat_state.freezed.dart';

@freezed
class StreamStatus with _$StreamStatus {
  const factory StreamStatus({
    @Default('') String content,
    @Default('') String reasoning,
    @Default(false) bool isStreaming,
  }) = _StreamStatus;
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    Session? session,
    String? currentRoundId,
    ChatPageList? pageList,
    String? error,
    @Default(false) bool isLoading,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState(
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