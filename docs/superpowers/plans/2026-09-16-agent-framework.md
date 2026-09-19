# Agent Framework Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add complete agent capabilities to aiservice based on opencode's architecture, including tool calling, permission system, and multi-agent collaboration.

**Architecture:** Extend existing Flutter AI chat app with agent framework. Core components: Tool interface, ToolRegistry, PermissionService, AgentRuntime. Based on opencode's actual source code patterns (agent.ts, tool.ts, registry.ts, permission/index.ts).

**Tech Stack:** Dart, Flutter, Freezed, Riverpod, HTTP/SSE

**Spec:** Design based on opencode source code analysis (src/agent/, src/tool/, src/permission/)

---

## File Structure

```
lib/
├── core/
│   └── models/
│       ├── chat_chunk.dart          # MODIFY: 添加 toolCalls 字段
│       ├── api_message.dart         # MODIFY: 添加 toolCalls, toolCallId 字段
│       ├── tool_call.dart           # CREATE: ToolCall 模型
│       └── generation_event.dart    # MODIFY: 添加 tool 相关事件
├── domain/
│   ├── agents/
│   │   ├── agent_config.dart        # CREATE: Agent 配置模型
│   │   ├── agent_runtime.dart       # CREATE: Agent 运行时引擎
│   │   └── agent_event.dart         # CREATE: Agent 事件流
│   ├── tools/
│   │   ├── tool.dart                # CREATE: Tool 抽象接口
│   │   ├── tool_context.dart        # CREATE: Tool 执行上下文
│   │   └── tool_result.dart         # CREATE: Tool 结果模型
│   └── permissions/
│       ├── permission_rule.dart     # CREATE: 权限规则模型
│       └── permission_service.dart  # CREATE: 权限评估服务
├── data/
│   └── tools/
│       ├── registry.dart            # CREATE: Tool 注册表
│       ├── read_file_tool.dart      # CREATE: 读取文件工具
│       ├── search_tool.dart         # CREATE: 搜索工具
│       └── bash_tool.dart           # CREATE: 执行命令工具
└── presentation/
    └── agent/
        ├── agent_selector.dart      # CREATE: Agent 选择 UI
        └── tool_permission_dialog.dart # CREATE: 权限确认 UI
```

---

## Task 1: 扩展核心模型支持 Tool Calls

**Files:**
- Modify: `lib/core/models/chat_chunk.dart:6-12`
- Modify: `lib/core/models/api_message.dart:32-43`
- Create: `lib/core/models/tool_call.dart`

**Interfaces:**
- Produces: `ToolCall`, `ToolCallRequest` 模型，`ChatChunk.toolCalls` 字段

- [ ] **Step 1: 创建 ToolCall 模型**

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

- [ ] **Step 2: 运行 build_runner 生成代码**

Run: `dart run build_runner build --delete-conflicting-outputs`
Expected: 生成 tool_call.freezed.dart 和 tool_call.g.dart

- [ ] **Step 3: 扩展 ChatChunk 模型**

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

- [ ] **Step 4: 扩展 ApiMessage 模型**

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

- [ ] **Step 5: 运行 build_runner 更新代码**

Run: `dart run build_runner build --delete-conflicting-outputs`
Expected: 更新所有 .freezed.dart 和 .g.dart 文件

- [ ] **Step 6: 提交代码**

```bash
git add lib/core/models/
git commit -m "feat: extend core models to support tool calls"
```

---

## Task 2: 创建 Tool 接口和基础模型

**Files:**
- Create: `lib/domain/tools/tool.dart`
- Create: `lib/domain/tools/tool_context.dart`
- Create: `lib/domain/tools/tool_result.dart`

**Interfaces:**
- Produces: `Tool` 抽象类，`ToolContext`，`ToolResult`

- [ ] **Step 1: 创建 Tool 抽象接口**

```dart
// lib/domain/tools/tool.dart
import 'tool_context.dart';
import 'tool_result.dart';

abstract class Tool {
  /// 工具唯一标识符
  String get id;
  
  /// 工具描述（发送给 LLM）
  String get description;
  
  /// 工具参数定义（JSON Schema 格式）
  Map<String, ToolParameter> get parameters;
  
  /// 执行工具
  Future<ToolResult> execute(
    Map<String, dynamic> args,
    ToolContext context,
  );
}

class ToolParameter {
  final String type;
  final String? description;
  final bool required;
  final dynamic defaultValue;
  final List<String>? enumValues;

  const ToolParameter({
    required this.type,
    this.description,
    this.required = false,
    this.defaultValue,
    this.enumValues,
  });

  Map<String, dynamic> toJsonSchema() {
    final schema = <String, dynamic>{
      'type': type,
    };
    if (description != null) schema['description'] = description;
    if (enumValues != null) schema['enum'] = enumValues;
    if (defaultValue != null) schema['default'] = defaultValue;
    return schema;
  }
}
```

