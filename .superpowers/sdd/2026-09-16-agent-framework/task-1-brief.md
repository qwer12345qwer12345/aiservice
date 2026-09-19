# Task 1 Brief: 扩展核心模型支持 Tool Calls

## Task Description

**Files:**
- Modify: `lib/core/models/chat_chunk.dart:6-12`
- Modify: `lib/core/models/api_message.dart:32-43`
- Create: `lib/core/models/tool_call.dart`

**Interfaces:**
- Produces: `ToolCall`, `ToolCallRequest` 模型，`ChatChunk.toolCalls` 字段

## Steps

### Step 1: 创建 ToolCall 模型

```dart
// lib/core/models/tool_call.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_call.freezed.dart';
part 'tool_call.g.dart';

@freezed
class ToolCall with _$ToolCall {
  const factory ToolCall({
    required String id,
    required String name,
    @Default({}) Map<String, dynamic> arguments,
  }) = _ToolCall;

  factory ToolCall.fromJson(Map<String, dynamic> json) =>
      _$ToolCallFromJson(json);
}

@freezed
class ToolCallRequest with _$ToolCallRequest {
  const factory ToolCallRequest({
    required String id,
    required String type,
    required ToolCallRequestFunction function,
  }) = _ToolCallRequest;

  factory ToolCallRequest.fromJson(Map<String, dynamic> json) =>
      _$ToolCallRequestFromJson(json);
}

@freezed
class ToolCallRequestFunction with _$ToolCallRequestFunction {
  const factory ToolCallRequestFunction({
    required String name,
    required String arguments,
  }) = _ToolCallRequestFunction;

  factory ToolCallRequestFunction.fromJson(Map<String, dynamic> json) =>
      _$ToolCallRequestFunctionFromJson(json);
}
```

### Step 2: 运行 build_runner 生成代码

Run: `dart run build_runner build --delete-conflicting-outputs`
Expected: 生成 tool_call.freezed.dart 和 tool_call.g.dart

### Step 3: 扩展 ChatChunk 模型

```dart
// lib/core/models/chat_chunk.dart - 修改
import 'package:freezed_annotation/freezed_annotation.dart';
import 'tool_call.dart';

part 'chat_chunk.freezed.dart';

@freezed
class ChatChunk with _$ChatChunk {
  const factory ChatChunk({
    String? content,
    String? reasoningContent,
    required bool isDone,
    String? error,
    @Default([]) List<ToolCallRequest> toolCalls, // 新增
  }) = _ChatChunk;
}
```

### Step 4: 扩展 ApiMessage 模型

```dart
// lib/core/models/api_message.dart - 修改
@freezed
class ApiMessage with _$ApiMessage {
  const factory ApiMessage({
    required String role,
    String? content,
    String? reasoning,
    @Default([]) List<ApiMessageContentPart> parts,
    @Default([]) List<ToolCall> toolCalls,      // 新增
    String? toolCallId,                          // 新增
  }) = _ApiMessage;

  factory ApiMessage.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageFromJson(json);
}
```

### Step 5: 运行 build_runner 更新代码

Run: `dart run build_runner build --delete-conflicting-outputs`
Expected: 更新所有 .freezed.dart 和 .g.dart 文件

### Step 6: 提交代码

```bash
git add lib/core/models/
git commit -m "feat: extend core models to support tool calls"
```

## Context

This is the first task in the Agent Framework implementation. It extends the core data models to support tool calling, which is essential for the agent system. The models follow Freezed conventions used throughout the codebase.

## Global Constraints

- Flutter SDK ^3.11.1
- Dart SDK ^3.11.1
- Follow existing Freezed patterns in the codebase
- Run build_runner after model changes
- No breaking changes to existing code
