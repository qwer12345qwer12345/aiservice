// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRound _$ChatRoundFromJson(Map<String, dynamic> json) => _ChatRound(
  id: json['id'] as String,
  parentId: json['parentId'] as String?,
  createdAt: (json['createdAt'] as num).toInt(),
  userContent: json['userContent'] as String,
  userAttachments:
      (json['userAttachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  assistantThinking: json['assistantThinking'] as String?,
  assistantContent: json['assistantContent'] as String?,
  isIncomplete: json['isIncomplete'] as bool? ?? false,
  hasUnseenUpdate: json['hasUnseenUpdate'] as bool? ?? false,
);

Map<String, dynamic> _$ChatRoundToJson(_ChatRound instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'createdAt': instance.createdAt,
      'userContent': instance.userContent,
      'userAttachments': instance.userAttachments,
      'assistantThinking': instance.assistantThinking,
      'assistantContent': instance.assistantContent,
      'isIncomplete': instance.isIncomplete,
      'hasUnseenUpdate': instance.hasUnseenUpdate,
    };