- [ ] **Step 2: 创建 ToolContext**

```dart
// lib/domain/tools/tool_context.dart
import '../../core/models/api_message.dart';
import '../permissions/permission_rule.dart';

/// Tool 执行上下文（参考 opencode 的 Tool.Context）
class ToolContext {
  final String sessionId;
  final String messageId;
  final String agent;
  final String? callId;
  final void Function(String, PermissionRequest)? onAskPermission;
  final void Function({String? title, Map<String, dynamic>? metadata})? onMetadata;

  const ToolContext({
    required this.sessionId,
    required this.messageId,
    required this.agent,
    this.callId,
    this.onAskPermission,
    this.onMetadata,
  });

  /// 请求用户权限
  Future<void> ask(PermissionRequest request) async {
    onAskPermission?.call(request.tool, request);
  }

  /// 更新元数据
  void metadata({String? title, Map<String, dynamic>? data}) {
    onMetadata?.call(title: title, data: data);
  }
}

class PermissionRequest {
  final String tool;
  final List<String> patterns;
  final List<String> always;
  final Map<String, dynamic>? metadata;

  const PermissionRequest({
    required this.tool,
    required this.patterns,
    @Default([]) this.always,
    this.metadata,
  });
}
```

- [ ] **Step 3: 创建 ToolResult**

```dart
// lib/domain/tools/tool_result.dart
import '../../core/models/attachment.dart';

class ToolResult {
  final bool success;
  final String output;
  final String? title;
  final Map<String, dynamic>? metadata;
  final List<Attachment>? attachments;

  const ToolResult({
    required this.success,
    required this.output,
    this.title,
    this.metadata,
    this.attachments,
  });

  factory ToolResult.success(String output, {String? title, Map<String, dynamic>? metadata}) {
    return ToolResult(
      success: true,
      output: output,
      title: title,
      metadata: metadata,
    );
  }

  factory ToolResult.error(String error) {
    return ToolResult(
      success: false,
      output: error,
    );
  }
}
```

- [ ] **Step 4: 提交代码**

```bash
git add lib/domain/tools/
git commit -m "feat: create Tool interface and base models"
```

---

## Task 3: 创建权限系统

**Files:**
- Create: `lib/domain/permissions/permission_rule.dart`
- Create: `lib/domain/permissions/permission_service.dart`

**Interfaces:**
- Consumes: 无
- Produces: `PermissionRule`，`PermissionService`

- [ ] **Step 1: 创建权限规则模型**

```dart
// lib/domain/permissions/permission_rule.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_rule.freezed.dart';

enum PermissionAction { allow, ask, deny }

@freezed
class PermissionRule with _$PermissionRule {
  const factory PermissionRule({
    required String permission,
    required String pattern,
    required PermissionAction action,
  }) = _PermissionRule;
}
```

- [ ] **Step 2: 运行 build_runner**

Run: `dart run build_runner build --delete-conflicting-outputs`
Expected: 生成 permission_rule.freezed.dart

- [ ] **Step 3: 创建权限服务**

```dart
// lib/domain/permissions/permission_service.dart
import 'permission_rule.dart';

/// 权限服务（参考 opencode 的 permission/index.ts）
class PermissionService {
  /// 评估工具权限
  /// 从后向前遍历规则集，最后一个匹配的规则生效
  PermissionRule evaluate(
    String toolName,
    List<PermissionRule> ruleset,
  ) {
    for (var i = ruleset.length - 1; i >= 0; i--) {
      final rule = ruleset[i];
      if (_matches(toolName, rule.permission) &&
          _matches('*', rule.pattern)) {
        return rule;
      }
    }
    // 默认 ask
    return const PermissionRule(
      permission: '*',
      pattern: '*',
      action: PermissionAction.ask,
    );
  }

  /// 通配符匹配
  bool _matches(String value, String pattern) {
    if (pattern == '*') return true;
    if (pattern.endsWith('*')) {
      return value.startsWith(pattern.substring(0, pattern.length - 1));
    }
    if (pattern.startsWith('*')) {
      return value.endsWith(pattern.substring(1));
    }
    return value == pattern;
  }

  /// 合并多个规则集
  List<PermissionRule> merge(List<List<PermissionRule>> rulesets) {
    return rulesets.expand((rules) => rules).toList();
  }

  /// 从配置创建规则集
  List<PermissionRule> fromConfig(Map<String, dynamic> config) {
    final rules = <PermissionRule>[];
    for (final entry in config.entries) {
      final permission = entry.key;
      final value = entry.value;
      if (value is String) {
        rules.add(PermissionRule(
          permission: permission,
          pattern: '*',
          action: PermissionAction.values.byName(value),
        ));
      } else if (value is Map) {
        for (final patternEntry in value.entries) {
          rules.add(PermissionRule(
            permission: permission,
            pattern: patternEntry.key,
            action: PermissionAction.values.byName(patternEntry.value),
          ));
        }
      }
    }
    return rules;
  }
}
```

