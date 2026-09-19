import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_call.freezed.dart';
part 'tool_call.g.dart';

@freezed
abstract class ToolCall with _$ToolCall {
  const factory ToolCall({
    required String id,
    required String name,
    @Default({}) Map<String, dynamic> arguments,
  }) = _ToolCall;

  factory ToolCall.fromJson(Map<String, dynamic> json) =>
      _$ToolCallFromJson(json);
}

@freezed
abstract class ToolCallRequest with _$ToolCallRequest {
  const factory ToolCallRequest({
    required String id,
    required String type,
    required ToolCallRequestFunction function,
  }) = _ToolCallRequest;

  factory ToolCallRequest.fromJson(Map<String, dynamic> json) =>
      _$ToolCallRequestFromJson(json);
}

@freezed
abstract class ToolCallRequestFunction with _$ToolCallRequestFunction {
  const factory ToolCallRequestFunction({
    required String name,
    required String arguments,
  }) = _ToolCallRequestFunction;

  factory ToolCallRequestFunction.fromJson(Map<String, dynamic> json) =>
      _$ToolCallRequestFunctionFromJson(json);
}
