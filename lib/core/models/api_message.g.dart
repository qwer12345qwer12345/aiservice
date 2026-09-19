// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMessageTextPart _$ApiMessageTextPartFromJson(Map<String, dynamic> json) =>
    ApiMessageTextPart(
      type: json['type'] as String? ?? 'text',
      text: json['text'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ApiMessageTextPartToJson(ApiMessageTextPart instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'runtimeType': instance.$type,
    };

ApiMessageImageUrlPart _$ApiMessageImageUrlPartFromJson(
  Map<String, dynamic> json,
) => ApiMessageImageUrlPart(
  type: json['type'] as String? ?? 'image_url',
  imageUrl: ApiImageUrl.fromJson(json['image_url'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ApiMessageImageUrlPartToJson(
  ApiMessageImageUrlPart instance,
) => <String, dynamic>{
  'type': instance.type,
  'image_url': instance.imageUrl,
  'runtimeType': instance.$type,
};

_ApiImageUrl _$ApiImageUrlFromJson(Map<String, dynamic> json) =>
    _ApiImageUrl(url: json['url'] as String);

Map<String, dynamic> _$ApiImageUrlToJson(_ApiImageUrl instance) =>
    <String, dynamic>{'url': instance.url};

_ApiMessage _$ApiMessageFromJson(Map<String, dynamic> json) => _ApiMessage(
  role: json['role'] as String,
  content: json['content'] as String?,
  reasoning: json['reasoning'] as String?,
  parts:
      (json['parts'] as List<dynamic>?)
          ?.map(
            (e) => ApiMessageContentPart.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  toolCalls:
      (json['toolCalls'] as List<dynamic>?)
          ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  toolCallId: json['toolCallId'] as String?,
);

Map<String, dynamic> _$ApiMessageToJson(_ApiMessage instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'reasoning': instance.reasoning,
      'parts': instance.parts,
      'toolCalls': instance.toolCalls,
      'toolCallId': instance.toolCallId,
    };