- [ ] **Step 4: 提交代码**

```bash
git add lib/domain/permissions/
git commit -m "feat: create permission system"
```

---

## Task 4: 创建 ToolRegistry

**Files:**
- Create: `lib/data/tools/registry.dart`

**Interfaces:**
- Consumes: `Tool`，`PermissionService`
- Produces: `ToolRegistry`

- [ ] **Step 1: 创建 ToolRegistry**

```dart
// lib/data/tools/registry.dart
import '../../domain/tools/tool.dart';
import '../../domain/permissions/permission_rule.dart';
import '../../domain/permissions/permission_service.dart';

/// Tool 注册表（参考 opencode 的 tool/registry.ts）
class ToolRegistry {
  final Map<String, Tool> _tools = {};
  final PermissionService _permissionService;

  ToolRegistry(this._permissionService);

  /// 注册工具
  void register(Tool tool) {
    _tools[tool.id] = tool;
  }

  /// 获取单个工具
  Tool? getTool(String id) => _tools[id];

  /// 获取所有工具
  List<Tool> getAllTools() => _tools.values.toList();

  /// 获取 agent 可用的工具
  List<Tool> getToolsForAgent(List<PermissionRule> permissions) {
    return _tools.values.where((tool) {
      final rule = _permissionService.evaluate(tool.id, permissions);
      return rule.action != PermissionAction.deny;
    }).toList();
  }

  /// 获取工具定义（发送给 LLM 的 JSON Schema）
  List<Map<String, dynamic>> getToolDefinitions(List<Tool> tools) {
    return tools.map((tool) => {
      'type': 'function',
      'function': {
        'name': tool.id,
        'description': tool.description,
        'parameters': _buildJsonSchema(tool.parameters),
      },
    }).toList();
  }

  /// 构建 JSON Schema
  Map<String, dynamic> _buildJsonSchema(Map<String, ToolParameter> params) {
    if (params.isEmpty) {
      return {
        'type': 'object',
        'properties': {},
      };
    }

    final properties = <String, dynamic>{};
    final required = <String>[];

    for (final entry in params.entries) {
      properties[entry.key] = entry.value.toJsonSchema();
      if (entry.value.required) {
        required.add(entry.key);
      }
    }

    return {
      'type': 'object',
      'properties': properties,
      if (required.isNotEmpty) 'required': required,
    };
  }
}
```

- [ ] **Step 2: 提交代码**

```bash
git add lib/data/tools/registry.dart
git commit -m "feat: create ToolRegistry"
```

---

## Task 5: 实现内置工具 - ReadFileTool

**Files:**
- Create: `lib/data/tools/read_file_tool.dart`

**Interfaces:**
- Consumes: `Tool` 接口
- Produces: `ReadFileTool`

- [ ] **Step 1: 实现 ReadFileTool**

