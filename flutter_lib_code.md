This file is a merged representation of a subset of the codebase, containing files not matching ignore patterns, combined into a single document by Repomix.

# File Summary

## Purpose
This file contains a packed representation of a subset of the repository's contents that is considered the most important context.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Files matching these patterns are excluded: **/*.freezed.dart
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
core/constants/app_constants.dart
core/models/api_message.dart
core/models/api_message.g.dart
core/models/app_config_store.dart
core/models/app_config_store.g.dart
core/models/app_config.dart
core/models/app_config.g.dart
core/models/attachment.dart
core/models/attachment.g.dart
core/models/chat_chunk.dart
core/models/chat_round.dart
core/models/chat_round.g.dart
core/models/model_info.dart
core/models/model_info.g.dart
core/models/session.dart
core/models/session.g.dart
core/models/sse_event.dart
core/utils/app_route_observer.dart
core/utils/sse_parser.dart
data/data_sources/local_file_source.dart
data/data_sources/remote_api_source.dart
data/data_sources/sse_event_decoder.dart
data/database/database.dart
data/database/database.g.dart
data/repositories/conversation_repository.dart
data/services/config_service.dart
di/providers.dart
domain/models/session_card_meta.dart
domain/models/session_list_item.dart
domain/models/tree_node.dart
domain/models/tree_node.g.dart
domain/services/attachment_preparer.dart
domain/services/chat_context_builder.dart
domain/services/chat_round_factory.dart
domain/services/model_capability_registry.dart
domain/services/tree_builder.dart
domain/states/chat_state.dart
main.dart
presentation/models/pending_attachment.dart
presentation/pages/branch_tree_page.dart
presentation/pages/chat_page.dart
presentation/pages/home_page.dart
presentation/pages/settings_page.dart
presentation/pages/text_attachment_viewer_page.dart
presentation/providers/attachment_bytes_provider.dart
presentation/providers/chat_notifier.dart
presentation/providers/config_notifier.dart
presentation/providers/input_draft_provider.dart
presentation/providers/session_list_notifier.dart
presentation/themes/app_theme.dart
presentation/themes/app_tokens.dart
presentation/widgets/attachment_list.dart
presentation/widgets/common/app_card.dart
presentation/widgets/common/app_page_scaffold.dart
presentation/widgets/common/app_section.dart
presentation/widgets/common/app_toast.dart
presentation/widgets/input_bar.dart
presentation/widgets/message_bubble.dart
presentation/widgets/thought_bubble.dart
```

# Files

## File: core/constants/app_constants.dart
```dart
abstract class AppConstants {
  // 文件夹名称
  static const String dirConversations = 'conversations';
  static const String dirAttachments = 'attachments';

  // 文件名
  static const String fileConfig = 'config.json';

  // 配置键
  static const String keyBaseUrl = 'baseUrl';
  static const String keyApiKey = 'apiKey';
  static const String keyTheme = 'theme';
  static const String keyModel = 'selectedModel';

  // 默认值
  static const String defaultBaseUrl = 'https://api.openai.com';
  static const String defaultTheme = 'system';

  // 文件扩展名
  static const String extJson = '.json';
}
```

## File: core/models/api_message.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_message.freezed.dart';
part 'api_message.g.dart';

@Freezed(unionKey: 'runtimeType')
class ApiMessageContentPart with _$ApiMessageContentPart {
  const factory ApiMessageContentPart.text({
    @Default('text') String type,
    required String text,
  }) = ApiMessageTextPart;

  const factory ApiMessageContentPart.imageUrl({
    @Default('image_url') String type,
    @JsonKey(name: 'image_url') required ApiImageUrl imageUrl,
  }) = ApiMessageImageUrlPart;

  factory ApiMessageContentPart.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageContentPartFromJson(json);
}

@freezed
class ApiImageUrl with _$ApiImageUrl {
  const factory ApiImageUrl({
    required String url,
  }) = _ApiImageUrl;

  factory ApiImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ApiImageUrlFromJson(json);
}

@freezed
class ApiMessage with _$ApiMessage {
  const factory ApiMessage({
    required String role,
    String? content,
    String? reasoning,
    @Default([]) List<ApiMessageContentPart> parts,
  }) = _ApiMessage;

  factory ApiMessage.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageFromJson(json);
}
```

