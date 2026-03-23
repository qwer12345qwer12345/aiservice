import 'package:freezed_annotation/freezed_annotation.dart';
import 'attachment.dart';

part 'chat_round.freezed.dart';
part 'chat_round.g.dart';

@freezed
class ChatRound with _$ChatRound {
  const factory ChatRound({
    required String id,
    String? parentId,
    required int createdAt,
    required String userContent,
    @Default([]) List<Attachment> userAttachments,
    String? assistantThinking,
    String? assistantContent,
    @Default(false) bool isIncomplete,
  }) = _ChatRound;

  factory ChatRound.fromJson(Map<String, dynamic> json) =>
      _$ChatRoundFromJson(json);
}