```dart
// lib/data/tools/read_file_tool.dart
import 'dart:io';
import '../../domain/tools/tool.dart';
import '../../domain/tools/tool_context.dart';
import '../../domain/tools/tool_result.dart';

/// 读取文件工具（参考 opencode 的 tool/read.ts）
class ReadFileTool implements Tool {
  @override
  String get id => 'read_file';

  @override
  String get description => 'Read contents of a file from the filesystem.';

  @override
  Map<String, ToolParameter> get parameters => {
    'path': const ToolParameter(
      type: 'string',
      description: 'Absolute path to the file to read',
      required: true,
    ),
    'offset': const ToolParameter(
      type: 'integer',
      description: 'Line number to start reading from (0-indexed)',
    ),
    'limit': const ToolParameter(
      type: 'integer',
      description: 'Maximum number of lines to read',
    ),
  };

  @override
  Future<ToolResult> execute(
    Map<String, dynamic> args,
    ToolContext context,
  ) async {
    try {
      final path = args['path'] as String;
      final offset = args['offset'] as int? ?? 0;
      final limit = args['limit'] as int?;

      final file = File(path);
      if (!await file.exists()) {
        return ToolResult.error('File not found: $path');
      }

      final lines = await file.readAsLines();
      final start = offset.clamp(0, lines.length);
      final end = limit != null
          ? (start + limit).clamp(0, lines.length)
          : lines.length;
      final selectedLines = lines.sublist(start, end);

      final content = selectedLines.asMap().entries.map((entry) {
        final lineNum = entry.key + start + 1;
        return '$lineNum: ${entry.value}';
      }).join('\n');

      return ToolResult.success(content);
    } catch (e) {
      return ToolResult.error('Failed to read file: $e');
    }
  }
}
```

- [ ] **Step 2: 提交代码**

```bash
git add lib/data/tools/read_file_tool.dart
git commit -m "feat: implement ReadFileTool"
```

---

## Task 6: 实现内置工具 - SearchTool

**Files:**
- Create: `lib/data/tools/search_tool.dart`

**Interfaces:**
- Consumes: `Tool` 接口
- Produces: `SearchTool`

- [ ] **Step 1: 实现 SearchTool**

```dart
// lib/data/tools/search_tool.dart
import 'dart:io';
import 'package:path/path.dart' as p;
import '../../domain/tools/tool.dart';
import '../../domain/tools/tool_context.dart';
import '../../domain/tools/tool_result.dart';

/// 搜索文件工具（参考 opencode 的 tool/grep.ts）
class SearchTool implements Tool {
  @override
  String get id => 'search';

  @override
  String get description => 'Search file contents using regular expressions.';

  @override
  Map<String, ToolParameter> get parameters => {
    'pattern': const ToolParameter(
      type: 'string',
      description: 'Regex pattern to search for',
      required: true,
    ),
    'path': const ToolParameter(
      type: 'string',
      description: 'Directory or file path to search in',
    ),
    'include': const ToolParameter(
      type: 'string',
      description: 'File pattern to include (e.g., "*.dart")',
    ),
  };

  @override
  Future<ToolResult> execute(
    Map<String, dynamic> args,
    ToolContext context,
  ) async {
    try {
      final pattern = args['pattern'] as String;
      final searchPath = args['path'] as String? ?? '.';
      final include = args['include'] as String?;

      final regex = RegExp(pattern, multiLine: true);
      final results = <String>[];

      await _searchDirectory(Directory(searchPath), regex, include, results);

      if (results.isEmpty) {
        return ToolResult.success('No matches found.');
      }

      return ToolResult.success(results.join('\n'));
    } catch (e) {
      return ToolResult.error('Search failed: $e');
    }
  }

  Future<void> _searchDirectory(
    Directory dir,
    RegExp regex,
    String? include,
    List<String> results,
  ) async {
    await for (final entity in dir.list(recursive: true)) {
      if (entity is! File) continue;
      
      final fileName = p.basename(entity.path);
      if (include != null && !_matchPattern(fileName, include)) continue;
      
      try {
        final content = await entity.readAsString();
        final matches = regex.allMatches(content);
        for (final match in matches) {
          final line = _getLine(content, match.start);
          results.add('${entity.path}: $line');
        }
      } catch (_) {
        // 跳过无法读取的文件
      }
    }
  }

  bool _matchPattern(String fileName, String pattern) {
    final regex = RegExp(
      pattern.replaceAll('*', '.*').replaceAll('?', '.'),
    );
    return regex.hasMatch(fileName);
  }

  String _getLine(String content, int offset) {
    final lines = content.split('\n');
    var currentOffset = 0;
    for (final line in lines) {
      if (currentOffset + line.length >= offset) {
        return line.trim();
      }
      currentOffset += line.length + 1;
    }
    return '';
  }
}
```

- [ ] **Step 2: 提交代码**

```bash
git add lib/data/tools/search_tool.dart
git commit -m "feat: implement SearchTool"
```

---

## Task 7: 实现内置工具 - BashTool

**Files:**
- Create: `lib/data/tools/bash_tool.dart`

**Interfaces:**
- Consumes: `Tool` 接口
- Produces: `BashTool`

- [ ] **Step 1: 实现 BashTool**

