// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToolCall _$ToolCallFromJson(Map<String, dynamic> json) => _ToolCall(
  id: json['id'] as String,
  name: json['name'] as String,
  arguments: json['arguments'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$ToolCallToJson(_ToolCall instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'arguments': instance.arguments,
};

_ToolCallRequest _$ToolCallRequestFromJson(Map<String, dynamic> json) =>
    _ToolCallRequest(
      id: json['id'] as String,
      type: json['type'] as String,
      function: ToolCallRequestFunction.fromJson(
        json['function'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ToolCallRequestToJson(_ToolCallRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'function': instance.function,
    };

_ToolCallRequestFunction _$ToolCallRequestFunctionFromJson(
  Map<String, dynamic> json,
) => _ToolCallRequestFunction(
  name: json['name'] as String,
  arguments: json['arguments'] as String,
);

Map<String, dynamic> _$ToolCallRequestFunctionToJson(
  _ToolCallRequestFunction instance,
) => <String, dynamic>{'name': instance.name, 'arguments': instance.arguments};