## File: core/models/api_message.g.dart
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiMessageTextPartImpl _$$ApiMessageTextPartImplFromJson(
  Map<String, dynamic> json,
) => _$ApiMessageTextPartImpl(
  type: json['type'] as String? ?? 'text',
  text: json['text'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ApiMessageTextPartImplToJson(
  _$ApiMessageTextPartImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'text': instance.text,
  'runtimeType': instance.$type,
};

_$ApiMessageImageUrlPartImpl _$$ApiMessageImageUrlPartImplFromJson(
  Map<String, dynamic> json,
) => _$ApiMessageImageUrlPartImpl(
  type: json['type'] as String? ?? 'image_url',
  imageUrl: ApiImageUrl.fromJson(json['image_url'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ApiMessageImageUrlPartImplToJson(
  _$ApiMessageImageUrlPartImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'image_url': instance.imageUrl,
  'runtimeType': instance.$type,
};

_$ApiImageUrlImpl _$$ApiImageUrlImplFromJson(Map<String, dynamic> json) =>
    _$ApiImageUrlImpl(url: json['url'] as String);

Map<String, dynamic> _$$ApiImageUrlImplToJson(_$ApiImageUrlImpl instance) =>
    <String, dynamic>{'url': instance.url};

_$ApiMessageImpl _$$ApiMessageImplFromJson(Map<String, dynamic> json) =>
    _$ApiMessageImpl(
      role: json['role'] as String,
      content: json['content'] as String?,
      reasoning: json['reasoning'] as String?,
      parts:
          (json['parts'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ApiMessageContentPart.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ApiMessageImplToJson(_$ApiMessageImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'reasoning': instance.reasoning,
      'parts': instance.parts,
    };
```

## File: core/models/app_config_store.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'app_config.dart';

part 'app_config_store.freezed.dart';
part 'app_config_store.g.dart';

@freezed
class ConfigProfile with _$ConfigProfile {
  const factory ConfigProfile({
    required String id,
    required String name,
    required AppConfig config,
  }) = _ConfigProfile;

  factory ConfigProfile.fromJson(Map<String, dynamic> json) =>
      _$ConfigProfileFromJson(json);
}

@freezed
class AppConfigStore with _$AppConfigStore {
  const factory AppConfigStore({
    required String activeProfileId,
    @Default([]) List<ConfigProfile> profiles,
  }) = _AppConfigStore;

  factory AppConfigStore.fromJson(Map<String, dynamic> json) =>
      _$AppConfigStoreFromJson(json);

  factory AppConfigStore.defaultStore() => AppConfigStore(
        activeProfileId: 'default',
        profiles: [
          ConfigProfile(
            id: 'default',
            name: '默认配置',
            config: AppConfig.defaultConfig(),
          ),
        ],
      );
}
```

## File: core/models/app_config_store.g.dart
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigProfileImpl _$$ConfigProfileImplFromJson(Map<String, dynamic> json) =>
    _$ConfigProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      config: AppConfig.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConfigProfileImplToJson(_$ConfigProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'config': instance.config,
    };

_$AppConfigStoreImpl _$$AppConfigStoreImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigStoreImpl(
      activeProfileId: json['activeProfileId'] as String,
      profiles:
          (json['profiles'] as List<dynamic>?)
              ?.map((e) => ConfigProfile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AppConfigStoreImplToJson(
  _$AppConfigStoreImpl instance,
) => <String, dynamic>{
  'activeProfileId': instance.activeProfileId,
  'profiles': instance.profiles,
};
```

## File: core/models/app_config.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'model_info.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

List<ModelInfo>? _modelsFromJson(List<dynamic>? json) =>
    json?.map((e) => ModelInfo.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>>? _modelsToJson(List<ModelInfo>? models) =>
    models?.map((e) => e.toJson()).toList();

@freezed
class AppConfig with _$AppConfig {
  const factory AppConfig({
    required String baseUrl,
    required String apiKey,
    String? selectedModel,
    @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
    List<ModelInfo>? availableModels,
    @Default('system') String theme,
    @Default('v1/models') String modelsPath,
    @Default('v1/chat/completions') String chatPath,
    @Default('chat_completions') String apiMode,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  factory AppConfig.defaultConfig() => const AppConfig(
        baseUrl: 'https://api.openai.com',
        apiKey: '',
        theme: 'system',
        modelsPath: 'v1/models',
        chatPath: 'v1/chat/completions',
        apiMode: 'chat_completions',
      );
}
```

## File: core/models/app_config.g.dart
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
      baseUrl: json['baseUrl'] as String,
      apiKey: json['apiKey'] as String,
      selectedModel: json['selectedModel'] as String?,
      availableModels: _modelsFromJson(json['availableModels'] as List?),
      theme: json['theme'] as String? ?? 'system',
      modelsPath: json['modelsPath'] as String? ?? 'v1/models',
      chatPath: json['chatPath'] as String? ?? 'v1/chat/completions',
      apiMode: json['apiMode'] as String? ?? 'chat_completions',
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'apiKey': instance.apiKey,
      'selectedModel': instance.selectedModel,
      'availableModels': _modelsToJson(instance.availableModels),
      'theme': instance.theme,
      'modelsPath': instance.modelsPath,
      'chatPath': instance.chatPath,
      'apiMode': instance.apiMode,
    };
```

## File: core/models/attachment.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    required String id,
    required String name,
    required String relativePath,
    @Default(false) bool isImage,
    String? mimeType,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}
```

## File: core/models/attachment.g.dart
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentImpl _$$AttachmentImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      relativePath: json['relativePath'] as String,
      isImage: json['isImage'] as bool? ?? false,
      mimeType: json['mimeType'] as String?,
    );

Map<String, dynamic> _$$AttachmentImplToJson(_$AttachmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'relativePath': instance.relativePath,
      'isImage': instance.isImage,
      'mimeType': instance.mimeType,
    };
```

## File: core/models/chat_chunk.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_chunk.freezed.dart';

@freezed
class ChatChunk with _$ChatChunk {
  const factory ChatChunk({
    String? content,          // 正式内容片段
    String? reasoningContent, // 思考过程片段
    required bool isDone,     // 是否结束
    String? error,            // 错误信息
  }) = _ChatChunk;
}
```

## File: core/models/chat_round.dart
```dart
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
    @Default(false) bool hasUnseenUpdate,
  }) = _ChatRound;

  factory ChatRound.fromJson(Map<String, dynamic> json) =>
      _$ChatRoundFromJson(json);
}
```

## File: core/models/chat_round.g.dart
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoundImpl _$$ChatRoundImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoundImpl(
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

Map<String, dynamic> _$$ChatRoundImplToJson(_$ChatRoundImpl instance) =>
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
```

## File: core/models/model_info.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_info.freezed.dart';
part 'model_info.g.dart';

@freezed
class ModelInfo with _$ModelInfo {
  const factory ModelInfo({
    required String id,
    String? name,

    // 最终生效能力（默认检测 + 手动覆盖后）
    bool? supportsReasoning,
    bool? supportsVision,

    // 用户手动覆盖值
    bool? overrideSupportsReasoning,
    bool? overrideSupportsVision,
  }) = _ModelInfo;

  factory ModelInfo.fromJson(Map<String, dynamic> json) =>
      _$ModelInfoFromJson(json);
}
```

## File: core/models/model_info.g.dart
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelInfoImpl _$$ModelInfoImplFromJson(Map<String, dynamic> json) =>
    _$ModelInfoImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      supportsReasoning: json['supportsReasoning'] as bool?,
      supportsVision: json['supportsVision'] as bool?,
      overrideSupportsReasoning: json['overrideSupportsReasoning'] as bool?,
      overrideSupportsVision: json['overrideSupportsVision'] as bool?,
    );

Map<String, dynamic> _$$ModelInfoImplToJson(_$ModelInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'supportsReasoning': instance.supportsReasoning,
      'supportsVision': instance.supportsVision,
      'overrideSupportsReasoning': instance.overrideSupportsReasoning,
      'overrideSupportsVision': instance.overrideSupportsVision,
    };
```

## File: core/models/session.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'chat_round.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  const factory Session({
    required String id,
    required String title,
    required int createdAt,
    required int updatedAt,
    required List<ChatRound> rounds,
    SessionConfig? config,
    @Default(false) bool hasUnseenUpdate,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
}

@freezed
class SessionConfig with _$SessionConfig {
  const factory SessionConfig({
    String? model,
    double? temperature,
    bool? enableReasoning,
  }) = _SessionConfig;

  factory SessionConfig.fromJson(Map<String, dynamic> json) =>
      _$SessionConfigFromJson(json);
}
```

## File: core/models/session.g.dart
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      rounds: (json['rounds'] as List<dynamic>)
          .map((e) => ChatRound.fromJson(e as Map<String, dynamic>))
          .toList(),
      config: json['config'] == null
          ? null
          : SessionConfig.fromJson(json['config'] as Map<String, dynamic>),
      hasUnseenUpdate: json['hasUnseenUpdate'] as bool? ?? false,
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'rounds': instance.rounds,
      'config': instance.config,
      'hasUnseenUpdate': instance.hasUnseenUpdate,
    };

_$SessionConfigImpl _$$SessionConfigImplFromJson(Map<String, dynamic> json) =>
    _$SessionConfigImpl(
      model: json['model'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      enableReasoning: json['enableReasoning'] as bool?,
    );

Map<String, dynamic> _$$SessionConfigImplToJson(_$SessionConfigImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'temperature': instance.temperature,
      'enableReasoning': instance.enableReasoning,
    };
```

## File: core/models/sse_event.dart
```dart
// 导入库的模型和枚举
import 'package:flutter_client_sse/flutter_client_sse.dart';

// 保持你原有SseEvent的非空约定，避免修改下游Decoder
class SseEvent {
  final String? id;
  final String? event;
  final String data; // 保持非空，和你原有逻辑一致

  // 从库的SSEModel转换，自动处理空值
  factory SseEvent.fromSSEModel(SSEModel model) {
    return SseEvent(
      id: model.id,
      event: model.event,
      // 空值处理：保证data永远非空，不会给下游Decoder传null
      data: model.data?.trim() ?? '',
    );
  }

  const SseEvent({
    this.id,
    this.event,
    required this.data,
  });

  @override
  String toString() => 'SseEvent(id: $id, event: $event, data: $data)';
}
```

## File: core/utils/app_route_observer.dart
```dart
import 'package:flutter/material.dart';

final RouteObserver<ModalRoute<void>> appRouteObserver =
    RouteObserver<ModalRoute<void>>();
```

## File: core/utils/sse_parser.dart
```dart
import '../models/sse_event.dart';

/// 标准 SSE 解析器
///
/// 负责：
/// - 处理 HTTP 分块不等于 SSE 事件边界的问题
/// - 支持 event/id/data/retry
/// - 支持多行 data 拼接
/// - 以空行作为一个 SSE event 的结束
class SseParser {
  String _buffer = '';

  final List<String> _dataLines = [];
  String? _event;
  String? _id;

  /// 输入任意一段文本，输出当前能够完整解析出的 SSE 事件列表
  List<SseEvent> addChunk(String chunk) {
    _buffer += chunk;
    final events = <SseEvent>[];

    while (true) {
      final newlineIndex = _buffer.indexOf('\n');
      if (newlineIndex == -1) break;

      var line = _buffer.substring(0, newlineIndex);
      _buffer = _buffer.substring(newlineIndex + 1);

      if (line.endsWith('\r')) {
        line = line.substring(0, line.length - 1);
      }

      // 空行 => 一个事件结束
      if (line.isEmpty) {
        final event = _flushEvent();
        if (event != null) {
          events.add(event);
        }
        continue;
      }

      // 注释行
      if (line.startsWith(':')) {
        continue;
      }

      final colonIndex = line.indexOf(':');
      String field;
      String value;

      if (colonIndex == -1) {
        field = line;
        value = '';
      } else {
        field = line.substring(0, colonIndex);
        value = line.substring(colonIndex + 1);
        if (value.startsWith(' ')) {
          value = value.substring(1);
        }
      }

      switch (field) {
        case 'event':
          _event = value;
          break;
        case 'data':
          _dataLines.add(value);
          break;
        case 'id':
          _id = value;
          break;
        case 'retry':
          // 目前不处理自动重试时间
          break;
        default:
          // 未知字段忽略
          break;
      }
    }

    return events;
  }

  /// 在底层流结束时调用，尝试 flush 最后一个未结束事件
  SseEvent? close() {
    return _flushEvent();
  }

  SseEvent? _flushEvent() {
    if (_dataLines.isEmpty && _event == null && _id == null) {
      return null;
    }

    final event = SseEvent(
      id: _id,
      event: _event,
      data: _dataLines.join('\n'),
    );

    _dataLines.clear();
    _event = null;
    _id = null;

    return event;
  }
}
```

## File: data/data_sources/local_file_source.dart
```dart
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as path;
import '../../core/constants/app_constants.dart';

class LocalFileSource{
  final String _baseDir;
  final Directory _directory;

  LocalFileSource(this._baseDir) : _directory = Directory(_baseDir);

  Future<String> get basePath async => _baseDir;

  Future<void> initDirectories() async {
    await _directory.create(recursive: true);
    await Directory(path.join(_baseDir, AppConstants.dirConversations))
        .create(recursive: true);
     await Directory(path.join(_baseDir, AppConstants.dirAttachments))
        .create(recursive: true);
  }

  Future<String> readTextFile(String relativePath) async {
    try {
      final file = File(path.join(_baseDir, relativePath));
      if (!await file.exists()) {
        throw Exception('文件不存在');
      }
      return await file.readAsString();
    } on FileSystemException catch (e) {
      throw Exception('读取文件失败：${e.message}');
    }
  }

  Future<void> writeTextFile(String relativePath, String content) async {
    try {
      final file = File(path.join(_baseDir, relativePath));
      final dir = file.parent;
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }
      await file.writeAsString(content, flush: true);
    } on FileSystemException catch (e) {
      throw Exception('写入文件失败：${e.message}');
    }
  }

  Future<void> deleteAttachment(String relativePath) async {
    try {
      final file = File(path.join(_baseDir, relativePath));
      if (await file.exists()) {
        await file.delete();
       }
    } on FileSystemException catch (e) {
      throw Exception('删除文件失败：${e.message}');
    }
  }

  Future<List<String>> listFiles(String directory) async {
    try {
      final dir = Directory(path.join(_baseDir, directory));
      if (!await dir.exists()) {
        return [];
      }
      final entities = await dir.list().toList();
      return entities
          .whereType<File>()
          .where((f) => f.path.endsWith(AppConstants.extJson))
          .map((f) => path.basename(f.path))
          .toList();
    } on FileSystemException catch (e) {
      throw Exception('列出文件失败：${e.message}');
    }
  }

  Future<String> saveAttachment(Uint8List data, String fileName) async {
    try {
      final ext = path.extension(fileName).toLowerCase();
      final hash = sha256.convert(data).toString();
       final hashedFileName = '$hash$ext';
      final relativePath = '${AppConstants.dirAttachments}/$hashedFileName';
      final filePath = path.join(_baseDir, relativePath);
       final file = File(filePath);

      if (!await file.exists()) {
        await file.writeAsBytes(data, flush: true);
      }

      return relativePath;
    } on FileSystemException catch (e) {
      throw Exception('保存附件失败：${e.message}');
    }
  }

  Future<Uint8List> readAttachment(String relativePath) async {
    try {
      final file = File(path.join(_baseDir, relativePath));
      if (!await file.exists()) {
        throw Exception('附件不存在');
      }
      return await file.readAsBytes();
    } on FileSystemException catch (e) {
      throw Exception('读取附件失败：${e.message}');
    }
  }
}
```

## File: data/data_sources/remote_api_source.dart
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/models/model_info.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/utils/sse_parser.dart';
import 'sse_event_decoder.dart';

class RemoteApiSource{
  final Map<String, http.Client> _activeClients = {};
  final Set<String> _cancelledTasks = {};

  String _buildUrl(String baseUrl, String path) {
    final normalizedBase = baseUrl.trim().replaceAll(RegExp(r'/+$'), '');
    final normalizedPath = path.trim().replaceAll(RegExp(r'^/+'), '');
    return '$normalizedBase/$normalizedPath';
  }

  bool? _readBool(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      if (!json.containsKey(key)) continue;
      final value = json[key];
      if (value is bool) return value;
      if (value is num) return value != 0;
      if (value is String) {
        final lower = value.toLowerCase();
        if (lower == 'true' || lower == '1' || lower == 'yes') return true;
        if (lower == 'false' || lower == '0' || lower == 'no') return false;
      }
    }
    return null;
  }

  ModelInfo _parseModelInfo(Map<String, dynamic> json) {
    return ModelInfo(
      id: (json['id'] ?? '').toString(),
      name: json['name']?.toString(),
      supportsReasoning: _readBool(json, ['supportsReasoning', 'supports_reasoning']),
      supportsVision: _readBool(json, ['supportsVision', 'supports_vision', 'vision', 'supportsImageInput', 'supports_image_input']),
      overrideSupportsReasoning: _readBool(json, ['overrideSupportsReasoning', 'override_supports_reasoning']),
      overrideSupportsVision: _readBool(json, ['overrideSupportsVision', 'override_supports_vision']),
    );
    // 说明：初始拉取阶段仅保留 API 原始返回值与本地覆盖值，最终生效值由 UI/配置层按需计算
  }

  bool _isOnlySingleTextPart(ApiMessage message) {
    if (message.parts.length != 1) return false;
    return message.parts.first.maybeWhen(
      text: (_, text) => true,
      orElse: () => false,
    );
  }

  Map<String, dynamic> _buildChatCompletionAssistantMessage(ApiMessage message) {
    final result = <String, dynamic>{
      'role': 'assistant',
      'content': message.content ?? '',
    };
    if ((message.reasoning ?? '').trim().isNotEmpty) {
      result['reasoning_content'] = message.reasoning;
    }
    return result;
  }

  Map<String, dynamic> _buildChatCompletionMessage(ApiMessage message) {
    if (message.role == 'assistant') {
      return _buildChatCompletionAssistantMessage(message);
    }

    if (message.parts.isEmpty) {
      return {
        'role': message.role,
        'content': message.content ?? '',
      };
    }

    if (_isOnlySingleTextPart(message)) {
      final text = message.parts.first.maybeWhen(
        text: (_, text) => text,
        orElse: () => message.content ?? '',
      );
      return {
        'role': message.role,
        'content': text,
      };
    }

    return {
      'role': message.role,
      'content': message.parts.map((part) {
        return part.when(
          text: (type, text) => {
            'type': 'text',
            'text': text,
          },
          imageUrl: (type, imageUrl) => {
            'type': 'image_url',
            'image_url': {
              'url': imageUrl.url,
            },
          },
        );
      }).toList(),
    };
  }

  List<Map<String, dynamic>> _buildChatCompletionMessages(
    List<ApiMessage> context,
  ) {
    return context.map(_buildChatCompletionMessage).toList();
  }

  Map<String, dynamic> _buildResponsesUserLikeMessage(ApiMessage message) {
    if (message.parts.isEmpty) {
      return {
        'role': message.role,
        'content': message.content ?? '',
       };
    }

    if (_isOnlySingleTextPart(message)) {
      final text = message.parts.first.maybeWhen(
        text: (_, text) => text,
        orElse: () => message.content ?? '',
      );
      return {
        'role': message.role,
        'content': text,
      };
    }

    return {
      'role': message.role,
      'content': message.parts.map((part) {
        return part.when(
          text: (type, text) => {
            'type': 'input_text',
            'text': text,
          },
          imageUrl: (type, imageUrl) => {
            'type': 'input_image',
            'image_url': imageUrl.url,
          },
        );
      }).toList(),
    };
  }

  List<Map<String, dynamic>> _buildResponsesAssistantItems(ApiMessage message) {
    final items = <Map<String, dynamic>>[];

    if ((message.reasoning ?? '').trim().isNotEmpty) {
      items.add({
        'type': 'reasoning',
        'summary': [
          {
            'type': 'summary_text',
             'text': message.reasoning,
          }
        ],
      });
    }

    if ((message.content ?? '').trim().isNotEmpty) {
      items.add({
        'role': 'assistant',
         'content': message.content,
      });
    }

    return items;
  }

  List<Map<String, dynamic>> _buildResponsesInput(
    List<ApiMessage> context,
  ) {
    final result = <Map<String, dynamic>>[];
    for (final message in context) {
      if (message.role == 'assistant') {
        result.addAll(_buildResponsesAssistantItems(message));
      } else {
        result.add(_buildResponsesUserLikeMessage(message));
      }
    }
    return result;
  }

  Map<String, dynamic> _buildRequestBody({
    required String apiMode,
    required String model,
    required List<ApiMessage> context,
    required bool enableReasoning,
  }) {
    if (apiMode == 'responses') {
      return {
        'model': model,
        'input': _buildResponsesInput(context),
         'stream': true,
        'store': false,
        if (enableReasoning)
          'reasoning': {
            'effort': 'medium',
          },
      };
    }

    return {
      'model': model,
      'messages': _buildChatCompletionMessages(context),
      'stream': true,
      if (enableReasoning) 'reasoning_effort': 'medium',
    };
  }

  Future<List<ModelInfo>> fetchModels({
    required String baseUrl,
    required String apiKey,
    required String modelsPath,
  }) async {
    try {
      final url = Uri.parse(_buildUrl(baseUrl, modelsPath));
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('获取模型列表失败：${response.statusCode}');
      } 

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final data = json['data'] as List<dynamic>;

      return data
          .map((e) => _parseModelInfo(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('获取模型列表失败：$e');
    }
  }

  Stream<ChatChunk> chatStream({
    required String taskId,
    required Future<AppConfig> Function() loadConfig,
    required List<ApiMessage> context,
    bool enableReasoning = false,
  }) async* {
    final client = http.Client();
    _activeClients[taskId] = client;

    try {
      final config = await loadConfig();

      final baseUrl = config.baseUrl.trim();
      final apiKey = config.apiKey.trim();
      final chatPath = config.chatPath.trim();
      final apiMode = config.apiMode.trim();
      final model = config.selectedModel?.trim() ?? '';

      if (baseUrl.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'Base URL 为空');
        return;
      }
 
      if (apiKey.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'API Key 为空');
        return;
      }

      if (chatPath.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'Chat Path 为空');
        return;
      }

      if (model.isEmpty) {
        yield const ChatChunk(isDone: true, error: '未选择模型');
        return;
      }

       final url = Uri.parse(_buildUrl(baseUrl, chatPath));
      final requestBody = _buildRequestBody(
        apiMode: apiMode,
        model: model,
        context: context,
         enableReasoning: enableReasoning,
      );
      final body = jsonEncode(requestBody);

      final request = http.Request('POST', url)
        ..headers.addAll({
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
          'Accept': 'text/event-stream',
          'Cache-Control': 'no-cache',
        })
        ..body = body;

      final streamedResponse = await client.send(request);

      if (streamedResponse.statusCode  < 200 ||
          streamedResponse.statusCode  >= 300) {
        final errorBody = await streamedResponse.stream.bytesToString();
        throw Exception('流式请求失败：${streamedResponse.statusCode} $errorBody');
      }

      final parser = SseParser();
      final stream = streamedResponse.stream.transform(utf8.decoder);

      await for (final rawChunk in stream) {
        if (_cancelledTasks.contains(taskId)) {
          yield const ChatChunk(isDone: true);
          return;
        }

        final events = parser.addChunk(rawChunk);

        for (final event in events) {
          if (_cancelledTasks.contains(taskId)) {
            yield const ChatChunk(isDone: true);
            return;
           }

          try {
            final decoded = SseEventDecoder.decode(
              apiMode: apiMode,
              event: event,
            );

            if (decoded == null) continue;

            yield decoded;

            if (decoded.isDone) {
              return;
            }
          } catch (_) {
            // 单条 SSE 解析失败不让整个流中断
          } 
        }
      }

      final lastEvent = parser.close();
      if (lastEvent != null) {
        try {
          final decoded = SseEventDecoder.decode(
            apiMode: apiMode,
            event: lastEvent,
          );
          if (decoded != null) {
            yield decoded;
            if (decoded.isDone) return;
          }
        } catch (_) {
          // 忽略最后一次 flush 解码错误
        }
      }

      yield const ChatChunk(isDone: true);
    } catch (e) {
      if (_cancelledTasks.contains(taskId)) {
        yield const ChatChunk(isDone: true);
      } else {
        yield ChatChunk(isDone: true, error: '流式请求失败：$e');
      }
    } finally {
      _activeClients[taskId]?.close();
      _activeClients.remove(taskId);
      _cancelledTasks.remove(taskId);
    }
  }

  void cancelRequest(String taskId) {
    _cancelledTasks.add(taskId);
     _activeClients[taskId]?.close();
    _activeClients.remove(taskId);
  }
}
```

## File: data/data_sources/sse_event_decoder.dart
```dart
import 'dart:convert';
import '../../core/models/chat_chunk.dart';
import '../../core/models/sse_event.dart';

/// 按不同 API 协议把 SSEEvent 解释成统一的 ChatChunk
class SseEventDecoder {
  static ChatChunk? decode({
    required String apiMode,
    required SseEvent event,
  }) {
    final data = event.data.trim();
    if (data.isEmpty) return null;

    if (data == '[DONE]') {
      return const ChatChunk(isDone: true);
    }

    switch (apiMode) {
      case 'responses':
        return _decodeResponses(event);
      case 'chat_completions':
      default:
        return _decodeChatCompletions(event);
    }
  }

  static ChatChunk? _decodeChatCompletions(SseEvent event) {
    final json = jsonDecode(event.data) as Map<String, dynamic>;

    if (json['error'] != null) {
      return ChatChunk(
        isDone: true,
        error: _extractErrorMessage(json['error']),
      );
    }

    final choices = json['choices'] as List<dynamic>?;
    if (choices == null || choices.isEmpty) return null;

    final choice = choices.first as Map<String, dynamic>;
    final delta = (choice['delta'] as Map<String, dynamic>?) ??
        (choice['message'] as Map<String, dynamic>?);

    if (delta == null) return null;

    final content = delta['content'] as String?;
    final reasoning = (delta['reasoning_content'] as String?) ??
        (delta['reasoning'] as String?);

    // 某些服务会发 finish_reason 但没有内容
    final finishReason = choice['finish_reason'];
    if ((content == null || content.isEmpty) &&
        (reasoning == null || reasoning.isEmpty) &&
        finishReason != null) {
      return const ChatChunk(isDone: false);
    }

    if (content != null || reasoning != null) {
      return ChatChunk(
        content: content,
        reasoningContent: reasoning,
        isDone: false,
      );
    }

    return null;
  }

  static ChatChunk? _decodeResponses(SseEvent event) {
    final json = jsonDecode(event.data) as Map<String, dynamic>;
    final type = json['type'] as String?;

    switch (type) {
      case 'response.output_text.delta':
        final delta = json['delta'] as String?;
        if (delta == null || delta.isEmpty) return null;
        return ChatChunk(content: delta, isDone: false);

      case 'response.reasoning_summary_text.delta':
      case 'response.reasoning_text.delta':
        final delta = json['delta'] as String?;
        if (delta == null || delta.isEmpty) return null;
        return ChatChunk(reasoningContent: delta, isDone: false);

      case 'response.completed':
        return const ChatChunk(isDone: true);

      case 'response.error':
        return ChatChunk(
          isDone: true,
          error: _extractErrorMessage(json['error']),
        );

      default:
        return null;
    }
  }

  static String _extractErrorMessage(dynamic error) {
    if (error == null) return '未知错误';
    if (error is String) return error;
    if (error is Map<String, dynamic>) {
      if (error['message'] != null) return error['message'].toString();
      if (error['error'] != null) return error['error'].toString();
      return error.toString();
    }
    return error.toString();
  }
}
```

## File: data/database/database.dart
```dart
import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../core/models/app_config.dart';
import '../../core/models/session.dart';

part 'database.g.dart'; // 运行 build_runner 生成

// ==========================================
// Type Converters
// ==========================================
class AppConfigConverter extends TypeConverter<AppConfig, String> {
  const AppConfigConverter();
  @override
  AppConfig fromSql(String fromDb) => 
    AppConfig.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  @override
  String toSql(AppConfig value) => jsonEncode(value.toJson());
}

class SessionConfigConverter extends TypeConverter<SessionConfig, String> {
  const SessionConfigConverter();
  @override
  SessionConfig fromSql(String fromDb) => 
    SessionConfig.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  @override
  String toSql(SessionConfig value) => jsonEncode(value.toJson());
}

// ==========================================
// Tables
// ==========================================
class DbConfigStore extends Table {
  IntColumn get id => integer().autoIncrement()(); // 永远只有一条记录 id=1
  TextColumn get activeProfileId => text()();
}

class DbConfigProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get config => text().map(const AppConfigConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

class DbSessions extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  TextColumn get config => text().map(const SessionConfigConverter()).nullable()();
  BoolColumn get hasUnseenUpdate => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class DbChatRounds extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text().references(DbSessions, #id, onDelete: KeyAction.cascade)();
  TextColumn get parentId => text().nullable()();
  IntColumn get createdAt => integer()();
  TextColumn get userContent => text()();
  TextColumn get assistantThinking => text().nullable()();
  TextColumn get assistantContent => text().nullable()();
  BoolColumn get isIncomplete => boolean().withDefault(const Constant(false))();
  BoolColumn get hasUnseenUpdate => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class DbAttachments extends Table {
  TextColumn get id => text()();
  TextColumn get roundId => text().references(DbChatRounds, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get relativePath => text()();
  BoolColumn get isImage => boolean().withDefault(const Constant(false))();
  TextColumn get mimeType => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ==========================================
// Database
// ==========================================
@DriftDatabase(
  tables: [
    DbConfigStore,
    DbConfigProfiles,
    DbSessions,
    DbChatRounds,
    DbAttachments,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          // 开启 SQLite 外键约束，实现级联删除
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ai_chat_v1.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
```

## File: data/database/database.g.dart
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DbConfigStoreTable extends DbConfigStore
    with TableInfo<$DbConfigStoreTable, DbConfigStoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbConfigStoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _activeProfileIdMeta = const VerificationMeta(
    'activeProfileId',
  );
  @override
  late final GeneratedColumn<String> activeProfileId = GeneratedColumn<String>(
    'active_profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, activeProfileId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_config_store';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbConfigStoreData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('active_profile_id')) {
      context.handle(
        _activeProfileIdMeta,
        activeProfileId.isAcceptableOrUnknown(
          data['active_profile_id']!,
          _activeProfileIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_activeProfileIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbConfigStoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbConfigStoreData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      activeProfileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}active_profile_id'],
      )!,
    );
  }

  @override
  $DbConfigStoreTable createAlias(String alias) {
    return $DbConfigStoreTable(attachedDatabase, alias);
  }
}

class DbConfigStoreData extends DataClass
    implements Insertable<DbConfigStoreData> {
  final int id;
  final String activeProfileId;
  const DbConfigStoreData({required this.id, required this.activeProfileId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['active_profile_id'] = Variable<String>(activeProfileId);
    return map;
  }

  DbConfigStoreCompanion toCompanion(bool nullToAbsent) {
    return DbConfigStoreCompanion(
      id: Value(id),
      activeProfileId: Value(activeProfileId),
    );
  }

  factory DbConfigStoreData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbConfigStoreData(
      id: serializer.fromJson<int>(json['id']),
      activeProfileId: serializer.fromJson<String>(json['activeProfileId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activeProfileId': serializer.toJson<String>(activeProfileId),
    };
  }

  DbConfigStoreData copyWith({int? id, String? activeProfileId}) =>
      DbConfigStoreData(
        id: id ?? this.id,
        activeProfileId: activeProfileId ?? this.activeProfileId,
      );
  DbConfigStoreData copyWithCompanion(DbConfigStoreCompanion data) {
    return DbConfigStoreData(
      id: data.id.present ? data.id.value : this.id,
      activeProfileId: data.activeProfileId.present
          ? data.activeProfileId.value
          : this.activeProfileId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbConfigStoreData(')
          ..write('id: $id, ')
          ..write('activeProfileId: $activeProfileId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, activeProfileId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbConfigStoreData &&
          other.id == this.id &&
          other.activeProfileId == this.activeProfileId);
}

class DbConfigStoreCompanion extends UpdateCompanion<DbConfigStoreData> {
  final Value<int> id;
  final Value<String> activeProfileId;
  const DbConfigStoreCompanion({
    this.id = const Value.absent(),
    this.activeProfileId = const Value.absent(),
  });
  DbConfigStoreCompanion.insert({
    this.id = const Value.absent(),
    required String activeProfileId,
  }) : activeProfileId = Value(activeProfileId);
  static Insertable<DbConfigStoreData> custom({
    Expression<int>? id,
    Expression<String>? activeProfileId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activeProfileId != null) 'active_profile_id': activeProfileId,
    });
  }

  DbConfigStoreCompanion copyWith({
    Value<int>? id,
    Value<String>? activeProfileId,
  }) {
    return DbConfigStoreCompanion(
      id: id ?? this.id,
      activeProfileId: activeProfileId ?? this.activeProfileId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activeProfileId.present) {
      map['active_profile_id'] = Variable<String>(activeProfileId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbConfigStoreCompanion(')
          ..write('id: $id, ')
          ..write('activeProfileId: $activeProfileId')
          ..write(')'))
        .toString();
  }
}

class $DbConfigProfilesTable extends DbConfigProfiles
    with TableInfo<$DbConfigProfilesTable, DbConfigProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbConfigProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AppConfig, String> config =
      GeneratedColumn<String>(
        'config',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AppConfig>($DbConfigProfilesTable.$converterconfig);
  @override
  List<GeneratedColumn> get $columns => [id, name, config];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_config_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbConfigProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbConfigProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbConfigProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      config: $DbConfigProfilesTable.$converterconfig.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}config'],
        )!,
      ),
    );
  }

  @override
  $DbConfigProfilesTable createAlias(String alias) {
    return $DbConfigProfilesTable(attachedDatabase, alias);
  }

  static TypeConverter<AppConfig, String> $converterconfig =
      const AppConfigConverter();
}

class DbConfigProfile extends DataClass implements Insertable<DbConfigProfile> {
  final String id;
  final String name;
  final AppConfig config;
  const DbConfigProfile({
    required this.id,
    required this.name,
    required this.config,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    {
      map['config'] = Variable<String>(
        $DbConfigProfilesTable.$converterconfig.toSql(config),
      );
    }
    return map;
  }

  DbConfigProfilesCompanion toCompanion(bool nullToAbsent) {
    return DbConfigProfilesCompanion(
      id: Value(id),
      name: Value(name),
      config: Value(config),
    );
  }

  factory DbConfigProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbConfigProfile(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      config: serializer.fromJson<AppConfig>(json['config']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'config': serializer.toJson<AppConfig>(config),
    };
  }

  DbConfigProfile copyWith({String? id, String? name, AppConfig? config}) =>
      DbConfigProfile(
        id: id ?? this.id,
        name: name ?? this.name,
        config: config ?? this.config,
      );
  DbConfigProfile copyWithCompanion(DbConfigProfilesCompanion data) {
    return DbConfigProfile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      config: data.config.present ? data.config.value : this.config,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbConfigProfile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('config: $config')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, config);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbConfigProfile &&
          other.id == this.id &&
          other.name == this.name &&
          other.config == this.config);
}

class DbConfigProfilesCompanion extends UpdateCompanion<DbConfigProfile> {
  final Value<String> id;
  final Value<String> name;
  final Value<AppConfig> config;
  final Value<int> rowid;
  const DbConfigProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.config = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbConfigProfilesCompanion.insert({
    required String id,
    required String name,
    required AppConfig config,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       config = Value(config);
  static Insertable<DbConfigProfile> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? config,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (config != null) 'config': config,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbConfigProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<AppConfig>? config,
    Value<int>? rowid,
  }) {
    return DbConfigProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      config: config ?? this.config,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (config.present) {
      map['config'] = Variable<String>(
        $DbConfigProfilesTable.$converterconfig.toSql(config.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbConfigProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('config: $config, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbSessionsTable extends DbSessions
    with TableInfo<$DbSessionsTable, DbSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SessionConfig?, String> config =
      GeneratedColumn<String>(
        'config',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<SessionConfig?>($DbSessionsTable.$converterconfign);
  static const VerificationMeta _hasUnseenUpdateMeta = const VerificationMeta(
    'hasUnseenUpdate',
  );
  @override
  late final GeneratedColumn<bool> hasUnseenUpdate = GeneratedColumn<bool>(
    'has_unseen_update',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_unseen_update" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    createdAt,
    updatedAt,
    config,
    hasUnseenUpdate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('has_unseen_update')) {
      context.handle(
        _hasUnseenUpdateMeta,
        hasUnseenUpdate.isAcceptableOrUnknown(
          data['has_unseen_update']!,
          _hasUnseenUpdateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      config: $DbSessionsTable.$converterconfign.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}config'],
        ),
      ),
      hasUnseenUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_unseen_update'],
      )!,
    );
  }

  @override
  $DbSessionsTable createAlias(String alias) {
    return $DbSessionsTable(attachedDatabase, alias);
  }

  static TypeConverter<SessionConfig, String> $converterconfig =
      const SessionConfigConverter();
  static TypeConverter<SessionConfig?, String?> $converterconfign =
      NullAwareTypeConverter.wrap($converterconfig);
}

class DbSession extends DataClass implements Insertable<DbSession> {
  final String id;
  final String title;
  final int createdAt;
  final int updatedAt;
  final SessionConfig? config;
  final bool hasUnseenUpdate;
  const DbSession({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    this.config,
    required this.hasUnseenUpdate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || config != null) {
      map['config'] = Variable<String>(
        $DbSessionsTable.$converterconfign.toSql(config),
      );
    }
    map['has_unseen_update'] = Variable<bool>(hasUnseenUpdate);
    return map;
  }

  DbSessionsCompanion toCompanion(bool nullToAbsent) {
    return DbSessionsCompanion(
      id: Value(id),
      title: Value(title),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      config: config == null && nullToAbsent
          ? const Value.absent()
          : Value(config),
      hasUnseenUpdate: Value(hasUnseenUpdate),
    );
  }

  factory DbSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSession(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      config: serializer.fromJson<SessionConfig?>(json['config']),
      hasUnseenUpdate: serializer.fromJson<bool>(json['hasUnseenUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'config': serializer.toJson<SessionConfig?>(config),
      'hasUnseenUpdate': serializer.toJson<bool>(hasUnseenUpdate),
    };
  }

  DbSession copyWith({
    String? id,
    String? title,
    int? createdAt,
    int? updatedAt,
    Value<SessionConfig?> config = const Value.absent(),
    bool? hasUnseenUpdate,
  }) => DbSession(
    id: id ?? this.id,
    title: title ?? this.title,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    config: config.present ? config.value : this.config,
    hasUnseenUpdate: hasUnseenUpdate ?? this.hasUnseenUpdate,
  );
  DbSession copyWithCompanion(DbSessionsCompanion data) {
    return DbSession(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      config: data.config.present ? data.config.value : this.config,
      hasUnseenUpdate: data.hasUnseenUpdate.present
          ? data.hasUnseenUpdate.value
          : this.hasUnseenUpdate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSession(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('config: $config, ')
          ..write('hasUnseenUpdate: $hasUnseenUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, createdAt, updatedAt, config, hasUnseenUpdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSession &&
          other.id == this.id &&
          other.title == this.title &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.config == this.config &&
          other.hasUnseenUpdate == this.hasUnseenUpdate);
}

class DbSessionsCompanion extends UpdateCompanion<DbSession> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<SessionConfig?> config;
  final Value<bool> hasUnseenUpdate;
  final Value<int> rowid;
  const DbSessionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.config = const Value.absent(),
    this.hasUnseenUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbSessionsCompanion.insert({
    required String id,
    required String title,
    required int createdAt,
    required int updatedAt,
    this.config = const Value.absent(),
    this.hasUnseenUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DbSession> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? config,
    Expression<bool>? hasUnseenUpdate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (config != null) 'config': config,
      if (hasUnseenUpdate != null) 'has_unseen_update': hasUnseenUpdate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbSessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<SessionConfig?>? config,
    Value<bool>? hasUnseenUpdate,
    Value<int>? rowid,
  }) {
    return DbSessionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      config: config ?? this.config,
      hasUnseenUpdate: hasUnseenUpdate ?? this.hasUnseenUpdate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (config.present) {
      map['config'] = Variable<String>(
        $DbSessionsTable.$converterconfign.toSql(config.value),
      );
    }
    if (hasUnseenUpdate.present) {
      map['has_unseen_update'] = Variable<bool>(hasUnseenUpdate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbSessionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('config: $config, ')
          ..write('hasUnseenUpdate: $hasUnseenUpdate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbChatRoundsTable extends DbChatRounds
    with TableInfo<$DbChatRoundsTable, DbChatRound> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbChatRoundsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_sessions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userContentMeta = const VerificationMeta(
    'userContent',
  );
  @override
  late final GeneratedColumn<String> userContent = GeneratedColumn<String>(
    'user_content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assistantThinkingMeta = const VerificationMeta(
    'assistantThinking',
  );
  @override
  late final GeneratedColumn<String> assistantThinking =
      GeneratedColumn<String>(
        'assistant_thinking',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _assistantContentMeta = const VerificationMeta(
    'assistantContent',
  );
  @override
  late final GeneratedColumn<String> assistantContent = GeneratedColumn<String>(
    'assistant_content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isIncompleteMeta = const VerificationMeta(
    'isIncomplete',
  );
  @override
  late final GeneratedColumn<bool> isIncomplete = GeneratedColumn<bool>(
    'is_incomplete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_incomplete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hasUnseenUpdateMeta = const VerificationMeta(
    'hasUnseenUpdate',
  );
  @override
  late final GeneratedColumn<bool> hasUnseenUpdate = GeneratedColumn<bool>(
    'has_unseen_update',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_unseen_update" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    parentId,
    createdAt,
    userContent,
    assistantThinking,
    assistantContent,
    isIncomplete,
    hasUnseenUpdate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_chat_rounds';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbChatRound> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('user_content')) {
      context.handle(
        _userContentMeta,
        userContent.isAcceptableOrUnknown(
          data['user_content']!,
          _userContentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userContentMeta);
    }
    if (data.containsKey('assistant_thinking')) {
      context.handle(
        _assistantThinkingMeta,
        assistantThinking.isAcceptableOrUnknown(
          data['assistant_thinking']!,
          _assistantThinkingMeta,
        ),
      );
    }
    if (data.containsKey('assistant_content')) {
      context.handle(
        _assistantContentMeta,
        assistantContent.isAcceptableOrUnknown(
          data['assistant_content']!,
          _assistantContentMeta,
        ),
      );
    }
    if (data.containsKey('is_incomplete')) {
      context.handle(
        _isIncompleteMeta,
        isIncomplete.isAcceptableOrUnknown(
          data['is_incomplete']!,
          _isIncompleteMeta,
        ),
      );
    }
    if (data.containsKey('has_unseen_update')) {
      context.handle(
        _hasUnseenUpdateMeta,
        hasUnseenUpdate.isAcceptableOrUnknown(
          data['has_unseen_update']!,
          _hasUnseenUpdateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbChatRound map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbChatRound(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      userContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_content'],
      )!,
      assistantThinking: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assistant_thinking'],
      ),
      assistantContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assistant_content'],
      ),
      isIncomplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_incomplete'],
      )!,
      hasUnseenUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_unseen_update'],
      )!,
    );
  }

  @override
  $DbChatRoundsTable createAlias(String alias) {
    return $DbChatRoundsTable(attachedDatabase, alias);
  }
}

class DbChatRound extends DataClass implements Insertable<DbChatRound> {
  final String id;
  final String sessionId;
  final String? parentId;
  final int createdAt;
  final String userContent;
  final String? assistantThinking;
  final String? assistantContent;
  final bool isIncomplete;
  final bool hasUnseenUpdate;
  const DbChatRound({
    required this.id,
    required this.sessionId,
    this.parentId,
    required this.createdAt,
    required this.userContent,
    this.assistantThinking,
    this.assistantContent,
    required this.isIncomplete,
    required this.hasUnseenUpdate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['user_content'] = Variable<String>(userContent);
    if (!nullToAbsent || assistantThinking != null) {
      map['assistant_thinking'] = Variable<String>(assistantThinking);
    }
    if (!nullToAbsent || assistantContent != null) {
      map['assistant_content'] = Variable<String>(assistantContent);
    }
    map['is_incomplete'] = Variable<bool>(isIncomplete);
    map['has_unseen_update'] = Variable<bool>(hasUnseenUpdate);
    return map;
  }

  DbChatRoundsCompanion toCompanion(bool nullToAbsent) {
    return DbChatRoundsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      createdAt: Value(createdAt),
      userContent: Value(userContent),
      assistantThinking: assistantThinking == null && nullToAbsent
          ? const Value.absent()
          : Value(assistantThinking),
      assistantContent: assistantContent == null && nullToAbsent
          ? const Value.absent()
          : Value(assistantContent),
      isIncomplete: Value(isIncomplete),
      hasUnseenUpdate: Value(hasUnseenUpdate),
    );
  }

  factory DbChatRound.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbChatRound(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      userContent: serializer.fromJson<String>(json['userContent']),
      assistantThinking: serializer.fromJson<String?>(
        json['assistantThinking'],
      ),
      assistantContent: serializer.fromJson<String?>(json['assistantContent']),
      isIncomplete: serializer.fromJson<bool>(json['isIncomplete']),
      hasUnseenUpdate: serializer.fromJson<bool>(json['hasUnseenUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'parentId': serializer.toJson<String?>(parentId),
      'createdAt': serializer.toJson<int>(createdAt),
      'userContent': serializer.toJson<String>(userContent),
      'assistantThinking': serializer.toJson<String?>(assistantThinking),
      'assistantContent': serializer.toJson<String?>(assistantContent),
      'isIncomplete': serializer.toJson<bool>(isIncomplete),
      'hasUnseenUpdate': serializer.toJson<bool>(hasUnseenUpdate),
    };
  }

  DbChatRound copyWith({
    String? id,
    String? sessionId,
    Value<String?> parentId = const Value.absent(),
    int? createdAt,
    String? userContent,
    Value<String?> assistantThinking = const Value.absent(),
    Value<String?> assistantContent = const Value.absent(),
    bool? isIncomplete,
    bool? hasUnseenUpdate,
  }) => DbChatRound(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    parentId: parentId.present ? parentId.value : this.parentId,
    createdAt: createdAt ?? this.createdAt,
    userContent: userContent ?? this.userContent,
    assistantThinking: assistantThinking.present
        ? assistantThinking.value
        : this.assistantThinking,
    assistantContent: assistantContent.present
        ? assistantContent.value
        : this.assistantContent,
    isIncomplete: isIncomplete ?? this.isIncomplete,
    hasUnseenUpdate: hasUnseenUpdate ?? this.hasUnseenUpdate,
  );
  DbChatRound copyWithCompanion(DbChatRoundsCompanion data) {
    return DbChatRound(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      userContent: data.userContent.present
          ? data.userContent.value
          : this.userContent,
      assistantThinking: data.assistantThinking.present
          ? data.assistantThinking.value
          : this.assistantThinking,
      assistantContent: data.assistantContent.present
          ? data.assistantContent.value
          : this.assistantContent,
      isIncomplete: data.isIncomplete.present
          ? data.isIncomplete.value
          : this.isIncomplete,
      hasUnseenUpdate: data.hasUnseenUpdate.present
          ? data.hasUnseenUpdate.value
          : this.hasUnseenUpdate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbChatRound(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('userContent: $userContent, ')
          ..write('assistantThinking: $assistantThinking, ')
          ..write('assistantContent: $assistantContent, ')
          ..write('isIncomplete: $isIncomplete, ')
          ..write('hasUnseenUpdate: $hasUnseenUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    parentId,
    createdAt,
    userContent,
    assistantThinking,
    assistantContent,
    isIncomplete,
    hasUnseenUpdate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbChatRound &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.parentId == this.parentId &&
          other.createdAt == this.createdAt &&
          other.userContent == this.userContent &&
          other.assistantThinking == this.assistantThinking &&
          other.assistantContent == this.assistantContent &&
          other.isIncomplete == this.isIncomplete &&
          other.hasUnseenUpdate == this.hasUnseenUpdate);
}

class DbChatRoundsCompanion extends UpdateCompanion<DbChatRound> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String?> parentId;
  final Value<int> createdAt;
  final Value<String> userContent;
  final Value<String?> assistantThinking;
  final Value<String?> assistantContent;
  final Value<bool> isIncomplete;
  final Value<bool> hasUnseenUpdate;
  final Value<int> rowid;
  const DbChatRoundsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.userContent = const Value.absent(),
    this.assistantThinking = const Value.absent(),
    this.assistantContent = const Value.absent(),
    this.isIncomplete = const Value.absent(),
    this.hasUnseenUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbChatRoundsCompanion.insert({
    required String id,
    required String sessionId,
    this.parentId = const Value.absent(),
    required int createdAt,
    required String userContent,
    this.assistantThinking = const Value.absent(),
    this.assistantContent = const Value.absent(),
    this.isIncomplete = const Value.absent(),
    this.hasUnseenUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       createdAt = Value(createdAt),
       userContent = Value(userContent);
  static Insertable<DbChatRound> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? parentId,
    Expression<int>? createdAt,
    Expression<String>? userContent,
    Expression<String>? assistantThinking,
    Expression<String>? assistantContent,
    Expression<bool>? isIncomplete,
    Expression<bool>? hasUnseenUpdate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (parentId != null) 'parent_id': parentId,
      if (createdAt != null) 'created_at': createdAt,
      if (userContent != null) 'user_content': userContent,
      if (assistantThinking != null) 'assistant_thinking': assistantThinking,
      if (assistantContent != null) 'assistant_content': assistantContent,
      if (isIncomplete != null) 'is_incomplete': isIncomplete,
      if (hasUnseenUpdate != null) 'has_unseen_update': hasUnseenUpdate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbChatRoundsCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String?>? parentId,
    Value<int>? createdAt,
    Value<String>? userContent,
    Value<String?>? assistantThinking,
    Value<String?>? assistantContent,
    Value<bool>? isIncomplete,
    Value<bool>? hasUnseenUpdate,
    Value<int>? rowid,
  }) {
    return DbChatRoundsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      parentId: parentId ?? this.parentId,
      createdAt: createdAt ?? this.createdAt,
      userContent: userContent ?? this.userContent,
      assistantThinking: assistantThinking ?? this.assistantThinking,
      assistantContent: assistantContent ?? this.assistantContent,
      isIncomplete: isIncomplete ?? this.isIncomplete,
      hasUnseenUpdate: hasUnseenUpdate ?? this.hasUnseenUpdate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (userContent.present) {
      map['user_content'] = Variable<String>(userContent.value);
    }
    if (assistantThinking.present) {
      map['assistant_thinking'] = Variable<String>(assistantThinking.value);
    }
    if (assistantContent.present) {
      map['assistant_content'] = Variable<String>(assistantContent.value);
    }
    if (isIncomplete.present) {
      map['is_incomplete'] = Variable<bool>(isIncomplete.value);
    }
    if (hasUnseenUpdate.present) {
      map['has_unseen_update'] = Variable<bool>(hasUnseenUpdate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbChatRoundsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('userContent: $userContent, ')
          ..write('assistantThinking: $assistantThinking, ')
          ..write('assistantContent: $assistantContent, ')
          ..write('isIncomplete: $isIncomplete, ')
          ..write('hasUnseenUpdate: $hasUnseenUpdate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbAttachmentsTable extends DbAttachments
    with TableInfo<$DbAttachmentsTable, DbAttachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbAttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roundIdMeta = const VerificationMeta(
    'roundId',
  );
  @override
  late final GeneratedColumn<String> roundId = GeneratedColumn<String>(
    'round_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_chat_rounds (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relativePathMeta = const VerificationMeta(
    'relativePath',
  );
  @override
  late final GeneratedColumn<String> relativePath = GeneratedColumn<String>(
    'relative_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isImageMeta = const VerificationMeta(
    'isImage',
  );
  @override
  late final GeneratedColumn<bool> isImage = GeneratedColumn<bool>(
    'is_image',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_image" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roundId,
    name,
    relativePath,
    isImage,
    mimeType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbAttachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('round_id')) {
      context.handle(
        _roundIdMeta,
        roundId.isAcceptableOrUnknown(data['round_id']!, _roundIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roundIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('relative_path')) {
      context.handle(
        _relativePathMeta,
        relativePath.isAcceptableOrUnknown(
          data['relative_path']!,
          _relativePathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relativePathMeta);
    }
    if (data.containsKey('is_image')) {
      context.handle(
        _isImageMeta,
        isImage.isAcceptableOrUnknown(data['is_image']!, _isImageMeta),
      );
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAttachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbAttachment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roundId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}round_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      relativePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relative_path'],
      )!,
      isImage: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_image'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      ),
    );
  }

  @override
  $DbAttachmentsTable createAlias(String alias) {
    return $DbAttachmentsTable(attachedDatabase, alias);
  }
}

class DbAttachment extends DataClass implements Insertable<DbAttachment> {
  final String id;
  final String roundId;
  final String name;
  final String relativePath;
  final bool isImage;
  final String? mimeType;
  const DbAttachment({
    required this.id,
    required this.roundId,
    required this.name,
    required this.relativePath,
    required this.isImage,
    this.mimeType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['round_id'] = Variable<String>(roundId);
    map['name'] = Variable<String>(name);
    map['relative_path'] = Variable<String>(relativePath);
    map['is_image'] = Variable<bool>(isImage);
    if (!nullToAbsent || mimeType != null) {
      map['mime_type'] = Variable<String>(mimeType);
    }
    return map;
  }

  DbAttachmentsCompanion toCompanion(bool nullToAbsent) {
    return DbAttachmentsCompanion(
      id: Value(id),
      roundId: Value(roundId),
      name: Value(name),
      relativePath: Value(relativePath),
      isImage: Value(isImage),
      mimeType: mimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(mimeType),
    );
  }

  factory DbAttachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbAttachment(
      id: serializer.fromJson<String>(json['id']),
      roundId: serializer.fromJson<String>(json['roundId']),
      name: serializer.fromJson<String>(json['name']),
      relativePath: serializer.fromJson<String>(json['relativePath']),
      isImage: serializer.fromJson<bool>(json['isImage']),
      mimeType: serializer.fromJson<String?>(json['mimeType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roundId': serializer.toJson<String>(roundId),
      'name': serializer.toJson<String>(name),
      'relativePath': serializer.toJson<String>(relativePath),
      'isImage': serializer.toJson<bool>(isImage),
      'mimeType': serializer.toJson<String?>(mimeType),
    };
  }

  DbAttachment copyWith({
    String? id,
    String? roundId,
    String? name,
    String? relativePath,
    bool? isImage,
    Value<String?> mimeType = const Value.absent(),
  }) => DbAttachment(
    id: id ?? this.id,
    roundId: roundId ?? this.roundId,
    name: name ?? this.name,
    relativePath: relativePath ?? this.relativePath,
    isImage: isImage ?? this.isImage,
    mimeType: mimeType.present ? mimeType.value : this.mimeType,
  );
  DbAttachment copyWithCompanion(DbAttachmentsCompanion data) {
    return DbAttachment(
      id: data.id.present ? data.id.value : this.id,
      roundId: data.roundId.present ? data.roundId.value : this.roundId,
      name: data.name.present ? data.name.value : this.name,
      relativePath: data.relativePath.present
          ? data.relativePath.value
          : this.relativePath,
      isImage: data.isImage.present ? data.isImage.value : this.isImage,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbAttachment(')
          ..write('id: $id, ')
          ..write('roundId: $roundId, ')
          ..write('name: $name, ')
          ..write('relativePath: $relativePath, ')
          ..write('isImage: $isImage, ')
          ..write('mimeType: $mimeType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, roundId, name, relativePath, isImage, mimeType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAttachment &&
          other.id == this.id &&
          other.roundId == this.roundId &&
          other.name == this.name &&
          other.relativePath == this.relativePath &&
          other.isImage == this.isImage &&
          other.mimeType == this.mimeType);
}

class DbAttachmentsCompanion extends UpdateCompanion<DbAttachment> {
  final Value<String> id;
  final Value<String> roundId;
  final Value<String> name;
  final Value<String> relativePath;
  final Value<bool> isImage;
  final Value<String?> mimeType;
  final Value<int> rowid;
  const DbAttachmentsCompanion({
    this.id = const Value.absent(),
    this.roundId = const Value.absent(),
    this.name = const Value.absent(),
    this.relativePath = const Value.absent(),
    this.isImage = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbAttachmentsCompanion.insert({
    required String id,
    required String roundId,
    required String name,
    required String relativePath,
    this.isImage = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       roundId = Value(roundId),
       name = Value(name),
       relativePath = Value(relativePath);
  static Insertable<DbAttachment> custom({
    Expression<String>? id,
    Expression<String>? roundId,
    Expression<String>? name,
    Expression<String>? relativePath,
    Expression<bool>? isImage,
    Expression<String>? mimeType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roundId != null) 'round_id': roundId,
      if (name != null) 'name': name,
      if (relativePath != null) 'relative_path': relativePath,
      if (isImage != null) 'is_image': isImage,
      if (mimeType != null) 'mime_type': mimeType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbAttachmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? roundId,
    Value<String>? name,
    Value<String>? relativePath,
    Value<bool>? isImage,
    Value<String?>? mimeType,
    Value<int>? rowid,
  }) {
    return DbAttachmentsCompanion(
      id: id ?? this.id,
      roundId: roundId ?? this.roundId,
      name: name ?? this.name,
      relativePath: relativePath ?? this.relativePath,
      isImage: isImage ?? this.isImage,
      mimeType: mimeType ?? this.mimeType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roundId.present) {
      map['round_id'] = Variable<String>(roundId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (relativePath.present) {
      map['relative_path'] = Variable<String>(relativePath.value);
    }
    if (isImage.present) {
      map['is_image'] = Variable<bool>(isImage.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbAttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('roundId: $roundId, ')
          ..write('name: $name, ')
          ..write('relativePath: $relativePath, ')
          ..write('isImage: $isImage, ')
          ..write('mimeType: $mimeType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DbConfigStoreTable dbConfigStore = $DbConfigStoreTable(this);
  late final $DbConfigProfilesTable dbConfigProfiles = $DbConfigProfilesTable(
    this,
  );
  late final $DbSessionsTable dbSessions = $DbSessionsTable(this);
  late final $DbChatRoundsTable dbChatRounds = $DbChatRoundsTable(this);
  late final $DbAttachmentsTable dbAttachments = $DbAttachmentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dbConfigStore,
    dbConfigProfiles,
    dbSessions,
    dbChatRounds,
    dbAttachments,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'db_sessions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('db_chat_rounds', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'db_chat_rounds',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('db_attachments', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$DbConfigStoreTableCreateCompanionBuilder =
    DbConfigStoreCompanion Function({
      Value<int> id,
      required String activeProfileId,
    });
typedef $$DbConfigStoreTableUpdateCompanionBuilder =
    DbConfigStoreCompanion Function({
      Value<int> id,
      Value<String> activeProfileId,
    });

class $$DbConfigStoreTableFilterComposer
    extends Composer<_$AppDatabase, $DbConfigStoreTable> {
  $$DbConfigStoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activeProfileId => $composableBuilder(
    column: $table.activeProfileId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DbConfigStoreTableOrderingComposer
    extends Composer<_$AppDatabase, $DbConfigStoreTable> {
  $$DbConfigStoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activeProfileId => $composableBuilder(
    column: $table.activeProfileId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbConfigStoreTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbConfigStoreTable> {
  $$DbConfigStoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get activeProfileId => $composableBuilder(
    column: $table.activeProfileId,
    builder: (column) => column,
  );
}

class $$DbConfigStoreTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbConfigStoreTable,
          DbConfigStoreData,
          $$DbConfigStoreTableFilterComposer,
          $$DbConfigStoreTableOrderingComposer,
          $$DbConfigStoreTableAnnotationComposer,
          $$DbConfigStoreTableCreateCompanionBuilder,
          $$DbConfigStoreTableUpdateCompanionBuilder,
          (
            DbConfigStoreData,
            BaseReferences<
              _$AppDatabase,
              $DbConfigStoreTable,
              DbConfigStoreData
            >,
          ),
          DbConfigStoreData,
          PrefetchHooks Function()
        > {
  $$DbConfigStoreTableTableManager(_$AppDatabase db, $DbConfigStoreTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbConfigStoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbConfigStoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbConfigStoreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> activeProfileId = const Value.absent(),
              }) => DbConfigStoreCompanion(
                id: id,
                activeProfileId: activeProfileId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String activeProfileId,
              }) => DbConfigStoreCompanion.insert(
                id: id,
                activeProfileId: activeProfileId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DbConfigStoreTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbConfigStoreTable,
      DbConfigStoreData,
      $$DbConfigStoreTableFilterComposer,
      $$DbConfigStoreTableOrderingComposer,
      $$DbConfigStoreTableAnnotationComposer,
      $$DbConfigStoreTableCreateCompanionBuilder,
      $$DbConfigStoreTableUpdateCompanionBuilder,
      (
        DbConfigStoreData,
        BaseReferences<_$AppDatabase, $DbConfigStoreTable, DbConfigStoreData>,
      ),
      DbConfigStoreData,
      PrefetchHooks Function()
    >;
typedef $$DbConfigProfilesTableCreateCompanionBuilder =
    DbConfigProfilesCompanion Function({
      required String id,
      required String name,
      required AppConfig config,
      Value<int> rowid,
    });
typedef $$DbConfigProfilesTableUpdateCompanionBuilder =
    DbConfigProfilesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<AppConfig> config,
      Value<int> rowid,
    });

class $$DbConfigProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $DbConfigProfilesTable> {
  $$DbConfigProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AppConfig, AppConfig, String> get config =>
      $composableBuilder(
        column: $table.config,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$DbConfigProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $DbConfigProfilesTable> {
  $$DbConfigProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbConfigProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbConfigProfilesTable> {
  $$DbConfigProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AppConfig, String> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);
}

class $$DbConfigProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbConfigProfilesTable,
          DbConfigProfile,
          $$DbConfigProfilesTableFilterComposer,
          $$DbConfigProfilesTableOrderingComposer,
          $$DbConfigProfilesTableAnnotationComposer,
          $$DbConfigProfilesTableCreateCompanionBuilder,
          $$DbConfigProfilesTableUpdateCompanionBuilder,
          (
            DbConfigProfile,
            BaseReferences<
              _$AppDatabase,
              $DbConfigProfilesTable,
              DbConfigProfile
            >,
          ),
          DbConfigProfile,
          PrefetchHooks Function()
        > {
  $$DbConfigProfilesTableTableManager(
    _$AppDatabase db,
    $DbConfigProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbConfigProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbConfigProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbConfigProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<AppConfig> config = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbConfigProfilesCompanion(
                id: id,
                name: name,
                config: config,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required AppConfig config,
                Value<int> rowid = const Value.absent(),
              }) => DbConfigProfilesCompanion.insert(
                id: id,
                name: name,
                config: config,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DbConfigProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbConfigProfilesTable,
      DbConfigProfile,
      $$DbConfigProfilesTableFilterComposer,
      $$DbConfigProfilesTableOrderingComposer,
      $$DbConfigProfilesTableAnnotationComposer,
      $$DbConfigProfilesTableCreateCompanionBuilder,
      $$DbConfigProfilesTableUpdateCompanionBuilder,
      (
        DbConfigProfile,
        BaseReferences<_$AppDatabase, $DbConfigProfilesTable, DbConfigProfile>,
      ),
      DbConfigProfile,
      PrefetchHooks Function()
    >;
typedef $$DbSessionsTableCreateCompanionBuilder =
    DbSessionsCompanion Function({
      required String id,
      required String title,
      required int createdAt,
      required int updatedAt,
      Value<SessionConfig?> config,
      Value<bool> hasUnseenUpdate,
      Value<int> rowid,
    });
typedef $$DbSessionsTableUpdateCompanionBuilder =
    DbSessionsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<SessionConfig?> config,
      Value<bool> hasUnseenUpdate,
      Value<int> rowid,
    });

final class $$DbSessionsTableReferences
    extends BaseReferences<_$AppDatabase, $DbSessionsTable, DbSession> {
  $$DbSessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbChatRoundsTable, List<DbChatRound>>
  _dbChatRoundsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbChatRounds,
    aliasName: $_aliasNameGenerator(
      db.dbSessions.id,
      db.dbChatRounds.sessionId,
    ),
  );

  $$DbChatRoundsTableProcessedTableManager get dbChatRoundsRefs {
    final manager = $$DbChatRoundsTableTableManager(
      $_db,
      $_db.dbChatRounds,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbChatRoundsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $DbSessionsTable> {
  $$DbSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SessionConfig?, SessionConfig, String>
  get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dbChatRoundsRefs(
    Expression<bool> Function($$DbChatRoundsTableFilterComposer f) f,
  ) {
    final $$DbChatRoundsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbChatRounds,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChatRoundsTableFilterComposer(
            $db: $db,
            $table: $db.dbChatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbSessionsTable> {
  $$DbSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbSessionsTable> {
  $$DbSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SessionConfig?, String> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);

  GeneratedColumn<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => column,
  );

  Expression<T> dbChatRoundsRefs<T extends Object>(
    Expression<T> Function($$DbChatRoundsTableAnnotationComposer a) f,
  ) {
    final $$DbChatRoundsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbChatRounds,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChatRoundsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbChatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbSessionsTable,
          DbSession,
          $$DbSessionsTableFilterComposer,
          $$DbSessionsTableOrderingComposer,
          $$DbSessionsTableAnnotationComposer,
          $$DbSessionsTableCreateCompanionBuilder,
          $$DbSessionsTableUpdateCompanionBuilder,
          (DbSession, $$DbSessionsTableReferences),
          DbSession,
          PrefetchHooks Function({bool dbChatRoundsRefs})
        > {
  $$DbSessionsTableTableManager(_$AppDatabase db, $DbSessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<SessionConfig?> config = const Value.absent(),
                Value<bool> hasUnseenUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSessionsCompanion(
                id: id,
                title: title,
                createdAt: createdAt,
                updatedAt: updatedAt,
                config: config,
                hasUnseenUpdate: hasUnseenUpdate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required int createdAt,
                required int updatedAt,
                Value<SessionConfig?> config = const Value.absent(),
                Value<bool> hasUnseenUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSessionsCompanion.insert(
                id: id,
                title: title,
                createdAt: createdAt,
                updatedAt: updatedAt,
                config: config,
                hasUnseenUpdate: hasUnseenUpdate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dbChatRoundsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (dbChatRoundsRefs) db.dbChatRounds],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dbChatRoundsRefs)
                    await $_getPrefetchedData<
                      DbSession,
                      $DbSessionsTable,
                      DbChatRound
                    >(
                      currentTable: table,
                      referencedTable: $$DbSessionsTableReferences
                          ._dbChatRoundsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DbSessionsTableReferences(
                            db,
                            table,
                            p0,
                          ).dbChatRoundsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sessionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DbSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbSessionsTable,
      DbSession,
      $$DbSessionsTableFilterComposer,
      $$DbSessionsTableOrderingComposer,
      $$DbSessionsTableAnnotationComposer,
      $$DbSessionsTableCreateCompanionBuilder,
      $$DbSessionsTableUpdateCompanionBuilder,
      (DbSession, $$DbSessionsTableReferences),
      DbSession,
      PrefetchHooks Function({bool dbChatRoundsRefs})
    >;
typedef $$DbChatRoundsTableCreateCompanionBuilder =
    DbChatRoundsCompanion Function({
      required String id,
      required String sessionId,
      Value<String?> parentId,
      required int createdAt,
      required String userContent,
      Value<String?> assistantThinking,
      Value<String?> assistantContent,
      Value<bool> isIncomplete,
      Value<bool> hasUnseenUpdate,
      Value<int> rowid,
    });
typedef $$DbChatRoundsTableUpdateCompanionBuilder =
    DbChatRoundsCompanion Function({
      Value<String> id,
      Value<String> sessionId,
      Value<String?> parentId,
      Value<int> createdAt,
      Value<String> userContent,
      Value<String?> assistantThinking,
      Value<String?> assistantContent,
      Value<bool> isIncomplete,
      Value<bool> hasUnseenUpdate,
      Value<int> rowid,
    });

final class $$DbChatRoundsTableReferences
    extends BaseReferences<_$AppDatabase, $DbChatRoundsTable, DbChatRound> {
  $$DbChatRoundsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbSessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.dbSessions.createAlias(
        $_aliasNameGenerator(db.dbChatRounds.sessionId, db.dbSessions.id),
      );

  $$DbSessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $$DbSessionsTableTableManager(
      $_db,
      $_db.dbSessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DbAttachmentsTable, List<DbAttachment>>
  _dbAttachmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbAttachments,
    aliasName: $_aliasNameGenerator(
      db.dbChatRounds.id,
      db.dbAttachments.roundId,
    ),
  );

  $$DbAttachmentsTableProcessedTableManager get dbAttachmentsRefs {
    final manager = $$DbAttachmentsTableTableManager(
      $_db,
      $_db.dbAttachments,
    ).filter((f) => f.roundId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbAttachmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbChatRoundsTableFilterComposer
    extends Composer<_$AppDatabase, $DbChatRoundsTable> {
  $$DbChatRoundsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userContent => $composableBuilder(
    column: $table.userContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assistantThinking => $composableBuilder(
    column: $table.assistantThinking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assistantContent => $composableBuilder(
    column: $table.assistantContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isIncomplete => $composableBuilder(
    column: $table.isIncomplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => ColumnFilters(column),
  );

  $$DbSessionsTableFilterComposer get sessionId {
    final $$DbSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.dbSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSessionsTableFilterComposer(
            $db: $db,
            $table: $db.dbSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dbAttachmentsRefs(
    Expression<bool> Function($$DbAttachmentsTableFilterComposer f) f,
  ) {
    final $$DbAttachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbAttachments,
      getReferencedColumn: (t) => t.roundId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAttachmentsTableFilterComposer(
            $db: $db,
            $table: $db.dbAttachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbChatRoundsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbChatRoundsTable> {
  $$DbChatRoundsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userContent => $composableBuilder(
    column: $table.userContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assistantThinking => $composableBuilder(
    column: $table.assistantThinking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assistantContent => $composableBuilder(
    column: $table.assistantContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isIncomplete => $composableBuilder(
    column: $table.isIncomplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbSessionsTableOrderingComposer get sessionId {
    final $$DbSessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.dbSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSessionsTableOrderingComposer(
            $db: $db,
            $table: $db.dbSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbChatRoundsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbChatRoundsTable> {
  $$DbChatRoundsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get userContent => $composableBuilder(
    column: $table.userContent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get assistantThinking => $composableBuilder(
    column: $table.assistantThinking,
    builder: (column) => column,
  );

  GeneratedColumn<String> get assistantContent => $composableBuilder(
    column: $table.assistantContent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isIncomplete => $composableBuilder(
    column: $table.isIncomplete,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasUnseenUpdate => $composableBuilder(
    column: $table.hasUnseenUpdate,
    builder: (column) => column,
  );

  $$DbSessionsTableAnnotationComposer get sessionId {
    final $$DbSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.dbSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dbAttachmentsRefs<T extends Object>(
    Expression<T> Function($$DbAttachmentsTableAnnotationComposer a) f,
  ) {
    final $$DbAttachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbAttachments,
      getReferencedColumn: (t) => t.roundId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAttachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbAttachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbChatRoundsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbChatRoundsTable,
          DbChatRound,
          $$DbChatRoundsTableFilterComposer,
          $$DbChatRoundsTableOrderingComposer,
          $$DbChatRoundsTableAnnotationComposer,
          $$DbChatRoundsTableCreateCompanionBuilder,
          $$DbChatRoundsTableUpdateCompanionBuilder,
          (DbChatRound, $$DbChatRoundsTableReferences),
          DbChatRound,
          PrefetchHooks Function({bool sessionId, bool dbAttachmentsRefs})
        > {
  $$DbChatRoundsTableTableManager(_$AppDatabase db, $DbChatRoundsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbChatRoundsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbChatRoundsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbChatRoundsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<String> userContent = const Value.absent(),
                Value<String?> assistantThinking = const Value.absent(),
                Value<String?> assistantContent = const Value.absent(),
                Value<bool> isIncomplete = const Value.absent(),
                Value<bool> hasUnseenUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbChatRoundsCompanion(
                id: id,
                sessionId: sessionId,
                parentId: parentId,
                createdAt: createdAt,
                userContent: userContent,
                assistantThinking: assistantThinking,
                assistantContent: assistantContent,
                isIncomplete: isIncomplete,
                hasUnseenUpdate: hasUnseenUpdate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                Value<String?> parentId = const Value.absent(),
                required int createdAt,
                required String userContent,
                Value<String?> assistantThinking = const Value.absent(),
                Value<String?> assistantContent = const Value.absent(),
                Value<bool> isIncomplete = const Value.absent(),
                Value<bool> hasUnseenUpdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbChatRoundsCompanion.insert(
                id: id,
                sessionId: sessionId,
                parentId: parentId,
                createdAt: createdAt,
                userContent: userContent,
                assistantThinking: assistantThinking,
                assistantContent: assistantContent,
                isIncomplete: isIncomplete,
                hasUnseenUpdate: hasUnseenUpdate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbChatRoundsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({sessionId = false, dbAttachmentsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dbAttachmentsRefs) db.dbAttachments,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sessionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sessionId,
                                    referencedTable:
                                        $$DbChatRoundsTableReferences
                                            ._sessionIdTable(db),
                                    referencedColumn:
                                        $$DbChatRoundsTableReferences
                                            ._sessionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dbAttachmentsRefs)
                        await $_getPrefetchedData<
                          DbChatRound,
                          $DbChatRoundsTable,
                          DbAttachment
                        >(
                          currentTable: table,
                          referencedTable: $$DbChatRoundsTableReferences
                              ._dbAttachmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DbChatRoundsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbAttachmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roundId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DbChatRoundsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbChatRoundsTable,
      DbChatRound,
      $$DbChatRoundsTableFilterComposer,
      $$DbChatRoundsTableOrderingComposer,
      $$DbChatRoundsTableAnnotationComposer,
      $$DbChatRoundsTableCreateCompanionBuilder,
      $$DbChatRoundsTableUpdateCompanionBuilder,
      (DbChatRound, $$DbChatRoundsTableReferences),
      DbChatRound,
      PrefetchHooks Function({bool sessionId, bool dbAttachmentsRefs})
    >;
typedef $$DbAttachmentsTableCreateCompanionBuilder =
    DbAttachmentsCompanion Function({
      required String id,
      required String roundId,
      required String name,
      required String relativePath,
      Value<bool> isImage,
      Value<String?> mimeType,
      Value<int> rowid,
    });
typedef $$DbAttachmentsTableUpdateCompanionBuilder =
    DbAttachmentsCompanion Function({
      Value<String> id,
      Value<String> roundId,
      Value<String> name,
      Value<String> relativePath,
      Value<bool> isImage,
      Value<String?> mimeType,
      Value<int> rowid,
    });

final class $$DbAttachmentsTableReferences
    extends BaseReferences<_$AppDatabase, $DbAttachmentsTable, DbAttachment> {
  $$DbAttachmentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbChatRoundsTable _roundIdTable(_$AppDatabase db) =>
      db.dbChatRounds.createAlias(
        $_aliasNameGenerator(db.dbAttachments.roundId, db.dbChatRounds.id),
      );

  $$DbChatRoundsTableProcessedTableManager get roundId {
    final $_column = $_itemColumn<String>('round_id')!;

    final manager = $$DbChatRoundsTableTableManager(
      $_db,
      $_db.dbChatRounds,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbAttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $DbAttachmentsTable> {
  $$DbAttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isImage => $composableBuilder(
    column: $table.isImage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  $$DbChatRoundsTableFilterComposer get roundId {
    final $$DbChatRoundsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roundId,
      referencedTable: $db.dbChatRounds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChatRoundsTableFilterComposer(
            $db: $db,
            $table: $db.dbChatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbAttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbAttachmentsTable> {
  $$DbAttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isImage => $composableBuilder(
    column: $table.isImage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbChatRoundsTableOrderingComposer get roundId {
    final $$DbChatRoundsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roundId,
      referencedTable: $db.dbChatRounds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChatRoundsTableOrderingComposer(
            $db: $db,
            $table: $db.dbChatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbAttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbAttachmentsTable> {
  $$DbAttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isImage =>
      $composableBuilder(column: $table.isImage, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  $$DbChatRoundsTableAnnotationComposer get roundId {
    final $$DbChatRoundsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roundId,
      referencedTable: $db.dbChatRounds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbChatRoundsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbChatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbAttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbAttachmentsTable,
          DbAttachment,
          $$DbAttachmentsTableFilterComposer,
          $$DbAttachmentsTableOrderingComposer,
          $$DbAttachmentsTableAnnotationComposer,
          $$DbAttachmentsTableCreateCompanionBuilder,
          $$DbAttachmentsTableUpdateCompanionBuilder,
          (DbAttachment, $$DbAttachmentsTableReferences),
          DbAttachment,
          PrefetchHooks Function({bool roundId})
        > {
  $$DbAttachmentsTableTableManager(_$AppDatabase db, $DbAttachmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbAttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbAttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbAttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roundId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> relativePath = const Value.absent(),
                Value<bool> isImage = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbAttachmentsCompanion(
                id: id,
                roundId: roundId,
                name: name,
                relativePath: relativePath,
                isImage: isImage,
                mimeType: mimeType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roundId,
                required String name,
                required String relativePath,
                Value<bool> isImage = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbAttachmentsCompanion.insert(
                id: id,
                roundId: roundId,
                name: name,
                relativePath: relativePath,
                isImage: isImage,
                mimeType: mimeType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbAttachmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roundId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roundId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roundId,
                                referencedTable: $$DbAttachmentsTableReferences
                                    ._roundIdTable(db),
                                referencedColumn: $$DbAttachmentsTableReferences
                                    ._roundIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbAttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbAttachmentsTable,
      DbAttachment,
      $$DbAttachmentsTableFilterComposer,
      $$DbAttachmentsTableOrderingComposer,
      $$DbAttachmentsTableAnnotationComposer,
      $$DbAttachmentsTableCreateCompanionBuilder,
      $$DbAttachmentsTableUpdateCompanionBuilder,
      (DbAttachment, $$DbAttachmentsTableReferences),
      DbAttachment,
      PrefetchHooks Function({bool roundId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DbConfigStoreTableTableManager get dbConfigStore =>
      $$DbConfigStoreTableTableManager(_db, _db.dbConfigStore);
  $$DbConfigProfilesTableTableManager get dbConfigProfiles =>
      $$DbConfigProfilesTableTableManager(_db, _db.dbConfigProfiles);
  $$DbSessionsTableTableManager get dbSessions =>
      $$DbSessionsTableTableManager(_db, _db.dbSessions);
  $$DbChatRoundsTableTableManager get dbChatRounds =>
      $$DbChatRoundsTableTableManager(_db, _db.dbChatRounds);
  $$DbAttachmentsTableTableManager get dbAttachments =>
      $$DbAttachmentsTableTableManager(_db, _db.dbAttachments);
}
```

## File: data/repositories/conversation_repository.dart
```dart
// data/repositories/conversation_repository.dart
import 'dart:async';
import 'package:drift/drift.dart';
import '../data_sources/local_file_source.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../../domain/models/session_list_item.dart';
import '../database/database.dart';
import '../../domain/models/session_card_meta.dart';

class ConversationRepository {
  final AppDatabase _db;
  final LocalFileSource _fileService;
  ConversationRepository(this._db, this._fileService);

  String _getId(String fileName) => fileName.replaceAll('.json', '');

  // ========== 响应式查询 ==========

  Stream<List<SessionListItem>> watchSessionListItems() {
    final query = (_db.select(_db.dbSessions)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));
    return query.watch().map((sessions) {
      return sessions.map((session) {
        return SessionListItem(
          id: session.id,
          title: session.title,
          updatedAt: session.updatedAt,
        );
      }).toList();
    });
  }

  Stream<SessionCardMeta> watchSessionCardMeta(String sessionId) {
    final query = (_db.select(_db.dbChatRounds)
      ..where((t) => t.sessionId.equals(sessionId))
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]));
    return query.watch().map((rounds) {
      final previewRound = rounds.isEmpty ? null : rounds.last;
      final hasUnseen = rounds.any((r) => r.hasUnseenUpdate);
      final userPreview = previewRound == null
          ? '点击开始新的对话'
          : previewRound.userContent.trim().isEmpty
              ? '（空输入）'
              : previewRound.userContent.trim();
      final aiPreview = previewRound == null
          ? '（等待回复）'
          : (previewRound.assistantContent?.trim().isNotEmpty ?? false)
              ? previewRound.assistantContent!
              : (previewRound.isIncomplete ? '正在生成...' : '（等待回复）');
      return SessionCardMeta(
        roundCount: rounds.length,
        previewRoundId: previewRound?.id,
        userPreview: userPreview,
        aiPreview: aiPreview,
        hasUnseen: hasUnseen,
        isStreaming: previewRound?.isIncomplete == true,
      );
    });
  }
  // ========== 细粒度监听（新增） ==========

  /// 仅监听会话的拓扑结构（ID 与父子关系）
  /// 只有在增删消息时触发，AI 说话时不触发
  Stream<List<({String id, String? parentId})>> watchSessionTopology(String fileName) {
    final sessionId = _getId(fileName);
    final query = _db.selectOnly(_db.dbChatRounds)
      ..addColumns([_db.dbChatRounds.id, _db.dbChatRounds.parentId])
      ..where(_db.dbChatRounds.sessionId.equals(sessionId))
      ..orderBy([OrderingTerm.asc(_db.dbChatRounds.createdAt)]);
      
    return query.watch().map((rows) => rows.map((r) => (
      id: r.read(_db.dbChatRounds.id)!,
      parentId: r.read(_db.dbChatRounds.parentId)
    )).toList());
  }

  /// 仅监听单条消息的完整详情（含附件）
  Stream<ChatRound?> watchSingleRound(String roundId) {
    final query = _db.select(_db.dbChatRounds).join([
      leftOuterJoin(
        _db.dbAttachments,
        _db.dbAttachments.roundId.equalsExp(_db.dbChatRounds.id),
      ),
    ])..where(_db.dbChatRounds.id.equals(roundId));

    return query.watch().map((rows) {
      if (rows.isEmpty) return null;
      final roundRow = rows.first.readTable(_db.dbChatRounds);
      final attachments = rows
          .where((row) => row.readTableOrNull(_db.dbAttachments) != null)
          .map((row) {
            final a = row.readTable(_db.dbAttachments);
            return Attachment(
              id: a.id,
              name: a.name,
              relativePath: a.relativePath,
              isImage: a.isImage,
              mimeType: a.mimeType,
            );
          }).toList();
      return _mapToChatRound(roundRow, attachments);
    });
  }

  Future<List<ChatRound>> getContextRounds(String fileName, String roundId) async {
    // 1. 使用递归 CTE 直接查询从目标节点到根的路径（数据库层按时间正序返回）
    final roundsQuery = _db.customSelect(
      '''
      WITH RECURSIVE ctx_chain AS (
        -- 基础情况：目标节点
        SELECT id, session_id, parent_id, created_at, user_content,
              assistant_thinking, assistant_content, is_incomplete, has_unseen_update
        FROM db_chat_rounds WHERE id = :roundId
        UNION ALL
        -- 递归情况：向上查找父节点
        SELECT r.id, r.session_id, r.parent_id, r.created_at, r.user_content,
              r.assistant_thinking, r.assistant_content, r.is_incomplete, r.has_unseen_update
        FROM db_chat_rounds r
        INNER JOIN ctx_chain c ON r.id = c.parent_id
      )
      SELECT * FROM ctx_chain ORDER BY created_at ASC
      ''',
      readsFrom: {_db.dbChatRounds},
      variables: [Variable.withString(roundId)],
    );

    final dbRounds = await roundsQuery.map((row) {
      return DbChatRound(
        id: row.read<String>('id'),
        sessionId: row.read<String>('session_id'),
        parentId: row.read<String?>('parent_id'),
        createdAt: row.read<int>('created_at'),
        userContent: row.read<String>('user_content'),
        assistantThinking: row.read<String?>('assistant_thinking'),
        assistantContent: row.read<String?>('assistant_content'),
        isIncomplete: row.read<bool>('is_incomplete'),
        hasUnseenUpdate: row.read<bool>('has_unseen_update'),
      );
    }).get();

    if (dbRounds.isEmpty) return [];

    // 2. 批量查询链路上所有轮次的附件
    final roundIds = dbRounds.map((r) => r.id).toList();
    final dbAttachments = await (_db.select(_db.dbAttachments)
          ..where((t) => t.roundId.isIn(roundIds)))
        .get();

    // 3. 按 roundId 分组附件
    final attachmentMap = <String, List<Attachment>>{};
    for (final att in dbAttachments) {
      attachmentMap.putIfAbsent(att.roundId, () => []).add(
        Attachment(
          id: att.id,
          name: att.name,
          relativePath: att.relativePath,
          isImage: att.isImage,
          mimeType: att.mimeType,
        ),
      );
    }

    // 4. 组装返回（CTE 已按 created_at ASC 排序，无需 reversed）
    return dbRounds.map((round) => _mapToChatRound(round, attachmentMap[round.id] ?? [])).toList();
  }

  Stream<String?> watchSessionTitle(String fileName) {
    final sessionId = _getId(fileName);
    return (_db.select(_db.dbSessions)
          ..where((t) => t.id.equals(sessionId)))
        .map((row) => row.title)
        .watchSingleOrNull();
  }

  ChatRound _mapToChatRound(DbChatRound row, List<Attachment> attachments) {
    return ChatRound(
      id: row.id,
      parentId: row.parentId,
      createdAt: row.createdAt,
      userContent: row.userContent,
      userAttachments: attachments,
      assistantThinking: row.assistantThinking,
      assistantContent: row.assistantContent,
      isIncomplete: row.isIncomplete,
      hasUnseenUpdate: row.hasUnseenUpdate,
    );
  }

  Future<void> _cleanupOrphanAttachments(Iterable<String> relativePaths) async {
    final uniquePaths = relativePaths.toSet();
    if (uniquePaths.isEmpty) return;

    final referencedPaths = await (_db.select(_db.dbAttachments)
          ..where((t) => t.relativePath.isIn(uniquePaths)))
        .map((t) => t.relativePath)
        .get();

    final orphanPaths = uniquePaths.difference(referencedPaths.toSet());

    for (final path in orphanPaths) {
      try {
        await _fileService.deleteAttachment(path);
      } catch (_) {
      }
    }
  }

  // ========== 写操作 ==========

  Future<void> deleteRoundsAndCleanupOrphanAttachments(
    String fileName,
    List<String> roundIds,
  ) async {
    if (roundIds.isEmpty) return;
    final sessionId = _getId(fileName);

    // 1. 收集候选附件路径
    final candidatePaths = (await (_db.select(_db.dbAttachments).join([
      innerJoin(
        _db.dbChatRounds,
        _db.dbChatRounds.id.equalsExp(_db.dbAttachments.roundId),
      ),
    ])
          ..where(_db.dbChatRounds.sessionId.equals(sessionId))
          ..where(_db.dbChatRounds.id.isIn(roundIds)))
        .get())
        .map((row) => row.readTable(_db.dbAttachments).relativePath)
        .toSet();

    // 2. 提交数据库变更 (级联删除会自动清理 dbAttachments)
    await _db.transaction(() async {
      await (_db.delete(_db.dbChatRounds)
            ..where((t) => t.sessionId.equals(sessionId) & t.id.isIn(roundIds)))
          .go();
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(
        DbSessionsCompanion(
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });

    // 3. 基于最终态清理物理文件
    await _cleanupOrphanAttachments(candidatePaths);
  }

  Future<void> deleteSession(String fileName) async {
    final sessionId = _getId(fileName);

    // 1. 收集候选附件路径
    final candidatePaths = (await (_db.select(_db.dbAttachments).join([
      innerJoin(
        _db.dbChatRounds,
        _db.dbChatRounds.id.equalsExp(_db.dbAttachments.roundId),
      ),
    ])
          ..where(_db.dbChatRounds.sessionId.equals(sessionId)))
        .get())
        .map((row) => row.readTable(_db.dbAttachments).relativePath)
        .toSet();

    // 2. 提交数据库变更
    await (_db.delete(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .go();

    // 3. 基于最终态清理物理文件
    await _cleanupOrphanAttachments(candidatePaths);
  }

  Future<Session> createSession({
    required String fileName,
    required String title,
  }) async {
    final sessionId = _getId(fileName);
    final now = DateTime.now().millisecondsSinceEpoch;
    final session = Session(
      id: sessionId,
      title: title,
      createdAt: now,
      updatedAt: now,
      rounds: [],
    );
    await _db.into(_db.dbSessions).insert(
          DbSessionsCompanion.insert(
            id: session.id,
            title: session.title,
            createdAt: session.createdAt,
            updatedAt: session.updatedAt,
          ),
        );
    return session;
  }

  Future<void> updateSessionTitle(String fileName, String title) async {
    final sessionId = _getId(fileName);
    await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .write(
      DbSessionsCompanion(
        title: Value(title),
        updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  Future<void> appendRound(String fileName, ChatRound round) async {
    final sessionId = _getId(fileName);
    await _db.transaction(() async {
      await _db.into(_db.dbChatRounds).insert(
            DbChatRoundsCompanion.insert(
              id: round.id,
              sessionId: sessionId,
              parentId: Value(round.parentId),
              createdAt: round.createdAt,
              userContent: round.userContent,
              assistantThinking: Value(round.assistantThinking),
              assistantContent: Value(round.assistantContent),
              isIncomplete: Value(round.isIncomplete),
              hasUnseenUpdate: Value(round.hasUnseenUpdate),
            ),
          );
      for (final attach in round.userAttachments) {
        await _db.into(_db.dbAttachments).insert(
              DbAttachmentsCompanion.insert(
                id: attach.id,
                roundId: round.id,
                name: attach.name,
                relativePath: attach.relativePath,
                isImage: Value(attach.isImage),
                mimeType: Value(attach.mimeType),
              ),
            );
      }
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(
        DbSessionsCompanion(
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });
  }

  Future<void> updateRound(
    String fileName,
    String roundId,
    ChatRound updatedRound,
  ) async {
    final sessionId = _getId(fileName);
    await _db.transaction(() async {
      await (_db.update(_db.dbChatRounds)..where((t) => t.id.equals(roundId)))
          .write(
        DbChatRoundsCompanion(
          assistantThinking: Value(updatedRound.assistantThinking),
          assistantContent: Value(updatedRound.assistantContent),
          isIncomplete: Value(updatedRound.isIncomplete),
          hasUnseenUpdate: Value(updatedRound.hasUnseenUpdate),
        ),
      );
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(
        DbSessionsCompanion(
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });
  }

  // ========== 附件读写接口保留 ==========
  Future<String> saveAttachment(Uint8List data, String fileName) async =>
      await _fileService.saveAttachment(data, fileName);

  Future<Uint8List> getAttachment(String relativePath) async =>
      await _fileService.readAttachment(relativePath);

  Future<void> deleteAttachment(String relativePath) async =>
      await _fileService.deleteAttachment(relativePath);
}
```

## File: data/services/config_service.dart
```dart
import 'dart:async';
import 'package:drift/drift.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/models/model_info.dart';
import '../../data/data_sources/remote_api_source.dart';
import '../database/database.dart';
import 'package:uuid/uuid.dart';

class ConfigService{
  final AppDatabase _db;
  final RemoteApiSource _apiSource;

  ConfigService(this._db, this._apiSource);

  Future<AppConfigStore> _ensureInitialized() async {
    final storeRow = await _db.select(_db.dbConfigStore).getSingleOrNull();
    var activeId = storeRow?.activeProfileId ?? 'default';

    final profileRows = await _db.select(_db.dbConfigProfiles).get();

    if (profileRows.isEmpty) {
      final defaultProfile = ConfigProfile(
        id: 'default',
        name: '默认配置',
        config: AppConfig.defaultConfig(),
      );

      await _db.into(_db.dbConfigProfiles).insert(
        DbConfigProfilesCompanion.insert(
          id: defaultProfile.id,
          name: defaultProfile.name,
          config: defaultProfile.config,
        ),
      );
      await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
        const DbConfigStoreCompanion(
          id: Value(1),
          activeProfileId: Value('default'),
        ),
      );

      activeId = 'default';
      return AppConfigStore(
        activeProfileId: activeId,
        profiles: [defaultProfile],
      );
    }

    final profiles = profileRows
        .map((p) => ConfigProfile(id: p.id, name: p.name, config: p.config))
        .toList();

    if (!profiles.any((p) => p.id == activeId)) {
      activeId = profiles.first.id;
      await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
        DbConfigStoreCompanion(
          id: const Value(1),
          activeProfileId: Value(activeId),
        ),
      );
    }

    return AppConfigStore(activeProfileId: activeId, profiles: profiles);
  }

  Future<AppConfigStore> loadConfigStore() async {
    return await _ensureInitialized();
  }

  Future<AppConfig> loadConfig() async {
    final store = await loadConfigStore();
    return store.profiles.firstWhere(
      (p) => p.id == store.activeProfileId,
      orElse: () => store.profiles.first,
    ).config;
  }

  Future<void> saveConfig(AppConfig config) async {
    final activeId = await getActiveProfileId();
    await (_db.update(_db.dbConfigProfiles)..where((t) => t.id.equals(activeId)))
        .write(DbConfigProfilesCompanion(config: Value(config)));
  }

  Future<void> refreshModels() async {
    final activeConfig = await loadConfig();

    final remoteModels = await _apiSource.fetchModels(
      baseUrl: activeConfig.baseUrl,
      apiKey: activeConfig.apiKey,
      modelsPath: activeConfig.modelsPath,
    );

    final oldModels = activeConfig.availableModels ?? const <ModelInfo>[];
    final oldById = {for (final model in oldModels) model.id: model};
    final remoteIds = remoteModels.map((e) => e.id).toSet();

    final mergedRemoteModels = remoteModels.map((remote) {
      final old = oldById[remote.id];
      final merged = remote.copyWith(
        overrideSupportsReasoning: old?.overrideSupportsReasoning,
        overrideSupportsVision: old?.overrideSupportsVision,
      );
      return merged.copyWith(
        supportsVision: merged.overrideSupportsVision ?? merged.supportsVision,
        supportsReasoning: merged.overrideSupportsReasoning ?? merged.supportsReasoning,
      );
    }).toList();

    final customOnlyModels = oldModels
        .where((old) => !remoteIds.contains(old.id))
        .where((old) =>
            old.overrideSupportsReasoning != null ||
            old.overrideSupportsVision != null)
        .map((model) => model.copyWith(
          supportsVision: model.overrideSupportsVision ?? model.supportsVision,
          supportsReasoning: model.overrideSupportsReasoning ?? model.supportsReasoning,
        ))
        .toList();

    final updatedConfig = activeConfig.copyWith(
      availableModels: [
        ...mergedRemoteModels,
        ...customOnlyModels,
      ],
    );

    await saveConfig(updatedConfig);
  }

  Future<List<ConfigProfile>> getProfiles() async {
    final store = await loadConfigStore();
    return store.profiles;
  }

  Future<String> getActiveProfileId() async {
    final storeRow = await _db.select(_db.dbConfigStore).getSingleOrNull();
    var activeId = storeRow?.activeProfileId ?? 'default';

    final profiles = await _db.select(_db.dbConfigProfiles).get();
    if (!profiles.any((p) => p.id == activeId) && profiles.isNotEmpty) {
      activeId = profiles.first.id;
      await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
        DbConfigStoreCompanion(
          id: const Value(1),
          activeProfileId: Value(activeId),
        ),
      );
    }

    return activeId;
  }

  Future<void> switchProfile(String profileId) async {
    await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
      DbConfigStoreCompanion(
        id: const Value(1),
        activeProfileId: Value(profileId),
      ),
    );
  }

  Future<void> createProfile(String name) async {
    final activeConfig = await loadConfig();
    final newId = const Uuid().v4();
    final cleanName = name.trim().isEmpty ? '新配置' : name.trim();

    await _db.into(_db.dbConfigProfiles).insert(
      DbConfigProfilesCompanion.insert(
        id: newId,
        name: cleanName,
        config: activeConfig,
      ),
    );
    await switchProfile(newId);
  }

  Future<void> renameProfile(String profileId, String name) async {
    if (name.trim().isEmpty) return;
    await (_db.update(_db.dbConfigProfiles)
          ..where((t) => t.id.equals(profileId)))
        .write(DbConfigProfilesCompanion(name: Value(name.trim())));
  }

  Future<void> deleteProfile(String profileId) async {
    final store = await loadConfigStore();

    if (store.profiles.length <= 1) return;

    if (store.activeProfileId == profileId) {
      final remaining = store.profiles.where((p) => p.id != profileId).toList();
      if (remaining.isNotEmpty) {
        await switchProfile(remaining.first.id);
      }
    }

    await (_db.delete(_db.dbConfigProfiles)
          ..where((t) => t.id.equals(profileId)))
        .go();
  }

  Stream<AppConfigStore> watchConfigStore() {
    _ensureInitialized();

    final storeStream = _db.select(_db.dbConfigStore).watchSingleOrNull();
    final profilesStream = _db.select(_db.dbConfigProfiles).watch();

    final outputController = StreamController<AppConfigStore>();

    DbConfigStoreData? latestStoreRow;
    List<DbConfigProfile> latestProfileRows = [];

    void computeAndOutput() {
      final storeRow = latestStoreRow;
      final profileRows = latestProfileRows;

      if (storeRow == null && profileRows.isEmpty) return;
      if (profileRows.isEmpty) return;

      var activeId = storeRow?.activeProfileId ?? 'default';

      final profiles = profileRows
          .map((p) => ConfigProfile(id: p.id, name: p.name, config: p.config))
          .toList();

      if (!profiles.any((p) => p.id == activeId)) {
        activeId = profiles.first.id;
        _db.into(_db.dbConfigStore).insertOnConflictUpdate(
          DbConfigStoreCompanion(
            id: const Value(1),
            activeProfileId: Value(activeId),
          ),
        );
      }

      outputController.add(
        AppConfigStore(activeProfileId: activeId, profiles: profiles),
      );
    }

    final storeSubscription = storeStream.listen(
      (row) {
        latestStoreRow = row;
        computeAndOutput();
      },
      onError: (e) {
        outputController.addError(e);
      },
    );

    final profilesSubscription = profilesStream.listen(
      (rows) {
        latestProfileRows = rows;
        computeAndOutput();
      },
      onError: (e) {
        outputController.addError(e);
      },
    );

    outputController.onCancel = () {
      storeSubscription.cancel();
      profilesSubscription.cancel();
    };

    return outputController.stream;
  }

  Stream<AppConfig> watchConfig() {
    return watchConfigStore().map((store) {
      return store.profiles.firstWhere(
        (p) => p.id == store.activeProfileId,
        orElse: () => store.profiles.first,
      ).config;
    });
  }
}
```

## File: di/providers.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../data/data_sources/local_file_source.dart';
import '../data/data_sources/remote_api_source.dart';
import '../data/database/database.dart';
import '../data/services/config_service.dart';
import '../data/repositories/conversation_repository.dart';

/// 1. 环境初始化 Provider
final localFileSourceProvider = FutureProvider<LocalFileSource>((ref) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileSource = LocalFileSource(appDir.path);
  await fileSource.initDirectories();
  return fileSource;
});

/// 2. 数据库 Provider
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  ref.watch(localFileSourceProvider); // 触发依赖追踪
  return AppDatabase();
});

/// 3. 远程 API 数据源
final remoteApiSourceProvider = Provider<RemoteApiSource>((ref) {
  return RemoteApiSource();
});

/// 4. 配置服务
final configServiceProvider = Provider<ConfigService>((ref) {
  return ConfigService(
    ref.watch(appDatabaseProvider),
    ref.watch(remoteApiSourceProvider),
  );
});

/// 5. 会话仓库
final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  return ConversationRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(localFileSourceProvider).requireValue, // main() 已阻塞等待，此处必定就绪
  );
});
```

## File: domain/models/session_card_meta.dart
```dart
class SessionCardMeta {
  final int roundCount;
  final String? previewRoundId;
  final String userPreview;
  final String aiPreview;
  final bool hasUnseen;
  final bool isStreaming;

  const SessionCardMeta({
    required this.roundCount,
    required this.previewRoundId,
    required this.userPreview,
    required this.aiPreview,
    required this.hasUnseen,
    required this.isStreaming,
  });
}
```

## File: domain/models/session_list_item.dart
```dart
class SessionListItem {
  final String id;
  final String title;
  final int updatedAt;

  const SessionListItem({
    required this.id,
    required this.title,
    required this.updatedAt,
  });
}
```

## File: domain/models/tree_node.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_node.freezed.dart';
part 'tree_node.g.dart';

@freezed
class TreeNode with _$TreeNode {
  const factory TreeNode({
    required String id,
    String? parentId,
    required List<TreeNode> children,
    required int depth,
  }) = _TreeNode;

  factory TreeNode.fromJson(Map<String, dynamic> json) =>
      _$TreeNodeFromJson(json);
}

@freezed
class TreePath with _$TreePath {
  const factory TreePath({
    required List<TreeNode> nodes,
    required TreeNode targetNode,
  }) = _TreePath;

  factory TreePath.fromJson(Map<String, dynamic> json) =>
      _$TreePathFromJson(json);
}
```

## File: domain/models/tree_node.g.dart
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreeNodeImpl _$$TreeNodeImplFromJson(Map<String, dynamic> json) =>
    _$TreeNodeImpl(
      id: json['id'] as String,
      parentId: json['parentId'] as String?,
      children: (json['children'] as List<dynamic>)
          .map((e) => TreeNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      depth: (json['depth'] as num).toInt(),
    );

Map<String, dynamic> _$$TreeNodeImplToJson(_$TreeNodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'children': instance.children,
      'depth': instance.depth,
    };

_$TreePathImpl _$$TreePathImplFromJson(Map<String, dynamic> json) =>
    _$TreePathImpl(
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => TreeNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetNode: TreeNode.fromJson(json['targetNode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TreePathImplToJson(_$TreePathImpl instance) =>
    <String, dynamic>{
      'nodes': instance.nodes,
      'targetNode': instance.targetNode,
    };
```

## File: domain/services/attachment_preparer.dart
```dart
import 'dart:io';
import '../../core/models/attachment.dart';
import '../../data/repositories/conversation_repository.dart';
import '../../presentation/models/pending_attachment.dart';

Future<List<Attachment>> savePendingAttachments(
  ConversationRepository repository,
  List<PendingAttachment> pending,
) async {
  final result = <Attachment>[];

  for (final item in pending) {
    final bytes = await File(item.path).readAsBytes();
    final relativePath = await repository.saveAttachment(bytes, item.name);

    result.add(
      Attachment(
        id: item.id,
        name: item.name,
        relativePath: relativePath,
        isImage: item.isImage,
        mimeType: item.mimeType,
      ),
    );
  }

  return result;
}
```

## File: domain/services/chat_context_builder.dart
```dart
import 'dart:convert';
import '../../core/models/api_message.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';

Future<List<ApiMessage>> buildApiContextFromRounds(
  List<ChatRound> rounds,
  ConversationRepository repository,
) async {
  final result = <ApiMessage>[];

  for (final round in rounds) {
    final userMessage = await _buildUserMessage(round, repository);
    result.add(userMessage);

    final assistantMessage = _buildAssistantMessage(round);
    if (assistantMessage != null) {
      result.add(assistantMessage);
    }
  }

  return result;
}

ApiMessage? _buildAssistantMessage(ChatRound round) {
  final thinking = round.assistantThinking?.trim() ?? '';
  final content = round.assistantContent?.trim() ?? '';

  if (thinking.isEmpty && content.isEmpty) return null;

  return ApiMessage(
    role: 'assistant',
    content: content.isEmpty ? null : content,
    reasoning: thinking.isEmpty ? null : thinking,
  );
}

Future<ApiMessage> _buildUserMessage(
  ChatRound round,
  ConversationRepository repository,
) async {
  final parts = <ApiMessageContentPart>[];

  if (round.userContent.trim().isNotEmpty) {
    parts.add(ApiMessageContentPart.text(text: round.userContent.trim()));
  }

  for (final attachment in round.userAttachments) {
    final attachmentParts = await _buildAttachmentParts(attachment, repository);
    parts.addAll(attachmentParts);
  }

  if (parts.isEmpty) {
    return const ApiMessage(role: 'user', content: '');
  }

  if (_isOnlySingleTextPart(parts)) {
    final text = parts.first.maybeWhen(
      text: (_, text) => text,
      orElse: () => '',
    );
    return ApiMessage(role: 'user', content: text);
  }

  return ApiMessage(role: 'user', parts: parts);
}

bool _isOnlySingleTextPart(List<ApiMessageContentPart> parts) {
  if (parts.length != 1) return false;
  return parts.first.maybeWhen(
    text: (_, text) => true,
    orElse: () => false,
  );
}

Future<List<ApiMessageContentPart>> _buildAttachmentParts(
  dynamic attachment,
  ConversationRepository repository,
) async {
  final lowerName = attachment.name.toLowerCase();
  final mime = (attachment.mimeType ?? '').toLowerCase();

  final isTextFile = mime.startsWith('text/') ||
      mime == 'application/json' ||
      lowerName.endsWith('.md') ||
      lowerName.endsWith('.txt') ||
      lowerName.endsWith('.json') ||
      lowerName.endsWith('.dart') ||
      lowerName.endsWith('.yaml') ||
      lowerName.endsWith('.yml');

  if (attachment.isImage) {
    final bytes = await repository.getAttachment(attachment.relativePath);
    final mimeType = attachment.mimeType ?? 'image/png';
    final base64Data = base64Encode(bytes);
    return [ApiMessageContentPart.imageUrl(imageUrl: ApiImageUrl(url: 'data:$mimeType;base64,$base64Data'))];
  }

  if (isTextFile) {
    final bytes = await repository.getAttachment(attachment.relativePath);
    return [ApiMessageContentPart.text(text: utf8.decode(bytes, allowMalformed: true))];
  }

  return [ApiMessageContentPart.text(text: '[附件: ${attachment.name}]')];
}
```

## File: domain/services/chat_round_factory.dart
```dart
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import 'package:uuid/uuid.dart';

class ChatRoundFactory {
  static ChatRound createUserRound({
    required String content,
    required String? parentId,
    required List<Attachment> attachments,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return ChatRound(
      id: const Uuid().v4(),
      parentId: parentId,
      createdAt: now,
      userContent: content,
      userAttachments: attachments,
      isIncomplete: true,
    );
  }

  static ChatRound createRetryRound({
    required ChatRound sourceRound,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return ChatRound(
      id: const Uuid().v4(),
      parentId: sourceRound.parentId,
      createdAt: now,
      userContent: sourceRound.userContent,
      userAttachments: sourceRound.userAttachments,
      isIncomplete: true,
    );
  }

  static ChatRound createEditedRetryRound({
    required ChatRound sourceRound,
    required String newContent,
    required List<Attachment> attachments,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return ChatRound(
      id: const Uuid().v4(),
      parentId: sourceRound.parentId,
      createdAt: now,
      userContent: newContent,
      userAttachments: attachments,
      isIncomplete: true,
    );
  }
}
```

## File: domain/services/model_capability_registry.dart
```dart
import '../../core/models/model_info.dart';

class ModelCapabilityRegistry {
  static final List<_ModelRule> _rules = [
    _ModelRule(
      patterns: ['gpt', '4', 'o'],
      supportsVision: true,
      supportsReasoning: false,
      priority: 100,
    ),
    _ModelRule(
      patterns: ['gpt', '4', '1'],
      supportsVision: true,
      supportsReasoning: false,
      priority: 100,
    ),
    _ModelRule(
      patterns: ['o'],
      numberAfter: true,
      supportsVision: true,
      supportsReasoning: true,
      priority: 200,
    ),
    _ModelRule(
      patterns: ['gpt', '5'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['gemini', '2', '5'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['gemini', '3'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['gemini', 'flash', 'latest'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 140,
    ),
    _ModelRule(
      patterns: ['gemini', 'pro', 'latest'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 140,
    ),
    _ModelRule(
      patterns: ['claude'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 120,
    ),
    _ModelRule(
      patterns: ['deepseek', 'r', '1'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 160,
    ),
    _ModelRule(
      patterns: ['deepseek', 'reasoner'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 160,
    ),
    _ModelRule(
      patterns: ['deepseek', 'v', '3'],
      supportsVision: false,
      supportsReasoning: false,
      priority: 120,
    ),
    _ModelRule(
      patterns: ['deepseek', 'chat'],
      supportsVision: false,
      supportsReasoning: false,
      priority: 120,
    ),
    _ModelRule(
      patterns: ['qwen', '3', '5'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['qwen', '3'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 120,
    ),
    _ModelRule(
      patterns: ['kimi', 'k', '2', '5'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['kimi', 'k', '2'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 120,
    ),
    _ModelRule(
      patterns: ['glm', '4', '5'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['glm', '4', '6'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['glm', '4', '7'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['glm', '5'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['grok', '4'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 140,
    ),
    _ModelRule(
      patterns: ['doubao', '1', '6'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 130,
    ),
    _ModelRule(
      patterns: ['doubao', '1', '8'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 130,
    ),
  ];

  static ModelInfo enhance(ModelInfo model) {
    final tokens = _tokenize(model.id);
    _ModelRule? best;

    for (final rule in _rules) {
      if (rule.matches(tokens)) {
        if (best == null || rule.priority > best.priority) {
          best = rule;
        }
      }
    }

    final detectedVision = best?.supportsVision;
    final detectedReasoning = best?.supportsReasoning;

    return model.copyWith(
      supportsVision: model.overrideSupportsVision ?? detectedVision ?? model.supportsVision,
      supportsReasoning: model.overrideSupportsReasoning ??
          detectedReasoning ??
          model.supportsReasoning,
    );
  }

  static List<String> _tokenize(String input) {
    final lower = input.toLowerCase();
    final tokens = <String>[];
    final buffer = StringBuffer();

    bool? lastIsDigit;

    void flush() {
      if (buffer.isNotEmpty) {
        tokens.add(buffer.toString());
        buffer.clear();
      }
    }

    for (final rune in lower.runes) {
      final ch = String.fromCharCode(rune);
      final isLetter = RegExp(r'[a-z]').hasMatch(ch);
      final isDigit = RegExp(r'[0-9]').hasMatch(ch);

      if (isLetter || isDigit) {
        final currentIsDigit = isDigit;
        if (lastIsDigit != null && lastIsDigit != currentIsDigit) {
          flush();
        }
        buffer.write(ch);
        lastIsDigit = currentIsDigit;
      } else {
        flush();
        lastIsDigit = null;
      }
    }

    flush();
    return tokens;
  }
}

class _ModelRule {
  final List<String> patterns;
  final bool supportsVision;
  final bool supportsReasoning;
  final int priority;
  final bool numberAfter;

  const _ModelRule({
    required this.patterns,
    required this.supportsVision,
    required this.supportsReasoning,
    required this.priority,
    this.numberAfter = false,
  });

  bool matches(List<String> tokens) {
    if (numberAfter && patterns.length == 1 && patterns.first == 'o') {
      for (int i = 0; i < tokens.length - 1; i++) {
        if (tokens[i] == 'o' && RegExp(r'^\d+$').hasMatch(tokens[i + 1])) {
          return true;
        }
      }
      return false;
    }

    int index = 0;
    for (final token in tokens) {
      if (token == patterns[index]) {
        index++;
        if (index == patterns.length) return true;
      }
    }
    return false;
  }
}
```

## File: domain/services/tree_builder.dart
```dart
import '../models/tree_node.dart';

List<TreeNode> buildTree(List<({String id, String? parentId})> topology) {
  if (topology.isEmpty) return [];

  final nodeMap = <String, TreeNode>{
    for (final t in topology)
      t.id: TreeNode(id: t.id, parentId: t.parentId, children: const [], depth: 0),
  };

  final childrenMap = <String, List<String>>{};
  final rootIds = <String>[];

  for (final t in topology) {
    if (t.parentId == null) {
      rootIds.add(t.id);
    } else {
      childrenMap.putIfAbsent(t.parentId!, () => []).add(t.id);
    }
  }

  final roots = <TreeNode>[];
  for (final rootId in rootIds) {
    final root = nodeMap[rootId];
    if (root != null) {
      roots.add(_buildSubtreeIterative(root, childrenMap, nodeMap));
    }
  }
  return roots;
}

TreeNode _buildSubtreeIterative(
  TreeNode root,
  Map<String, List<String>> childrenMap,
  Map<String, TreeNode> nodeMap,
) {
  final postOrder = <TreeNode>[];
  final stack = <TreeNode>[root];
  while (stack.isNotEmpty) {
    final node = stack.removeLast();
    postOrder.add(node);
    for (final cid in childrenMap[node.id] ?? []) {
      final child = nodeMap[cid];
      if (child != null) stack.add(child);
    }
  }

  final updatedMap = <String, TreeNode>{};
  for (int i = postOrder.length - 1; i >= 0; i--) {
    final original = postOrder[i];
    final childIds = childrenMap[original.id] ?? [];
    final builtChildren = <TreeNode>[];
    int maxChildDepth = -1;
    for (final cid in childIds) {
      final builtChild = updatedMap[cid]!;
      builtChildren.add(builtChild);
      if (builtChild.depth > maxChildDepth) maxChildDepth = builtChild.depth;
    }
    updatedMap[original.id] = original.copyWith(
      depth: maxChildDepth + 1,
      children: builtChildren,
    );
  }
  return updatedMap[root.id]!;
}
```

## File: domain/states/chat_state.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

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
    String? currentRoundId,
    String? branchLeafRoundId,
    String? error,
    @Default(false) bool isLoading,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState(
        error: null,
        isLoading: false,
      );
}

extension ChatStateX on ChatState {
  ChatState copyWithCurrentRoundId(String roundId) {
    return copyWith(currentRoundId: roundId);
  }

  ChatState copyWithBranchLeafRoundId(String roundId) {
    return copyWith(branchLeafRoundId: roundId);
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
```

## File: main.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/utils/app_route_observer.dart';
import 'di/providers.dart'; // 仅导入 providers
import 'presentation/pages/home_page.dart';
import 'presentation/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  // ✅ 等待核心环境初始化完成（目录创建、依赖图预热）
  await container.read(localFileSourceProvider.future);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Chat',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      navigatorObservers: [appRouteObserver],
      home: const HomePage(),
    );
  }
}
```

## File: presentation/models/pending_attachment.dart
```dart
class PendingAttachment {
  final String id;
  final String name;
  final String path;
  final bool isImage;
  final String? mimeType;

  const PendingAttachment({
    required this.id,
    required this.name,
    required this.path,
    required this.isImage,
    this.mimeType,
  });
}
```

## File: presentation/pages/branch_tree_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphview/GraphView.dart';
import 'package:intl/intl.dart';

import '../../di/providers.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart' show chatTopologyProvider, roundDetailProvider;
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

class BranchTreePage extends ConsumerStatefulWidget {
  final String fileName;
  final String initialFocusRoundId;

  const BranchTreePage({
    super.key,
    required this.fileName,
    required this.initialFocusRoundId,
  });

  @override
  ConsumerState<BranchTreePage> createState() => _BranchTreePageState();
}

class _BranchTreePageState extends ConsumerState<BranchTreePage> {
  final GlobalKey _viewerKey = GlobalKey();
  final GlobalKey _targetNodeKey = GlobalKey();
  final TransformationController _transformationController = TransformationController();
  
  final BuchheimWalkerConfiguration _builder = BuchheimWalkerConfiguration()
    ..siblingSeparation = 40
    ..levelSeparation = 78
    ..subtreeSeparation = 50
    ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;

  bool _hasFocused = false;

  @override
  void didUpdateWidget(covariant BranchTreePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fileName != widget.fileName || oldWidget.initialFocusRoundId != widget.initialFocusRoundId) {
      _hasFocused = false; // 切换文件/目标时重置聚焦状态
    }
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  String _buildGraphSignature(List<({String id, String? parentId})> topology) {
    if (topology.isEmpty) return 'empty';
    return topology.map((t) => '${t.id}:${t.parentId ?? 'root'}').join('|');
  }

  // 🔑 核心：目标节点完成布局后触发。仅计算一次偏移并 setState 完成最终测量
  void _onTargetLaidOut() {
    if (_hasFocused) return;
    
    final targetCtx = _targetNodeKey.currentContext;
    final viewerCtx = _viewerKey.currentContext;
    if (targetCtx == null || viewerCtx == null) return;

    final targetBox = targetCtx.findRenderObject() as RenderBox?;
    final viewerBox = viewerCtx.findRenderObject() as RenderBox?;
    if (targetBox == null || viewerBox == null || !targetBox.hasSize || !viewerBox.hasSize) return;

    final targetCenter = targetBox.localToGlobal(targetBox.size.center(Offset.zero), ancestor: viewerBox);
    final viewerCenter = viewerBox.size.center(Offset.zero);

    _transformationController.value = Matrix4.identity()
      ..translate(viewerCenter.dx - targetCenter.dx, viewerCenter.dy - targetCenter.dy);

    _hasFocused = true;
    setState(() {}); // 必需：触发 GraphView 二次布局，解决 constrained:false 下的测量缺陷
  }

  Future<void> _deleteNode(String nodeId) async {
    final topology = ref.read(chatTopologyProvider(widget.fileName)).valueOrNull ?? [];
    final roots = buildTree(topology);
    final target = _findIterative(roots, nodeId);
    if (target == null) return;

    final ids = _collectSubtreeIds(target).toList();
    try {
      await ref.read(conversationRepositoryProvider)
          .deleteRoundsAndCleanupOrphanAttachments(widget.fileName, ids);
    } catch (e) {
      if (mounted) AppToast.show('删除失败：$e');
    }
  }

  Future<bool> _confirmDelete() async {
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('删除节点'),
            content: const Text('确定删除这一轮及其后续全部分支吗？'),
            actions: [
              TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
              FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('删除')),
            ],
          ),
        ) ?? false;
  }

  Set<String> _collectSubtreeIds(TreeNode root) {
    final ids = <String>{};
    final stack = <TreeNode>[root];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      ids.add(node.id);
      stack.addAll(node.children);
    }
    return ids;
  }

  TreeNode? _findIterative(List<TreeNode> roots, String targetId) {
    final stack = [...roots];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      if (node.id == targetId) return node;
      stack.addAll(node.children);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final topology = ref.watch(chatTopologyProvider(widget.fileName)).valueOrNull ?? [];
    final roots = buildTree(topology);
    final graphSignature = _buildGraphSignature(topology);
    final targetId = widget.initialFocusRoundId;

    return AppPageScaffold(
      appBar: AppBar(title: const Text('分支树')),
      body: roots.isEmpty
          ? const Center(child: Text('暂无分支结构'))
          : InteractiveViewer(
              key: _viewerKey,
              constrained: false,
              boundaryMargin: const EdgeInsets.all(100), // 适度边界替代无限边界，防止手势漂移
              minScale: 0.1,
              maxScale: 3.0,
              transformationController: _transformationController,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: RepaintBoundary( // 🔑 隔离 setState 重建，保护 InteractiveViewer 手势状态
                  child: Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: roots.map((root) => _RootTreeGroup(
                      key: ValueKey('root-${root.id}-$graphSignature'),
                      root: root,
                      graphSignature: graphSignature,
                      builderConfig: _builder,
                      targetNodeId: targetId,
                      targetNodeKey: _targetNodeKey,
                      onTargetLaidOut: _onTargetLaidOut,
                      onSwitch: (id) => Navigator.of(context).pop(id),
                      onDelete: (id) async {
                        if (await _confirmDelete()) await _deleteNode(id);
                      },
                    )).toList(),
                  ),
                ),
              ),
            ),
    );
  }
}

class _RootTreeGroup extends StatelessWidget {
  final TreeNode root;
  final String graphSignature;
  final BuchheimWalkerConfiguration builderConfig;
  final void Function(String id) onSwitch;
  final void Function(String id) onDelete;
  final String? targetNodeId;
  final GlobalKey? targetNodeKey;
  final VoidCallback? onTargetLaidOut;

  const _RootTreeGroup({
    super.key,
    required this.root,
    required this.graphSignature,
    required this.builderConfig,
    required this.onSwitch,
    required this.onDelete,
    this.targetNodeId,
    this.targetNodeKey,
    this.onTargetLaidOut,
  });

  @override
  Widget build(BuildContext context) {
    final graph = Graph()..isTree = true;
    final nodeMap = <String, Node>{};
    final graphToTree = <Node, TreeNode>{};
    final stack = <TreeNode>[root];

    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      final gNode = Node.Id('${root.id}-${node.id}-$graphSignature');
      nodeMap[node.id] = gNode;
      graphToTree[gNode] = node;
      graph.addNode(gNode);
      if (node.parentId != null) {
        final parent = nodeMap[node.parentId!];
        if (parent != null) graph.addEdge(parent, gNode);
      }
      stack.addAll(node.children.reversed);
    }

    return GraphView(
      key: ValueKey('graph-${root.id}-$graphSignature'),
      graph: graph,
      animated: false,
      algorithm: BuchheimWalkerAlgorithm(builderConfig, TreeEdgeRenderer(builderConfig)),
      paint: Paint()
        ..color = Theme.of(context).dividerColor
        ..strokeWidth = 1.6
        ..style = PaintingStyle.stroke,
      builder: (Node node) {
        final tree = graphToTree[node];
        if (tree == null) return const SizedBox.shrink();

        final isTarget = targetNodeId != null && tree.id == targetNodeId;
        final child = _GraphNodeShell(
          roundId: tree.id,
          onSwitch: () => onSwitch(tree.id),
          onDelete: () => onDelete(tree.id),
        );

        return isTarget
            ? _NodeAnchor(key: targetNodeKey, onLaidOut: onTargetLaidOut, child: child)
            : child;
      },
    );
  }
}

class _NodeAnchor extends StatefulWidget {
  final Widget child;
  final VoidCallback? onLaidOut;
  const _NodeAnchor({super.key, required this.child, this.onLaidOut});

  @override
  State<_NodeAnchor> createState() => _NodeAnchorState();
}

class _NodeAnchorState extends State<_NodeAnchor> {
  Size? _lastSize;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || widget.onLaidOut == null) return;
      final box = context.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize || box.size.isEmpty) return;
      if (_lastSize == box.size) return;
      _lastSize = box.size;
      widget.onLaidOut!();
    });
    return widget.child;
  }
}

class _GraphNodeShell extends ConsumerWidget {
  final String roundId;
  final VoidCallback onSwitch;
  final VoidCallback onDelete;

  const _GraphNodeShell({required this.roundId, required this.onSwitch, required this.onDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId)).valueOrNull;
    final dateText = round == null ? null : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(round.createdAt));
    final userText = round?.userContent;
    final aiText = round == null ? null : ((round.assistantContent ?? '').trim().isEmpty ? '（等待回复）' : round.assistantContent!);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 290,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                child: dateText == null
                    ? const _SkeletonBar(width: 160, height: 14)
                    : Align(alignment: Alignment.centerLeft, child: Text(dateText, style: Theme.of(context).textTheme.bodySmall)),
              ),
              const SizedBox(height: 12),
              _PreviewSlot(label: 'YOU', content: userText, loading: round == null),
              const SizedBox(height: 8),
              _PreviewSlot(label: 'AI', content: aiText, loading: round == null),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(child: FilledButton.tonal(onPressed: onSwitch, child: const Text('切换到此分支'))),
                  IconButton(onPressed: onDelete, icon: const Icon(Icons.delete_outline)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewSlot extends StatelessWidget {
  final String label;
  final String? content;
  final bool loading;
  const _PreviewSlot({required this.label, required this.content, required this.loading});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 78,
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 34, child: Text('$label ', style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700))),
              Expanded(
                child: loading
                    ? const _PreviewSkeleton()
                    : Text((content == null || content!.trim().isEmpty) ? '（空）' : content!, maxLines: 3, overflow: TextOverflow.ellipsis, style: textTheme.bodySmall),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewSkeleton extends StatelessWidget {
  const _PreviewSkeleton();
  @override
  Widget build(BuildContext context) {
    return const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _SkeletonBar(widthFactor: 0.92), SizedBox(height: 8), _SkeletonBar(widthFactor: 0.76), SizedBox(height: 8), _SkeletonBar(widthFactor: 0.58),
    ]);
  }
}

class _SkeletonBar extends StatelessWidget {
  final double? width;
  final double height;
  final double? widthFactor;
  const _SkeletonBar({this.width, this.height = 12, this.widthFactor});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;
    Widget child = Container(width: width, height: height, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)));
    if (widthFactor != null) child = FractionallySizedBox(widthFactor: widthFactor, alignment: Alignment.centerLeft, child: child);
    return child;
  }
}
```

## File: presentation/pages/chat_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/app_route_observer.dart';
import 'package:intl/intl.dart';
import '../providers/chat_notifier.dart';
import '../providers/config_notifier.dart';
import '../providers/input_draft_provider.dart';
import '../widgets/attachment_list.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/thought_bubble.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import 'branch_tree_page.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String fileName;
  final String? initialRoundId;
  final String? initialMessage;
  final List<dynamic>? initialAttachments;

  const ChatPage({
    super.key,
    required this.fileName,
    this.initialRoundId,
    this.initialMessage,
    this.initialAttachments,
  });

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> with RouteAware {
  PageController? _pageController;
  bool _initialMessageHandled = false;
  bool _isRouteVisible = false;
  ModalRoute<dynamic>? _route;

  String? _branchLeafId;
  String? _currentRoundId;

  @override
  void initState() {
    super.initState();
    _branchLeafId = widget.initialRoundId;
    _currentRoundId = widget.initialRoundId;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _subscribeRoute();
    _handleInitialMessage();
  }

  void _handleInitialMessage() async {
    if (_initialMessageHandled || widget.initialMessage == null) return;
    _initialMessageHandled = true;

    try {
      final newId =
          await ref.read(chatControllerProvider(widget.fileName)).sendMessage(
                content: widget.initialMessage!,
                parentRoundId: _currentRoundId,
                attachments: widget.initialAttachments?.cast() ?? [],
              );
      _updateBranch(newId);
    } catch (e) {
      AppToast.show('发送失败：$e');
    }
  }

  void _subscribeRoute() {
    final route = ModalRoute.of(context);
    if (route != _route && route is PageRoute) {
      if (_route != null) appRouteObserver.unsubscribe(this);
      _route = route;
      appRouteObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    _pageController?.dispose();
    super.dispose();
  }

  void _updateBranch(String leafId) {
    if (!mounted) return;
    setState(() {
      _branchLeafId = leafId;
      _currentRoundId = leafId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sessionTitle = ref.watch(sessionTitleProvider(widget.fileName)).valueOrNull ?? '未加载';
    final currentRoundAsync = ref.watch(roundDetailProvider(_currentRoundId ?? ''));
    final isStreaming = currentRoundAsync.valueOrNull?.isIncomplete ?? false;
    final configAsync = ref.watch(configProvider);
    final editSourceRoundId = ref.watch(globalEditSourceRoundIdProvider);
    final isEditMode = editSourceRoundId != null;

    final currentConfig = configAsync.valueOrNull;
    final selectedModelId = currentConfig?.selectedModel;
    final selectedModel = currentConfig?.availableModels
        ?.where((m) => m.id == selectedModelId)
        .firstOrNull;
    final allowImages = selectedModel?.supportsVision == true;

    if (_branchLeafId == null) {
      final topology = ref.watch(chatTopologyProvider(widget.fileName)).valueOrNull;
      if (topology != null && topology.isNotEmpty) {
        _branchLeafId = topology.last.id;
        _currentRoundId = _branchLeafId;
      }
    }

    final visibleRoundIds = ref.watch(visibleRoundIdsProvider((
      fileName: widget.fileName,
      roundId: _branchLeafId,
    )));

    int currentIndex = visibleRoundIds.indexOf(_currentRoundId ?? '');
    if (currentIndex == -1 && visibleRoundIds.isNotEmpty) {
      currentIndex = visibleRoundIds.length - 1;
    }

    if (visibleRoundIds.isNotEmpty) {
      _pageController ??= PageController(initialPage: currentIndex);
      if (_pageController!.hasClients &&
          _pageController!.page?.round() != currentIndex) {
        _pageController!.jumpToPage(currentIndex);
      }
    }

    return AppPageScaffold(
      appBar: AppBar(
        title: Text(sessionTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_tree_outlined),
            onPressed: (isEditMode || _currentRoundId == null)
                ? null
                : () async {
                    final selectedId =
                        await Navigator.of(context).push<String>(
                      MaterialPageRoute(
                        builder: (_) => BranchTreePage(
                          fileName: widget.fileName,
                          initialFocusRoundId: _currentRoundId!,
                        ),
                      ),
                    );
                    if (selectedId != null) _updateBranch(selectedId);
                  },
          ),
        ],
      ),
      body: Column(
        children: [
          if (visibleRoundIds.isNotEmpty)
            _PaginationBar(
              currentIndex: currentIndex,
              totalPages: visibleRoundIds.length,
              onPrev: (currentIndex > 0 && !isEditMode)
                  ? () => _pageController?.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutCubic,
                      )
                  : null,
              onNext: (currentIndex < visibleRoundIds.length - 1 && !isEditMode)
                  ? () => _pageController?.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutCubic,
                      )
                  : null,
              isEditMode: isEditMode,
            ),
          if (isEditMode)
            MaterialBanner(
              content: const Text('正在编辑，发送前不可切换页面'),
              actions: [
                TextButton(
                  onPressed: () => _setEditMode(null, ''),
                  child: const Text('取消'),
                ),
              ],
            ),
          Expanded(
            child: visibleRoundIds.isEmpty
                ? const Center(child: Text('新对话'))
                : PageView.builder(
                    controller: _pageController,
                    physics: isEditMode
                        ? const NeverScrollableScrollPhysics()
                        : const PageScrollPhysics(),
                    itemCount: visibleRoundIds.length,
                    onPageChanged: (index) {
                      final targetId = visibleRoundIds[index];
                      setState(() => _currentRoundId = targetId);
                      _markAsSeen(targetId);
                    },
                    itemBuilder: (_, index) => _ChatRoundPage(
                      key: ValueKey(visibleRoundIds[index]),
                      fileName: widget.fileName,
                      roundId: visibleRoundIds[index],
                      onRetryReply: () => _retry(visibleRoundIds[index]),
                      onEdit: (text) => _setEditMode(visibleRoundIds[index], text),
                    ),
                  ),
          ),
          InputBar(
            hintText: isEditMode ? '编辑并重试' : '发送消息',
            allowImages: allowImages,
            isStreaming: isStreaming,
            onStop: () => ref
                .read(chatControllerProvider(widget.fileName))
                .stopGeneration(_currentRoundId!),
            onSend: (text, attachments) async {
              final controller = ref.read(chatControllerProvider(widget.fileName));
              final newId = isEditMode
                  ? await controller.editAndResendFromRound(
                      editSourceRoundId,
                      text,
                      attachments: attachments,
                    )
                  : await controller.sendMessage(
                      content: text,
                      parentRoundId: _currentRoundId,
                      attachments: attachments,
                    );
              _updateBranch(newId);
              _setEditMode(null, '');
            },
          ),
        ],
      ),
    );
  }

  void _markAsSeen(String roundId) {
    if (!_isRouteVisible) return;
    final roundAsync = ref.read(roundDetailProvider(roundId));
    final round = roundAsync.valueOrNull;  
    if (round?.hasUnseenUpdate == true) {
      ref.read(chatControllerProvider(widget.fileName)).markRoundSeen(round!);
    }
  }

  void _retry(String roundId) async {
    final newId =
        await ref.read(chatControllerProvider(widget.fileName)).retryFromRound(roundId);
    _updateBranch(newId);
  }

  void _setEditMode(String? roundId, String text) {
    ref.read(globalEditSourceRoundIdProvider.notifier).state = roundId;
    ref.read(globalInputDraftProvider.notifier).state = text;
  }

  @override
  void didPush() => _isRouteVisible = true;

  @override
  void didPopNext() {
    _isRouteVisible = true;
    if (_currentRoundId != null) _markAsSeen(_currentRoundId!);
  }

  @override
  void didPushNext() => _isRouteVisible = false;
}

class _ChatRoundPage extends StatelessWidget {
  final String fileName;
  final String roundId;
  final VoidCallback onRetryReply;
  final Function(String) onEdit;

  const _ChatRoundPage({
    super.key,
    required this.fileName,
    required this.roundId,
    required this.onRetryReply,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _UserSection(
                  roundId: roundId,
                  onEdit: onEdit,
                  onRetryReply: onRetryReply,
                ),
                _ThinkingSection(roundId: roundId),
                _AiReplySection(
                  roundId: roundId,
                  onRetryReply: onRetryReply,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _UserSection extends ConsumerWidget {
  final String roundId;
  final Function(String) onEdit;
  final VoidCallback onRetryReply;

  const _UserSection({
    required this.roundId,
    required this.onEdit,
    required this.onRetryReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId).select((s) {
      final r = s.valueOrNull;
      return r == null
          ? null
          : (
              content: r.userContent,
              time: r.createdAt,
              attach: r.userAttachments,
              inc: r.isIncomplete
            );
    }));

    if (round == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Chip(label: Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(round.time)))),
        const SizedBox(height: 12),
        MessageBubble(
          content: round.content,
          isUser: true,
          onEdit: round.inc ? null : () => onEdit(round.content),
          onCopy: () => Clipboard.setData(ClipboardData(text: round.content)),
        ),
        if (round.attach.isNotEmpty) ...[
          const SizedBox(height: 8),
          AttachmentList(attachments: round.attach),
        ],
      ],
    );
  }
}

class _ThinkingSection extends ConsumerWidget {
  final String roundId;

  const _ThinkingSection({required this.roundId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thinking = ref.watch(
      roundDetailProvider(roundId).select((s) => s.valueOrNull?.assistantThinking),
    );
    if (thinking == null || thinking.trim().isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        const Divider(height: 32),
        ThoughtBubble(content: thinking),
      ],
    );
  }
}

class _AiReplySection extends ConsumerWidget {
  final String roundId;
  final VoidCallback onRetryReply;

  const _AiReplySection({
    required this.roundId,
    required this.onRetryReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ai = ref.watch(roundDetailProvider(roundId).select((s) {
      final r = s.valueOrNull;
      return r == null
          ? null
          : (content: r.assistantContent, isIncomplete: r.isIncomplete);
    }));

    if (ai == null || (ai.content == null && !ai.isIncomplete)) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 32),
        if (ai.content != null)
          MessageBubble(
            content: ai.content!,
            isUser: false,
            onRetryReply: ai.isIncomplete ? null : onRetryReply,
            onCopy: () => Clipboard.setData(ClipboardData(text: ai.content!)),
          )
        else
          const Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
      ],
    );
  }
}

class _PaginationBar extends StatelessWidget {
  final int currentIndex, totalPages;
  final VoidCallback? onPrev, onNext;
  final bool isEditMode;

  const _PaginationBar({
    required this.currentIndex,
    required this.totalPages,
    this.onPrev,
    this.onNext,
    required this.isEditMode,
  });

  @override
  Widget build(BuildContext context) {
    final displayPage = currentIndex + 1;
    final progress = totalPages == 0 ? 0.0 : displayPage.clamp(1, totalPages) / totalPages;
    final pageText = totalPages == 0 ? '0 / 0' : '$displayPage / $totalPages';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: [
          IconButton(onPressed: onPrev, icon: const Icon(Icons.chevron_left)),
          Expanded(
            child: Column(
              children: [
                Text(
                  pageText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(value: progress),
              ],
            ),
          ),
          IconButton(onPressed: onNext, icon: const Icon(Icons.chevron_right)),
        ],
      ),
    );
  }
}
```

## File: presentation/pages/home_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../../domain/models/session_list_item.dart';
import '../providers/config_notifier.dart';
import '../providers/session_list_notifier.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/input_bar.dart';
import 'chat_page.dart';
import 'settings_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Future<void> _showRenameDialog(
    BuildContext context,
    SessionListController controller,
    SessionListItem item,
  ) async {
    final controllerText = TextEditingController(text: item.title);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('重命名会话'),
        content: TextField(
          controller: controllerText,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '输入新的会话名称',
          ),
          onSubmitted: (value) => Navigator.of(ctx).pop(value.trim()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(controllerText.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );
    if (result != null && result.isNotEmpty && result != item.title) {
      await controller.updateSessionTitle('${item.id}.json', result);
    }
  }

  Future<void> _showDeleteConfirmDialog(
    BuildContext context,
    SessionListController controller,
    SessionListItem item,
  ) async {
    final colorScheme = Theme.of(context).colorScheme;
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('删除会话'),
            content: Text('确定要删除 “${item.title}” 吗？\n此操作无法撤销。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.error,
                  foregroundColor: colorScheme.onError,
                ),
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;

    if (confirmed == true) {
      await controller.deleteSession('${item.id}.json');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(sessionListProvider);
    final controller = ref.read(sessionListControllerProvider);
    final configAsync = ref.watch(configProvider);

    final currentConfig = configAsync.valueOrNull;
    final selectedModelId = currentConfig?.selectedModel;
    final selectedModel = currentConfig?.availableModels
        ?.where((m) => m.id == selectedModelId)
        .firstOrNull;
    final allowImages = selectedModel?.supportsVision == true;

    return AppPageScaffold(
      appBar: AppBar(
        title: const Text('AI Chat'),
        actions: [
          IconButton(
            tooltip: '设置',
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: sessionsAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (e, st) => _HomeErrorState(
                message: '加载会话失败：$e',
                onRetry: () async {
                  ref.invalidate(sessionListProvider);
                },
              ),
              data: (items) {
                if (items.isEmpty) {
                  return const _HomeEmptyState();
                }
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  itemCount: items.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _SessionCard(
                      item: item,
                      controller: controller,
                      onRename: (item) =>
                          _showRenameDialog(context, controller, item),
                      onDelete: (item) =>
                          _showDeleteConfirmDialog(context, controller, item),
                    );
                  },
                );
              },
            ),
          ),
          InputBar(
            hintText: '发送消息',
            allowImages: allowImages,
            onSend: (content, attachments) async {
              final newFileName = await controller.createSession('新对话');
              if (context.mounted) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatPage(
                      fileName: newFileName,
                      initialMessage: content,
                      initialAttachments: attachments,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _HomeEmptyState extends StatelessWidget {
  const _HomeEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.auto_awesome_outlined, size: 40),
                SizedBox(height: 16),
                Text(
                  '开始你的第一段对话',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                Text(
                  '在下方输入问题，系统会自动创建一个新会话。\n你也可以附加图片或文件开始交流。',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeErrorState extends StatelessWidget {
  final String message;
  final Future<void> Function() onRetry;

  const _HomeErrorState({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 40,
                  color: colorScheme.error,
                ),
                const SizedBox(height: 12),
                const Text(
                  '出现了一点问题',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  label: const Text('重试'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SessionCard extends ConsumerWidget {
  final SessionListItem item;
  final SessionListController controller;
  final Future<void> Function(SessionListItem item) onRename;
  final Future<void> Function(SessionListItem item) onDelete;

  const _SessionCard({
    required this.item,
    required this.controller,
    required this.onRename,
    required this.onDelete,
  });

  Widget _buildMetaChip(String label, {IconData? icon}) {
    return Chip(
      avatar: icon == null ? null : Icon(icon, size: 16),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileName = '${item.id}.json';
    final updatedAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(item.updatedAt));
    final metaAsync = ref.watch(sessionCardMetaProvider(item.id));

    return metaAsync.when(
      loading: () {
        return Card(
          child: ListTile(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPage(fileName: fileName),
                ),
              );
            },
            leading: const Icon(Icons.forum_outlined),
            title: Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('加载中...'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildMetaChip(updatedAt, icon: Icons.schedule_outlined),
                    ],
                  ),
                ],
              ),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        );
      },
      error: (e, st) {
        return Card(
          child: ListTile(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPage(fileName: fileName),
                ),
              );
            },
            leading: const Icon(Icons.forum_outlined),
            title: Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('加载摘要失败'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildMetaChip(updatedAt, icon: Icons.schedule_outlined),
                    ],
                  ),
                ],
              ),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        );
      },
      data: (meta) {
        return Slidable(
          key: ValueKey(fileName),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.34,
            children: [
              CustomSlidableAction(
                onPressed: (_) => onRename(item),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: const Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                ),
              ),
              CustomSlidableAction(
                onPressed: (_) => onDelete(item),
                backgroundColor: Theme.of(context).colorScheme.error,
                child: Icon(
                  Icons.delete_outline,
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
            ],
          ),
          child: Card(
            child: ListTile(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatPage(
                      fileName: fileName,
                      initialRoundId: meta.previewRoundId,
                    ),
                  ),
                );
              },
              leading: const Icon(Icons.forum_outlined),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (meta.isStreaming) ...[
                    const SizedBox(width: 8),
                    _buildMetaChip('生成中', icon: Icons.bolt_outlined),
                  ],
                  if (meta.hasUnseen) ...[
                    const SizedBox(width: 8),
                    _buildMetaChip('未查看', icon: Icons.mark_chat_unread_outlined),
                  ],
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PreviewLine(
                      label: 'YOU',
                      text: meta.userPreview,
                    ),
                    const SizedBox(height: 4),
                    _PreviewLine(
                      label: 'AI',
                      text: meta.aiPreview,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildMetaChip(
                          '${meta.roundCount} 轮',
                          icon: Icons.chat_bubble_outline,
                        ),
                        _buildMetaChip(
                          updatedAt,
                          icon: Icons.schedule_outlined,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),
          ),
        );
      },
    );
  }
}

class _PreviewLine extends StatelessWidget {
  final String label;
  final String text;

  const _PreviewLine({
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label  ',
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
```

## File: presentation/pages/settings_page.dart
```dart
import 'package:aiservice/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/models/model_info.dart';
import '../providers/config_notifier.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_section.dart';
import '../widgets/common/app_toast.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  static const String _defaultModelsPath = 'v1/models';

  final _formKey = GlobalKey<FormBuilderState>();
  bool _isPatching = false;
  bool _isModelListExpanded = false;

  String _defaultChatPathForApiMode(String apiMode) {
    return apiMode == 'responses' ? 'v1/responses' : 'v1/chat/completions';
  }

  ModelInfo? _findModel(AppConfig config, String? modelId) {
    final id = modelId?.trim() ?? '';
    if (id.isEmpty) return null;
    return config.availableModels?.where((m) => m.id == id).firstOrNull;
  }

  bool _effectiveReasoningSwitch(ModelInfo? model) {
    return model?.overrideSupportsReasoning ??
        model?.supportsReasoning ??
        false;
  }

  bool _effectiveVisionSwitch(ModelInfo? model) {
    return model?.overrideSupportsVision ??
        model?.supportsVision ??
        false;
  }

  void _patchForm(AppConfig config) {
    final form = _formKey.currentState;
    if (form == null) return;

    final selectedModelId = config.selectedModel ?? '';
    final model = _findModel(config, selectedModelId);

    _isPatching = true;
    form.patchValue({
      'baseUrl': config.baseUrl,
      'apiKey': config.apiKey,
      'modelsPath': config.modelsPath,
      'chatPath': config.chatPath,
      'apiMode': config.apiMode,
      'selectedModel': selectedModelId,
      'overrideSupportsReasoning': _effectiveReasoningSwitch(model),
      'overrideSupportsVision': _effectiveVisionSwitch(model),
    });
    _isPatching = false;
  }

  void _patchModelCapabilityFields(AppConfig config, String? modelId) {
    final form = _formKey.currentState;
    if (form == null) return;

    final model = _findModel(config, modelId);

    _isPatching = true;
    form.patchValue({
      'overrideSupportsReasoning': _effectiveReasoningSwitch(model),
      'overrideSupportsVision': _effectiveVisionSwitch(model),
    });
    _isPatching = false;
  }

  Future<void> _save(AppConfig currentConfig) async {
    final form = _formKey.currentState;
    if (form == null) return;
    if (!form.saveAndValidate()) return;

    final values = form.value;

    final selectedModelId = (values['selectedModel'] as String? ?? '').trim();
    final overrideSupportsReasoning =
        values['overrideSupportsReasoning'] as bool? ?? false;
    final overrideSupportsVision =
        values['overrideSupportsVision'] as bool? ?? false;

    final models = [...(currentConfig.availableModels ?? const <ModelInfo>[])];

    if (selectedModelId.isNotEmpty) {
      final index = models.indexWhere((m) => m.id == selectedModelId);
      final baseModel =
          index >= 0 ? models[index] : ModelInfo(id: selectedModelId);

      final updatedModel = baseModel.copyWith(
        overrideSupportsReasoning: overrideSupportsReasoning,
        overrideSupportsVision: overrideSupportsVision,
        supportsVision: overrideSupportsVision,
        supportsReasoning: overrideSupportsReasoning,
      );

      if (index >= 0) {
        models[index] = updatedModel;
      } else {
        models.add(updatedModel);
      }
    }

    final nextApiMode = values['apiMode'] as String? ?? currentConfig.apiMode;
    final rawModelsPath = (values['modelsPath'] as String? ?? '').trim();
    final rawChatPath = (values['chatPath'] as String? ?? '').trim();

    final updatedConfig = currentConfig.copyWith(
      baseUrl: (values['baseUrl'] as String? ?? '').trim(),
      apiKey: (values['apiKey'] as String? ?? '').trim(),
      modelsPath: rawModelsPath.isEmpty ? _defaultModelsPath : rawModelsPath,
      chatPath: rawChatPath.isEmpty
          ? _defaultChatPathForApiMode(nextApiMode)
          : rawChatPath,
      apiMode: nextApiMode,
      selectedModel: selectedModelId.isEmpty ? null : selectedModelId,
      availableModels: models,
    );

    await ref.read(configServiceProvider).saveConfig(updatedConfig);
    await AppToast.show('设置已保存');
  }

  @override
  Widget build(BuildContext context) {
    final configAsync = ref.watch(configProvider);
    final profilesAsync = ref.watch(configProfilesProvider);

    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      next.whenData((config) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _patchForm(config);
        });
      });
    });

    return AppPageScaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: profilesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载配置存档失败：$e')),
        data: (store) {
          return configAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('加载配置失败：$e')),
            data: (config) {
              return FormBuilder(
                key: _formKey,
                initialValue: {
                  'baseUrl': config.baseUrl,
                  'apiKey': config.apiKey,
                  'modelsPath': config.modelsPath,
                  'chatPath': config.chatPath,
                  'apiMode': config.apiMode,
                  'selectedModel': config.selectedModel ?? '',
                  'overrideSupportsReasoning': _effectiveReasoningSwitch(
                    _findModel(config, config.selectedModel),
                  ),
                  'overrideSupportsVision': _effectiveVisionSwitch(
                    _findModel(config, config.selectedModel),
                  ),
                },
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildProfileSection(store),
                    _buildConnectionSection(config),
                    _buildModelSection(config),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _patchForm(config),
                            child: const Text('重置'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton(
                            onPressed: () => _save(config),
                            child: const Text('保存'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: _confirmRestoreDefaults,
                      child: const Text('恢复默认'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProfileSection(AppConfigStore store) {
    return AppSection(
      title: '配置存档',
      subtitle: '切换后表单会刷新为该存档内容',
      children: [
        DropdownButtonFormField<String>(
          value: store.activeProfileId,
          decoration: const InputDecoration(labelText: '当前配置存档'),
          items: store.profiles
              .map((p) => DropdownMenuItem(value: p.id, child: Text(p.name)))
              .toList(),
          onChanged: (value) async {
            if (value == null) return;
            await ref.read(configServiceProvider).switchProfile(value);
          },
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          children: [
            OutlinedButton(
              onPressed: _showCreateProfileDialog,
              child: const Text('新建'),
            ),
            OutlinedButton(
              onPressed: () {
                final profile = store.profiles.firstWhere(
                  (p) => p.id == store.activeProfileId,
                );
                _showRenameProfileDialog(profile);
              },
              child: const Text('重命名'),
            ),
            OutlinedButton(
              onPressed: () {
                final profile = store.profiles.firstWhere(
                  (p) => p.id == store.activeProfileId,
                );
                _deleteProfile(profile, store.profiles.length);
              },
              child: const Text('删除'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildConnectionSection(AppConfig config) {
    return AppSection(
      title: '连接配置',
      children: [
        FormBuilderTextField(
          name: 'baseUrl',
          decoration: const InputDecoration(
            labelText: 'Base URL',
            hintText: 'https://api.openai.com',
          ),
        ),
        const SizedBox(height: 12),
        FormBuilderTextField(
          name: 'apiKey',
          decoration: const InputDecoration(labelText: 'API Key'),
        ),
        const SizedBox(height: 12),
        FormBuilderTextField(
          name: 'modelsPath',
          decoration: const InputDecoration(
            labelText: 'Models Path',
            hintText: _defaultModelsPath,
          ),
        ),
        const SizedBox(height: 12),
        FormBuilderTextField(
          name: 'chatPath',
          decoration: InputDecoration(
            labelText: 'Chat Path',
            hintText: _defaultChatPathForApiMode(config.apiMode),
          ),
        ),
        const SizedBox(height: 12),
        FormBuilderDropdown<String>(
          name: 'apiMode',
          decoration: const InputDecoration(labelText: 'API Mode'),
          items: const [
            DropdownMenuItem(
              value: 'chat_completions',
              child: Text('chat_completions'),
            ),
            DropdownMenuItem(
              value: 'responses',
              child: Text('responses'),
            ),
          ],
          onChanged: (value) {
            if (_isPatching || value == null) return;
            final chatPathField = _formKey.currentState?.fields['chatPath'];
            final current = (chatPathField?.value as String? ?? '').trim();
            if (current.isEmpty) {
              _isPatching = true;
              _formKey.currentState?.patchValue({
                'chatPath': _defaultChatPathForApiMode(value),
              });
              _isPatching = false;
            }
          },
        ),
      ],
    );
  }

  Widget _buildModelSection(AppConfig config) {
    final models = config.availableModels ?? const <ModelInfo>[];

    return AppSection(
      title: '当前模型',
      subtitle: '可直接输入自定义模型 ID，下方能力开关将保存到该模型',
      children: [
        FormBuilderTextField(
          name: 'selectedModel',
          decoration: const InputDecoration(
            labelText: '模型 ID',
            hintText: '输入模型 ID',
          ),
          onChanged: (value) {
            if (_isPatching) return;
            _patchModelCapabilityFields(config, value);
          },
        ),
        const SizedBox(height: 12),
        if (models.isNotEmpty) ...[
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              setState(() {
                _isModelListExpanded = !_isModelListExpanded;
              });
            },
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: '已同步模型快捷选择',
                border: OutlineInputBorder(),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _isModelListExpanded ? '点击收起模型列表' : '点击展开模型列表',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Icon(
                    _isModelListExpanded
                        ? Icons.expand_less
                        : Icons.expand_more,
                  ),
                ],
              ),
            ),
          ),
          if (_isModelListExpanded) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: models.map((model) {
                final label = (model.name ?? '').trim().isNotEmpty
                    ? '${model.name} (${model.id})'
                    : model.id;
                return ActionChip(
                  label: Text(label),
                  onPressed: () {
                    _isPatching = true;
                    _formKey.currentState?.patchValue({
                      'selectedModel': model.id,
                    });
                    _isPatching = false;
                    _patchModelCapabilityFields(config, model.id);
                    setState(() {
                      _isModelListExpanded = false;
                    });
                  },
                );
              }).toList(),
            ),
          ],
          const SizedBox(height: 12),
        ],
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton(
            onPressed: _refreshModels,
            child: const Text('同步模型'),
          ),
        ),
        const SizedBox(height: 16),
        FormBuilderSwitch(
          name: 'overrideSupportsReasoning',
          title: const Text('该模型启用思考'),
        ),
        FormBuilderSwitch(
          name: 'overrideSupportsVision',
          title: const Text('该模型允许图片输入'),
        ),
      ],
    );
  }

  Future<void> _refreshModels() async {
    try {
      await ref.read(configServiceProvider).refreshModels();
      await AppToast.show('模型列表已同步');
    } catch (e) {
      await AppToast.show('同步模型失败：$e');
    }
  }

  Future<void> _confirmRestoreDefaults() async {
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('恢复默认设置'),
            content: const Text('确定要将当前配置存档恢复为默认设置吗？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: const Text('恢复默认'),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed) return;

    await ref.read(configServiceProvider).saveConfig(AppConfig.defaultConfig());
  }

  Future<void> _showCreateProfileDialog() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('新建配置存档'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: '输入配置名称'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
            child: const Text('创建'),
          ),
        ],
      ),
    );

    if (result == null || result.isEmpty) return;
    await ref.read(configServiceProvider).createProfile(result);
  }

  Future<void> _showRenameProfileDialog(ConfigProfile profile) async {
    final controller = TextEditingController(text: profile.name);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('重命名配置存档'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: '输入配置名称'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );

    if (result == null || result.isEmpty) return;
    await ref
        .read(configServiceProvider)
        .renameProfile(profile.id, result);
  }

  Future<void> _deleteProfile(ConfigProfile profile, int profileCount) async {
    if (profileCount <= 1) {
      await AppToast.show('至少保留一个配置存档');
      return;
    }

    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('删除配置存档'),
            content: Text('确定删除 "${profile.name}" 吗？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed) return;
    await ref.read(configServiceProvider).deleteProfile(profile.id);
  }
}
```

## File: presentation/pages/text_attachment_viewer_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

class TextAttachmentViewerPage extends StatelessWidget {
  final String title;
  final String content;

  const TextAttachmentViewerPage({
    super.key,
    required this.title,
    required this.content,
  });

  Future<void> _copyAll() async {
    await Clipboard.setData(ClipboardData(text: content));
    await AppToast.show('全文已复制');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppPageScaffold(
      appBar: AppBar(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            tooltip: '复制全文',
            onPressed: _copyAll,
            icon: const Icon(Icons.content_copy_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SelectableText(
              content,
              style: textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

## File: presentation/providers/attachment_bytes_provider.dart
```dart
// presentation/providers/attachment_bytes_provider.dart

import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';

// 使用 autoDispose，组件销毁时自动释放内存
final attachmentBytesProvider =
    FutureProvider.autoDispose.family<Uint8List, String>(
  (ref, relativePath) async {
    final repository = ref.read(conversationRepositoryProvider);
    return repository.getAttachment(relativePath);
  },
);
```

## File: presentation/providers/chat_notifier.dart
```dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../di/providers.dart';
import '../../domain/services/attachment_preparer.dart';
import '../../domain/services/chat_context_builder.dart';
import 'package:uuid/uuid.dart';

final sessionTitleProvider = StreamProvider.family<String, String>((ref, fileName) {
  return ref.watch(conversationRepositoryProvider).watchSessionTitle(fileName)
      .map((title) => title ?? '对话');
});

final chatTopologyProvider =
    StreamProvider.family<List<({String id, String? parentId})>, String>(
  (ref, fileName) {
    return ref.watch(conversationRepositoryProvider).watchSessionTopology(fileName);
  },
);

final roundDetailProvider = StreamProvider.family<ChatRound?, String>((ref, roundId) {
  return ref.watch(conversationRepositoryProvider).watchSingleRound(roundId);
});

final visibleRoundIdsProvider =
    Provider.family<List<String>, ({String fileName, String? roundId})>(
  (ref, args) {
    final topology = ref.watch(chatTopologyProvider(args.fileName)).valueOrNull ?? [];
    if (args.roundId == null) return const [];

    final idToParent = {for (var t in topology) t.id: t.parentId};
    final path = <String>[];
    String? currentId = args.roundId;

    while (currentId != null && idToParent.containsKey(currentId)) {
      path.add(currentId);
      currentId = idToParent[currentId];
    }
    return path.reversed.toList();
  },
);

class ChatController {
  final Ref ref;
  final String fileName;
  final Set<String> _stoppingRoundIds = {};

  ChatController(this.ref, this.fileName);

  Future<String> sendMessage({
    required String content,
    required String? parentRoundId,
    List<dynamic>? attachments,
  }) async {
    final repository = ref.read(conversationRepositoryProvider);
    final saved = await savePendingAttachments(
      repository,
      attachments?.cast() ?? [],
    );

    final newRound = ChatRound(
      id: const Uuid().v4(),
      parentId: parentRoundId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      userContent: content,
      userAttachments: saved,
      isIncomplete: true,
      hasUnseenUpdate: false,
    );

    await repository.appendRound(fileName, newRound);

    () async {
      final apiSource = ref.read(remoteApiSourceProvider);
      final contentBuffer = StringBuffer();
      final reasoningBuffer = StringBuffer();
      String? error;
      DateTime? lastDbUpdateTime;
      const updateInterval = Duration(seconds: 1);

      try {
        final contextRounds = await repository.getContextRounds(
          fileName,
          newRound.id,
        );
        final apiContext = await buildApiContextFromRounds(
          contextRounds,
          repository,
        );

        final currentConfig = await ref.read(configServiceProvider).loadConfig();
        final selectedId = currentConfig.selectedModel;
        final selectedModel = currentConfig.availableModels
            ?.where((m) => m.id == selectedId)
            .firstOrNull;
        final enableReasoning = selectedModel?.supportsReasoning == true;

        final stream = apiSource.chatStream(
          taskId: newRound.id,
          loadConfig: () async => currentConfig,
          context: apiContext,
          enableReasoning: enableReasoning,
        );

        await for (final chunk in stream) {
          if (chunk.error != null) {
            error = chunk.error;
            break;
          }
          if (chunk.isDone) break;

          if (chunk.content != null) contentBuffer.write(chunk.content);
          if (chunk.reasoningContent != null) reasoningBuffer.write(chunk.reasoningContent);

          final now = DateTime.now();
          if (lastDbUpdateTime == null ||
              now.difference(lastDbUpdateTime) >= updateInterval) {
            await repository.updateRound(
              fileName,
              newRound.id,
              newRound.copyWith(
                assistantContent: contentBuffer.toString(),
                assistantThinking: reasoningBuffer.toString(),
              ),
            );
            lastDbUpdateTime = now;
          }
        }
      } catch (e) {
        error = e.toString();
      } finally {

        String finalContent = contentBuffer.toString();
        if (error != null) {
          finalContent += '\n\n[错误]\n$error';
        } else if (_stoppingRoundIds.contains(newRound.id)) {
          finalContent += '\n\n[已停止]';
        }

        await repository.updateRound(
          fileName,
          newRound.id,
          newRound.copyWith(
            assistantContent: finalContent.trim().isEmpty ? null : finalContent,
            assistantThinking: reasoningBuffer.toString().trim().isEmpty
                ? null
                : reasoningBuffer.toString(),
            isIncomplete: false,
            hasUnseenUpdate: true,
          ),
        );
        _stoppingRoundIds.remove(newRound.id);
      }
    }();

    return newRound.id;
  }

  Future<String> retryFromRound(String roundId) async {
    final source = await ref.read(roundDetailProvider(roundId).future);
    if (source == null) throw Exception('找不到对应的对话轮次');

    return sendMessage(
      content: source.userContent,
      parentRoundId: source.parentId,
    );
  }

  Future<String> editAndResendFromRound(
    String roundId,
    String content, {
    List<dynamic>? attachments,
  }) async {
    final source = await ref.read(roundDetailProvider(roundId).future);
    if (source == null) throw Exception('找不到对应的对话轮次');
    return sendMessage(
      content: content,
      parentRoundId: source.parentId,
      attachments: attachments,
    );
  }

  void stopGeneration(String roundId) {
    _stoppingRoundIds.add(roundId);
    ref.read(remoteApiSourceProvider).cancelRequest(roundId);
  }

  Future<void> markRoundSeen(ChatRound round) async {
    await ref.read(conversationRepositoryProvider).updateRound(
      fileName,
      round.id,
      round.copyWith(hasUnseenUpdate: false),
    );
  }
}

final chatControllerProvider =
    Provider.family<ChatController, String>((ref, fileName) {
  return ChatController(ref, fileName);
});
```

## File: presentation/providers/config_notifier.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../di/providers.dart';

/// 监听当前激活的配置（响应式）
final configProvider = StreamProvider<AppConfig>((ref) {
  return ref.read(configServiceProvider).watchConfig();
});

/// 监听配置存档列表（响应式）
final configProfilesProvider = StreamProvider<AppConfigStore>((ref) {
  return ref.read(configServiceProvider).watchConfigStore();
});
```

## File: presentation/providers/input_draft_provider.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/pending_attachment.dart';

final globalInputDraftProvider = StateProvider<String>((ref) => '');

final globalAttachmentDraftProvider =
    StateProvider<List<PendingAttachment>>((ref) => []);

final globalEditSourceRoundIdProvider =
    StateProvider<String?>((ref) => null);
```

## File: presentation/providers/session_list_notifier.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';
import '../../domain/models/session_list_item.dart';
import '../../domain/models/session_card_meta.dart';
import 'package:uuid/uuid.dart';

final sessionListProvider = StreamProvider<List<SessionListItem>>((ref) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSessionListItems();
});

final sessionCardMetaProvider =
    StreamProvider.family<SessionCardMeta, String>((ref, sessionId) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSessionCardMeta(sessionId);
});

class SessionListController {
  final Ref ref;

  SessionListController(this.ref);

  Future<void> deleteSession(String fileName) async {
    final repository = ref.read(conversationRepositoryProvider);
    await repository.deleteSession(fileName);
  }

  Future<void> updateSessionTitle(String fileName, String newTitle) async {
    final repository = ref.read(conversationRepositoryProvider);
    final cleanTitle = newTitle.trim();
    if (cleanTitle.isEmpty) return;
    await repository.updateSessionTitle(fileName, cleanTitle);
  }

  Future<String> createSession(String title) async {
    final repository = ref.read(conversationRepositoryProvider);

    final fileName = '${const Uuid().v4()}.json';

    await repository.createSession(fileName: fileName, title: '新对话');
    return fileName;
  }
}

final sessionListControllerProvider = Provider<SessionListController>((ref) {
  return SessionListController(ref);
});
```

## File: presentation/themes/app_theme.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color _seedColor = Colors.blueGrey;

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
```

## File: presentation/themes/app_tokens.dart
```dart
abstract class AppTokens {
  const AppTokens._();

  static const double spaceXs = 4;
  static const double spaceSm = 8;
  static const double spaceMd = 12;
  static const double spaceLg = 16;
  static const double spaceXl = 24;
}
```

## File: presentation/widgets/attachment_list.dart
```dart
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/models/attachment.dart';
import '../pages/text_attachment_viewer_page.dart';
import '../providers/attachment_bytes_provider.dart';
import 'common/app_toast.dart';

class AttachmentList extends ConsumerWidget {
  final List<Attachment> attachments;
  final bool rightAligned;

  const AttachmentList({
    super.key,
    required this.attachments,
    this.rightAligned = true,
  });

  bool _isTextAttachment(Attachment attachment) {
    final lowerName = attachment.name.toLowerCase();
    final mime = (attachment.mimeType ?? '').toLowerCase();
    return mime.startsWith('text/') ||
        mime == 'application/json' ||
        lowerName.endsWith('.md') ||
        lowerName.endsWith('.txt') ||
        lowerName.endsWith('.json') ||
        lowerName.endsWith('.dart') ||
        lowerName.endsWith('.yaml') ||
        lowerName.endsWith('.yml') ||
        lowerName.endsWith('.log') ||
        lowerName.endsWith('.csv');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (attachments.isEmpty) return const SizedBox.shrink();

    return Align(
      alignment: rightAligned ? Alignment.centerRight : Alignment.centerLeft,
      child: Wrap(
        alignment: rightAligned ? WrapAlignment.end : WrapAlignment.start,
        spacing: 8,
        runSpacing: 8,
        children: attachments.map((attachment) {
          if (attachment.isImage) {
            return _ImageAttachmentThumb(attachment: attachment);
          }
          return _FileAttachmentChip(
            attachment: attachment,
            isText: _isTextAttachment(attachment),
          );
        }).toList(),
      ),
    );
  }
}

class _AttachmentActionHelper {
  static Future<void> shareAttachmentFromBytes(
    Attachment attachment,
    Uint8List bytes,
  ) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/${attachment.name}');
      await file.writeAsBytes(bytes, flush: true);
      await Share.shareXFiles(
        [XFile(file.path)],
        text: attachment.name,
      );
    } catch (e) {
      await AppToast.show('共享文件失败：$e');
    }
  }

  static Future<void> previewImage(
    BuildContext context,
    Uint8List bytes,
  ) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: Stack(
            children: [
              InteractiveViewer(
                minScale: 0.5,
                maxScale: 4,
                child: Center(
                  child: Image.memory(
                    bytes,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> openTextViewer(
    BuildContext context,
    String title,
    Uint8List bytes,
  ) async {
    final text = utf8.decode(bytes, allowMalformed: true);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TextAttachmentViewerPage(
          title: title,
          content: text,
        ),
      ),
    );
  }
}

class _ImageAttachmentThumb extends ConsumerWidget {
  final Attachment attachment;

  const _ImageAttachmentThumb({
    required this.attachment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bytesAsync = ref.watch(
      attachmentBytesProvider(attachment.relativePath),
    );

    return bytesAsync.when(
      loading: () => const SizedBox(
        width: 108,
        height: 108,
        child: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (e, st) => const SizedBox(
        width: 108,
        height: 108,
        child: Center(
          child: Icon(Icons.broken_image_outlined),
        ),
      ),
      data: (bytes) {
        return InkWell(
          onTap: () => _AttachmentActionHelper.previewImage(context, bytes),
          onLongPress: () =>
              _AttachmentActionHelper.shareAttachmentFromBytes(
            attachment,
            bytes,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 108,
              height: 108,
              child: Image.memory(
                bytes,
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FileAttachmentChip extends ConsumerWidget {
  final Attachment attachment;
  final bool isText;

  const _FileAttachmentChip({
    required this.attachment,
    required this.isText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bytesAsync = ref.watch(
      attachmentBytesProvider(attachment.relativePath),
    );

    final leadingIcon =
        isText ? Icons.description_outlined : Icons.attach_file_outlined;

    return bytesAsync.when(
      loading: () => Chip(
        avatar: Icon(leadingIcon, size: 18),
        label: Text(
          attachment.name,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      error: (e, st) => Chip(
        avatar: const Icon(Icons.error_outline, size: 18),
        label: Text(
          attachment.name,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      data: (bytes) {
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () async {
            if (isText) {
              await _AttachmentActionHelper.openTextViewer(
                context,
                attachment.name,
                bytes,
              );
              return;
            }
            await AppToast.show('该文件暂不支持直接预览，请长按进行分享');
          },
          onLongPress: () =>
              _AttachmentActionHelper.shareAttachmentFromBytes(
            attachment,
            bytes,
          ),
          child: Chip(
            avatar: Icon(leadingIcon, size: 18),
            label: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 180),
              child: Text(
                attachment.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}
```

## File: presentation/widgets/common/app_card.dart
```dart
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final ShapeBorder? shape;
  final double? elevation;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.color,
    this.shape,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      color: color,
      shape: shape,
      elevation: elevation,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
```

## File: presentation/widgets/common/app_page_scaffold.dart
```dart
import 'package:flutter/material.dart';

class AppPageScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool useSafeArea;

  const AppPageScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = useSafeArea ? SafeArea(child: body) : body;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: content,
      ),
    );
  }
}
```

## File: presentation/widgets/common/app_section.dart
```dart
import 'package:flutter/material.dart';
import 'app_card.dart';

class AppSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;

  const AppSection({
    super.key,
    required this.title,
    this.subtitle,
    required this.children,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppCard(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textTheme.titleMedium),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(subtitle!, style: textTheme.bodySmall),
          ],
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}
```

## File: presentation/widgets/common/app_toast.dart
```dart
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class AppToast {
  static Future<void> show(
    String message, {
    ToastGravity gravity = ToastGravity.CENTER,
    Toast toastLength = Toast.LENGTH_SHORT,
    Color backgroundColor = const Color(0xE6111827),
    Color textColor = Colors.white,
    double fontSize = 14,
  }) async {
    await Fluttertoast.cancel();
    await Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
```

## File: presentation/widgets/input_bar.dart
```dart
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../models/pending_attachment.dart';
import '../providers/input_draft_provider.dart';

class InputBar extends ConsumerStatefulWidget {
  final void Function(String text, List<PendingAttachment> attachments) onSend;
  final VoidCallback? onStop;
  final bool isStreaming;
  final bool enabled;
  final String hintText;
  final bool allowImages;

  const InputBar({
    super.key,
    required this.onSend,
    this.onStop,
    this.isStreaming = false,
    this.enabled = true,
    this.hintText = '输入消息...',
    this.allowImages = false,
  });

  @override
  ConsumerState<InputBar> createState() => _InputBarState();
}

class _InputBarState extends ConsumerState<InputBar> {
  late final TextEditingController _controller;
  late final ProviderSubscription<String> _draftSubscription;
  final ImagePicker _imagePicker = ImagePicker();
  bool _isSyncingText = false;

  @override
  void initState() {
    super.initState();
    final draft = ref.read(globalInputDraftProvider);
    _controller = TextEditingController(text: draft);
    _controller.addListener(_handleControllerChanged);
    _draftSubscription = ref.listenManual<String>(
      globalInputDraftProvider,
      (previous, next) {
        if (_controller.text == next) return;
        _syncControllerText(next);
      },
    );
  }

  @override
  void dispose() {
    _draftSubscription.close();
    _controller.removeListener(_handleControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  void _handleControllerChanged() {
    if (_isSyncingText) return;
    final text = _controller.text;
    final notifier = ref.read(globalInputDraftProvider.notifier);
    if (notifier.state != text) {
      notifier.state = text;
    }
    if (mounted) {
      setState(() {});
    }
  }

  void _syncControllerText(String text) {
    _isSyncingText = true;
    _controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
      composing: TextRange.empty,
    );
    _isSyncingText = false;
    if (mounted) {
      setState(() {});
    }
  }

  bool _isImageFile(String name) {
    final lower = name.toLowerCase();
    return lower.endsWith('.png') ||
        lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.gif') ||
        lower.endsWith('.webp') ||
        lower.endsWith('.bmp');
  }

  String? _guessMimeType(String name) {
    final lower = name.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) {
      return 'image/jpeg';
    }
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.bmp')) return 'image/bmp';
    if (lower.endsWith('.txt')) return 'text/plain';
    if (lower.endsWith('.md')) return 'text/markdown';
    if (lower.endsWith('.json')) return 'application/json';
    if (lower.endsWith('.pdf')) return 'application/pdf';
    if (lower.endsWith('.dart')) return 'text/plain';
    if (lower.endsWith('.yaml') || lower.endsWith('.yml')) {
      return 'text/yaml';
    }
    return null;
  }

  Future<void> _pickFileAttachment() async {
    if (!widget.enabled) return;
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: false,
      type: FileType.any,
    );
    if (result == null || result.files.isEmpty) return;
    final file = result.files.single;
    final filePath = file.path;
    if (filePath == null || filePath.trim().isEmpty) return;

    final mimeType = _guessMimeType(file.name);
    final isImage = _isImageFile(file.name);
    final attachment = PendingAttachment(
      id: const Uuid().v4(),
      name: file.name,
      path: filePath,
      isImage: isImage,
      mimeType: mimeType,
    );
    final notifier = ref.read(globalAttachmentDraftProvider.notifier);
    notifier.state = [...notifier.state, attachment];
  }

  Future<void> _pickImageFromGallery() async {
    if (!widget.enabled) return;
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (file == null) return;
    final name = file.name;
    final attachment = PendingAttachment(
      id: const Uuid().v4(),
      name: name,
      path: file.path,
      isImage: true,
      mimeType: _guessMimeType(name) ?? 'image/*',
    );
    final notifier = ref.read(globalAttachmentDraftProvider.notifier);
    notifier.state = [...notifier.state, attachment];
  }

  void _removeAttachment(String id) {
    final notifier = ref.read(globalAttachmentDraftProvider.notifier);
    notifier.state = notifier.state.where((item) => item.id != id).toList();
  }

  Future<void> _showAddAttachmentSheet() async {
    if (!widget.enabled) return;

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.attach_file_outlined),
                title: const Text('文件'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickFileAttachment();
                },
              ),
              if (widget.allowImages)
                ListTile(
                  leading: const Icon(Icons.photo_library_outlined),
                  title: const Text('相册'),
                  onTap: () async {
                    Navigator.of(context).pop();
                    await _pickImageFromGallery();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  void _handleSend() {
    if (!widget.enabled) return;
    final content = _controller.text.trim();
    final attachments = ref.read(globalAttachmentDraftProvider);
    if (content.isEmpty && attachments.isEmpty) return;

    widget.onSend(content, attachments);
    ref.invalidate(globalInputDraftProvider);
    ref.invalidate(globalAttachmentDraftProvider);
  }

  @override
  Widget build(BuildContext context) {
    final attachments = ref.watch(globalAttachmentDraftProvider);
    final hasText = _controller.text.trim().isNotEmpty;
    final hasAttachments = attachments.isNotEmpty;
    final canSend = (hasText || hasAttachments) && widget.enabled;
    final showStopButton = widget.isStreaming && widget.onStop != null;

    return SafeArea(
      top: false,
      child: Material(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (attachments.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: attachments.map((attachment) {
                        return InputChip(
                          avatar: Icon(
                            attachment.isImage
                                ? Icons.image_outlined
                                : Icons.attach_file_outlined,
                            size: 18,
                          ),
                          label: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 180),
                            child: Text(
                              attachment.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          onDeleted: () => _removeAttachment(attachment.id),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: '添加附件',
                    onPressed: widget.enabled ? _showAddAttachmentSheet : null,
                    icon: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      minLines: 1,
                      maxLines: 6,
                      enabled: widget.enabled,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (showStopButton)
                    IconButton.filledTonal(
                      tooltip: '停止生成',
                      onPressed: widget.enabled ? widget.onStop : null,
                      icon: const Icon(Icons.stop_rounded),
                    )
                  else
                    IconButton.filled(
                      tooltip: '发送',
                      onPressed: canSend ? _handleSend : null,
                      icon: const Icon(Icons.arrow_upward_rounded),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## File: presentation/widgets/message_bubble.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageBubble extends StatelessWidget {
  final String content;
  final bool isUser;
  final VoidCallback? onCopy;
  final VoidCallback? onRetryReply;
  final VoidCallback? onEdit;

  const MessageBubble({
    super.key,
    required this.content,
    required this.isUser,
    this.onCopy,
    this.onRetryReply,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bubbleColor =
        isUser ? colorScheme.secondaryContainer : colorScheme.surfaceContainerHigh;
    final textColor =
        isUser ? colorScheme.onSecondaryContainer : colorScheme.onSurface;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.88,
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Card(
              color: bubbleColor,
              elevation: 0,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: MarkdownBody(
                  data: content,
                  selectable: true,
                  styleSheet: MarkdownStyleSheet(
                    p: TextStyle(
                      fontSize: 14,
                      height: 1.7,
                      color: textColor,
                    ),
                    h1: TextStyle(
                      fontSize: 22,
                      height: 1.35,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    h2: TextStyle(
                      fontSize: 18,
                      height: 1.4,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    h3: TextStyle(
                      fontSize: 16,
                      height: 1.45,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    code: TextStyle(
                      fontSize: 13,
                      fontFamily: 'monospace',
                      color: textColor,
                    ),
                    codeblockPadding: const EdgeInsets.all(12),
                    codeblockDecoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    blockSpacing: 10,
                    listBullet: TextStyle(color: textColor),
                    strong: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    em: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: textColor,
                    ),
                    a: TextStyle(
                      color: colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                    blockquote: TextStyle(
                      color: textColor.withValues(alpha: 0.85),
                      height: 1.6,
                    ),
                    blockquoteDecoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.outline,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (onCopy != null || onRetryReply != null || onEdit != null) ...[
              const SizedBox(height: 6),
              Wrap(
                spacing: 4,
                children: [
                  if (onCopy != null)
                    IconButton(
                      tooltip: '复制',
                      onPressed: onCopy,
                      icon: const Icon(Icons.content_copy_outlined),
                    ),
                  if (onEdit != null)
                    IconButton(
                      tooltip: '编辑后发送',
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit_outlined),
                    ),
                  if (onRetryReply != null)
                    IconButton(
                      tooltip: '重新生成',
                      onPressed: onRetryReply,
                      icon: const Icon(Icons.refresh_outlined),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

## File: presentation/widgets/thought_bubble.dart
```dart
import 'package:flutter/material.dart';

class ThoughtBubble extends StatefulWidget {
  final String content;

  const ThoughtBubble({
    super.key,
    required this.content,
  });

  @override
  State<ThoughtBubble> createState() => _ThoughtBubbleState();
}

class _ThoughtBubbleState extends State<ThoughtBubble> {
  // 默认折叠
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.content.trim();
    if (text.isEmpty) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: colorScheme.surfaceContainerHigh,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 可点击的标题栏
            InkWell(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.psychology_alt_outlined,
                      size: 16,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '推理过程',
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.primary,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                      size: 18,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            // 内容折叠/展开动画
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  text,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    height: 1.65,
                  ),
                ),
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }
}
```