```dart
// lib/data/tools/bash_tool.dart
import 'dart:io';
import '../../domain/tools/tool.dart';
import '../../domain/tools/tool_context.dart';
import '../../domain/tools/tool_result.dart';

/// 执行命令工具（参考 opencode 的 tool/shell.ts）
class BashTool implements Tool {
  @override
  String get id => 'bash';

  @override
  String get description => 'Execute shell commands in the project environment.';

  @override
  Map<String, ToolParameter> get parameters => {
    'command': const ToolParameter(
      type: 'string',
      description: 'The command to execute',
      required: true,
    ),
    'timeout': const ToolParameter(
      type: 'integer',
      description: 'Timeout in milliseconds (default: 120000)',
    ),
  };

  @override
  Future<ToolResult> execute(
    Map<String, dynamic> args,
    ToolContext context,
  ) async {
    try {
      final command = args['command'] as String;
      final timeout = args['timeout'] as int? ?? 120000;

      final result = await Process.run(
        'sh',
        ['-c', command],
        timeout: Duration(milliseconds: timeout),
      );

      final output = StringBuffer();
      if (result.stdout.isNotEmpty) {
        output.writeln(result.stdout);
      }
      if (result.stderr.isNotEmpty) {
        output.writeln('STDERR: ${result.stderr}');
      }
      output.writeln('Exit code: ${result.exitCode}');

      return ToolResult.success(
        output.toString(),
        metadata: {'exitCode': result.exitCode},
      );
    } catch (e) {
      return ToolResult.error('Command failed: $e');
    }
  }
}
```

- [ ] **Step 2: 提交代码**

```bash
git add lib/data/tools/bash_tool.dart
git commit -m "feat: implement BashTool"
```

---

## Task 8: 创建 Agent 配置模型

**Files:**
- Create: `lib/domain/agents/agent_config.dart`
- Create: `lib/domain/agents/agent_event.dart`

**Interfaces:**
- Consumes: `PermissionRule`
- Produces: `AgentConfig`，`AgentEvent`

- [ ] **Step 1: 创建 AgentConfig**

```dart
// lib/domain/agents/agent_config.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../permissions/permission_rule.dart';

part 'agent_config.freezed.dart';

/// Agent 模式
enum AgentMode { primary, subagent, all }

/// Agent 配置（参考 opencode 的 agent/agent.ts Info）
@freezed
class AgentConfig with _$AgentConfig {
  const factory AgentConfig({
    required String name,
    required String description,
    required AgentMode mode,
    @Default(false) bool hidden,
    @Default(false) bool native,
    String? prompt,
    String? modelId,
    String? providerId,
    @Default([]) List<PermissionRule> permissions,
    double? temperature,
    double? topP,
    int? maxSteps,
    @Default({}) Map<String, dynamic> options,
    String? color,
  }) = _AgentConfig;
}
```

- [ ] **Step 2: 运行 build_runner**

Run: `dart run build_runner build --delete-conflicting-outputs`
Expected: 生成 agent_config.freezed.dart

- [ ] **Step 3: 创建 AgentEvent**

```dart
// lib/domain/agents/agent_event.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../tools/tool_result.dart';

part 'agent_event.freezed.dart';

/// Agent 运行时事件
@freezed
class AgentEvent with _$AgentEvent {
  /// Agent 开始执行
  const factory AgentEvent.started({
    required String agentName,
  }) = AgentStarted;

  /// 收到文本内容
  const factory AgentEvent.text({
    required String content,
  }) = AgentText;

  /// 工具被执行
  const factory AgentEvent.toolExecuted({
    required String toolName,
    required ToolResult result,
  }) = AgentToolExecuted;

  /// 工具被拒绝
  const factory AgentEvent.toolDenied({
    required String toolName,
  }) = AgentToolDenied;

  /// 工具执行出错
  const factory AgentEvent.toolError({
    required String toolName,
    required String error,
  }) = AgentToolError;

  /// Agent 完成
  const factory AgentEvent.completed({
    required String content,
  }) = AgentCompleted;

  /// Agent 出错
  const factory AgentEvent.failed({
    required String error,
  }) = AgentFailed;

  /// 达到最大步数
  const factory AgentEvent.maxStepsReached({
    required int steps,
  }) = AgentMaxStepsReached;
}
```

- [ ] **Step 4: 提交代码**

```bash
git add lib/domain/agents/
git commit -m "feat: create AgentConfig and AgentEvent models"
```

---

## Task 9: 实现 AgentRuntime

**Files:**
- Create: `lib/domain/agents/agent_runtime.dart`

**Interfaces:**
- Consumes: `AgentConfig`，`ToolRegistry`，`PermissionService`，`ChatSource`
- Produces: `AgentRuntime`

- [ ] **Step 1: 实现 AgentRuntime**

```dart
// lib/domain/agents/agent_runtime.dart
import 'dart:async';
import '../../core/models/api_message.dart';
import '../../core/models/chat_chunk.dart';
import '../tools/tool.dart';
import '../tools/tool_context.dart';
import '../tools/tool_result.dart';
import '../permissions/permission_rule.dart';
import '../permissions/permission_service.dart';
import '../../data/tools/registry.dart';
import '../../data/data_sources/chat_source.dart';
import '../../core/models/app_config.dart';
import 'agent_config.dart';
import 'agent_event.dart';

/// Agent 运行时引擎（参考 opencode 的 agent loop）
class AgentRuntime {
  final ToolRegistry _toolRegistry;
  final PermissionService _permissionService;
  final ChatSource _chatSource;

  AgentRuntime(
    this._toolRegistry,
    this._permissionService,
    this._chatSource,
  );

  /// 运行 Agent
  Stream<AgentEvent> run({
    required AgentConfig agent,
    required ConfigProfile config,
    required List<ApiMessage> context,
    required String userInput,
    String? sessionId,
    String? messageId,
  }) async* {
    yield AgentEvent.started(agentName: agent.name);

    var messages = List<ApiMessage>.from(context);
    var steps = 0;
    final maxSteps = agent.maxSteps ?? 100;

    while (steps < maxSteps) {
      // 1. 获取可用工具
      final tools = _toolRegistry.getToolsForAgent(agent.permissions);
      final toolDefs = _toolRegistry.getToolDefinitions(tools);

      // 2. 构建用户消息
      final userMessage = ApiMessage(
        role: 'user',
        content: userInput,
      );
      messages.add(userMessage);

      // 3. 调用 LLM
      final responseStream = _chatSource.chatStream(
        config: config,
        context: messages,
      );

      ChatChunk? lastChunk;
      await for (final chunk in responseStream) {
        lastChunk = chunk;
        if (chunk.content != null && chunk.content!.isNotEmpty) {
          yield AgentEvent.text(content: chunk.content!);
        }
      }

      if (lastChunk == null) {
        yield const AgentEvent.failed(error: 'No response from LLM');
        return;
      }

      // 4. 检查是否有 tool_calls
      if (lastChunk.toolCalls.isEmpty) {
        yield AgentEvent.completed(
          content: lastChunk.content ?? '',
        );
        return;
      }

      // 5. 执行工具调用
      final assistantMessage = ApiMessage(
        role: 'assistant',
        content: lastChunk.content,
        toolCalls: lastChunk.toolCalls.map((tc) => tc as dynamic).toList(),
      );
      messages.add(assistantMessage);

      for (final toolCall in lastChunk.toolCalls) {
        // 获取工具
        final tool = _toolRegistry.getTool(toolCall.name);
        if (tool == null) {
          yield AgentEvent.toolError(
            toolName: toolCall.name,
            error: 'Tool not found',
          );
          continue;
        }

        // 权限检查
        final permission = _permissionService.evaluate(
          toolCall.name,
          agent.permissions,
        );

        if (permission.action == PermissionAction.deny) {
          yield AgentEvent.toolDenied(toolName: toolCall.name);
          continue;
        }

        // if (permission.action == PermissionAction.ask) {
        //   // TODO: 请求用户确认
        // }

        // 执行工具
        final result = await tool.execute(
          toolCall.arguments,
          ToolContext(
            sessionId: sessionId ?? '',
            messageId: messageId ?? '',
            agent: agent.name,
            callId: toolCall.id,
          ),
        );

        yield AgentEvent.toolExecuted(
          toolName: toolCall.name,
          result: result,
        );

        // 将工具结果加入上下文
        final toolMessage = ApiMessage(
          role: 'tool',
          content: result.output,
          toolCallId: toolCall.id,
        );
        messages.add(toolMessage);
      }

      steps++;
    }

    yield AgentEvent.maxStepsReached(steps: steps);
  }
}
```

- [ ] **Step 2: 提交代码**

```bash
git add lib/domain/agents/agent_runtime.dart
git commit -m "feat: implement AgentRuntime"
```

---

## Task 10: 集成到现有 ChatService

**Files:**
- Modify: `lib/domain/services/chat_service.dart`
- Modify: `lib/data/data_sources/remote_chat_source.dart`

**Interfaces:**
- Consumes: `AgentRuntime`，`ToolRegistry`
- Produces: 扩展的 `ChatService`

- [ ] **Step 1: 扩展 RemoteChatSource 支持 tools 参数**

```dart
// lib/data/data_sources/chat_source.dart - 修改
abstract class ChatSource {
  Future<List<ModelInfo>> fetchModels(
    ConfigProfile config, {
    required http.Client client,
  });
  
  Stream<ChatChunk> chatStream({
    required ConfigProfile config,
    required List<ApiMessage> context,
    List<Map<String, dynamic>>? tools, // 新增
  });
}
```

- [ ] **Step 2: 修改 RemoteChatSource 支持 tools**

在 `remote_chat_source.dart` 的 `chatStream` 方法中添加 tools 支持：
- 在构建请求体时，如果 tools 不为空，添加到请求中
- 解析响应时，提取 tool_calls

- [ ] **Step 3: 扩展 ChatService 添加 agent 方法**

```dart
// lib/domain/services/chat_service.dart - 添加
static Stream<AgentEvent> sendAgentMessage({
  required ConversationRepository repository,
  required ConfigService configService,
  required ChatSourceRouter sourceRouter,
  required AgentRuntime agentRuntime,
  required AgentConfig agent,
  required String sessionId,
  required String content,
  required String? parentRoundId,
}) async* {
  // 1. 创建轮次
  final newRoundId = await _createRound(
    repository: repository,
    sessionId: sessionId,
    content: content,
    parentRoundId: parentRoundId,
    attachments: [],
  );

  // 2. 获取上下文
  final contextRounds = await repository.getContextRounds(newRoundId);
  final apiContext = await buildApiContextFromRounds(contextRounds, repository);

  // 3. 获取配置
  final config = await configService.loadActiveConfig();

  // 4. 运行 agent
  await for (final event in agentRuntime.run(
    agent: agent,
    config: config,
    context: apiContext,
    userInput: content,
    sessionId: sessionId,
  )) {
    yield event;
    
    // 更新轮次
    if (event is AgentText) {
      repository.updateRound(
        roundId: newRoundId,
        assistantContent: event.content,
        isIncomplete: true,
      );
    } else if (event is AgentCompleted) {
      repository.updateRound(
        roundId: newRoundId,
        assistantContent: event.content,
        isIncomplete: false,
        hasUnseenUpdate: true,
      );
    }
  }
}
```

- [ ] **Step 4: 提交代码**

```bash
git add lib/domain/services/chat_service.dart lib/data/data_sources/
git commit -m "feat: integrate agent framework into ChatService"
```

---

## Task 11: 创建 UI 组件

**Files:**
- Create: `lib/presentation/agent/agent_selector.dart`
- Create: `lib/presentation/agent/tool_permission_dialog.dart`

**Interfaces:**
- Consumes: `AgentConfig`
- Produces: Agent 选择器 Widget，权限确认 Dialog

- [ ] **Step 1: 创建 AgentSelector**

```dart
// lib/presentation/agent/agent_selector.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/agents/agent_config.dart';

class AgentSelector extends ConsumerWidget {
  final List<AgentConfig> agents;
  final String? selectedAgent;
  final ValueChanged<String> onAgentSelected;

  const AgentSelector({
    super.key,
    required this.agents,
    this.selectedAgent,
    required this.onAgentSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibleAgents = agents.where((a) => !a.hidden).toList();
    
    return DropdownButton<String>(
      value: selectedAgent,
      hint: const Text('Select Agent'),
      items: visibleAgents.map((agent) {
        return DropdownMenuItem(
          value: agent.name,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: agent.mode == AgentMode.primary
                      ? Colors.green
                      : Colors.blue,
                ),
              ),
              const SizedBox(width: 8),
              Text(agent.name),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) onAgentSelected(value);
      },
    );
  }
}
```

- [ ] **Step 2: 创建 ToolPermissionDialog**

```dart
// lib/presentation/agent/tool_permission_dialog.dart
import 'package:flutter/material.dart';

class ToolPermissionDialog extends StatelessWidget {
  final String toolName;
  final String agentName;
  final Map<String, dynamic>? metadata;

  const ToolPermissionDialog({
    super.key,
    required this.toolName,
    required this.agentName,
    this.metadata,
  });

  static Future<bool> show(
    BuildContext context, {
    required String toolName,
    required String agentName,
    Map<String, dynamic>? metadata,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => ToolPermissionDialog(
        toolName: toolName,
        agentName: agentName,
        metadata: metadata,
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Permission Request'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Agent "$agentName" wants to use tool:'),
          const SizedBox(height: 8),
          Chip(
            label: Text(toolName),
            backgroundColor: Colors.blue.shade100,
          ),
          if (metadata != null && metadata!.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text('Details:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(metadata.toString()),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Deny'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Allow'),
        ),
      ],
    );
  }
}
```

- [ ] **Step 3: 提交代码**

```bash
git add lib/presentation/agent/
git commit -m "feat: create Agent UI components"
```

---

## Task 12: 创建 Provider 集成

**Files:**
- Create: `lib/di/agent_providers.dart`

**Interfaces:**
- Consumes: 所有 Domain 层组件
- Produces: Riverpod Providers

- [ ] **Step 1: 创建 Agent Providers**

```dart
// lib/di/agent_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/permissions/permission_service.dart';
import '../data/tools/registry.dart';
import '../data/tools/read_file_tool.dart';
import '../data/tools/search_tool.dart';
import '../data/tools/bash_tool.dart';
import '../domain/agents/agent_config.dart';
import '../domain/agents/agent_runtime.dart';

/// 权限服务 Provider
final permissionServiceProvider = Provider<PermissionService>((ref) {
  return PermissionService();
});

/// ToolRegistry Provider
final toolRegistryProvider = Provider<ToolRegistry>((ref) {
  final permissionService = ref.watch(permissionServiceProvider);
  final registry = ToolRegistry(permissionService);
  
  // 注册内置工具
  registry.register(ReadFileTool());
  registry.register(SearchTool());
  registry.register(BashTool());
  
  return registry;
});

/// 默认 Agent 配置
final defaultAgentsProvider = Provider<List<AgentConfig>>((ref) {
  return const [
    AgentConfig(
      name: 'build',
      description: 'Default agent with full tool access.',
      mode: AgentMode.primary,
      native: true,
    ),
    AgentConfig(
      name: 'plan',
      description: 'Plan mode. Read-only analysis.',
      mode: AgentMode.primary,
      native: true,
    ),
    AgentConfig(
      name: 'explore',
      description: 'Fast agent for codebase exploration.',
      mode: AgentMode.subagent,
      native: true,
      maxSteps: 10,
    ),
  ];
});

/// AgentRuntime Provider
final agentRuntimeProvider = Provider<AgentRuntime>((ref) {
  final toolRegistry = ref.watch(toolRegistryProvider);
  final permissionService = ref.watch(permissionServiceProvider);
  // chatSource 需要从现有 DI 获取
  // final chatSource = ref.watch(chatSourceProvider);
  
  return AgentRuntime(
    toolRegistry,
    permissionService,
    null, // TODO: 注入 ChatSource
  );
});
```

- [ ] **Step 2: 提交代码**

```bash
git add lib/di/agent_providers.dart
git commit -m "feat: create Riverpod providers for agent framework"
```

---

## Task 13: 运行测试验证

**Files:**
- 无新文件

**Interfaces:**
- 无

- [ ] **Step 1: 运行 build_runner 确保所有代码生成完成**

Run: `dart run build_runner build --delete-conflicting-outputs`
Expected: 无错误

- [ ] **Step 2: 运行分析检查**

Run: `dart analyze lib/`
Expected: 无错误

- [ ] **Step 3: 运行现有测试**

Run: `flutter test`
Expected: 所有测试通过

- [ ] **Step 4: 验证编译**

Run: `flutter build apk --debug`
Expected: 编译成功

- [ ] **Step 5: 最终提交**

```bash
git add -A
git commit -m "feat: complete agent framework implementation"
```

---

## Summary

**总计 13 个 Tasks，约 50+ 个 Steps**

| Phase | Tasks | 描述 |
|-------|-------|------|
| Phase 1 | Task 1 | 扩展核心模型 |
| Phase 2 | Task 2-7 | Tool 接口 + 内置工具 |
| Phase 3 | Task 8 | Agent 配置模型 |
| Phase 4 | Task 9 | AgentRuntime |
| Phase 5 | Task 10-12 | 集成 + UI + Providers |
| 验证 | Task 13 | 测试验证 |

**依赖关系：**
```
Task 1 → Task 2 → Task 3 → Task 4 → Task 5-7 (并行)
                    ↓
                  Task 8 → Task 9 → Task 10-12 (并行)
                                          ↓
                                        Task 13
```
