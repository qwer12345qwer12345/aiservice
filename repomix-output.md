This file is a merged representation of a subset of the codebase, containing specifically included files, combined into a single document by Repomix.
The content has been processed where empty lines have been removed.

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
- Only files matching these patterns are included: lib
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Empty lines have been removed from all files
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
lib/core/constants/app_constants.dart
lib/core/errors/exceptions.dart
lib/core/interfaces/api_service.dart
lib/core/interfaces/config_service.dart
lib/core/interfaces/file_service.dart
lib/core/models/api_message.dart
lib/core/models/api_message.freezed.dart
lib/core/models/api_message.g.dart
lib/core/models/app_config.dart
lib/core/models/app_config.freezed.dart
lib/core/models/app_config.g.dart
lib/core/models/attachment.dart
lib/core/models/attachment.freezed.dart
lib/core/models/attachment.g.dart
lib/core/models/chat_chunk.dart
lib/core/models/chat_chunk.freezed.dart
lib/core/models/chat_round.dart
lib/core/models/chat_round.freezed.dart
lib/core/models/chat_round.g.dart
lib/core/models/model_info.dart
lib/core/models/model_info.freezed.dart
lib/core/models/model_info.g.dart
lib/core/models/session.dart
lib/core/models/session.freezed.dart
lib/core/models/session.g.dart
lib/core/models/sse_event.dart
lib/core/utils/file_name_utils.dart
lib/core/utils/id_generator.dart
lib/core/utils/json_utils.dart
lib/core/utils/sse_parser.dart
lib/core/utils/time_format_utils.dart
lib/data/data_sources/local_file_source.dart
lib/data/data_sources/remote_api_source.dart
lib/data/data_sources/sse_event_decoder.dart
lib/data/repositories/config_repository.dart
lib/data/repositories/conversation_repository.dart
lib/data/services/api_service.dart
lib/data/services/config_service.dart
lib/data/services/file_service.dart
lib/di/providers.dart
lib/domain/models/chat_page.dart
lib/domain/models/chat_page.freezed.dart
lib/domain/models/tree_node.dart
lib/domain/models/tree_node.freezed.dart
lib/domain/services/attachment_preparer.dart
lib/domain/services/branch_navigator.dart
lib/domain/services/chat_context_builder.dart
lib/domain/services/chat_round_factory.dart
lib/domain/services/chat_stream_accumulator.dart
lib/domain/services/chat_view_state_builder.dart
lib/domain/services/message_paginator.dart
lib/domain/services/model_capability_registry.dart
lib/domain/services/tree_builder.dart
lib/domain/states/chat_state.dart
lib/domain/states/chat_state.freezed.dart
lib/main.dart
lib/presentation/models/pending_attachment.dart
lib/presentation/pages/branch_tree_page.dart
lib/presentation/pages/chat_page.dart
lib/presentation/pages/home_page.dart
lib/presentation/pages/settings_page.dart
lib/presentation/providers/chat_notifier.dart
lib/presentation/providers/config_notifier.dart
lib/presentation/providers/input_draft_provider.dart
lib/presentation/providers/session_list_notifier.dart
lib/presentation/themes/app_theme.dart
lib/presentation/themes/app_tokens.dart
lib/presentation/widgets/attachment_list.dart
lib/presentation/widgets/common/app_badge.dart
lib/presentation/widgets/common/app_card.dart
lib/presentation/widgets/common/app_page_scaffold.dart
lib/presentation/widgets/common/app_section.dart
lib/presentation/widgets/input_bar.dart
lib/presentation/widgets/message_bubble.dart
lib/presentation/widgets/page_indicator.dart
lib/presentation/widgets/thought_bubble.dart
```

# Files

## File: lib/core/constants/app_constants.dart
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
  static const String defaultBaseUrl = 'https://api.openai.com/v1';
  static const String defaultTheme = 'system';
  // 文件扩展名
  static const String extJson = '.json';
  // 分页
  static const int pageSizeMessages = 1; // 每页显示的消息对数 (逻辑上)
}
```

## File: lib/core/errors/exceptions.dart
```dart
/// 基础应用异常
class AppException implements Exception {
  final String message;
  final String? code;
  const AppException(this.message, {this.code});
  @override
  String toString() => 'AppException: $message (Code: $code)';
}
/// 文件操作异常
class FileException extends AppException {
  const FileException(super.message, {super.code});
}
/// 网络/API 异常
class ApiException extends AppException {
  const ApiException(super.message, {super.code});
}
/// 配置异常
class ConfigException extends AppException {
  const ConfigException(super.message, {super.code});
}
/// 数据解析异常
class ParseException extends AppException {
  const ParseException(super.message, {super.code});
}
```

## File: lib/core/interfaces/api_service.dart
```dart
import '../models/model_info.dart';
import '../models/api_message.dart';
import '../models/chat_chunk.dart';
abstract class IApiService {
  Future<List<ModelInfo>> fetchModels({
    required String baseUrl,
    required String apiKey,
    required String modelsPath,
  });
  Stream<ChatChunk> chatStream({
    required String taskId, // 新增 taskId 标识请求
    required String baseUrl,
    required String apiKey,
    required String chatPath,
    required String apiMode,
    required String model,
    required List<ApiMessage> context,
    bool enableReasoning = false,
  });
  void cancelRequest(String taskId); // 支持取消指定的任务
}
```

## File: lib/core/interfaces/config_service.dart
```dart
import '../models/app_config.dart';
abstract class IConfigService {
  Future<AppConfig> loadConfig();
  Future<void> saveConfig(AppConfig config);
  Future<void> refreshModels(); // 触发模型列表刷新
}
```

## File: lib/core/interfaces/file_service.dart
```dart
import 'dart:typed_data';
import '../models/session.dart';
import '../models/app_config.dart';
abstract class IFileService {
  // 配置
  Future<AppConfig> readConfig();
  Future<void> writeConfig(AppConfig config);
  // 会话
  Future<List<String>> getConversationFileList(); // 获取文件名列表
  Future<Session> readSession(String fileName);   // 读取会话
  Future<void> writeSession(String fileName, Session session); // 保存会话
  Future<void> deleteSession(String fileName);    // 删除会话
  // 附件
  Future<String> saveAttachment(Uint8List data, String fileName); // 返回相对路径
  Future<Uint8List> readAttachment(String relativePath);
  Future<void> deleteAttachment(String relativePath);
}
```

## File: lib/core/models/api_message.dart
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

## File: lib/core/models/api_message.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'api_message.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
ApiMessageContentPart _$ApiMessageContentPartFromJson(
  Map<String, dynamic> json,
) {
  switch (json['runtimeType']) {
    case 'text':
      return ApiMessageTextPart.fromJson(json);
    case 'imageUrl':
      return ApiMessageImageUrlPart.fromJson(json);
    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'ApiMessageContentPart',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}
/// @nodoc
mixin _$ApiMessageContentPart {
  String get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, String text) text,
    required TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )
    imageUrl,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, String text)? text,
    TResult? Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, String text)? text,
    TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiMessageTextPart value) text,
    required TResult Function(ApiMessageImageUrlPart value) imageUrl,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiMessageTextPart value)? text,
    TResult? Function(ApiMessageImageUrlPart value)? imageUrl,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiMessageTextPart value)? text,
    TResult Function(ApiMessageImageUrlPart value)? imageUrl,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  /// Serializes this ApiMessageContentPart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiMessageContentPartCopyWith<ApiMessageContentPart> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $ApiMessageContentPartCopyWith<$Res> {
  factory $ApiMessageContentPartCopyWith(
    ApiMessageContentPart value,
    $Res Function(ApiMessageContentPart) then,
  ) = _$ApiMessageContentPartCopyWithImpl<$Res, ApiMessageContentPart>;
  @useResult
  $Res call({String type});
}
/// @nodoc
class _$ApiMessageContentPartCopyWithImpl<
  $Res,
  $Val extends ApiMessageContentPart
>
    implements $ApiMessageContentPartCopyWith<$Res> {
  _$ApiMessageContentPartCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null}) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$ApiMessageTextPartImplCopyWith<$Res>
    implements $ApiMessageContentPartCopyWith<$Res> {
  factory _$$ApiMessageTextPartImplCopyWith(
    _$ApiMessageTextPartImpl value,
    $Res Function(_$ApiMessageTextPartImpl) then,
  ) = __$$ApiMessageTextPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String text});
}
/// @nodoc
class __$$ApiMessageTextPartImplCopyWithImpl<$Res>
    extends _$ApiMessageContentPartCopyWithImpl<$Res, _$ApiMessageTextPartImpl>
    implements _$$ApiMessageTextPartImplCopyWith<$Res> {
  __$$ApiMessageTextPartImplCopyWithImpl(
    _$ApiMessageTextPartImpl _value,
    $Res Function(_$ApiMessageTextPartImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? text = null}) {
    return _then(
      _$ApiMessageTextPartImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$ApiMessageTextPartImpl implements ApiMessageTextPart {
  const _$ApiMessageTextPartImpl({
    this.type = 'text',
    required this.text,
    final String? $type,
  }) : $type = $type ?? 'text';
  factory _$ApiMessageTextPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiMessageTextPartImplFromJson(json);
  @override
  @JsonKey()
  final String type;
  @override
  final String text;
  @JsonKey(name: 'runtimeType')
  final String $type;
  @override
  String toString() {
    return 'ApiMessageContentPart.text(type: $type, text: $text)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiMessageTextPartImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, text);
  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiMessageTextPartImplCopyWith<_$ApiMessageTextPartImpl> get copyWith =>
      __$$ApiMessageTextPartImplCopyWithImpl<_$ApiMessageTextPartImpl>(
        this,
        _$identity,
      );
  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, String text) text,
    required TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )
    imageUrl,
  }) {
    return text(type, this.text);
  }
  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, String text)? text,
    TResult? Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
  }) {
    return text?.call(type, this.text);
  }
  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, String text)? text,
    TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(type, this.text);
    }
    return orElse();
  }
  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiMessageTextPart value) text,
    required TResult Function(ApiMessageImageUrlPart value) imageUrl,
  }) {
    return text(this);
  }
  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiMessageTextPart value)? text,
    TResult? Function(ApiMessageImageUrlPart value)? imageUrl,
  }) {
    return text?.call(this);
  }
  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiMessageTextPart value)? text,
    TResult Function(ApiMessageImageUrlPart value)? imageUrl,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
  @override
  Map<String, dynamic> toJson() {
    return _$$ApiMessageTextPartImplToJson(this);
  }
}
abstract class ApiMessageTextPart implements ApiMessageContentPart {
  const factory ApiMessageTextPart({
    final String type,
    required final String text,
  }) = _$ApiMessageTextPartImpl;
  factory ApiMessageTextPart.fromJson(Map<String, dynamic> json) =
      _$ApiMessageTextPartImpl.fromJson;
  @override
  String get type;
  String get text;
  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiMessageTextPartImplCopyWith<_$ApiMessageTextPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class _$$ApiMessageImageUrlPartImplCopyWith<$Res>
    implements $ApiMessageContentPartCopyWith<$Res> {
  factory _$$ApiMessageImageUrlPartImplCopyWith(
    _$ApiMessageImageUrlPartImpl value,
    $Res Function(_$ApiMessageImageUrlPartImpl) then,
  ) = __$$ApiMessageImageUrlPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, @JsonKey(name: 'image_url') ApiImageUrl imageUrl});
  $ApiImageUrlCopyWith<$Res> get imageUrl;
}
/// @nodoc
class __$$ApiMessageImageUrlPartImplCopyWithImpl<$Res>
    extends
        _$ApiMessageContentPartCopyWithImpl<$Res, _$ApiMessageImageUrlPartImpl>
    implements _$$ApiMessageImageUrlPartImplCopyWith<$Res> {
  __$$ApiMessageImageUrlPartImplCopyWithImpl(
    _$ApiMessageImageUrlPartImpl _value,
    $Res Function(_$ApiMessageImageUrlPartImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? imageUrl = null}) {
    return _then(
      _$ApiMessageImageUrlPartImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as ApiImageUrl,
      ),
    );
  }
  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiImageUrlCopyWith<$Res> get imageUrl {
    return $ApiImageUrlCopyWith<$Res>(_value.imageUrl, (value) {
      return _then(_value.copyWith(imageUrl: value));
    });
  }
}
/// @nodoc
@JsonSerializable()
class _$ApiMessageImageUrlPartImpl implements ApiMessageImageUrlPart {
  const _$ApiMessageImageUrlPartImpl({
    this.type = 'image_url',
    @JsonKey(name: 'image_url') required this.imageUrl,
    final String? $type,
  }) : $type = $type ?? 'imageUrl';
  factory _$ApiMessageImageUrlPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiMessageImageUrlPartImplFromJson(json);
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey(name: 'image_url')
  final ApiImageUrl imageUrl;
  @JsonKey(name: 'runtimeType')
  final String $type;
  @override
  String toString() {
    return 'ApiMessageContentPart.imageUrl(type: $type, imageUrl: $imageUrl)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiMessageImageUrlPartImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, imageUrl);
  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiMessageImageUrlPartImplCopyWith<_$ApiMessageImageUrlPartImpl>
  get copyWith =>
      __$$ApiMessageImageUrlPartImplCopyWithImpl<_$ApiMessageImageUrlPartImpl>(
        this,
        _$identity,
      );
  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, String text) text,
    required TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )
    imageUrl,
  }) {
    return imageUrl(type, this.imageUrl);
  }
  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, String text)? text,
    TResult? Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
  }) {
    return imageUrl?.call(type, this.imageUrl);
  }
  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, String text)? text,
    TResult Function(
      String type,
      @JsonKey(name: 'image_url') ApiImageUrl imageUrl,
    )?
    imageUrl,
    required TResult orElse(),
  }) {
    if (imageUrl != null) {
      return imageUrl(type, this.imageUrl);
    }
    return orElse();
  }
  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiMessageTextPart value) text,
    required TResult Function(ApiMessageImageUrlPart value) imageUrl,
  }) {
    return imageUrl(this);
  }
  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiMessageTextPart value)? text,
    TResult? Function(ApiMessageImageUrlPart value)? imageUrl,
  }) {
    return imageUrl?.call(this);
  }
  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiMessageTextPart value)? text,
    TResult Function(ApiMessageImageUrlPart value)? imageUrl,
    required TResult orElse(),
  }) {
    if (imageUrl != null) {
      return imageUrl(this);
    }
    return orElse();
  }
  @override
  Map<String, dynamic> toJson() {
    return _$$ApiMessageImageUrlPartImplToJson(this);
  }
}
abstract class ApiMessageImageUrlPart implements ApiMessageContentPart {
  const factory ApiMessageImageUrlPart({
    final String type,
    @JsonKey(name: 'image_url') required final ApiImageUrl imageUrl,
  }) = _$ApiMessageImageUrlPartImpl;
  factory ApiMessageImageUrlPart.fromJson(Map<String, dynamic> json) =
      _$ApiMessageImageUrlPartImpl.fromJson;
  @override
  String get type;
  @JsonKey(name: 'image_url')
  ApiImageUrl get imageUrl;
  /// Create a copy of ApiMessageContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiMessageImageUrlPartImplCopyWith<_$ApiMessageImageUrlPartImpl>
  get copyWith => throw _privateConstructorUsedError;
}
ApiImageUrl _$ApiImageUrlFromJson(Map<String, dynamic> json) {
  return _ApiImageUrl.fromJson(json);
}
/// @nodoc
mixin _$ApiImageUrl {
  String get url => throw _privateConstructorUsedError;
  /// Serializes this ApiImageUrl to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of ApiImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiImageUrlCopyWith<ApiImageUrl> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $ApiImageUrlCopyWith<$Res> {
  factory $ApiImageUrlCopyWith(
    ApiImageUrl value,
    $Res Function(ApiImageUrl) then,
  ) = _$ApiImageUrlCopyWithImpl<$Res, ApiImageUrl>;
  @useResult
  $Res call({String url});
}
/// @nodoc
class _$ApiImageUrlCopyWithImpl<$Res, $Val extends ApiImageUrl>
    implements $ApiImageUrlCopyWith<$Res> {
  _$ApiImageUrlCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of ApiImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null}) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$ApiImageUrlImplCopyWith<$Res>
    implements $ApiImageUrlCopyWith<$Res> {
  factory _$$ApiImageUrlImplCopyWith(
    _$ApiImageUrlImpl value,
    $Res Function(_$ApiImageUrlImpl) then,
  ) = __$$ApiImageUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}
/// @nodoc
class __$$ApiImageUrlImplCopyWithImpl<$Res>
    extends _$ApiImageUrlCopyWithImpl<$Res, _$ApiImageUrlImpl>
    implements _$$ApiImageUrlImplCopyWith<$Res> {
  __$$ApiImageUrlImplCopyWithImpl(
    _$ApiImageUrlImpl _value,
    $Res Function(_$ApiImageUrlImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ApiImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null}) {
    return _then(
      _$ApiImageUrlImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$ApiImageUrlImpl implements _ApiImageUrl {
  const _$ApiImageUrlImpl({required this.url});
  factory _$ApiImageUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiImageUrlImplFromJson(json);
  @override
  final String url;
  @override
  String toString() {
    return 'ApiImageUrl(url: $url)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiImageUrlImpl &&
            (identical(other.url, url) || other.url == url));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);
  /// Create a copy of ApiImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiImageUrlImplCopyWith<_$ApiImageUrlImpl> get copyWith =>
      __$$ApiImageUrlImplCopyWithImpl<_$ApiImageUrlImpl>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$$ApiImageUrlImplToJson(this);
  }
}
abstract class _ApiImageUrl implements ApiImageUrl {
  const factory _ApiImageUrl({required final String url}) = _$ApiImageUrlImpl;
  factory _ApiImageUrl.fromJson(Map<String, dynamic> json) =
      _$ApiImageUrlImpl.fromJson;
  @override
  String get url;
  /// Create a copy of ApiImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiImageUrlImplCopyWith<_$ApiImageUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
ApiMessage _$ApiMessageFromJson(Map<String, dynamic> json) {
  return _ApiMessage.fromJson(json);
}
/// @nodoc
mixin _$ApiMessage {
  String get role => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get reasoning => throw _privateConstructorUsedError;
  List<ApiMessageContentPart> get parts => throw _privateConstructorUsedError;
  /// Serializes this ApiMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of ApiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiMessageCopyWith<ApiMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $ApiMessageCopyWith<$Res> {
  factory $ApiMessageCopyWith(
    ApiMessage value,
    $Res Function(ApiMessage) then,
  ) = _$ApiMessageCopyWithImpl<$Res, ApiMessage>;
  @useResult
  $Res call({
    String role,
    String? content,
    String? reasoning,
    List<ApiMessageContentPart> parts,
  });
}
/// @nodoc
class _$ApiMessageCopyWithImpl<$Res, $Val extends ApiMessage>
    implements $ApiMessageCopyWith<$Res> {
  _$ApiMessageCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of ApiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = freezed,
    Object? reasoning = freezed,
    Object? parts = null,
  }) {
    return _then(
      _value.copyWith(
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            reasoning: freezed == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String?,
            parts: null == parts
                ? _value.parts
                : parts // ignore: cast_nullable_to_non_nullable
                      as List<ApiMessageContentPart>,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$ApiMessageImplCopyWith<$Res>
    implements $ApiMessageCopyWith<$Res> {
  factory _$$ApiMessageImplCopyWith(
    _$ApiMessageImpl value,
    $Res Function(_$ApiMessageImpl) then,
  ) = __$$ApiMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String role,
    String? content,
    String? reasoning,
    List<ApiMessageContentPart> parts,
  });
}
/// @nodoc
class __$$ApiMessageImplCopyWithImpl<$Res>
    extends _$ApiMessageCopyWithImpl<$Res, _$ApiMessageImpl>
    implements _$$ApiMessageImplCopyWith<$Res> {
  __$$ApiMessageImplCopyWithImpl(
    _$ApiMessageImpl _value,
    $Res Function(_$ApiMessageImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ApiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = freezed,
    Object? reasoning = freezed,
    Object? parts = null,
  }) {
    return _then(
      _$ApiMessageImpl(
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasoning: freezed == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String?,
        parts: null == parts
            ? _value._parts
            : parts // ignore: cast_nullable_to_non_nullable
                  as List<ApiMessageContentPart>,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$ApiMessageImpl implements _ApiMessage {
  const _$ApiMessageImpl({
    required this.role,
    this.content,
    this.reasoning,
    final List<ApiMessageContentPart> parts = const [],
  }) : _parts = parts;
  factory _$ApiMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiMessageImplFromJson(json);
  @override
  final String role;
  @override
  final String? content;
  @override
  final String? reasoning;
  final List<ApiMessageContentPart> _parts;
  @override
  @JsonKey()
  List<ApiMessageContentPart> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }
  @override
  String toString() {
    return 'ApiMessage(role: $role, content: $content, reasoning: $reasoning, parts: $parts)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiMessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    role,
    content,
    reasoning,
    const DeepCollectionEquality().hash(_parts),
  );
  /// Create a copy of ApiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiMessageImplCopyWith<_$ApiMessageImpl> get copyWith =>
      __$$ApiMessageImplCopyWithImpl<_$ApiMessageImpl>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$$ApiMessageImplToJson(this);
  }
}
abstract class _ApiMessage implements ApiMessage {
  const factory _ApiMessage({
    required final String role,
    final String? content,
    final String? reasoning,
    final List<ApiMessageContentPart> parts,
  }) = _$ApiMessageImpl;
  factory _ApiMessage.fromJson(Map<String, dynamic> json) =
      _$ApiMessageImpl.fromJson;
  @override
  String get role;
  @override
  String? get content;
  @override
  String? get reasoning;
  @override
  List<ApiMessageContentPart> get parts;
  /// Create a copy of ApiMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiMessageImplCopyWith<_$ApiMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/core/models/api_message.g.dart
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

## File: lib/core/models/app_config.dart
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

## File: lib/core/models/app_config.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'app_config.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}
/// @nodoc
mixin _$AppConfig {
  String get baseUrl => throw _privateConstructorUsedError;
  String get apiKey => throw _privateConstructorUsedError;
  String? get selectedModel => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
  List<ModelInfo>? get availableModels => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  String get modelsPath => throw _privateConstructorUsedError;
  String get chatPath => throw _privateConstructorUsedError;
  String get apiMode => throw _privateConstructorUsedError;
  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call({
    String baseUrl,
    String apiKey,
    String? selectedModel,
    @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
    List<ModelInfo>? availableModels,
    String theme,
    String modelsPath,
    String chatPath,
    String apiMode,
  });
}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? apiKey = null,
    Object? selectedModel = freezed,
    Object? availableModels = freezed,
    Object? theme = null,
    Object? modelsPath = null,
    Object? chatPath = null,
    Object? apiMode = null,
  }) {
    return _then(
      _value.copyWith(
            baseUrl: null == baseUrl
                ? _value.baseUrl
                : baseUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            apiKey: null == apiKey
                ? _value.apiKey
                : apiKey // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedModel: freezed == selectedModel
                ? _value.selectedModel
                : selectedModel // ignore: cast_nullable_to_non_nullable
                      as String?,
            availableModels: freezed == availableModels
                ? _value.availableModels
                : availableModels // ignore: cast_nullable_to_non_nullable
                      as List<ModelInfo>?,
            theme: null == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                      as String,
            modelsPath: null == modelsPath
                ? _value.modelsPath
                : modelsPath // ignore: cast_nullable_to_non_nullable
                      as String,
            chatPath: null == chatPath
                ? _value.chatPath
                : chatPath // ignore: cast_nullable_to_non_nullable
                      as String,
            apiMode: null == apiMode
                ? _value.apiMode
                : apiMode // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
    _$AppConfigImpl value,
    $Res Function(_$AppConfigImpl) then,
  ) = __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String baseUrl,
    String apiKey,
    String? selectedModel,
    @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
    List<ModelInfo>? availableModels,
    String theme,
    String modelsPath,
    String chatPath,
    String apiMode,
  });
}
/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
    _$AppConfigImpl _value,
    $Res Function(_$AppConfigImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? apiKey = null,
    Object? selectedModel = freezed,
    Object? availableModels = freezed,
    Object? theme = null,
    Object? modelsPath = null,
    Object? chatPath = null,
    Object? apiMode = null,
  }) {
    return _then(
      _$AppConfigImpl(
        baseUrl: null == baseUrl
            ? _value.baseUrl
            : baseUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        apiKey: null == apiKey
            ? _value.apiKey
            : apiKey // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedModel: freezed == selectedModel
            ? _value.selectedModel
            : selectedModel // ignore: cast_nullable_to_non_nullable
                  as String?,
        availableModels: freezed == availableModels
            ? _value._availableModels
            : availableModels // ignore: cast_nullable_to_non_nullable
                  as List<ModelInfo>?,
        theme: null == theme
            ? _value.theme
            : theme // ignore: cast_nullable_to_non_nullable
                  as String,
        modelsPath: null == modelsPath
            ? _value.modelsPath
            : modelsPath // ignore: cast_nullable_to_non_nullable
                  as String,
        chatPath: null == chatPath
            ? _value.chatPath
            : chatPath // ignore: cast_nullable_to_non_nullable
                  as String,
        apiMode: null == apiMode
            ? _value.apiMode
            : apiMode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$AppConfigImpl implements _AppConfig {
  const _$AppConfigImpl({
    required this.baseUrl,
    required this.apiKey,
    this.selectedModel,
    @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
    final List<ModelInfo>? availableModels,
    this.theme = 'system',
    this.modelsPath = 'v1/models',
    this.chatPath = 'v1/chat/completions',
    this.apiMode = 'chat_completions',
  }) : _availableModels = availableModels;
  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);
  @override
  final String baseUrl;
  @override
  final String apiKey;
  @override
  final String? selectedModel;
  final List<ModelInfo>? _availableModels;
  @override
  @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
  List<ModelInfo>? get availableModels {
    final value = _availableModels;
    if (value == null) return null;
    if (_availableModels is EqualUnmodifiableListView) return _availableModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }
  @override
  @JsonKey()
  final String theme;
  @override
  @JsonKey()
  final String modelsPath;
  @override
  @JsonKey()
  final String chatPath;
  @override
  @JsonKey()
  final String apiMode;
  @override
  String toString() {
    return 'AppConfig(baseUrl: $baseUrl, apiKey: $apiKey, selectedModel: $selectedModel, availableModels: $availableModels, theme: $theme, modelsPath: $modelsPath, chatPath: $chatPath, apiMode: $apiMode)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.selectedModel, selectedModel) ||
                other.selectedModel == selectedModel) &&
            const DeepCollectionEquality().equals(
              other._availableModels,
              _availableModels,
            ) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.modelsPath, modelsPath) ||
                other.modelsPath == modelsPath) &&
            (identical(other.chatPath, chatPath) ||
                other.chatPath == chatPath) &&
            (identical(other.apiMode, apiMode) || other.apiMode == apiMode));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    baseUrl,
    apiKey,
    selectedModel,
    const DeepCollectionEquality().hash(_availableModels),
    theme,
    modelsPath,
    chatPath,
    apiMode,
  );
  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(this);
  }
}
abstract class _AppConfig implements AppConfig {
  const factory _AppConfig({
    required final String baseUrl,
    required final String apiKey,
    final String? selectedModel,
    @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
    final List<ModelInfo>? availableModels,
    final String theme,
    final String modelsPath,
    final String chatPath,
    final String apiMode,
  }) = _$AppConfigImpl;
  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;
  @override
  String get baseUrl;
  @override
  String get apiKey;
  @override
  String? get selectedModel;
  @override
  @JsonKey(fromJson: _modelsFromJson, toJson: _modelsToJson)
  List<ModelInfo>? get availableModels;
  @override
  String get theme;
  @override
  String get modelsPath;
  @override
  String get chatPath;
  @override
  String get apiMode;
  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/core/models/app_config.g.dart
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

## File: lib/core/models/attachment.dart
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

## File: lib/core/models/attachment.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'attachment.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}
/// @nodoc
mixin _$Attachment {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get relativePath => throw _privateConstructorUsedError;
  bool get isImage => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  /// Serializes this Attachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachmentCopyWith<Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
    Attachment value,
    $Res Function(Attachment) then,
  ) = _$AttachmentCopyWithImpl<$Res, Attachment>;
  @useResult
  $Res call({
    String id,
    String name,
    String relativePath,
    bool isImage,
    String? mimeType,
  });
}
/// @nodoc
class _$AttachmentCopyWithImpl<$Res, $Val extends Attachment>
    implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? relativePath = null,
    Object? isImage = null,
    Object? mimeType = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            relativePath: null == relativePath
                ? _value.relativePath
                : relativePath // ignore: cast_nullable_to_non_nullable
                      as String,
            isImage: null == isImage
                ? _value.isImage
                : isImage // ignore: cast_nullable_to_non_nullable
                      as bool,
            mimeType: freezed == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$AttachmentImplCopyWith<$Res>
    implements $AttachmentCopyWith<$Res> {
  factory _$$AttachmentImplCopyWith(
    _$AttachmentImpl value,
    $Res Function(_$AttachmentImpl) then,
  ) = __$$AttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String relativePath,
    bool isImage,
    String? mimeType,
  });
}
/// @nodoc
class __$$AttachmentImplCopyWithImpl<$Res>
    extends _$AttachmentCopyWithImpl<$Res, _$AttachmentImpl>
    implements _$$AttachmentImplCopyWith<$Res> {
  __$$AttachmentImplCopyWithImpl(
    _$AttachmentImpl _value,
    $Res Function(_$AttachmentImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? relativePath = null,
    Object? isImage = null,
    Object? mimeType = freezed,
  }) {
    return _then(
      _$AttachmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        relativePath: null == relativePath
            ? _value.relativePath
            : relativePath // ignore: cast_nullable_to_non_nullable
                  as String,
        isImage: null == isImage
            ? _value.isImage
            : isImage // ignore: cast_nullable_to_non_nullable
                  as bool,
        mimeType: freezed == mimeType
            ? _value.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$AttachmentImpl implements _Attachment {
  const _$AttachmentImpl({
    required this.id,
    required this.name,
    required this.relativePath,
    this.isImage = false,
    this.mimeType,
  });
  factory _$AttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentImplFromJson(json);
  @override
  final String id;
  @override
  final String name;
  @override
  final String relativePath;
  @override
  @JsonKey()
  final bool isImage;
  @override
  final String? mimeType;
  @override
  String toString() {
    return 'Attachment(id: $id, name: $name, relativePath: $relativePath, isImage: $isImage, mimeType: $mimeType)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.relativePath, relativePath) ||
                other.relativePath == relativePath) &&
            (identical(other.isImage, isImage) || other.isImage == isImage) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, relativePath, isImage, mimeType);
  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      __$$AttachmentImplCopyWithImpl<_$AttachmentImpl>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentImplToJson(this);
  }
}
abstract class _Attachment implements Attachment {
  const factory _Attachment({
    required final String id,
    required final String name,
    required final String relativePath,
    final bool isImage,
    final String? mimeType,
  }) = _$AttachmentImpl;
  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$AttachmentImpl.fromJson;
  @override
  String get id;
  @override
  String get name;
  @override
  String get relativePath;
  @override
  bool get isImage;
  @override
  String? get mimeType;
  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/core/models/attachment.g.dart
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

## File: lib/core/models/chat_chunk.dart
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

## File: lib/core/models/chat_chunk.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'chat_chunk.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
/// @nodoc
mixin _$ChatChunk {
  String? get content => throw _privateConstructorUsedError; // 正式内容片段
  String? get reasoningContent => throw _privateConstructorUsedError; // 思考过程片段
  bool get isDone => throw _privateConstructorUsedError; // 是否结束
  String? get error => throw _privateConstructorUsedError;
  /// Create a copy of ChatChunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatChunkCopyWith<ChatChunk> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $ChatChunkCopyWith<$Res> {
  factory $ChatChunkCopyWith(ChatChunk value, $Res Function(ChatChunk) then) =
      _$ChatChunkCopyWithImpl<$Res, ChatChunk>;
  @useResult
  $Res call({
    String? content,
    String? reasoningContent,
    bool isDone,
    String? error,
  });
}
/// @nodoc
class _$ChatChunkCopyWithImpl<$Res, $Val extends ChatChunk>
    implements $ChatChunkCopyWith<$Res> {
  _$ChatChunkCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of ChatChunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? reasoningContent = freezed,
    Object? isDone = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            reasoningContent: freezed == reasoningContent
                ? _value.reasoningContent
                : reasoningContent // ignore: cast_nullable_to_non_nullable
                      as String?,
            isDone: null == isDone
                ? _value.isDone
                : isDone // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$ChatChunkImplCopyWith<$Res>
    implements $ChatChunkCopyWith<$Res> {
  factory _$$ChatChunkImplCopyWith(
    _$ChatChunkImpl value,
    $Res Function(_$ChatChunkImpl) then,
  ) = __$$ChatChunkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? content,
    String? reasoningContent,
    bool isDone,
    String? error,
  });
}
/// @nodoc
class __$$ChatChunkImplCopyWithImpl<$Res>
    extends _$ChatChunkCopyWithImpl<$Res, _$ChatChunkImpl>
    implements _$$ChatChunkImplCopyWith<$Res> {
  __$$ChatChunkImplCopyWithImpl(
    _$ChatChunkImpl _value,
    $Res Function(_$ChatChunkImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ChatChunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? reasoningContent = freezed,
    Object? isDone = null,
    Object? error = freezed,
  }) {
    return _then(
      _$ChatChunkImpl(
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasoningContent: freezed == reasoningContent
            ? _value.reasoningContent
            : reasoningContent // ignore: cast_nullable_to_non_nullable
                  as String?,
        isDone: null == isDone
            ? _value.isDone
            : isDone // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
/// @nodoc
class _$ChatChunkImpl implements _ChatChunk {
  const _$ChatChunkImpl({
    this.content,
    this.reasoningContent,
    required this.isDone,
    this.error,
  });
  @override
  final String? content;
  // 正式内容片段
  @override
  final String? reasoningContent;
  // 思考过程片段
  @override
  final bool isDone;
  // 是否结束
  @override
  final String? error;
  @override
  String toString() {
    return 'ChatChunk(content: $content, reasoningContent: $reasoningContent, isDone: $isDone, error: $error)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatChunkImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoningContent, reasoningContent) ||
                other.reasoningContent == reasoningContent) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.error, error) || other.error == error));
  }
  @override
  int get hashCode =>
      Object.hash(runtimeType, content, reasoningContent, isDone, error);
  /// Create a copy of ChatChunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatChunkImplCopyWith<_$ChatChunkImpl> get copyWith =>
      __$$ChatChunkImplCopyWithImpl<_$ChatChunkImpl>(this, _$identity);
}
abstract class _ChatChunk implements ChatChunk {
  const factory _ChatChunk({
    final String? content,
    final String? reasoningContent,
    required final bool isDone,
    final String? error,
  }) = _$ChatChunkImpl;
  @override
  String? get content; // 正式内容片段
  @override
  String? get reasoningContent; // 思考过程片段
  @override
  bool get isDone; // 是否结束
  @override
  String? get error;
  /// Create a copy of ChatChunk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatChunkImplCopyWith<_$ChatChunkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/core/models/chat_round.dart
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
  }) = _ChatRound;
  factory ChatRound.fromJson(Map<String, dynamic> json) =>
      _$ChatRoundFromJson(json);
}
```

## File: lib/core/models/chat_round.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'chat_round.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
ChatRound _$ChatRoundFromJson(Map<String, dynamic> json) {
  return _ChatRound.fromJson(json);
}
/// @nodoc
mixin _$ChatRound {
  String get id => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  String get userContent => throw _privateConstructorUsedError;
  List<Attachment> get userAttachments => throw _privateConstructorUsedError;
  String? get assistantThinking => throw _privateConstructorUsedError;
  String? get assistantContent => throw _privateConstructorUsedError;
  bool get isIncomplete => throw _privateConstructorUsedError;
  /// Serializes this ChatRound to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoundCopyWith<ChatRound> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $ChatRoundCopyWith<$Res> {
  factory $ChatRoundCopyWith(ChatRound value, $Res Function(ChatRound) then) =
      _$ChatRoundCopyWithImpl<$Res, ChatRound>;
  @useResult
  $Res call({
    String id,
    String? parentId,
    int createdAt,
    String userContent,
    List<Attachment> userAttachments,
    String? assistantThinking,
    String? assistantContent,
    bool isIncomplete,
  });
}
/// @nodoc
class _$ChatRoundCopyWithImpl<$Res, $Val extends ChatRound>
    implements $ChatRoundCopyWith<$Res> {
  _$ChatRoundCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? createdAt = null,
    Object? userContent = null,
    Object? userAttachments = null,
    Object? assistantThinking = freezed,
    Object? assistantContent = freezed,
    Object? isIncomplete = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as int,
            userContent: null == userContent
                ? _value.userContent
                : userContent // ignore: cast_nullable_to_non_nullable
                      as String,
            userAttachments: null == userAttachments
                ? _value.userAttachments
                : userAttachments // ignore: cast_nullable_to_non_nullable
                      as List<Attachment>,
            assistantThinking: freezed == assistantThinking
                ? _value.assistantThinking
                : assistantThinking // ignore: cast_nullable_to_non_nullable
                      as String?,
            assistantContent: freezed == assistantContent
                ? _value.assistantContent
                : assistantContent // ignore: cast_nullable_to_non_nullable
                      as String?,
            isIncomplete: null == isIncomplete
                ? _value.isIncomplete
                : isIncomplete // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$ChatRoundImplCopyWith<$Res>
    implements $ChatRoundCopyWith<$Res> {
  factory _$$ChatRoundImplCopyWith(
    _$ChatRoundImpl value,
    $Res Function(_$ChatRoundImpl) then,
  ) = __$$ChatRoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? parentId,
    int createdAt,
    String userContent,
    List<Attachment> userAttachments,
    String? assistantThinking,
    String? assistantContent,
    bool isIncomplete,
  });
}
/// @nodoc
class __$$ChatRoundImplCopyWithImpl<$Res>
    extends _$ChatRoundCopyWithImpl<$Res, _$ChatRoundImpl>
    implements _$$ChatRoundImplCopyWith<$Res> {
  __$$ChatRoundImplCopyWithImpl(
    _$ChatRoundImpl _value,
    $Res Function(_$ChatRoundImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? createdAt = null,
    Object? userContent = null,
    Object? userAttachments = null,
    Object? assistantThinking = freezed,
    Object? assistantContent = freezed,
    Object? isIncomplete = null,
  }) {
    return _then(
      _$ChatRoundImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as int,
        userContent: null == userContent
            ? _value.userContent
            : userContent // ignore: cast_nullable_to_non_nullable
                  as String,
        userAttachments: null == userAttachments
            ? _value._userAttachments
            : userAttachments // ignore: cast_nullable_to_non_nullable
                  as List<Attachment>,
        assistantThinking: freezed == assistantThinking
            ? _value.assistantThinking
            : assistantThinking // ignore: cast_nullable_to_non_nullable
                  as String?,
        assistantContent: freezed == assistantContent
            ? _value.assistantContent
            : assistantContent // ignore: cast_nullable_to_non_nullable
                  as String?,
        isIncomplete: null == isIncomplete
            ? _value.isIncomplete
            : isIncomplete // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$ChatRoundImpl implements _ChatRound {
  const _$ChatRoundImpl({
    required this.id,
    this.parentId,
    required this.createdAt,
    required this.userContent,
    final List<Attachment> userAttachments = const [],
    this.assistantThinking,
    this.assistantContent,
    this.isIncomplete = false,
  }) : _userAttachments = userAttachments;
  factory _$ChatRoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoundImplFromJson(json);
  @override
  final String id;
  @override
  final String? parentId;
  @override
  final int createdAt;
  @override
  final String userContent;
  final List<Attachment> _userAttachments;
  @override
  @JsonKey()
  List<Attachment> get userAttachments {
    if (_userAttachments is EqualUnmodifiableListView) return _userAttachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAttachments);
  }
  @override
  final String? assistantThinking;
  @override
  final String? assistantContent;
  @override
  @JsonKey()
  final bool isIncomplete;
  @override
  String toString() {
    return 'ChatRound(id: $id, parentId: $parentId, createdAt: $createdAt, userContent: $userContent, userAttachments: $userAttachments, assistantThinking: $assistantThinking, assistantContent: $assistantContent, isIncomplete: $isIncomplete)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userContent, userContent) ||
                other.userContent == userContent) &&
            const DeepCollectionEquality().equals(
              other._userAttachments,
              _userAttachments,
            ) &&
            (identical(other.assistantThinking, assistantThinking) ||
                other.assistantThinking == assistantThinking) &&
            (identical(other.assistantContent, assistantContent) ||
                other.assistantContent == assistantContent) &&
            (identical(other.isIncomplete, isIncomplete) ||
                other.isIncomplete == isIncomplete));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    parentId,
    createdAt,
    userContent,
    const DeepCollectionEquality().hash(_userAttachments),
    assistantThinking,
    assistantContent,
    isIncomplete,
  );
  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoundImplCopyWith<_$ChatRoundImpl> get copyWith =>
      __$$ChatRoundImplCopyWithImpl<_$ChatRoundImpl>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoundImplToJson(this);
  }
}
abstract class _ChatRound implements ChatRound {
  const factory _ChatRound({
    required final String id,
    final String? parentId,
    required final int createdAt,
    required final String userContent,
    final List<Attachment> userAttachments,
    final String? assistantThinking,
    final String? assistantContent,
    final bool isIncomplete,
  }) = _$ChatRoundImpl;
  factory _ChatRound.fromJson(Map<String, dynamic> json) =
      _$ChatRoundImpl.fromJson;
  @override
  String get id;
  @override
  String? get parentId;
  @override
  int get createdAt;
  @override
  String get userContent;
  @override
  List<Attachment> get userAttachments;
  @override
  String? get assistantThinking;
  @override
  String? get assistantContent;
  @override
  bool get isIncomplete;
  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoundImplCopyWith<_$ChatRoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/core/models/chat_round.g.dart
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
    };
```

## File: lib/core/models/model_info.dart
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

## File: lib/core/models/model_info.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'model_info.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) {
  return _ModelInfo.fromJson(json);
}
/// @nodoc
mixin _$ModelInfo {
  String get id => throw _privateConstructorUsedError;
  String? get name =>
      throw _privateConstructorUsedError; // 最终生效能力（默认检测 + 手动覆盖后）
  bool? get supportsReasoning => throw _privateConstructorUsedError;
  bool? get supportsVision => throw _privateConstructorUsedError; // 用户手动覆盖值
  bool? get overrideSupportsReasoning => throw _privateConstructorUsedError;
  bool? get overrideSupportsVision => throw _privateConstructorUsedError;
  /// Serializes this ModelInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of ModelInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModelInfoCopyWith<ModelInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $ModelInfoCopyWith<$Res> {
  factory $ModelInfoCopyWith(ModelInfo value, $Res Function(ModelInfo) then) =
      _$ModelInfoCopyWithImpl<$Res, ModelInfo>;
  @useResult
  $Res call({
    String id,
    String? name,
    bool? supportsReasoning,
    bool? supportsVision,
    bool? overrideSupportsReasoning,
    bool? overrideSupportsVision,
  });
}
/// @nodoc
class _$ModelInfoCopyWithImpl<$Res, $Val extends ModelInfo>
    implements $ModelInfoCopyWith<$Res> {
  _$ModelInfoCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of ModelInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? supportsReasoning = freezed,
    Object? supportsVision = freezed,
    Object? overrideSupportsReasoning = freezed,
    Object? overrideSupportsVision = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            supportsReasoning: freezed == supportsReasoning
                ? _value.supportsReasoning
                : supportsReasoning // ignore: cast_nullable_to_non_nullable
                      as bool?,
            supportsVision: freezed == supportsVision
                ? _value.supportsVision
                : supportsVision // ignore: cast_nullable_to_non_nullable
                      as bool?,
            overrideSupportsReasoning: freezed == overrideSupportsReasoning
                ? _value.overrideSupportsReasoning
                : overrideSupportsReasoning // ignore: cast_nullable_to_non_nullable
                      as bool?,
            overrideSupportsVision: freezed == overrideSupportsVision
                ? _value.overrideSupportsVision
                : overrideSupportsVision // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$ModelInfoImplCopyWith<$Res>
    implements $ModelInfoCopyWith<$Res> {
  factory _$$ModelInfoImplCopyWith(
    _$ModelInfoImpl value,
    $Res Function(_$ModelInfoImpl) then,
  ) = __$$ModelInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? name,
    bool? supportsReasoning,
    bool? supportsVision,
    bool? overrideSupportsReasoning,
    bool? overrideSupportsVision,
  });
}
/// @nodoc
class __$$ModelInfoImplCopyWithImpl<$Res>
    extends _$ModelInfoCopyWithImpl<$Res, _$ModelInfoImpl>
    implements _$$ModelInfoImplCopyWith<$Res> {
  __$$ModelInfoImplCopyWithImpl(
    _$ModelInfoImpl _value,
    $Res Function(_$ModelInfoImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ModelInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? supportsReasoning = freezed,
    Object? supportsVision = freezed,
    Object? overrideSupportsReasoning = freezed,
    Object? overrideSupportsVision = freezed,
  }) {
    return _then(
      _$ModelInfoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        supportsReasoning: freezed == supportsReasoning
            ? _value.supportsReasoning
            : supportsReasoning // ignore: cast_nullable_to_non_nullable
                  as bool?,
        supportsVision: freezed == supportsVision
            ? _value.supportsVision
            : supportsVision // ignore: cast_nullable_to_non_nullable
                  as bool?,
        overrideSupportsReasoning: freezed == overrideSupportsReasoning
            ? _value.overrideSupportsReasoning
            : overrideSupportsReasoning // ignore: cast_nullable_to_non_nullable
                  as bool?,
        overrideSupportsVision: freezed == overrideSupportsVision
            ? _value.overrideSupportsVision
            : overrideSupportsVision // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$ModelInfoImpl implements _ModelInfo {
  const _$ModelInfoImpl({
    required this.id,
    this.name,
    this.supportsReasoning,
    this.supportsVision,
    this.overrideSupportsReasoning,
    this.overrideSupportsVision,
  });
  factory _$ModelInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelInfoImplFromJson(json);
  @override
  final String id;
  @override
  final String? name;
  // 最终生效能力（默认检测 + 手动覆盖后）
  @override
  final bool? supportsReasoning;
  @override
  final bool? supportsVision;
  // 用户手动覆盖值
  @override
  final bool? overrideSupportsReasoning;
  @override
  final bool? overrideSupportsVision;
  @override
  String toString() {
    return 'ModelInfo(id: $id, name: $name, supportsReasoning: $supportsReasoning, supportsVision: $supportsVision, overrideSupportsReasoning: $overrideSupportsReasoning, overrideSupportsVision: $overrideSupportsVision)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.supportsReasoning, supportsReasoning) ||
                other.supportsReasoning == supportsReasoning) &&
            (identical(other.supportsVision, supportsVision) ||
                other.supportsVision == supportsVision) &&
            (identical(
                  other.overrideSupportsReasoning,
                  overrideSupportsReasoning,
                ) ||
                other.overrideSupportsReasoning == overrideSupportsReasoning) &&
            (identical(other.overrideSupportsVision, overrideSupportsVision) ||
                other.overrideSupportsVision == overrideSupportsVision));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    supportsReasoning,
    supportsVision,
    overrideSupportsReasoning,
    overrideSupportsVision,
  );
  /// Create a copy of ModelInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelInfoImplCopyWith<_$ModelInfoImpl> get copyWith =>
      __$$ModelInfoImplCopyWithImpl<_$ModelInfoImpl>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$$ModelInfoImplToJson(this);
  }
}
abstract class _ModelInfo implements ModelInfo {
  const factory _ModelInfo({
    required final String id,
    final String? name,
    final bool? supportsReasoning,
    final bool? supportsVision,
    final bool? overrideSupportsReasoning,
    final bool? overrideSupportsVision,
  }) = _$ModelInfoImpl;
  factory _ModelInfo.fromJson(Map<String, dynamic> json) =
      _$ModelInfoImpl.fromJson;
  @override
  String get id;
  @override
  String? get name; // 最终生效能力（默认检测 + 手动覆盖后）
  @override
  bool? get supportsReasoning;
  @override
  bool? get supportsVision; // 用户手动覆盖值
  @override
  bool? get overrideSupportsReasoning;
  @override
  bool? get overrideSupportsVision;
  /// Create a copy of ModelInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModelInfoImplCopyWith<_$ModelInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/core/models/model_info.g.dart
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

## File: lib/core/models/session.dart
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

## File: lib/core/models/session.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'session.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}
/// @nodoc
mixin _$Session {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  List<ChatRound> get rounds => throw _privateConstructorUsedError;
  SessionConfig? get config => throw _privateConstructorUsedError;
  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call({
    String id,
    String title,
    int createdAt,
    int updatedAt,
    List<ChatRound> rounds,
    SessionConfig? config,
  });
  $SessionConfigCopyWith<$Res>? get config;
}
/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? rounds = null,
    Object? config = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as int,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as int,
            rounds: null == rounds
                ? _value.rounds
                : rounds // ignore: cast_nullable_to_non_nullable
                      as List<ChatRound>,
            config: freezed == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as SessionConfig?,
          )
          as $Val,
    );
  }
  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionConfigCopyWith<$Res>? get config {
    if (_value.config == null) {
      return null;
    }
    return $SessionConfigCopyWith<$Res>(_value.config!, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}
/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
    _$SessionImpl value,
    $Res Function(_$SessionImpl) then,
  ) = __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    int createdAt,
    int updatedAt,
    List<ChatRound> rounds,
    SessionConfig? config,
  });
  @override
  $SessionConfigCopyWith<$Res>? get config;
}
/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
    _$SessionImpl _value,
    $Res Function(_$SessionImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? rounds = null,
    Object? config = freezed,
  }) {
    return _then(
      _$SessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as int,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as int,
        rounds: null == rounds
            ? _value._rounds
            : rounds // ignore: cast_nullable_to_non_nullable
                  as List<ChatRound>,
        config: freezed == config
            ? _value.config
            : config // ignore: cast_nullable_to_non_nullable
                  as SessionConfig?,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$SessionImpl implements _Session {
  const _$SessionImpl({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required final List<ChatRound> rounds,
    this.config,
  }) : _rounds = rounds;
  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);
  @override
  final String id;
  @override
  final String title;
  @override
  final int createdAt;
  @override
  final int updatedAt;
  final List<ChatRound> _rounds;
  @override
  List<ChatRound> get rounds {
    if (_rounds is EqualUnmodifiableListView) return _rounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rounds);
  }
  @override
  final SessionConfig? config;
  @override
  String toString() {
    return 'Session(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, rounds: $rounds, config: $config)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._rounds, _rounds) &&
            (identical(other.config, config) || other.config == config));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_rounds),
    config,
  );
  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(this);
  }
}
abstract class _Session implements Session {
  const factory _Session({
    required final String id,
    required final String title,
    required final int createdAt,
    required final int updatedAt,
    required final List<ChatRound> rounds,
    final SessionConfig? config,
  }) = _$SessionImpl;
  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;
  @override
  String get id;
  @override
  String get title;
  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  List<ChatRound> get rounds;
  @override
  SessionConfig? get config;
  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
SessionConfig _$SessionConfigFromJson(Map<String, dynamic> json) {
  return _SessionConfig.fromJson(json);
}
/// @nodoc
mixin _$SessionConfig {
  String? get model => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  bool? get enableReasoning => throw _privateConstructorUsedError;
  /// Serializes this SessionConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionConfigCopyWith<SessionConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $SessionConfigCopyWith<$Res> {
  factory $SessionConfigCopyWith(
    SessionConfig value,
    $Res Function(SessionConfig) then,
  ) = _$SessionConfigCopyWithImpl<$Res, SessionConfig>;
  @useResult
  $Res call({String? model, double? temperature, bool? enableReasoning});
}
/// @nodoc
class _$SessionConfigCopyWithImpl<$Res, $Val extends SessionConfig>
    implements $SessionConfigCopyWith<$Res> {
  _$SessionConfigCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? temperature = freezed,
    Object? enableReasoning = freezed,
  }) {
    return _then(
      _value.copyWith(
            model: freezed == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String?,
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as double?,
            enableReasoning: freezed == enableReasoning
                ? _value.enableReasoning
                : enableReasoning // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$SessionConfigImplCopyWith<$Res>
    implements $SessionConfigCopyWith<$Res> {
  factory _$$SessionConfigImplCopyWith(
    _$SessionConfigImpl value,
    $Res Function(_$SessionConfigImpl) then,
  ) = __$$SessionConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? model, double? temperature, bool? enableReasoning});
}
/// @nodoc
class __$$SessionConfigImplCopyWithImpl<$Res>
    extends _$SessionConfigCopyWithImpl<$Res, _$SessionConfigImpl>
    implements _$$SessionConfigImplCopyWith<$Res> {
  __$$SessionConfigImplCopyWithImpl(
    _$SessionConfigImpl _value,
    $Res Function(_$SessionConfigImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? temperature = freezed,
    Object? enableReasoning = freezed,
  }) {
    return _then(
      _$SessionConfigImpl(
        model: freezed == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String?,
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as double?,
        enableReasoning: freezed == enableReasoning
            ? _value.enableReasoning
            : enableReasoning // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$SessionConfigImpl implements _SessionConfig {
  const _$SessionConfigImpl({
    this.model,
    this.temperature,
    this.enableReasoning,
  });
  factory _$SessionConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionConfigImplFromJson(json);
  @override
  final String? model;
  @override
  final double? temperature;
  @override
  final bool? enableReasoning;
  @override
  String toString() {
    return 'SessionConfig(model: $model, temperature: $temperature, enableReasoning: $enableReasoning)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionConfigImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.enableReasoning, enableReasoning) ||
                other.enableReasoning == enableReasoning));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, model, temperature, enableReasoning);
  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionConfigImplCopyWith<_$SessionConfigImpl> get copyWith =>
      __$$SessionConfigImplCopyWithImpl<_$SessionConfigImpl>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$$SessionConfigImplToJson(this);
  }
}
abstract class _SessionConfig implements SessionConfig {
  const factory _SessionConfig({
    final String? model,
    final double? temperature,
    final bool? enableReasoning,
  }) = _$SessionConfigImpl;
  factory _SessionConfig.fromJson(Map<String, dynamic> json) =
      _$SessionConfigImpl.fromJson;
  @override
  String? get model;
  @override
  double? get temperature;
  @override
  bool? get enableReasoning;
  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionConfigImplCopyWith<_$SessionConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/core/models/session.g.dart
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
    );
Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'rounds': instance.rounds,
      'config': instance.config,
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

## File: lib/core/models/sse_event.dart
```dart
class SseEvent {
  final String? id;
  final String? event;
  final String data;
  const SseEvent({
    this.id,
    this.event,
    required this.data,
  });
  @override
  String toString() => 'SseEvent(id: $id, event: $event, data: $data)';
}
```

## File: lib/core/utils/file_name_utils.dart
```dart
abstract class FileNameUtils {
  // Windows/Android/iOS 通用非法字符
  static final _illegalChars = RegExp(r'[<>:"/\\|?*]');
  // 清理非法字符
  static String sanitize(String name) {
    return name.replaceAll(_illegalChars, '_').trim();
  }
  // 生成唯一文件名 (如果存在冲突，自动加数字)
  // 注意：这里只处理字符串逻辑，实际文件存在性检查应在 Service 层
  static String makeUnique(String baseName, List<String> existingNames) {
    final cleanName = sanitize(baseName);
    if (!existingNames.contains('$cleanName.json')) {
      return '$cleanName.json';
    }
    int counter = 1;
    while (existingNames.contains('$cleanName$counter.json')) {
      counter++;
    }
    return '$cleanName$counter.json';
  }
  // 从文件名提取标题 (去掉 .json)
  static String extractTitle(String fileName) {
    return fileName.endsWith('.json') 
        ? fileName.substring(0, fileName.length - 5) 
        : fileName;
  }
}
```

## File: lib/core/utils/id_generator.dart
```dart
import 'package:uuid/uuid.dart';
abstract class IdGenerator {
  static final _uuid = const Uuid();
  static String generate() {
    return _uuid.v4();
  }
}
```

## File: lib/core/utils/json_utils.dart
```dart
import 'dart:convert';
import '../errors/exceptions.dart';
abstract class JsonUtils {
  static Map<String, dynamic> decode(String source) {
    try {
      return jsonDecode(source) as Map<String, dynamic>;
    } catch (e) {
      throw const ParseException('JSON 解析失败', code: 'INVALID_JSON');
    }
  }
  static String encode(Map<String, dynamic> data) {
    try {
      return jsonEncode(data);
    } catch (e) {
      throw const ParseException('JSON 编码失败', code: 'ENCODE_ERROR');
    }
  }
}
```

## File: lib/core/utils/sse_parser.dart
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

## File: lib/core/utils/time_format_utils.dart
```dart
import 'package:intl/intl.dart';
abstract class TimeFormatUtils {
  static final DateFormat _dateTimeFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  static String formatTimestamp(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return _dateTimeFormat.format(dateTime);
  }
}
```

## File: lib/data/data_sources/local_file_source.dart
```dart
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import '../../core/errors/exceptions.dart';
import '../../core/constants/app_constants.dart';
abstract class ILocalFileSource {
  Future<String> get basePath;
  Future<void> initDirectories();
  Future<String> readTextFile(String relativePath);
  Future<void> writeTextFile(String relativePath, String content);
  Future<void> deleteFile(String relativePath);
  Future<List<String>> listFiles(String directory);
  Future<String> saveAttachment(Uint8List data, String fileName);
  Future<Uint8List> readAttachment(String relativePath);
}
class LocalFileSource implements ILocalFileSource {
  final String _baseDir;
  final Directory _directory;
  LocalFileSource(this._baseDir) : _directory = Directory(_baseDir);
  @override
  Future<String> get basePath async => _baseDir;
  @override
  Future<void> initDirectories() async {
    await _directory.create(recursive: true);
    await Directory(path.join(_baseDir, AppConstants.dirConversations))
        .create(recursive: true);
    await Directory(path.join(_baseDir, AppConstants.dirAttachments))
        .create(recursive: true);
  }
  @override
  Future<String> readTextFile(String relativePath) async {
    try {
      final file = File(path.join(_baseDir, relativePath));
      if (!await file.exists()) {
        throw const FileException('文件不存在', code: 'FILE_NOT_FOUND');
      }
      return await file.readAsString();
    } on FileSystemException catch (e) {
      throw FileException('读取文件失败：${e.message}', code: 'READ_ERROR');
    }
  }
  @override
  Future<void> writeTextFile(String relativePath, String content) async {
    try {
      final file = File(path.join(_baseDir, relativePath));
      final dir = file.parent;
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }
      await file.writeAsString(content, flush: true);
    } on FileSystemException catch (e) {
      throw FileException('写入文件失败：${e.message}', code: 'WRITE_ERROR');
    }
  }
  @override
  Future<void> deleteFile(String relativePath) async {
    try {
      final file = File(path.join(_baseDir, relativePath));
      if (await file.exists()) {
        await file.delete();
      }
    } on FileSystemException catch (e) {
      throw FileException('删除文件失败：${e.message}', code: 'DELETE_ERROR');
    }
  }
  @override
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
      throw FileException('列出文件失败：${e.message}', code: 'LIST_ERROR');
    }
  }
  @override
  Future<String> saveAttachment(Uint8List data, String fileName) async {
    try {
      final uuid = const Uuid().v4();
      final ext = path.extension(fileName);
      final newFileName = '$uuid$ext';
      final relativePath =
          '${AppConstants.dirAttachments}/$newFileName';
      final filePath = path.join(_baseDir, relativePath);
      final file = File(filePath);
      await file.writeAsBytes(data, flush: true);
      return relativePath;
    } on FileSystemException catch (e) {
      throw FileException(
        '保存附件失败：${e.message}',
        code: 'ATTACHMENT_SAVE_ERROR',
      );
    }
  }
  @override
  Future<Uint8List> readAttachment(String relativePath) async {
    try {
      final file = File(path.join(_baseDir, relativePath));
      if (!await file.exists()) {
        throw const FileException('附件不存在', code: 'ATTACHMENT_NOT_FOUND');
      }
      return await file.readAsBytes();
    } on FileSystemException catch (e) {
      throw FileException(
        '读取附件失败：${e.message}',
        code: 'ATTACHMENT_READ_ERROR',
      );
    }
  }
}
```

## File: lib/data/data_sources/remote_api_source.dart
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/errors/exceptions.dart';
import '../../core/models/model_info.dart';
import '../../core/models/api_message.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/utils/sse_parser.dart';
import '../../domain/services/model_capability_registry.dart';
import 'sse_event_decoder.dart';
abstract class IRemoteApiSource {
  Future<List<ModelInfo>> fetchModels({
    required String baseUrl,
    required String apiKey,
    required String modelsPath,
  });
  Stream<ChatChunk> chatStream({
    required String taskId,
    required String baseUrl,
    required String apiKey,
    required String chatPath,
    required String apiMode,
    required String model,
    required List<ApiMessage> context,
    bool enableReasoning = false,
  });
  void cancelRequest(String taskId);
}
class RemoteApiSource implements IRemoteApiSource {
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
    final raw = ModelInfo(
      id: (json['id'] ?? '').toString(),
      name: json['name']?.toString(),
      supportsReasoning: _readBool(json, [
        'supportsReasoning',
        'supports_reasoning',
      ]),
      supportsVision: _readBool(json, [
        'supportsVision',
        'supports_vision',
        'vision',
        'supportsImageInput',
        'supports_image_input',
      ]),
      overrideSupportsReasoning: _readBool(json, [
        'overrideSupportsReasoning',
        'override_supports_reasoning',
      ]),
      overrideSupportsVision: _readBool(json, [
        'overrideSupportsVision',
        'override_supports_vision',
      ]),
    );
    return ModelCapabilityRegistry.enhance(raw);
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
  @override
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
        throw ApiException(
          '获取模型列表失败：${response.statusCode}',
          code: 'MODEL_FETCH_ERROR',
        );
      }
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final data = json['data'] as List<dynamic>;
      return data
          .map((e) => _parseModelInfo(e as Map<String, dynamic>))
          .toList();
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('获取模型列表失败：$e', code: 'MODEL_FETCH_ERROR');
    }
  }
  @override
  Stream<ChatChunk> chatStream({
    required String taskId,
    required String baseUrl,
    required String apiKey,
    required String chatPath,
    required String apiMode,
    required String model,
    required List<ApiMessage> context,
    bool enableReasoning = false,
  }) async* {
    _cancelledTasks.remove(taskId);
    final client = http.Client();
    _activeClients[taskId] = client;
    try {
      final url = Uri.parse(_buildUrl(baseUrl, chatPath));
      final requestBody = _buildRequestBody(
        apiMode: apiMode,
        model: model,
        context: context,
        enableReasoning: enableReasoning,
      );
      final body = jsonEncode(requestBody);
      // 调试用：必要时打开
      // print('REQUEST URL => $url');
      // print('REQUEST BODY => $body');
      final request = http.Request('POST', url)
        ..headers.addAll({
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
          'Accept': 'text/event-stream',
          'Cache-Control': 'no-cache',
        })
        ..body = body;
      final streamedResponse = await client.send(request);
      if (streamedResponse.statusCode < 200 ||
          streamedResponse.statusCode >= 300) {
        final errorBody = await streamedResponse.stream.bytesToString();
        throw ApiException(
          '流式请求失败：${streamedResponse.statusCode} $errorBody',
          code: 'CHAT_STREAM_ERROR',
        );
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
          } catch (e) {
            // 保持原逻辑风格：单条 SSE 事件解析失败不让整个流崩掉
            // 如需调试，可打开下面这行：
            // print('SSE decode error: $e, event=$event');
          }
        }
      }
      // 流结束时 flush 一次，避免最后一个事件未被空行结尾
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
    } on ApiException {
      rethrow;
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
  @override
  void cancelRequest(String taskId) {
    _cancelledTasks.add(taskId);
    _activeClients[taskId]?.close();
    _activeClients.remove(taskId);
  }
}
```

## File: lib/data/data_sources/sse_event_decoder.dart
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

## File: lib/data/repositories/config_repository.dart
```dart
import '../../core/models/app_config.dart';
import '../../core/interfaces/config_service.dart';
class ConfigRepository {
  final IConfigService _configService;
  ConfigRepository(this._configService);
  Future<AppConfig> getConfig() async {
    return await _configService.loadConfig();
  }
  Future<void> saveConfig(AppConfig config) async {
    await _configService.saveConfig(config);
  }
  Future<void> saveFullConfig(AppConfig config) async {
    await saveConfig(config);
  }
  Future<void> saveAndRefreshModels(AppConfig config) async {
    final clearedConfig = config.copyWith(
      availableModels: [],
    );
    await _configService.saveConfig(clearedConfig);
    await _configService.refreshModels();
  }
  Future<void> updateApiKey(String apiKey) async {
    final config = await getConfig();
    final updated = config.copyWith(apiKey: apiKey);
    await saveConfig(updated);
  }
  Future<void> updateBaseUrl(String baseUrl) async {
    final config = await getConfig();
    final updated = config.copyWith(baseUrl: baseUrl);
    await saveConfig(updated);
  }
  Future<void> updateModelsPath(String modelsPath) async {
    final config = await getConfig();
    final updated = config.copyWith(modelsPath: modelsPath);
    await saveConfig(updated);
  }
  Future<void> updateChatPath(String chatPath) async {
    final config = await getConfig();
    final updated = config.copyWith(chatPath: chatPath);
    await saveConfig(updated);
  }
  Future<void> updateApiMode(String apiMode) async {
    final config = await getConfig();
    final updated = config.copyWith(apiMode: apiMode);
    await saveConfig(updated);
  }
  Future<void> updateSelectedModel(String? model) async {
    final config = await getConfig();
    final updated = config.copyWith(selectedModel: model);
    await saveConfig(updated);
  }
  Future<void> refreshModels() async {
    await _configService.refreshModels();
  }
  Future<List<String>> getAvailableModelIds() async {
    final config = await getConfig();
    final models = config.availableModels ?? [];
    return models.map((m) => m.id).toList();
  }
}
```

## File: lib/data/repositories/conversation_repository.dart
```dart
import 'dart:typed_data';
import 'package:synchronized/synchronized.dart';
import '../../core/models/session.dart';
import '../../core/models/chat_round.dart';
import '../../core/interfaces/file_service.dart';
import '../../core/utils/id_generator.dart';
class ConversationRepository {
  final IFileService _fileService;
  // 针对特定文件名的异步互斥锁，防止并发任务覆盖存档
  final Map<String, Lock> _locks = {};
  ConversationRepository(this._fileService);
  /// 互斥锁执行器，确保对同一个文件操作是顺序的
  Future<T> _runWithLock<T>(String fileName, Future<T> Function() action) {
    final lock = _locks.putIfAbsent(fileName, () => Lock());
    return lock.synchronized(action);
  }
  Future<List<String>> getAllSessionFileNames() async {
    return await _fileService.getConversationFileList();
  }
  Future<Session> getSession(String fileName) async {
    return _runWithLock(fileName, () async {
      return await _fileService.readSession(fileName);
    });
  }
  Future<void> saveSession(String fileName, Session session) async {
    return _runWithLock(fileName, () async {
      await _fileService.writeSession(fileName, session);
    });
  }
  Future<void> deleteSession(String fileName) async {
    return _runWithLock(fileName, () async {
      await _fileService.deleteSession(fileName);
    });
  }
  Future<String> saveAttachment(Uint8List data, String fileName) async {
    return await _fileService.saveAttachment(data, fileName);
  }
  Future<Uint8List> getAttachment(String relativePath) async {
    return await _fileService.readAttachment(relativePath);
  }
  Future<void> deleteAttachment(String relativePath) async {
    await _fileService.deleteAttachment(relativePath);
  }
  Future<Session> createSession({
    required String fileName,
    required String title,
  }) async {
    return _runWithLock(fileName, () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      final session = Session(
        id: fileName.replaceAll('.json', ''),
        title: title,
        createdAt: now,
        updatedAt: now,
        rounds: [],
      );
      await _fileService.writeSession(fileName, session);
      return session;
    });
  }
  Future<Session> createSessionWithGeneratedId({
    required String title,
  }) async {
    final sessionId = IdGenerator.generate();
    final fileName = '$sessionId.json';
    return await createSession(
      fileName: fileName,
      title: title,
    );
  }
  Future<void> updateSessionTitle(String fileName, String title) async {
    return _runWithLock(fileName, () async {
      final session = await _fileService.readSession(fileName);
      final updatedSession = session.copyWith(
        title: title,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _fileService.writeSession(fileName, updatedSession);
    });
  }
  Future<List<Session>> getAllSessions() async {
    final fileNames = await getAllSessionFileNames();
    final sessions = <Session>[];
    for (final fileName in fileNames) {
      try {
        final session = await getSession(fileName);
        sessions.add(session);
      } catch (_) {
        // 忽略损坏/不可读的会话文件，避免整个列表崩掉
      }
    }
    sessions.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return sessions;
  }
  Future<void> appendRound(String fileName, ChatRound round) async {
    return _runWithLock(fileName, () async {
      final session = await _fileService.readSession(fileName);
      final updatedSession = session.copyWith(
        rounds: [...session.rounds, round],
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _fileService.writeSession(fileName, updatedSession);
    });
  }
  Future<void> updateRound(
    String fileName,
    String roundId,
    ChatRound updatedRound,
  ) async {
    return _runWithLock(fileName, () async {
      final session = await _fileService.readSession(fileName);
      final updatedRounds = session.rounds.map((round) {
        if (round.id == roundId) {
          return updatedRound;
        }
        return round;
      }).toList();
      final updatedSession = session.copyWith(
        rounds: updatedRounds,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _fileService.writeSession(fileName, updatedSession);
    });
  }
}
```

## File: lib/data/services/api_service.dart
```dart
import '../../core/interfaces/api_service.dart';
import '../../core/models/model_info.dart';
import '../../core/models/api_message.dart';
import '../../core/models/chat_chunk.dart';
import '../data_sources/remote_api_source.dart';
class ApiService implements IApiService {
  final IRemoteApiSource _apiSource;
  ApiService(this._apiSource);
  @override
  Future<List<ModelInfo>> fetchModels({
    required String baseUrl,
    required String apiKey,
    required String modelsPath,
  }) async {
    return await _apiSource.fetchModels(
      baseUrl: baseUrl,
      apiKey: apiKey,
      modelsPath: modelsPath,
    );
  }
  @override
  Stream<ChatChunk> chatStream({
    required String taskId,
    required String baseUrl,
    required String apiKey,
    required String chatPath,
    required String apiMode,
    required String model,
    required List<ApiMessage> context,
    bool enableReasoning = false,
  }) async* {
    yield* _apiSource.chatStream(
      taskId: taskId,
      baseUrl: baseUrl,
      apiKey: apiKey,
      chatPath: chatPath,
      apiMode: apiMode,
      model: model,
      context: context,
      enableReasoning: enableReasoning,
    );
  }
  @override
  void cancelRequest(String taskId) {
    _apiSource.cancelRequest(taskId);
  }
}
```

## File: lib/data/services/config_service.dart
```dart
import '../../core/interfaces/config_service.dart';
import '../../core/models/app_config.dart';
import '../../core/interfaces/file_service.dart';
import '../../core/interfaces/api_service.dart';
class ConfigService implements IConfigService {
  final IFileService _fileService;
  final IApiService _apiService;
  AppConfig? _cachedConfig;
  ConfigService(this._fileService, this._apiService);
  @override
  Future<AppConfig> loadConfig() async {
    try {
      _cachedConfig = await _fileService.readConfig();
    } catch (_) {
      _cachedConfig = AppConfig.defaultConfig();
      await _fileService.writeConfig(_cachedConfig!);
    }
    return _cachedConfig!;
  }
  @override
  Future<void> saveConfig(AppConfig config) async {
    await _fileService.writeConfig(config);
    _cachedConfig = config;
  }
  @override
  Future<void> refreshModels() async {
    if (_cachedConfig == null) {
      await loadConfig();
    }
    final models = await _apiService.fetchModels(
      baseUrl: _cachedConfig!.baseUrl,
      apiKey: _cachedConfig!.apiKey,
      modelsPath: _cachedConfig!.modelsPath,
    );
    _cachedConfig = _cachedConfig!.copyWith(availableModels: models);
    await _fileService.writeConfig(_cachedConfig!);
  }
}
```

## File: lib/data/services/file_service.dart
```dart
import 'dart:typed_data';
import '../../core/interfaces/file_service.dart';
import '../../core/models/session.dart';
import '../../core/models/app_config.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/json_utils.dart';
import '../data_sources/local_file_source.dart';
class FileService implements IFileService {
  final ILocalFileSource _fileSource;
  FileService(this._fileSource);
  @override
  Future<AppConfig> readConfig() async {
    final content = await _fileSource.readTextFile(AppConstants.fileConfig);
    final json = JsonUtils.decode(content);
    return AppConfig.fromJson(json);
  }
  @override
  Future<void> writeConfig(AppConfig config) async {
    final json = config.toJson();
    final content = JsonUtils.encode(json);
    await _fileSource.writeTextFile(AppConstants.fileConfig, content);
  }
  @override
  Future<List<String>> getConversationFileList() async {
    return await _fileSource.listFiles(AppConstants.dirConversations);
  }
  @override
  Future<Session> readSession(String fileName) async {
    final relativePath = '${AppConstants.dirConversations}/$fileName';
    final content = await _fileSource.readTextFile(relativePath);
    final json = JsonUtils.decode(content);
    return Session.fromJson(json);
  }
  @override
  Future<void> writeSession(String fileName, Session session) async {
    final relativePath = '${AppConstants.dirConversations}/$fileName';
    final json = session.toJson();
    final content = JsonUtils.encode(json);
    await _fileSource.writeTextFile(relativePath, content);
  }
  @override
  Future<void> deleteSession(String fileName) async {
    final relativePath = '${AppConstants.dirConversations}/$fileName';
    await _fileSource.deleteFile(relativePath);
  }
  @override
  Future<String> saveAttachment(Uint8List data, String fileName) async {
    return await _fileSource.saveAttachment(data, fileName);
  }
  @override
  Future<Uint8List> readAttachment(String relativePath) async {
    return await _fileSource.readAttachment(relativePath);
  }
  @override
  Future<void> deleteAttachment(String relativePath) async {
    await _fileSource.deleteFile(relativePath);
  }
}
```

## File: lib/di/providers.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
// ==========================================
// Data Sources
// ==========================================
import '../data/data_sources/local_file_source.dart';
import '../data/data_sources/remote_api_source.dart';
// ==========================================
// Services
// ==========================================
import '../data/services/file_service.dart';
import '../data/services/api_service.dart';
import '../data/services/config_service.dart';
// ==========================================
// Repositories
// ==========================================
import '../data/repositories/conversation_repository.dart';
import '../data/repositories/config_repository.dart';
// ==========================================
// Core Interfaces
// ==========================================
import '../core/interfaces/file_service.dart';
import '../core/interfaces/api_service.dart';
import '../core/interfaces/config_service.dart';
/// 应用初始化状态
enum InitStatus {
  idle,
  loading,
  success,
  error,
}
/// 初始化数据模型
class InitState {
  final InitStatus status;
  final String? errorMessage;
  final ILocalFileSource? fileSource;
  final IFileService? fileService;
  final IApiService? apiService;
  final IConfigService? configService;
  final ConversationRepository? conversationRepository;
  final ConfigRepository? configRepository;
  InitState({
    this.status = InitStatus.idle,
    this.errorMessage,
    this.fileSource,
    this.fileService,
    this.apiService,
    this.configService,
    this.conversationRepository,
    this.configRepository,
  });
  InitState copyWith({
    InitStatus? status,
    String? errorMessage,
    ILocalFileSource? fileSource,
    IFileService? fileService,
    IApiService? apiService,
    IConfigService? configService,
    ConversationRepository? conversationRepository,
    ConfigRepository? configRepository,
  }) {
    return InitState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      fileSource: fileSource ?? this.fileSource,
      fileService: fileService ?? this.fileService,
      apiService: apiService ?? this.apiService,
      configService: configService ?? this.configService,
      conversationRepository: conversationRepository ?? this.conversationRepository,
      configRepository: configRepository ?? this.configRepository,
    );
  }
}
/// 初始化 Notifier
class InitNotifier extends StateNotifier<InitState> {
  InitNotifier() : super(InitState());
  Future<void> initialize() async {
    state = state.copyWith(status: InitStatus.loading);
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final basePath = appDir.path;
      final fileSource = LocalFileSource(basePath);
      await fileSource.initDirectories();
      final fileService = FileService(fileSource);
      final apiService = ApiService(RemoteApiSource());
      final configService = ConfigService(fileService, apiService);
      final conversationRepository = ConversationRepository(fileService);
      final configRepository = ConfigRepository(configService);
      state = state.copyWith(
        status: InitStatus.success,
        fileSource: fileSource,
        fileService: fileService,
        apiService: apiService,
        configService: configService,
        conversationRepository: conversationRepository,
        configRepository: configRepository,
      );
    } catch (e) {
      state = state.copyWith(
        status: InitStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
// ==========================================
// Providers
// ==========================================
final initProvider = StateNotifierProvider<InitNotifier, InitState>((ref) {
  return InitNotifier();
});
final localFileSourceProvider = Provider<ILocalFileSource>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.fileSource == null) {
    throw StateError('应用未初始化');
  }
  return initState.fileSource!;
});
final fileServiceProvider = Provider<IFileService>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.fileService == null) {
    throw StateError('应用未初始化');
  }
  return initState.fileService!;
});
final apiServiceProvider = Provider<IApiService>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.apiService == null) {
    throw StateError('应用未初始化');
  }
  return initState.apiService!;
});
final configServiceProvider = Provider<IConfigService>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.configService == null) {
    throw StateError('应用未初始化');
  }
  return initState.configService!;
});
final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.conversationRepository == null) {
    throw StateError('应用未初始化');
  }
  return initState.conversationRepository!;
});
final configRepositoryProvider = Provider<ConfigRepository>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.configRepository == null) {
    throw StateError('应用未初始化');
  }
  return initState.configRepository!;
});
```

## File: lib/domain/models/chat_page.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/models/chat_round.dart';
part 'chat_page.freezed.dart';
@freezed
class ChatPage with _$ChatPage {
  const factory ChatPage({
    required int pageIndex,
    required ChatRound round,
  }) = _ChatPage;
}
@freezed
class ChatPageList with _$ChatPageList {
  const factory ChatPageList({
    required List<ChatPage> pages,
    required int currentPageIndex,
    required int totalPages,
  }) = _ChatPageList;
  factory ChatPageList.fromPages(List<ChatPage> pages, int currentIndex) {
    return ChatPageList(
      pages: pages,
      currentPageIndex: pages.isEmpty ? 0 : currentIndex,
      totalPages: pages.length,
    );
  }
}
```

## File: lib/domain/models/chat_page.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'chat_page.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
/// @nodoc
mixin _$ChatPage {
  int get pageIndex => throw _privateConstructorUsedError;
  ChatRound get round => throw _privateConstructorUsedError;
  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatPageCopyWith<ChatPage> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $ChatPageCopyWith<$Res> {
  factory $ChatPageCopyWith(ChatPage value, $Res Function(ChatPage) then) =
      _$ChatPageCopyWithImpl<$Res, ChatPage>;
  @useResult
  $Res call({int pageIndex, ChatRound round});
  $ChatRoundCopyWith<$Res> get round;
}
/// @nodoc
class _$ChatPageCopyWithImpl<$Res, $Val extends ChatPage>
    implements $ChatPageCopyWith<$Res> {
  _$ChatPageCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pageIndex = null, Object? round = null}) {
    return _then(
      _value.copyWith(
            pageIndex: null == pageIndex
                ? _value.pageIndex
                : pageIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            round: null == round
                ? _value.round
                : round // ignore: cast_nullable_to_non_nullable
                      as ChatRound,
          )
          as $Val,
    );
  }
  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatRoundCopyWith<$Res> get round {
    return $ChatRoundCopyWith<$Res>(_value.round, (value) {
      return _then(_value.copyWith(round: value) as $Val);
    });
  }
}
/// @nodoc
abstract class _$$ChatPageImplCopyWith<$Res>
    implements $ChatPageCopyWith<$Res> {
  factory _$$ChatPageImplCopyWith(
    _$ChatPageImpl value,
    $Res Function(_$ChatPageImpl) then,
  ) = __$$ChatPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageIndex, ChatRound round});
  @override
  $ChatRoundCopyWith<$Res> get round;
}
/// @nodoc
class __$$ChatPageImplCopyWithImpl<$Res>
    extends _$ChatPageCopyWithImpl<$Res, _$ChatPageImpl>
    implements _$$ChatPageImplCopyWith<$Res> {
  __$$ChatPageImplCopyWithImpl(
    _$ChatPageImpl _value,
    $Res Function(_$ChatPageImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pageIndex = null, Object? round = null}) {
    return _then(
      _$ChatPageImpl(
        pageIndex: null == pageIndex
            ? _value.pageIndex
            : pageIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        round: null == round
            ? _value.round
            : round // ignore: cast_nullable_to_non_nullable
                  as ChatRound,
      ),
    );
  }
}
/// @nodoc
class _$ChatPageImpl implements _ChatPage {
  const _$ChatPageImpl({required this.pageIndex, required this.round});
  @override
  final int pageIndex;
  @override
  final ChatRound round;
  @override
  String toString() {
    return 'ChatPage(pageIndex: $pageIndex, round: $round)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPageImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.round, round) || other.round == round));
  }
  @override
  int get hashCode => Object.hash(runtimeType, pageIndex, round);
  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPageImplCopyWith<_$ChatPageImpl> get copyWith =>
      __$$ChatPageImplCopyWithImpl<_$ChatPageImpl>(this, _$identity);
}
abstract class _ChatPage implements ChatPage {
  const factory _ChatPage({
    required final int pageIndex,
    required final ChatRound round,
  }) = _$ChatPageImpl;
  @override
  int get pageIndex;
  @override
  ChatRound get round;
  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatPageImplCopyWith<_$ChatPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
mixin _$ChatPageList {
  List<ChatPage> get pages => throw _privateConstructorUsedError;
  int get currentPageIndex => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  /// Create a copy of ChatPageList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatPageListCopyWith<ChatPageList> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $ChatPageListCopyWith<$Res> {
  factory $ChatPageListCopyWith(
    ChatPageList value,
    $Res Function(ChatPageList) then,
  ) = _$ChatPageListCopyWithImpl<$Res, ChatPageList>;
  @useResult
  $Res call({List<ChatPage> pages, int currentPageIndex, int totalPages});
}
/// @nodoc
class _$ChatPageListCopyWithImpl<$Res, $Val extends ChatPageList>
    implements $ChatPageListCopyWith<$Res> {
  _$ChatPageListCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of ChatPageList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pages = null,
    Object? currentPageIndex = null,
    Object? totalPages = null,
  }) {
    return _then(
      _value.copyWith(
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as List<ChatPage>,
            currentPageIndex: null == currentPageIndex
                ? _value.currentPageIndex
                : currentPageIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$ChatPageListImplCopyWith<$Res>
    implements $ChatPageListCopyWith<$Res> {
  factory _$$ChatPageListImplCopyWith(
    _$ChatPageListImpl value,
    $Res Function(_$ChatPageListImpl) then,
  ) = __$$ChatPageListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatPage> pages, int currentPageIndex, int totalPages});
}
/// @nodoc
class __$$ChatPageListImplCopyWithImpl<$Res>
    extends _$ChatPageListCopyWithImpl<$Res, _$ChatPageListImpl>
    implements _$$ChatPageListImplCopyWith<$Res> {
  __$$ChatPageListImplCopyWithImpl(
    _$ChatPageListImpl _value,
    $Res Function(_$ChatPageListImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ChatPageList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pages = null,
    Object? currentPageIndex = null,
    Object? totalPages = null,
  }) {
    return _then(
      _$ChatPageListImpl(
        pages: null == pages
            ? _value._pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as List<ChatPage>,
        currentPageIndex: null == currentPageIndex
            ? _value.currentPageIndex
            : currentPageIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
/// @nodoc
class _$ChatPageListImpl implements _ChatPageList {
  const _$ChatPageListImpl({
    required final List<ChatPage> pages,
    required this.currentPageIndex,
    required this.totalPages,
  }) : _pages = pages;
  final List<ChatPage> _pages;
  @override
  List<ChatPage> get pages {
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }
  @override
  final int currentPageIndex;
  @override
  final int totalPages;
  @override
  String toString() {
    return 'ChatPageList(pages: $pages, currentPageIndex: $currentPageIndex, totalPages: $totalPages)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPageListImpl &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            (identical(other.currentPageIndex, currentPageIndex) ||
                other.currentPageIndex == currentPageIndex) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_pages),
    currentPageIndex,
    totalPages,
  );
  /// Create a copy of ChatPageList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPageListImplCopyWith<_$ChatPageListImpl> get copyWith =>
      __$$ChatPageListImplCopyWithImpl<_$ChatPageListImpl>(this, _$identity);
}
abstract class _ChatPageList implements ChatPageList {
  const factory _ChatPageList({
    required final List<ChatPage> pages,
    required final int currentPageIndex,
    required final int totalPages,
  }) = _$ChatPageListImpl;
  @override
  List<ChatPage> get pages;
  @override
  int get currentPageIndex;
  @override
  int get totalPages;
  /// Create a copy of ChatPageList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatPageListImplCopyWith<_$ChatPageListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/domain/models/tree_node.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/models/chat_round.dart';
part 'tree_node.freezed.dart';
@freezed
class TreeNode with _$TreeNode {
  const factory TreeNode({
    required String id,
    String? parentId,
    required ChatRound round,
    required List<TreeNode> children,
    required int depth,
    String? preview,
  }) = _TreeNode;
  factory TreeNode.fromRound({
    required ChatRound round,
    required int depth,
  }) {
    final userText = round.userContent.trim();
    final aiText = round.assistantContent?.trim() ?? '（等待回复）';
    final userPreview =
        userText.length > 20 ? '${userText.substring(0, 20)}...' : userText;
    final aiPreview =
        aiText.length > 20 ? '${aiText.substring(0, 20)}...' : aiText;
    return TreeNode(
      id: round.id,
      parentId: round.parentId,
      round: round,
      children: const [],
      depth: depth,
      preview: 'YOU: $userPreview\nAI: $aiPreview',
    );
  }
}
@freezed
class TreePath with _$TreePath {
  const factory TreePath({
    required List<TreeNode> nodes,
    required TreeNode targetNode,
  }) = _TreePath;
}
```

## File: lib/domain/models/tree_node.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'tree_node.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
/// @nodoc
mixin _$TreeNode {
  String get id => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  ChatRound get round => throw _privateConstructorUsedError;
  List<TreeNode> get children => throw _privateConstructorUsedError;
  int get depth => throw _privateConstructorUsedError;
  String? get preview => throw _privateConstructorUsedError;
  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreeNodeCopyWith<TreeNode> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $TreeNodeCopyWith<$Res> {
  factory $TreeNodeCopyWith(TreeNode value, $Res Function(TreeNode) then) =
      _$TreeNodeCopyWithImpl<$Res, TreeNode>;
  @useResult
  $Res call({
    String id,
    String? parentId,
    ChatRound round,
    List<TreeNode> children,
    int depth,
    String? preview,
  });
  $ChatRoundCopyWith<$Res> get round;
}
/// @nodoc
class _$TreeNodeCopyWithImpl<$Res, $Val extends TreeNode>
    implements $TreeNodeCopyWith<$Res> {
  _$TreeNodeCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? round = null,
    Object? children = null,
    Object? depth = null,
    Object? preview = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            round: null == round
                ? _value.round
                : round // ignore: cast_nullable_to_non_nullable
                      as ChatRound,
            children: null == children
                ? _value.children
                : children // ignore: cast_nullable_to_non_nullable
                      as List<TreeNode>,
            depth: null == depth
                ? _value.depth
                : depth // ignore: cast_nullable_to_non_nullable
                      as int,
            preview: freezed == preview
                ? _value.preview
                : preview // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatRoundCopyWith<$Res> get round {
    return $ChatRoundCopyWith<$Res>(_value.round, (value) {
      return _then(_value.copyWith(round: value) as $Val);
    });
  }
}
/// @nodoc
abstract class _$$TreeNodeImplCopyWith<$Res>
    implements $TreeNodeCopyWith<$Res> {
  factory _$$TreeNodeImplCopyWith(
    _$TreeNodeImpl value,
    $Res Function(_$TreeNodeImpl) then,
  ) = __$$TreeNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? parentId,
    ChatRound round,
    List<TreeNode> children,
    int depth,
    String? preview,
  });
  @override
  $ChatRoundCopyWith<$Res> get round;
}
/// @nodoc
class __$$TreeNodeImplCopyWithImpl<$Res>
    extends _$TreeNodeCopyWithImpl<$Res, _$TreeNodeImpl>
    implements _$$TreeNodeImplCopyWith<$Res> {
  __$$TreeNodeImplCopyWithImpl(
    _$TreeNodeImpl _value,
    $Res Function(_$TreeNodeImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? round = null,
    Object? children = null,
    Object? depth = null,
    Object? preview = freezed,
  }) {
    return _then(
      _$TreeNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        round: null == round
            ? _value.round
            : round // ignore: cast_nullable_to_non_nullable
                  as ChatRound,
        children: null == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<TreeNode>,
        depth: null == depth
            ? _value.depth
            : depth // ignore: cast_nullable_to_non_nullable
                  as int,
        preview: freezed == preview
            ? _value.preview
            : preview // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
/// @nodoc
class _$TreeNodeImpl implements _TreeNode {
  const _$TreeNodeImpl({
    required this.id,
    this.parentId,
    required this.round,
    required final List<TreeNode> children,
    required this.depth,
    this.preview,
  }) : _children = children;
  @override
  final String id;
  @override
  final String? parentId;
  @override
  final ChatRound round;
  final List<TreeNode> _children;
  @override
  List<TreeNode> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }
  @override
  final int depth;
  @override
  final String? preview;
  @override
  String toString() {
    return 'TreeNode(id: $id, parentId: $parentId, round: $round, children: $children, depth: $depth, preview: $preview)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.round, round) || other.round == round) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.preview, preview) || other.preview == preview));
  }
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    parentId,
    round,
    const DeepCollectionEquality().hash(_children),
    depth,
    preview,
  );
  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeImplCopyWith<_$TreeNodeImpl> get copyWith =>
      __$$TreeNodeImplCopyWithImpl<_$TreeNodeImpl>(this, _$identity);
}
abstract class _TreeNode implements TreeNode {
  const factory _TreeNode({
    required final String id,
    final String? parentId,
    required final ChatRound round,
    required final List<TreeNode> children,
    required final int depth,
    final String? preview,
  }) = _$TreeNodeImpl;
  @override
  String get id;
  @override
  String? get parentId;
  @override
  ChatRound get round;
  @override
  List<TreeNode> get children;
  @override
  int get depth;
  @override
  String? get preview;
  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreeNodeImplCopyWith<_$TreeNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
mixin _$TreePath {
  List<TreeNode> get nodes => throw _privateConstructorUsedError;
  TreeNode get targetNode => throw _privateConstructorUsedError;
  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreePathCopyWith<TreePath> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $TreePathCopyWith<$Res> {
  factory $TreePathCopyWith(TreePath value, $Res Function(TreePath) then) =
      _$TreePathCopyWithImpl<$Res, TreePath>;
  @useResult
  $Res call({List<TreeNode> nodes, TreeNode targetNode});
  $TreeNodeCopyWith<$Res> get targetNode;
}
/// @nodoc
class _$TreePathCopyWithImpl<$Res, $Val extends TreePath>
    implements $TreePathCopyWith<$Res> {
  _$TreePathCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nodes = null, Object? targetNode = null}) {
    return _then(
      _value.copyWith(
            nodes: null == nodes
                ? _value.nodes
                : nodes // ignore: cast_nullable_to_non_nullable
                      as List<TreeNode>,
            targetNode: null == targetNode
                ? _value.targetNode
                : targetNode // ignore: cast_nullable_to_non_nullable
                      as TreeNode,
          )
          as $Val,
    );
  }
  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TreeNodeCopyWith<$Res> get targetNode {
    return $TreeNodeCopyWith<$Res>(_value.targetNode, (value) {
      return _then(_value.copyWith(targetNode: value) as $Val);
    });
  }
}
/// @nodoc
abstract class _$$TreePathImplCopyWith<$Res>
    implements $TreePathCopyWith<$Res> {
  factory _$$TreePathImplCopyWith(
    _$TreePathImpl value,
    $Res Function(_$TreePathImpl) then,
  ) = __$$TreePathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TreeNode> nodes, TreeNode targetNode});
  @override
  $TreeNodeCopyWith<$Res> get targetNode;
}
/// @nodoc
class __$$TreePathImplCopyWithImpl<$Res>
    extends _$TreePathCopyWithImpl<$Res, _$TreePathImpl>
    implements _$$TreePathImplCopyWith<$Res> {
  __$$TreePathImplCopyWithImpl(
    _$TreePathImpl _value,
    $Res Function(_$TreePathImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nodes = null, Object? targetNode = null}) {
    return _then(
      _$TreePathImpl(
        nodes: null == nodes
            ? _value._nodes
            : nodes // ignore: cast_nullable_to_non_nullable
                  as List<TreeNode>,
        targetNode: null == targetNode
            ? _value.targetNode
            : targetNode // ignore: cast_nullable_to_non_nullable
                  as TreeNode,
      ),
    );
  }
}
/// @nodoc
class _$TreePathImpl implements _TreePath {
  const _$TreePathImpl({
    required final List<TreeNode> nodes,
    required this.targetNode,
  }) : _nodes = nodes;
  final List<TreeNode> _nodes;
  @override
  List<TreeNode> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }
  @override
  final TreeNode targetNode;
  @override
  String toString() {
    return 'TreePath(nodes: $nodes, targetNode: $targetNode)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreePathImpl &&
            const DeepCollectionEquality().equals(other._nodes, _nodes) &&
            (identical(other.targetNode, targetNode) ||
                other.targetNode == targetNode));
  }
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_nodes),
    targetNode,
  );
  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreePathImplCopyWith<_$TreePathImpl> get copyWith =>
      __$$TreePathImplCopyWithImpl<_$TreePathImpl>(this, _$identity);
}
abstract class _TreePath implements TreePath {
  const factory _TreePath({
    required final List<TreeNode> nodes,
    required final TreeNode targetNode,
  }) = _$TreePathImpl;
  @override
  List<TreeNode> get nodes;
  @override
  TreeNode get targetNode;
  /// Create a copy of TreePath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreePathImplCopyWith<_$TreePathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/domain/services/attachment_preparer.dart
```dart
import 'dart:io';
import '../../core/models/attachment.dart';
import '../../data/repositories/conversation_repository.dart';
import '../../presentation/models/pending_attachment.dart';
class AttachmentPreparer {
  static Future<List<Attachment>> savePendingAttachments(
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
}
```

## File: lib/domain/services/branch_navigator.dart
```dart
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../models/tree_node.dart';
import 'tree_builder.dart';
class BranchNavigator {
  static List<ChatRound> getCurrentBranchPath(
    Session session,
    String currentRoundId,
  ) {
    if (session.rounds.isEmpty) return const [];
    final roots = TreeBuilder.buildTree(session.rounds);
    final path = TreeBuilder.findPath(roots, currentRoundId);
    if (path == null) {
      return [...session.rounds]
        ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
    return path.nodes.map((node) => node.round).toList();
  }
  static String switchBranch(Session session, String targetRoundId) {
    if (session.rounds.isEmpty) return targetRoundId;
    final roots = TreeBuilder.buildTree(session.rounds);
    final path = TreeBuilder.findPath(roots, targetRoundId);
    if (path == null) return targetRoundId;
    return path.targetNode.id;
  }
  static List<TreeNode> getAllBranchLeaves(Session session) {
    if (session.rounds.isEmpty) return const [];
    final roots = TreeBuilder.buildTree(session.rounds);
    return TreeBuilder.findLeafNodes(roots);
  }
  static bool isOnLatestBranch(Session session, String currentRoundId) {
    if (session.rounds.isEmpty) return true;
    final roots = TreeBuilder.buildTree(session.rounds);
    final leaves = TreeBuilder.findLeafNodes(roots);
    if (leaves.isEmpty) return true;
    final latestLeaf = leaves.reduce((a, b) {
      return a.round.createdAt >= b.round.createdAt ? a : b;
    });
    return latestLeaf.id == currentRoundId;
  }
}
```

## File: lib/domain/services/chat_context_builder.dart
```dart
import 'dart:convert';
import '../../core/models/api_message.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';
class ChatContextBuilder {
  static Future<List<ApiMessage>> buildFromRounds(
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
  static ApiMessage? _buildAssistantMessage(ChatRound round) {
    final thinking = round.assistantThinking?.trim() ?? '';
    final content = round.assistantContent?.trim() ?? '';
    if (thinking.isEmpty && content.isEmpty) {
      return null;
    }
    return ApiMessage(
      role: 'assistant',
      content: content.isEmpty ? null : content,
      reasoning: thinking.isEmpty ? null : thinking,
    );
  }
  static Future<ApiMessage> _buildUserMessage(
    ChatRound round,
    ConversationRepository repository,
  ) async {
    final parts = <ApiMessageContentPart>[];
    if (round.userContent.trim().isNotEmpty) {
      parts.add(
        ApiMessageContentPart.text(
          text: round.userContent.trim(),
        ),
      );
    }
    for (final attachment in round.userAttachments) {
      final attachmentParts =
          await _buildAttachmentParts(attachment, repository);
      parts.addAll(attachmentParts);
    }
    if (parts.isEmpty) {
      return const ApiMessage(
        role: 'user',
        content: '',
      );
    }
    if (_isOnlySingleTextPart(parts)) {
      final text = parts.first.maybeWhen(
        text: (_, text) => text,
        orElse: () => '',
      );
      return ApiMessage(
        role: 'user',
        content: text,
      );
    }
    return ApiMessage(
      role: 'user',
      parts: parts,
    );
  }
  static bool _isOnlySingleTextPart(List<ApiMessageContentPart> parts) {
    if (parts.length != 1) return false;
    return parts.first.maybeWhen(
      text: (_, text) => true,
      orElse: () => false,
    );
  }
  static Future<List<ApiMessageContentPart>> _buildAttachmentParts(
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
      final dataUrl = 'data:$mimeType;base64,$base64Data';
      return [
        ApiMessageContentPart.imageUrl(
          imageUrl: ApiImageUrl(url: dataUrl),
        ),
      ];
    }
    if (isTextFile) {
      final bytes = await repository.getAttachment(attachment.relativePath);
      final text = utf8.decode(bytes, allowMalformed: true);
      return [
        ApiMessageContentPart.text(
          text: text,
        ),
      ];
    }
    return [
      ApiMessageContentPart.text(
        text: '[附件: ${attachment.name}]',
      ),
    ];
  }
}
```

## File: lib/domain/services/chat_round_factory.dart
```dart
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../core/utils/id_generator.dart';
class ChatRoundFactory {
  static ChatRound createUserRound({
    required String content,
    required String? parentId,
    required List<Attachment> attachments,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return ChatRound(
      id: IdGenerator.generate(),
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
      id: IdGenerator.generate(),
      parentId: sourceRound.parentId,
      createdAt: now,
      userContent: sourceRound.userContent,
      userAttachments: sourceRound.userAttachments,
      isIncomplete: true,
    );
  }
  static ChatRound completeRound({
    required ChatRound round,
    required String content,
    required String reasoning,
  }) {
    return round.copyWith(
      assistantThinking: reasoning.trim().isEmpty ? null : reasoning,
      assistantContent: content.trim().isEmpty ? null : content,
      isIncomplete: false,
    );
  }
}
```

## File: lib/domain/services/chat_stream_accumulator.dart
```dart
import '../../core/models/chat_chunk.dart';
class ChatStreamAccumulator {
  String _content = '';
  String _reasoning = '';
  String get content => _content;
  String get reasoning => _reasoning;
  void add(ChatChunk chunk) {
    if (chunk.content != null) {
      _content += chunk.content!;
    }
    if (chunk.reasoningContent != null) {
      _reasoning += chunk.reasoningContent!;
    }
  }
}
```

## File: lib/domain/services/chat_view_state_builder.dart
```dart
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../models/chat_page.dart';
import 'branch_navigator.dart';
import 'message_paginator.dart';
class ChatViewStateData {
  final String? currentRoundId;
  final List<ChatRound> branchPath;
  final ChatPageList pageList;
  const ChatViewStateData({
    required this.currentRoundId,
    required this.branchPath,
    required this.pageList,
  });
}
class ChatViewStateBuilder {
  static ChatViewStateData buildInitial(Session session) {
    final leaves = BranchNavigator.getAllBranchLeaves(session);
    final currentRoundId = leaves.isNotEmpty
        ? leaves.last.id
        : (session.rounds.isNotEmpty ? session.rounds.first.id : null);
    return buildForRound(session, currentRoundId);
  }
  static ChatViewStateData buildForRound(Session session, String? roundId) {
    final branchPath = roundId == null
        ? <ChatRound>[]
        : BranchNavigator.getCurrentBranchPath(session, roundId);
    final targetPageIndex = branchPath.isNotEmpty ? branchPath.length - 1 : 0;
    final pageList = MessagePaginator.paginate(branchPath, targetPageIndex);
    return ChatViewStateData(
      currentRoundId: roundId,
      branchPath: branchPath,
      pageList: pageList,
    );
  }
}
```

## File: lib/domain/services/message_paginator.dart
```dart
import '../../core/models/chat_round.dart';
import '../models/chat_page.dart';
class MessagePaginator {
  static ChatPageList paginate(List<ChatRound> rounds, int currentPageIndex) {
    if (rounds.isEmpty) {
      return ChatPageList.fromPages([], 0);
    }
    final pages = <ChatPage>[
      for (int i = 0; i < rounds.length; i++)
        ChatPage(
          pageIndex: i,
          round: rounds[i],
        ),
    ];
    final validIndex = currentPageIndex.clamp(0, pages.length - 1);
    return ChatPageList.fromPages(pages, validIndex);
  }
  static ChatPage? getPage(List<ChatRound> rounds, int pageIndex) {
    if (rounds.isEmpty) return null;
    if (pageIndex < 0 || pageIndex >= rounds.length) return null;
    return ChatPage(
      pageIndex: pageIndex,
      round: rounds[pageIndex],
    );
  }
  static int getTotalPages(List<ChatRound> rounds) {
    return rounds.length;
  }
}
```

## File: lib/domain/services/model_capability_registry.dart
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

## File: lib/domain/services/tree_builder.dart
```dart
import '../../core/models/chat_round.dart';
import '../models/tree_node.dart';
class TreeBuilder {
  static List<TreeNode> buildTree(List<ChatRound> rounds) {
    if (rounds.isEmpty) return [];
    final sortedRounds = [...rounds]
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    final nodeMap = <String, TreeNode>{
      for (final round in sortedRounds)
        round.id: TreeNode.fromRound(
          round: round,
          depth: 0,
        ),
    };
    final childrenMap = <String, List<String>>{};
    final rootIds = <String>[];
    for (final round in sortedRounds) {
      final parentId = round.parentId;
      if (parentId == null) {
        rootIds.add(round.id);
      } else {
        childrenMap.putIfAbsent(parentId, () => []).add(round.id);
      }
    }
    final roots = <TreeNode>[];
    for (final rootId in rootIds) {
      final root = nodeMap[rootId];
      if (root != null) {
        roots.add(_buildSubtree(root, childrenMap, nodeMap, 0));
      }
    }
    roots.sort((a, b) => a.round.createdAt.compareTo(b.round.createdAt));
    return roots;
  }
  static TreeNode _buildSubtree(
    TreeNode node,
    Map<String, List<String>> childrenMap,
    Map<String, TreeNode> nodeMap,
    int depth,
  ) {
    final childIds = childrenMap[node.id] ?? [];
    final children = <TreeNode>[];
    for (final childId in childIds) {
      final child = nodeMap[childId];
      if (child != null) {
        children.add(_buildSubtree(child, childrenMap, nodeMap, depth + 1));
      }
    }
    children.sort((a, b) => a.round.createdAt.compareTo(b.round.createdAt));
    return node.copyWith(
      depth: depth,
      children: children,
    );
  }
  static TreePath? findPath(List<TreeNode> roots, String targetId) {
    for (final root in roots) {
      final path = _findPathRecursive(root, targetId, []);
      if (path != null) {
        return TreePath(
          nodes: path,
          targetNode: path.last,
        );
      }
    }
    return null;
  }
  static List<TreeNode>? _findPathRecursive(
    TreeNode node,
    String targetId,
    List<TreeNode> currentPath,
  ) {
    final newPath = [...currentPath, node];
    if (node.id == targetId) {
      return newPath;
    }
    for (final child in node.children) {
      final result = _findPathRecursive(child, targetId, newPath);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
  static List<TreeNode> findLeafNodes(List<TreeNode> roots) {
    final leaves = <TreeNode>[];
    _findLeavesRecursive(roots, leaves);
    leaves.sort((a, b) => a.round.createdAt.compareTo(b.round.createdAt));
    return leaves;
  }
  static void _findLeavesRecursive(
    List<TreeNode> nodes,
    List<TreeNode> leaves,
  ) {
    for (final node in nodes) {
      if (node.children.isEmpty) {
        leaves.add(node);
      } else {
        _findLeavesRecursive(node.children, leaves);
      }
    }
  }
  static TreeNode? findLatestLeaf(TreeNode node) {
    if (node.children.isEmpty) {
      return node;
    }
    final latestChild = node.children.reduce((a, b) {
      return a.round.createdAt >= b.round.createdAt ? a : b;
    });
    return findLatestLeaf(latestChild);
  }
}
```

## File: lib/domain/states/chat_state.dart
```dart
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
```

## File: lib/domain/states/chat_state.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'chat_state.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
/// @nodoc
mixin _$StreamStatus {
  String get content => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  /// Create a copy of StreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreamStatusCopyWith<StreamStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $StreamStatusCopyWith<$Res> {
  factory $StreamStatusCopyWith(
    StreamStatus value,
    $Res Function(StreamStatus) then,
  ) = _$StreamStatusCopyWithImpl<$Res, StreamStatus>;
  @useResult
  $Res call({String content, String reasoning, bool isDone, String? error});
}
/// @nodoc
class _$StreamStatusCopyWithImpl<$Res, $Val extends StreamStatus>
    implements $StreamStatusCopyWith<$Res> {
  _$StreamStatusCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of StreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? reasoning = null,
    Object? isDone = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            reasoning: null == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String,
            isDone: null == isDone
                ? _value.isDone
                : isDone // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$StreamStatusImplCopyWith<$Res>
    implements $StreamStatusCopyWith<$Res> {
  factory _$$StreamStatusImplCopyWith(
    _$StreamStatusImpl value,
    $Res Function(_$StreamStatusImpl) then,
  ) = __$$StreamStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String reasoning, bool isDone, String? error});
}
/// @nodoc
class __$$StreamStatusImplCopyWithImpl<$Res>
    extends _$StreamStatusCopyWithImpl<$Res, _$StreamStatusImpl>
    implements _$$StreamStatusImplCopyWith<$Res> {
  __$$StreamStatusImplCopyWithImpl(
    _$StreamStatusImpl _value,
    $Res Function(_$StreamStatusImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of StreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? reasoning = null,
    Object? isDone = null,
    Object? error = freezed,
  }) {
    return _then(
      _$StreamStatusImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        reasoning: null == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String,
        isDone: null == isDone
            ? _value.isDone
            : isDone // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
/// @nodoc
class _$StreamStatusImpl implements _StreamStatus {
  const _$StreamStatusImpl({
    this.content = '',
    this.reasoning = '',
    this.isDone = false,
    this.error,
  });
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String reasoning;
  @override
  @JsonKey()
  final bool isDone;
  @override
  final String? error;
  @override
  String toString() {
    return 'StreamStatus(content: $content, reasoning: $reasoning, isDone: $isDone, error: $error)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamStatusImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.error, error) || other.error == error));
  }
  @override
  int get hashCode =>
      Object.hash(runtimeType, content, reasoning, isDone, error);
  /// Create a copy of StreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamStatusImplCopyWith<_$StreamStatusImpl> get copyWith =>
      __$$StreamStatusImplCopyWithImpl<_$StreamStatusImpl>(this, _$identity);
}
abstract class _StreamStatus implements StreamStatus {
  const factory _StreamStatus({
    final String content,
    final String reasoning,
    final bool isDone,
    final String? error,
  }) = _$StreamStatusImpl;
  @override
  String get content;
  @override
  String get reasoning;
  @override
  bool get isDone;
  @override
  String? get error;
  /// Create a copy of StreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamStatusImplCopyWith<_$StreamStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
mixin _$ChatState {
  Session? get session => throw _privateConstructorUsedError;
  String? get currentRoundId => throw _privateConstructorUsedError;
  ChatPageList? get pageList => throw _privateConstructorUsedError;
  Map<String, StreamStatus> get activeStreams =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call({
    Session? session,
    String? currentRoundId,
    ChatPageList? pageList,
    Map<String, StreamStatus> activeStreams,
    String? error,
    bool isLoading,
  });
  $SessionCopyWith<$Res>? get session;
  $ChatPageListCopyWith<$Res>? get pageList;
}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? currentRoundId = freezed,
    Object? pageList = freezed,
    Object? activeStreams = null,
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            session: freezed == session
                ? _value.session
                : session // ignore: cast_nullable_to_non_nullable
                      as Session?,
            currentRoundId: freezed == currentRoundId
                ? _value.currentRoundId
                : currentRoundId // ignore: cast_nullable_to_non_nullable
                      as String?,
            pageList: freezed == pageList
                ? _value.pageList
                : pageList // ignore: cast_nullable_to_non_nullable
                      as ChatPageList?,
            activeStreams: null == activeStreams
                ? _value.activeStreams
                : activeStreams // ignore: cast_nullable_to_non_nullable
                      as Map<String, StreamStatus>,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }
    return $SessionCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }
  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatPageListCopyWith<$Res>? get pageList {
    if (_value.pageList == null) {
      return null;
    }
    return $ChatPageListCopyWith<$Res>(_value.pageList!, (value) {
      return _then(_value.copyWith(pageList: value) as $Val);
    });
  }
}
/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
    _$ChatStateImpl value,
    $Res Function(_$ChatStateImpl) then,
  ) = __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Session? session,
    String? currentRoundId,
    ChatPageList? pageList,
    Map<String, StreamStatus> activeStreams,
    String? error,
    bool isLoading,
  });
  @override
  $SessionCopyWith<$Res>? get session;
  @override
  $ChatPageListCopyWith<$Res>? get pageList;
}
/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
    _$ChatStateImpl _value,
    $Res Function(_$ChatStateImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? currentRoundId = freezed,
    Object? pageList = freezed,
    Object? activeStreams = null,
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _$ChatStateImpl(
        session: freezed == session
            ? _value.session
            : session // ignore: cast_nullable_to_non_nullable
                  as Session?,
        currentRoundId: freezed == currentRoundId
            ? _value.currentRoundId
            : currentRoundId // ignore: cast_nullable_to_non_nullable
                  as String?,
        pageList: freezed == pageList
            ? _value.pageList
            : pageList // ignore: cast_nullable_to_non_nullable
                  as ChatPageList?,
        activeStreams: null == activeStreams
            ? _value._activeStreams
            : activeStreams // ignore: cast_nullable_to_non_nullable
                  as Map<String, StreamStatus>,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
/// @nodoc
class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl({
    this.session,
    this.currentRoundId,
    this.pageList,
    final Map<String, StreamStatus> activeStreams = const {},
    this.error,
    this.isLoading = false,
  }) : _activeStreams = activeStreams;
  @override
  final Session? session;
  @override
  final String? currentRoundId;
  @override
  final ChatPageList? pageList;
  final Map<String, StreamStatus> _activeStreams;
  @override
  @JsonKey()
  Map<String, StreamStatus> get activeStreams {
    if (_activeStreams is EqualUnmodifiableMapView) return _activeStreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activeStreams);
  }
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  String toString() {
    return 'ChatState(session: $session, currentRoundId: $currentRoundId, pageList: $pageList, activeStreams: $activeStreams, error: $error, isLoading: $isLoading)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.currentRoundId, currentRoundId) ||
                other.currentRoundId == currentRoundId) &&
            (identical(other.pageList, pageList) ||
                other.pageList == pageList) &&
            const DeepCollectionEquality().equals(
              other._activeStreams,
              _activeStreams,
            ) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }
  @override
  int get hashCode => Object.hash(
    runtimeType,
    session,
    currentRoundId,
    pageList,
    const DeepCollectionEquality().hash(_activeStreams),
    error,
    isLoading,
  );
  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}
abstract class _ChatState implements ChatState {
  const factory _ChatState({
    final Session? session,
    final String? currentRoundId,
    final ChatPageList? pageList,
    final Map<String, StreamStatus> activeStreams,
    final String? error,
    final bool isLoading,
  }) = _$ChatStateImpl;
  @override
  Session? get session;
  @override
  String? get currentRoundId;
  @override
  ChatPageList? get pageList;
  @override
  Map<String, StreamStatus> get activeStreams;
  @override
  String? get error;
  @override
  bool get isLoading;
  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'di/providers.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/themes/app_theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  // 初始化应用
  await container.read(initProvider.notifier).initialize();
  // 检查初始化是否成功
  final initState = container.read(initProvider);
  if (initState.status != InitStatus.success) {
    throw Exception('应用初始化失败：${initState.errorMessage}');
  }
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
      home: const HomePage(),
    );
  }
}
```

## File: lib/presentation/models/pending_attachment.dart
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

## File: lib/presentation/pages/branch_tree_page.dart
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphview/GraphView.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../../core/utils/time_format_utils.dart';
import '../../di/providers.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart';
import '../themes/app_tokens.dart';
import '../widgets/common/app_badge.dart';
import '../widgets/common/app_page_scaffold.dart';
class BranchTreePage extends ConsumerStatefulWidget {
  final Session session;
  final String fileName;
  const BranchTreePage({
    super.key,
    required this.session,
    required this.fileName,
  });
  @override
  ConsumerState<BranchTreePage> createState() => _BranchTreePageState();
}
class _BranchTreePageState extends ConsumerState<BranchTreePage> {
  final TransformationController _transformationController =
      TransformationController();
  Graph _graph = Graph()..isTree = true;
  final BuchheimWalkerConfiguration _builder =
      BuchheimWalkerConfiguration();
  final Map<String, Node> _nodeMap = {};
  final Map<Node, TreeNode> _graphNodeToTreeNodeMap = {};
  List<TreeNode> _roots = [];
  String _lastRootsSignature = '';
  @override
  void initState() {
    super.initState();
    _builder
      ..siblingSeparation = 40
      ..levelSeparation = 78
      ..subtreeSeparation = 50
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
    _reloadTree(widget.session.rounds);
  }
  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }
  void _reloadTree(List<ChatRound> rounds) {
    final roots = rounds.isEmpty ? <TreeNode>[] : TreeBuilder.buildTree(rounds);
    final signature = _buildRootsSignature(roots);
    setState(() {
      _roots = roots;
      _lastRootsSignature = signature;
      _rebuildGraph(_roots);
    });
  }
  String _buildRootsSignature(List<TreeNode> roots) {
    dynamic toJsonNode(TreeNode node) {
      return {
        'id': node.id,
        'children': node.children.map(toJsonNode).toList(),
      };
    }
    return jsonEncode(roots.map(toJsonNode).toList());
  }
  void _rebuildGraph(List<TreeNode> roots) {
    _graph = Graph()..isTree = true;
    _nodeMap.clear();
    _graphNodeToTreeNodeMap.clear();
    for (final root in roots) {
      _addTreeToGraph(root, null);
    }
  }
  void _addTreeToGraph(TreeNode treeNode, TreeNode? parent) {
    final currentNode = Node.Id(treeNode.id);
    _nodeMap[treeNode.id] = currentNode;
    _graphNodeToTreeNodeMap[currentNode] = treeNode;
    _graph.addNode(currentNode);
    if (parent != null) {
      final parentNode = _nodeMap[parent.id];
      if (parentNode != null) {
        _graph.addEdge(parentNode, currentNode);
      }
    }
    for (final child in treeNode.children) {
      _addTreeToGraph(child, treeNode);
    }
  }
  Future<void> _deleteNode(String nodeId) async {
    final repository = ref.read(conversationRepositoryProvider);
    final chatState = ref.read(chatProvider(widget.fileName));
    final session = chatState.session ?? widget.session;
    ChatRound? roundToDelete;
    for (final round in session.rounds) {
      if (round.id == nodeId) {
        roundToDelete = round;
        break;
      }
    }
    if (roundToDelete == null) {
      throw Exception('未找到要删除的节点');
    }
    final updatedRounds = session.rounds
        .where((round) => round.id != nodeId)
        .map((round) {
          if (round.parentId == nodeId) {
            return round.copyWith(parentId: roundToDelete!.parentId);
          }
          return round;
        }).toList();
    final updatedSession = session.copyWith(
      rounds: updatedRounds,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
    await repository.saveSession(widget.fileName, updatedSession);
    _reloadTree(updatedRounds);
    await ref.read(chatProvider(widget.fileName).notifier).loadSession();
  }
  @override
  Widget build(BuildContext context) {
    final chatNotifier = ref.read(chatProvider(widget.fileName).notifier);
    return AppPageScaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.session.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              '对话分支结构',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: _roots.isEmpty
          ? _buildEmptyState(context)
          : Column(
              children: [
                _GraphToolbar(
                  onZoomIn: () {
                    final current = _transformationController.value.clone();
                    current.scale(1.1);
                    _transformationController.value = current;
                  },
                  onZoomOut: () {
                    final current = _transformationController.value.clone();
                    current.scale(0.9);
                    _transformationController.value = current;
                  },
                  onReset: () {
                    _transformationController.value = Matrix4.identity();
                  },
                ),
                Expanded(
                  child: InteractiveViewer(
                    constrained: false,
                    boundaryMargin: const EdgeInsets.all(double.infinity),
                    minScale: 0.1,
                    maxScale: 3.0,
                    transformationController: _transformationController,
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      color: AppTokens.bg,
                      child: GraphView(
                        key: ValueKey(_lastRootsSignature),
                        graph: _graph,
                        animated: false,
                        algorithm: BuchheimWalkerAlgorithm(
                          _builder,
                          TreeEdgeRenderer(_builder),
                        ),
                        paint: Paint()
                          ..color = const Color(0xFFD8DEE8)
                          ..strokeWidth = 1.6
                          ..style = PaintingStyle.stroke,
                        builder: (Node node) {
                          final treeNode = _graphNodeToTreeNodeMap[node];
                          if (treeNode == null) {
                            return const SizedBox.shrink();
                          }
                          return _GraphNodeCard(
                            key: ValueKey(treeNode.id),
                            treeNode: treeNode,
                            onSwitch: () async {
                              await chatNotifier.switchBranch(treeNode.id);
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            },
                            onDelete: () async {
                              final confirmed =
                                  await _showDeleteDialog(context, treeNode);
                              if (!confirmed) return;
                              try {
                                await _deleteNode(treeNode.id);
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('节点已删除'),
                                    ),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('删除失败：$e'),
                                    ),
                                  );
                                }
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTokens.surface,
            borderRadius: AppTokens.brLg,
            border: Border.all(color: AppTokens.border),
            boxShadow: AppTokens.shadowMd,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: AppTokens.primarySoft,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Icon(
                  Icons.account_tree_outlined,
                  size: 30,
                  color: AppTokens.primary,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                '暂无分支结构',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '当你对历史轮次重新生成回复时，这里会显示完整的分支关系。',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTokens.textSecondary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> _showDeleteDialog(
    BuildContext context,
    TreeNode node,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: AppTokens.brLg,
            ),
            title: Text(
              '删除节点',
              style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            content: Text(
              '确定删除这一轮对话吗？\n\n${node.round.userContent}',
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTokens.danger,
                ),
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
class _GraphToolbar extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onReset;
  const _GraphToolbar({
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onReset,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppTokens.surface,
          borderRadius: AppTokens.brLg,
          border: Border.all(color: AppTokens.border),
          boxShadow: AppTokens.shadowSm,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.tune_outlined,
              size: 18,
              color: AppTokens.textSecondary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '缩放、拖拽查看对话分支结构',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTokens.textSecondary,
                    ),
              ),
            ),
            _ToolbarIconButton(
              icon: Icons.remove_rounded,
              tooltip: '缩小',
              onTap: onZoomOut,
            ),
            const SizedBox(width: 6),
            _ToolbarIconButton(
              icon: Icons.add_rounded,
              tooltip: '放大',
              onTap: onZoomIn,
            ),
            const SizedBox(width: 6),
            _ToolbarTextButton(
              icon: Icons.center_focus_strong_outlined,
              label: '重置',
              onTap: onReset,
            ),
          ],
        ),
      ),
    );
  }
}
class _ToolbarIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  const _ToolbarIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppTokens.brMd,
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppTokens.surfaceSoft,
            borderRadius: AppTokens.brMd,
            border: Border.all(color: AppTokens.border),
          ),
          child: Icon(
            icon,
            size: 18,
            color: AppTokens.textPrimary,
          ),
        ),
      ),
    );
  }
}
class _ToolbarTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ToolbarTextButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppTokens.brMd,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppTokens.surfaceSoft,
          borderRadius: AppTokens.brMd,
          border: Border.all(color: AppTokens.border),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: AppTokens.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTokens.textPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
class _GraphNodeCard extends StatelessWidget {
  final TreeNode treeNode;
  final VoidCallback onSwitch;
  final VoidCallback onDelete;
  const _GraphNodeCard({
    super.key,
    required this.treeNode,
    required this.onSwitch,
    required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    final isRoot = treeNode.parentId == null;
    final isIncomplete = treeNode.round.isIncomplete;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 290,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppTokens.surface,
          borderRadius: AppTokens.brLg,
          border: Border.all(
            color: isIncomplete
                ? AppTokens.warning.withOpacity(0.25)
                : AppTokens.border,
          ),
          boxShadow: AppTokens.shadowMd,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppBadge.primary(
                  '深度 ${treeNode.depth + 1}',
                  icon: Icons.layers_outlined,
                ),
                const SizedBox(width: 8),
                if (isRoot)
                  AppBadge.info(
                    '根节点',
                    icon: Icons.flag_outlined,
                  ),
                if (isIncomplete) ...[
                  const SizedBox(width: 8),
                  AppBadge.warning(
                    '未完成',
                    icon: Icons.hourglass_empty_outlined,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 10),
            Text(
              TimeFormatUtils.formatTimestamp(treeNode.round.createdAt),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: AppTokens.textSecondary,
                  ),
            ),
            const SizedBox(height: 12),
            _PreviewBlock(
              label: 'YOU',
              content: treeNode.round.userContent.trim().isEmpty
                  ? '（空输入）'
                  : treeNode.round.userContent,
              labelColor: AppTokens.info,
            ),
            const SizedBox(height: 8),
            _PreviewBlock(
              label: 'AI',
              content: (treeNode.round.assistantContent ?? '').trim().isEmpty
                  ? '（等待回复）'
                  : treeNode.round.assistantContent!,
              labelColor: AppTokens.success,
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: onSwitch,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppTokens.primarySoft,
                      foregroundColor: AppTokens.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: AppTokens.brMd,
                      ),
                    ),
                    child: const Text('切换到此分支'),
                  ),
                ),
                const SizedBox(width: 8),
                if (treeNode.parentId != null)
                  InkWell(
                    onTap: onDelete,
                    borderRadius: AppTokens.brMd,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppTokens.dangerSoft,
                        borderRadius: AppTokens.brMd,
                        border: Border.all(
                          color: AppTokens.danger.withOpacity(0.15),
                        ),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: AppTokens.danger,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class _PreviewBlock extends StatelessWidget {
  final String label;
  final String content;
  final Color labelColor;
  const _PreviewBlock({
    required this.label,
    required this.content,
    required this.labelColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTokens.surfaceSoft,
        borderRadius: AppTokens.brMd,
        border: Border.all(color: AppTokens.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label  ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: labelColor,
                ),
          ),
          Expanded(
            child: Text(
              content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    height: 1.5,
                    color: AppTokens.textPrimary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## File: lib/presentation/pages/chat_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/attachment.dart';
import '../../core/utils/time_format_utils.dart';
import '../models/pending_attachment.dart';
import '../providers/chat_notifier.dart';
import '../themes/app_tokens.dart';
import '../widgets/attachment_list.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/thought_bubble.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/app_badge.dart';
import '../widgets/common/app_page_scaffold.dart';
import 'branch_tree_page.dart';
class ChatPage extends ConsumerStatefulWidget {
  final String fileName;
  final String? initialMessage;
  final List<PendingAttachment>? initialAttachments;
  const ChatPage({
    super.key,
    required this.fileName,
    this.initialMessage,
    this.initialAttachments,
  });
  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}
class _ChatPageState extends ConsumerState<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  bool _initialMessageHandled = false;
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(chatProvider(widget.fileName).notifier).loadSession();
      final message = widget.initialMessage?.trim() ?? '';
      final attachments =
          widget.initialAttachments ?? const <PendingAttachment>[];
      final hasMessage = message.isNotEmpty;
      final hasAttachments = attachments.isNotEmpty;
      if (!_initialMessageHandled &&
          (hasMessage || hasAttachments) &&
          mounted) {
        _initialMessageHandled = true;
        await ref.read(chatProvider(widget.fileName).notifier).sendMessage(
              message,
              attachments: attachments,
            );
      }
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  void _scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.jumpTo(0);
    });
  }
  Future<void> _copyText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('已复制到剪贴板')),
    );
  }
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider(widget.fileName));
    final notifier = ref.read(chatProvider(widget.fileName).notifier);
    final hasPages =
        state.pageList != null && state.pageList!.pages.isNotEmpty;
    final currentPage = hasPages
        ? state.pageList!.pages[state.pageList!.currentPageIndex]
        : null;
    final round = currentPage?.round;
    final currentStreamStatus =
        round != null ? state.activeStreams[round.id] : null;
    final isViewingStreamingRound = currentStreamStatus != null;
    return AppPageScaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.session?.title ?? '对话',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              'AI 对话工作台',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          if (state.session != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                tooltip: '查看分支树',
                icon: const Icon(Icons.account_tree_outlined),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BranchTreePage(
                        session: state.session!,
                        fileName: widget.fileName,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.session == null
                    ? _buildErrorState(state.error ?? '会话不存在')
                    : !hasPages && state.activeStreams.isEmpty
                        ? _buildWelcomeEmpty(context)
                        : ListView(
                            controller: _scrollController,
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            children: [
                              if (round != null)
                                _buildRoundCard(
                                  context,
                                  userContent: round.userContent,
                                  attachments: round.userAttachments,
                                  createdAt: round.createdAt,
                                  onRetryReply: () =>
                                      notifier.retryFromRound(round.id),
                                  thinking: isViewingStreamingRound
                                      ? currentStreamStatus.reasoning
                                      : round.assistantThinking,
                                  assistantContent: isViewingStreamingRound
                                      ? currentStreamStatus.content
                                      : round.assistantContent,
                                  isStreaming: isViewingStreamingRound,
                                ),
                              if ((state.error ?? '').trim().isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: _InlineErrorCard(
                                    message: state.error!,
                                  ),
                                ),
                            ],
                          ),
          ),
          if (state.pageList != null && state.pageList!.totalPages > 0)
            _PaginationBar(
              currentIndex: state.pageList!.currentPageIndex,
              totalPages: state.pageList!.totalPages,
              onPrev: state.pageList!.currentPageIndex > 0
                  ? () {
                      notifier.changePage(
                        state.pageList!.currentPageIndex - 1,
                      );
                      _scrollToTop();
                    }
                  : null,
              onNext: state.pageList!.currentPageIndex <
                      state.pageList!.totalPages - 1
                  ? () {
                      notifier.changePage(
                        state.pageList!.currentPageIndex + 1,
                      );
                      _scrollToTop();
                    }
                  : null,
            ),
          InputBar(
            hintText: '发送消息，或附加图片/文件...',
            isStreaming: isViewingStreamingRound,
            onStop: notifier.stopGeneration,
            onSend: (text, attachments) {
              notifier.sendMessage(text, attachments: attachments);
            },
          ),
        ],
      ),
    );
  }
  Widget _buildErrorState(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AppCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 40,
                color: AppTokens.danger,
              ),
              const SizedBox(height: 12),
              Text(
                '无法加载会话',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildWelcomeEmpty(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AppCard(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: AppTokens.primarySoft,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Icon(
                  Icons.auto_awesome_outlined,
                  size: 30,
                  color: AppTokens.primary,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                '开始一段新的对话',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                '你可以输入问题、上传图片或文件，并在不同分支中回看每一轮回复。',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTokens.textSecondary,
                    ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  AppBadge.primary(
                    '多轮上下文',
                    icon: Icons.chat_bubble_outline,
                  ),
                  AppBadge.info(
                    '附件输入',
                    icon: Icons.attach_file_outlined,
                  ),
                  AppBadge.warning(
                    '分支切换',
                    icon: Icons.account_tree_outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildRoundCard(
    BuildContext context, {
    required String userContent,
    required List<Attachment> attachments,
    required int createdAt,
    required VoidCallback onRetryReply,
    String? thinking,
    String? assistantContent,
    bool isStreaming = false,
  }) {
    final hasUser = userContent.trim().isNotEmpty;
    final hasAttachments = attachments.isNotEmpty;
    final hasThinking = (thinking ?? '').trim().isNotEmpty;
    final hasAssistant = (assistantContent ?? '').trim().isNotEmpty;
    return AppCard(
      padding: const EdgeInsets.all(AppTokens.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RoundHeader(
            createdAt: createdAt,
            isStreaming: isStreaming,
          ),
          const SizedBox(height: AppTokens.space16),
          const _SectionLabel(
            icon: Icons.person_outline,
            text: '你的输入',
          ),
          const SizedBox(height: AppTokens.space10),
          if (hasUser)
            MessageBubble(
              content: userContent,
              isUser: true,
              onCopy: () => _copyText(userContent),
              onRetryReply: onRetryReply,
            ),
          if (hasAttachments) ...[
            if (hasUser) const SizedBox(height: AppTokens.space8),
            AttachmentList(attachments: attachments),
          ],
          if (hasThinking) ...[
            const SizedBox(height: AppTokens.space20),
            const Divider(),
            const SizedBox(height: AppTokens.space16),
            const _SectionLabel(
              icon: Icons.psychology_alt_outlined,
              text: '推理过程',
            ),
            const SizedBox(height: AppTokens.space10),
            ThoughtBubble(content: thinking!),
          ],
          if (hasAssistant || isStreaming) ...[
            const SizedBox(height: AppTokens.space20),
            const Divider(),
            const SizedBox(height: AppTokens.space16),
            Row(
              children: [
                const Expanded(
                  child: _SectionLabel(
                    icon: Icons.smart_toy_outlined,
                    text: '回答',
                  ),
                ),
                if (isStreaming)
                  AppBadge.info(
                    '生成中',
                    icon: Icons.bolt_outlined,
                  ),
              ],
            ),
            const SizedBox(height: AppTokens.space10),
            if (hasAssistant)
              MessageBubble(
                content: assistantContent!,
                isUser: false,
                onCopy: () => _copyText(assistantContent),
                onRetryReply: onRetryReply,
              )
            else
              _buildTypingPlaceholder(),
          ],
        ],
      ),
    );
  }
  Widget _buildTypingPlaceholder() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTokens.space16),
      decoration: BoxDecoration(
        color: AppTokens.surfaceSoft,
        borderRadius: AppTokens.brLg,
        border: Border.all(color: AppTokens.border),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: AppTokens.space12),
          Text(
            '正在生成回答...',
            style: const TextStyle(
              color: AppTokens.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
class _RoundHeader extends StatelessWidget {
  final int createdAt;
  final bool isStreaming;
  const _RoundHeader({
    required this.createdAt,
    required this.isStreaming,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTokens.space12,
            vertical: AppTokens.space6,
          ),
          decoration: BoxDecoration(
            color: AppTokens.surfaceMuted,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppTokens.border),
          ),
          child: Text(
            TimeFormatUtils.formatTimestamp(createdAt),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const Spacer(),
        if (isStreaming)
          AppBadge.info(
            '实时生成',
            icon: Icons.graphic_eq_outlined,
          ),
      ],
    );
  }
}
class _SectionLabel extends StatelessWidget {
  final IconData icon;
  final String text;
  const _SectionLabel({
    required this.icon,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: AppTokens.primary,
        ),
        const SizedBox(width: AppTokens.space6),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppTokens.textPrimary,
              ),
        ),
      ],
    );
  }
}
class _InlineErrorCard extends StatelessWidget {
  final String message;
  const _InlineErrorCard({
    required this.message,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTokens.space12),
      decoration: BoxDecoration(
        color: AppTokens.dangerSoft,
        borderRadius: AppTokens.brMd,
        border: Border.all(
          color: AppTokens.danger.withOpacity(0.18),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1),
            child: Icon(
              Icons.error_outline,
              size: 16,
              color: AppTokens.danger,
            ),
          ),
          const SizedBox(width: AppTokens.space8),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTokens.danger,
                    height: 1.55,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
class _PaginationBar extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;
  const _PaginationBar({
    required this.currentIndex,
    required this.totalPages,
    required this.onPrev,
    required this.onNext,
  });
  @override
  Widget build(BuildContext context) {
    final progress =
        totalPages == 0 ? 0.0 : (currentIndex + 1).clamp(0, totalPages) / totalPages;
    return Container(
      decoration: const BoxDecoration(
        color: AppTokens.surface,
        border: Border(
          top: BorderSide(color: AppTokens.border),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Row(
        children: [
          _PagerButton(
            icon: Icons.chevron_left_rounded,
            onTap: onPrev,
          ),
          const SizedBox(width: AppTokens.space10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '第 ${currentIndex + 1} 页 / 共 $totalPages 页',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppTokens.textPrimary,
                      ),
                ),
                const SizedBox(height: AppTokens.space8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: AppTokens.surfaceMuted,
                    valueColor:
                        const AlwaysStoppedAnimation(AppTokens.primary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppTokens.space10),
          _PagerButton(
            icon: Icons.chevron_right_rounded,
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}
class _PagerButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _PagerButton({
    required this.icon,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return InkWell(
      onTap: onTap,
      borderRadius: AppTokens.brMd,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: enabled ? AppTokens.surfaceSoft : AppTokens.surfaceMuted,
          borderRadius: AppTokens.brMd,
          border: Border.all(color: AppTokens.border),
        ),
        child: Icon(
          icon,
          color: enabled
              ? AppTokens.textPrimary
              : AppTokens.textTertiary,
        ),
      ),
    );
  }
}
```

## File: lib/presentation/pages/home_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../core/models/session.dart';
import '../../core/utils/time_format_utils.dart';
import '../providers/session_list_notifier.dart';
import '../themes/app_tokens.dart';
import '../widgets/common/app_badge.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/input_bar.dart';
import 'chat_page.dart';
import 'settings_page.dart';
class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  Future<void> _showRenameDialog(
    BuildContext context,
    SessionListNotifier notifier,
    Session session,
  ) async {
    final controller = TextEditingController(text: session.title);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.brLg,
        ),
        title: Text(
          '重命名会话',
          style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        content: TextField(
          controller: controller,
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
            onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );
    if (result != null && result.isNotEmpty && result != session.title) {
      await notifier.updateSessionTitle('${session.id}.json', result);
    }
  }
  Future<void> _showDeleteConfirmDialog(
    BuildContext context,
    SessionListNotifier notifier,
    Session session,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.brLg,
        ),
        title: Text(
          '删除会话',
          style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        content: Text(
          '确定要删除 “${session.title}” 吗？\n此操作无法撤销。',
          style: Theme.of(ctx).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: AppTokens.danger,
            ),
            child: const Text('删除'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await notifier.deleteSession('${session.id}.json');
    }
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionListState = ref.watch(sessionListProvider);
    final notifier = ref.read(sessionListProvider.notifier);
    return AppPageScaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AI Chat',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              '你的对话工作区',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
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
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: sessionListState.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (e, st) => _HomeErrorState(
                message: '加载会话失败：$e',
                onRetry: notifier.refresh,
              ),
              data: (sessions) {
                if (sessions.isEmpty) {
                  return const _HomeEmptyState();
                }
                return RefreshIndicator(
                  onRefresh: notifier.refresh,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    children: [
                      _HomeHeaderSummary(
                        sessionCount: sessions.length,
                      ),
                      const SizedBox(height: AppTokens.space16),
                      ...sessions.map((session) {
                        final fileName = '${session.id}.json';
                        return Padding(
                          padding:
                              const EdgeInsets.only(bottom: AppTokens.space12),
                          child: Slidable(
                            key: ValueKey(fileName),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              extentRatio: 0.34,
                              children: [
                                CustomSlidableAction(
                                  onPressed: (_) => _showRenameDialog(
                                    context,
                                    notifier,
                                    session,
                                  ),
                                  backgroundColor: AppTokens.info,
                                  borderRadius: AppTokens.brLg,
                                  child: const Icon(
                                    Icons.edit_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                CustomSlidableAction(
                                  onPressed: (_) => _showDeleteConfirmDialog(
                                    context,
                                    notifier,
                                    session,
                                  ),
                                  backgroundColor: AppTokens.danger,
                                  borderRadius: AppTokens.brLg,
                                  child: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            child: _SessionCard(
                              session: session,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChatPage(
                                      fileName: fileName,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 12),
                    ],
                  ),
                );
              },
            ),
          ),
          InputBar(
            hintText: '开启一个新对话...',
            onSend: (content, attachments) async {
              final newFileName = await notifier.createSession('新对话');
              if (context.mounted) {
                Navigator.push(
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
class _HomeHeaderSummary extends StatelessWidget {
  final int sessionCount;
  const _HomeHeaderSummary({
    required this.sessionCount,
  });
  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppTokens.primarySoft,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.forum_outlined,
              color: AppTokens.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: AppTokens.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '最近会话',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  '共 $sessionCount 个会话，可左滑进行重命名或删除。',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          AppBadge.primary(
            '$sessionCount',
            icon: Icons.layers_outlined,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AppCard(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppTokens.primarySoft,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.auto_awesome_outlined,
                  size: 32,
                  color: AppTokens.primary,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                '开始你的第一段对话',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                '在下方输入问题，系统会自动创建一个新会话。\n你也可以附加图片或文件开始交流。',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTokens.textSecondary,
                    ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  AppBadge.primary(
                    '快速提问',
                    icon: Icons.bolt_outlined,
                  ),
                  AppBadge.info(
                    '支持附件',
                    icon: Icons.attach_file_outlined,
                  ),
                  AppBadge.warning(
                    '多分支对话',
                    icon: Icons.account_tree_outlined,
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
class _HomeErrorState extends StatelessWidget {
  final String message;
  final Future<void> Function() onRetry;
  const _HomeErrorState({
    required this.message,
    required this.onRetry,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AppCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 40,
                color: AppTokens.danger,
              ),
              const SizedBox(height: 12),
              Text(
                '出现了一点问题',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
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
    );
  }
}
class _SessionCard extends StatelessWidget {
  final Session session;
  final VoidCallback onTap;
  const _SessionCard({
    required this.session,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final roundCount = session.rounds.length;
    final updatedAt = TimeFormatUtils.formatTimestamp(session.updatedAt);
    final preview = _buildLatestPreview(session);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppTokens.brLg,
        child: AppCard(
          padding: const EdgeInsets.all(16),
          boxShadow: AppTokens.shadowSm,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppTokens.surfaceSoft,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTokens.border),
                ),
                child: const Icon(
                  Icons.forum_outlined,
                  color: AppTokens.textSecondary,
                ),
              ),
              const SizedBox(width: AppTokens.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _PreviewLine(
                          label: 'YOU',
                          text: preview.userPreview,
                          color: AppTokens.info,
                        ),
                        const SizedBox(height: 4),
                        _PreviewLine(
                          label: 'AI',
                          text: preview.aiPreview,
                          color: AppTokens.success,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        AppBadge.info(
                          '$roundCount 轮',
                          icon: Icons.chat_bubble_outline,
                        ),
                        AppBadge.primary(
                          updatedAt,
                          icon: Icons.schedule_outlined,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppTokens.space8),
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppTokens.surfaceSoft,
                  borderRadius: AppTokens.brMd,
                  border: Border.all(color: AppTokens.border),
                ),
                child: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppTokens.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _SessionPreview _buildLatestPreview(Session session) {
    if (session.rounds.isEmpty) {
      return const _SessionPreview(
        userPreview: '点击开始新的对话',
        aiPreview: '等待助手回复',
      );
    }
    final latest = session.rounds.last;
    final user = latest.userContent.trim().isEmpty
        ? '（空输入）'
        : latest.userContent.trim();
    final ai = (latest.assistantContent ?? '').trim().isEmpty
        ? '（等待回复）'
        : latest.assistantContent!.trim();
    return _SessionPreview(
      userPreview: user,
      aiPreview: ai,
    );
  }
}
class _SessionPreview {
  final String userPreview;
  final String aiPreview;
  const _SessionPreview({
    required this.userPreview,
    required this.aiPreview,
  });
}
class _PreviewLine extends StatelessWidget {
  final String label;
  final String text;
  final Color color;
  const _PreviewLine({
    required this.label,
    required this.text,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label  ',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
              ),
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  color: AppTokens.textSecondary,
                  height: 1.4,
                ),
          ),
        ),
      ],
    );
  }
}
```

## File: lib/presentation/pages/settings_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/model_info.dart';
import '../providers/config_notifier.dart';
import '../themes/app_tokens.dart';
import '../widgets/common/app_badge.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_section.dart';
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});
  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends ConsumerState<SettingsPage> {
  static const String _defaultModelsPath = 'v1/models';
  final _baseUrlController = TextEditingController();
  final _apiKeyController = TextEditingController();
  final _modelsPathController = TextEditingController();
  final _chatPathController = TextEditingController();
  bool _initialized = false;
  bool _isRefreshingModels = false;
  String? _selectedModel;
  String _apiMode = 'chat_completions';
  List<ModelInfo> _models = const [];
  @override
  void dispose() {
    _baseUrlController.dispose();
    _apiKeyController.dispose();
    _modelsPathController.dispose();
    _chatPathController.dispose();
    super.dispose();
  }
  String _defaultChatPathForApiMode(String apiMode) {
    switch (apiMode) {
      case 'responses':
        return 'v1/responses';
      case 'chat_completions':
      default:
        return 'v1/chat/completions';
    }
  }
  void _applyConfig(AppConfig config) {
    _baseUrlController.text = config.baseUrl;
    _apiKeyController.text = config.apiKey;
    _modelsPathController.text = config.modelsPath;
    _chatPathController.text = config.chatPath;
    _selectedModel = config.selectedModel;
    _apiMode = config.apiMode;
    _models = config.availableModels ?? const [];
    _initialized = true;
  }
  ModelInfo? _selectedModelInfo() {
    final selectedId = _selectedModel;
    if (selectedId == null || selectedId.trim().isEmpty) return null;
    for (final model in _models) {
      if (model.id == selectedId) return model;
    }
    return null;
  }
  String _getSelectedModelDisplayText(List<ModelInfo> models) {
    if (_selectedModel == null || _selectedModel!.trim().isEmpty) {
      return '请选择模型';
    }
    for (final model in models) {
      if (model.id == _selectedModel) {
        final name = (model.name ?? '').trim();
        return name.isNotEmpty ? name : model.id;
      }
    }
    return _selectedModel!;
  }
  List<Widget> _buildModelBadges(ModelInfo model) {
    final widgets = <Widget>[];
    if (model.supportsVision == true) {
      widgets.add(
        AppBadge.info(
          'Vision',
          icon: Icons.image_outlined,
        ),
      );
    }
    if (model.supportsReasoning == true) {
      widgets.add(
        AppBadge.warning(
          'Reasoning',
          icon: Icons.psychology_alt_outlined,
        ),
      );
    }
    return widgets;
  }
  Widget _buildSelectedModelSupportsCard() {
    final model = _selectedModelInfo();
    if (model == null) return const SizedBox.shrink();
    final badges = _buildModelBadges(model);
    if (badges.isEmpty) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppTokens.space12),
      padding: const EdgeInsets.all(AppTokens.space12),
      decoration: BoxDecoration(
        color: AppTokens.surfaceSoft,
        borderRadius: AppTokens.brMd,
        border: Border.all(color: AppTokens.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '模型能力',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTokens.textPrimary,
                ),
          ),
          const SizedBox(height: AppTokens.space8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: badges,
          ),
        ],
      ),
    );
  }
  void _updateSelectedModelOverride({
    bool? overrideVision,
    bool? overrideReasoning,
  }) {
    final selected = _selectedModelInfo();
    if (selected == null) return;
    final updated = selected.copyWith(
      overrideSupportsVision:
          overrideVision ?? selected.overrideSupportsVision,
      overrideSupportsReasoning:
          overrideReasoning ?? selected.overrideSupportsReasoning,
      supportsVision: overrideVision ?? selected.supportsVision,
      supportsReasoning: overrideReasoning ?? selected.supportsReasoning,
    );
    setState(() {
      _models = _models.map((m) {
        if (m.id == selected.id) return updated;
        return m;
      }).toList();
    });
  }
  Future<void> _confirmRestoreDefaults() async {
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: AppTokens.brLg,
            ),
            title: Text(
              '恢复默认设置',
              style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            content: Text(
              '确定要恢复默认设置吗？\n\n这将重置模型路径、聊天路径、API 模式、当前模型选择，以及模型能力的手动覆盖。',
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTokens.danger,
                ),
                child: const Text('恢复默认'),
              ),
            ],
          ),
        ) ??
        false;
    if (!confirmed) return;
    await _restoreAllDefaultsAndSave();
  }
  Future<void> _restoreAllDefaultsAndSave() async {
    final current = ref.read(configProvider).value;
    if (current == null) return;
    final restoredModels = _models
        .map(
          (model) => model.copyWith(
            overrideSupportsVision: null,
            overrideSupportsReasoning: null,
          ),
        )
        .toList();
    final restoredConfig = current.copyWith(
      modelsPath: _defaultModelsPath,
      chatPath: _defaultChatPathForApiMode('chat_completions'),
      apiMode: 'chat_completions',
      selectedModel: null,
      availableModels: restoredModels,
    );
    try {
      await ref.read(configProvider.notifier).saveFullConfig(restoredConfig);
      setState(() {
        _apiMode = restoredConfig.apiMode;
        _selectedModel = restoredConfig.selectedModel;
        _models = restoredModels;
        _modelsPathController.text = restoredConfig.modelsPath;
        _chatPathController.text = restoredConfig.chatPath;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('已恢复默认设置')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('恢复默认失败：$e')),
      );
    }
  }
  Future<void> _saveSettings() async {
    final current = ref.read(configProvider).value;
    if (current == null) return;
    final updated = current.copyWith(
      baseUrl: _baseUrlController.text.trim(),
      apiKey: _apiKeyController.text.trim(),
      modelsPath: _modelsPathController.text.trim().isEmpty
          ? _defaultModelsPath
          : _modelsPathController.text.trim(),
      chatPath: _chatPathController.text.trim().isEmpty
          ? _defaultChatPathForApiMode(_apiMode)
          : _chatPathController.text.trim(),
      selectedModel: (_selectedModel?.trim().isEmpty ?? true)
          ? null
          : _selectedModel!.trim(),
      apiMode: _apiMode,
      availableModels: _models,
    );
    try {
      await ref.read(configProvider.notifier).saveFullConfig(updated);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('设置已保存')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('保存失败：$e')),
      );
    }
  }
  Future<void> _refreshModels() async {
    final current = ref.read(configProvider).value;
    if (current == null) return;
    final previousOverrides = {
      for (final model in _models) model.id: model,
    };
    final draft = current.copyWith(
      baseUrl: _baseUrlController.text.trim(),
      apiKey: _apiKeyController.text.trim(),
      modelsPath: _modelsPathController.text.trim().isEmpty
          ? _defaultModelsPath
          : _modelsPathController.text.trim(),
      chatPath: _chatPathController.text.trim().isEmpty
          ? _defaultChatPathForApiMode(_apiMode)
          : _chatPathController.text.trim(),
      selectedModel: (_selectedModel?.trim().isEmpty ?? true)
          ? null
          : _selectedModel!.trim(),
      apiMode: _apiMode,
      availableModels: _models,
    );
    setState(() {
      _isRefreshingModels = true;
    });
    try {
      await ref.read(configProvider.notifier).saveAndRefreshModels(draft);
      final refreshed = ref.read(configProvider).value;
      if (refreshed != null) {
        final mergedModels = (refreshed.availableModels ?? const [])
            .map((model) {
          final old = previousOverrides[model.id];
          if (old == null) return model;
          return model.copyWith(
            overrideSupportsVision: old.overrideSupportsVision,
            overrideSupportsReasoning: old.overrideSupportsReasoning,
            supportsVision: old.overrideSupportsVision ?? model.supportsVision,
            supportsReasoning:
                old.overrideSupportsReasoning ?? model.supportsReasoning,
          );
        }).toList();
        setState(() {
          _models = mergedModels;
          final exists = _models.any((m) => m.id == _selectedModel);
          if (!exists) {
            _selectedModel = _models.isNotEmpty ? _models.first.id : null;
          }
        });
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('模型列表已同步')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('同步模型失败：$e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isRefreshingModels = false;
        });
      }
    }
  }
  Widget _buildManualCapabilityEditor() {
    final model = _selectedModelInfo();
    if (model == null) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppTokens.space12),
      padding: const EdgeInsets.all(AppTokens.space12),
      decoration: BoxDecoration(
        color: AppTokens.surfaceSoft,
        borderRadius: AppTokens.brMd,
        border: Border.all(color: AppTokens.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '手动覆盖模型能力',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTokens.textPrimary,
                ),
          ),
          const SizedBox(height: AppTokens.space8),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('支持 Vision'),
            subtitle: const Text('用于图片输入能力声明'),
            value: model.supportsVision == true,
            activeColor: AppTokens.primary,
            onChanged: (value) {
              _updateSelectedModelOverride(overrideVision: value);
            },
          ),
          const Divider(),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('支持 Reasoning'),
            subtitle: const Text('用于推理过程能力声明'),
            value: model.supportsReasoning == true,
            activeColor: AppTokens.primary,
            onChanged: (value) {
              _updateSelectedModelOverride(overrideReasoning: value);
            },
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final configState = ref.watch(configProvider);
    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      next.whenData((config) {
        if (!_initialized) {
          setState(() {
            _applyConfig(config);
          });
        }
      });
    });
    final isBusy = configState.isLoading || _isRefreshingModels;
    final models = _models;
    return AppPageScaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '设置',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              '连接、模型与能力配置',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: configState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('加载配置失败：$e'),
          ),
        ),
        data: (config) {
          if (!_initialized) {
            _applyConfig(config);
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AppSection(
                  title: '连接配置',
                  subtitle: '用于配置 API 服务地址与接口路径。',
                  children: [
                    TextField(
                      controller: _baseUrlController,
                      enabled: !isBusy,
                      decoration: const InputDecoration(
                        labelText: 'Base URL',
                        hintText: 'https://api.openai.com',
                      ),
                    ),
                    const SizedBox(height: AppTokens.space12),
                    TextField(
                      controller: _apiKeyController,
                      enabled: !isBusy,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'API Key',
                        hintText: '输入 API Key',
                      ),
                    ),
                    const SizedBox(height: AppTokens.space12),
                    TextField(
                      controller: _modelsPathController,
                      enabled: !isBusy,
                      decoration: const InputDecoration(
                        labelText: 'Models Path',
                        hintText: _defaultModelsPath,
                      ),
                    ),
                    const SizedBox(height: AppTokens.space12),
                    TextField(
                      controller: _chatPathController,
                      enabled: !isBusy,
                      decoration: InputDecoration(
                        labelText: 'Chat Path',
                        hintText: _defaultChatPathForApiMode(_apiMode),
                      ),
                    ),
                    const SizedBox(height: AppTokens.space12),
                    DropdownButtonFormField<String>(
                      value: _apiMode,
                      decoration: const InputDecoration(
                        labelText: 'API Mode',
                      ),
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
                      onChanged: isBusy
                          ? null
                          : (value) {
                              if (value == null) return;
                              setState(() {
                                _apiMode = value;
                                if (_chatPathController.text.trim().isEmpty ||
                                    _chatPathController.text ==
                                        _defaultChatPathForApiMode(
                                            'chat_completions') ||
                                    _chatPathController.text ==
                                        _defaultChatPathForApiMode('responses')) {
                                  _chatPathController.text =
                                      _defaultChatPathForApiMode(value);
                                }
                              });
                            },
                    ),
                  ],
                ),
                AppSection(
                  title: '模型配置',
                  subtitle: '选择当前模型，并同步远端模型列表。',
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SearchAnchor(
                            builder: (context, controller) {
                              return GestureDetector(
                                onTap: isBusy
                                    ? null
                                    : () {
                                        controller.openView();
                                      },
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    labelText: '当前模型',
                                    enabled: !isBusy,
                                    suffixIcon: const Icon(
                                      Icons.arrow_drop_down,
                                    ),
                                  ),
                                  child: Text(
                                    _getSelectedModelDisplayText(models),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: isBusy
                                          ? AppTokens.textTertiary
                                          : AppTokens.textPrimary,
                                    ),
                                  ),
                                ),
                              );
                            },
                            suggestionsBuilder: (context, controller) {
                              final query =
                                  controller.text.trim().toLowerCase();
                              final filteredModels = models.where((model) {
                                final id = model.id.toLowerCase();
                                final name = (model.name ?? '').toLowerCase();
                                return query.isEmpty ||
                                    id.contains(query) ||
                                    name.contains(query);
                              }).toList();
                              if (filteredModels.isEmpty) {
                                return const [
                                  ListTile(
                                    title: Text('没有匹配的模型'),
                                  ),
                                ];
                              }
                              return filteredModels.map((model) {
                                final isSelected = model.id == _selectedModel;
                                final title =
                                    (model.name ?? '').trim().isNotEmpty
                                        ? model.name!
                                        : model.id;
                                final showSubtitle =
                                    (model.name ?? '').trim().isNotEmpty &&
                                        model.name != model.id;
                                final badges = _buildModelBadges(model);
                                return ListTile(
                                  title: Text(
                                    title,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (showSubtitle) Text(model.id),
                                      if (badges.isNotEmpty) ...[
                                        const SizedBox(height: 6),
                                        Wrap(
                                          spacing: 6,
                                          runSpacing: 6,
                                          children: badges,
                                        ),
                                      ],
                                    ],
                                  ),
                                  trailing: isSelected
                                      ? const Icon(
                                          Icons.check,
                                          color: AppTokens.primary,
                                        )
                                      : null,
                                  onTap: () {
                                    setState(() {
                                      _selectedModel = model.id;
                                    });
                                    controller.closeView(model.id);
                                  },
                                );
                              }).toList();
                            },
                          ),
                        ),
                        const SizedBox(width: AppTokens.space12),
                        SizedBox(
                          height: 56,
                          child: FilledButton(
                            onPressed: isBusy ? null : _refreshModels,
                            child: _isRefreshingModels
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('同步模型'),
                          ),
                        ),
                      ],
                    ),
                    _buildSelectedModelSupportsCard(),
                    _buildManualCapabilityEditor(),
                  ],
                ),
                AppSection(
                  title: '操作',
                  subtitle: '保存当前配置，应用到后续对话请求。',
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed:
                                isBusy ? null : _confirmRestoreDefaults,
                            child: const Text('恢复默认'),
                          ),
                        ),
                        const SizedBox(width: AppTokens.space12),
                        Expanded(
                          child: FilledButton(
                            onPressed: isBusy ? null : _saveSettings,
                            child: const Text('保存设置'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
```

## File: lib/presentation/providers/chat_notifier.dart
```dart
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/api_message.dart';
import '../../core/models/model_info.dart';
import '../../domain/models/chat_page.dart';
import '../../domain/services/attachment_preparer.dart';
import '../../domain/services/branch_navigator.dart';
import '../../domain/services/chat_context_builder.dart';
import '../../domain/services/chat_round_factory.dart';
import '../../domain/services/chat_stream_accumulator.dart';
import '../../domain/services/chat_view_state_builder.dart';
import '../../domain/states/chat_state.dart';
import '../../di/providers.dart';
import '../models/pending_attachment.dart';
class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;
  final String fileName;
  ChatNotifier(this.ref, this.fileName) : super(ChatState.initial());
  Future<void> loadSession() async {
    state = state.copyWithLoading(true);
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final session = await repository.getSession(fileName);
      final viewState = ChatViewStateBuilder.buildInitial(session);
      state = state.copyWithSession(session).copyWith(
            currentRoundId: viewState.currentRoundId,
            pageList: viewState.pageList,
            error: null,
          );
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }
  ModelInfo? _findSelectedModelInfo(AppConfig config) {
    final selectedId = config.selectedModel;
    if (selectedId == null || selectedId.trim().isEmpty) return null;
    final models = config.availableModels ?? const <ModelInfo>[];
    return models.firstWhereOrNull((m) => m.id == selectedId);
  }
  bool _shouldEnableReasoning(AppConfig config) {
    final selectedModel = _findSelectedModelInfo(config);
    return selectedModel?.supportsReasoning == true;
  }
  void _validateRequestCapability({
    required AppConfig config,
    required List<PendingAttachment> attachments,
  }) {
    final selectedModel = _findSelectedModelInfo(config);
    if (selectedModel == null) return;
    final hasImage = attachments.any((a) => a.isImage);
    if (hasImage && selectedModel.supportsVision != true) {
      throw Exception('当前模型未声明支持图片输入');
    }
  }
  Future<void> sendMessage(
    String content, {
    List<PendingAttachment>? attachments,
  }) async {
    if (state.session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }
    try {
      final pendingAttachments = attachments ?? const <PendingAttachment>[];
      final repository = ref.read(conversationRepositoryProvider);
      final config = await ref.read(configRepositoryProvider).getConfig();
      _validateRequestCapability(
        config: config,
        attachments: pendingAttachments,
      );
      final savedAttachments = await AttachmentPreparer.savePendingAttachments(
        repository,
        pendingAttachments,
      );
      final round = ChatRoundFactory.createUserRound(
        content: content,
        parentId: state.currentRoundId,
        attachments: savedAttachments,
      );
      await _appendRoundAndEnterStreaming(round);
      final updatedSession = await repository.getSession(fileName);
      final contextRounds =
          BranchNavigator.getCurrentBranchPath(updatedSession, round.id);
      final apiContext = await ChatContextBuilder.buildFromRounds(
        contextRounds,
        repository,
      );
      _handleStreamTask(round, apiContext, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }
  Future<void> retryFromRound(String roundId) async {
    if (state.session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final config = await ref.read(configRepositoryProvider).getConfig();
      final sourceRound =
          state.session!.rounds.firstWhereOrNull((round) => round.id == roundId);
      if (sourceRound == null) {
        state = state.copyWithError('未找到要重新回复的对话');
        return;
      }
      final selectedModel = _findSelectedModelInfo(config);
      if (selectedModel != null) {
        final hasImage = sourceRound.userAttachments.any((a) => a.isImage);
        if (hasImage && selectedModel.supportsVision != true) {
          state = state.copyWithError('当前模型未声明支持图片输入');
          return;
        }
      }
      final newRound = ChatRoundFactory.createRetryRound(
        sourceRound: sourceRound,
      );
      await _appendRoundAndEnterStreaming(newRound);
      final updatedSession = await repository.getSession(fileName);
      final contextRounds =
          BranchNavigator.getCurrentBranchPath(updatedSession, newRound.id);
      final apiContext = await ChatContextBuilder.buildFromRounds(
        contextRounds,
        repository,
      );
      _handleStreamTask(newRound, apiContext, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }
  Future<void> _appendRoundAndEnterStreaming(ChatRound round) async {
    final repository = ref.read(conversationRepositoryProvider);
    await repository.appendRound(fileName, round);
    final updatedSession = await repository.getSession(fileName);
    final viewState = ChatViewStateBuilder.buildForRound(updatedSession, round.id);
    final newActiveStreams = Map<String, StreamStatus>.from(state.activeStreams);
    newActiveStreams[round.id] = const StreamStatus();
    state = state.copyWithSession(updatedSession).copyWith(
          currentRoundId: viewState.currentRoundId,
          pageList: viewState.pageList,
          activeStreams: newActiveStreams,
          error: null,
        );
  }
  Future<void> _handleStreamTask(
    ChatRound round,
    List<ApiMessage> apiContext,
    AppConfig config,
  ) async {
    final apiService = ref.read(apiServiceProvider);
    final accumulator = ChatStreamAccumulator();
    try {
      final stream = apiService.chatStream(
        taskId: round.id,
        baseUrl: config.baseUrl,
        apiKey: config.apiKey,
        chatPath: config.chatPath,
        apiMode: config.apiMode,
        model: config.selectedModel ?? 'unknown-model',
        context: apiContext,
        enableReasoning: _shouldEnableReasoning(config),
      );
      await for (final chunk in stream) {
        if (chunk.error != null) {
          state = state.copyWithStreaming(round.id, error: chunk.error);
          return;
        }
        if (!chunk.isDone) {
          accumulator.add(chunk);
          state = state.copyWithStreaming(
            round.id,
            content: accumulator.content,
            reasoning: accumulator.reasoning,
            isDone: false,
          );
        } else {
          break;
        }
      }
      final updatedRound = ChatRoundFactory.completeRound(
        round: round,
        content: accumulator.content,
        reasoning: accumulator.reasoning,
      );
      final repository = ref.read(conversationRepositoryProvider);
      await repository.updateRound(fileName, round.id, updatedRound);
      final finalSession = await repository.getSession(fileName);
      final finalPageList = _replaceRoundInCurrentPages(updatedRound);
      state = state.copyWithStreaming(round.id, isDone: true).copyWith(
            session: finalSession,
            pageList: finalPageList,
            error: null,
          );
    } catch (e) {
      state = state.copyWithStreaming(round.id, error: e.toString());
    }
  }
  ChatPageList? _replaceRoundInCurrentPages(ChatRound updatedRound) {
    final currentPageList = state.pageList;
    if (currentPageList == null) return null;
    final updatedPages = currentPageList.pages.map((page) {
      if (page.round.id == updatedRound.id) {
        return page.copyWith(round: updatedRound);
      }
      return page;
    }).toList();
    return currentPageList.copyWith(pages: updatedPages);
  }
  void stopGeneration() {
    if (state.pageList == null || state.pageList!.pages.isEmpty) return;
    final viewingRound =
        state.pageList!.pages[state.pageList!.currentPageIndex].round;
    if (!state.activeStreams.containsKey(viewingRound.id)) return;
    final apiService = ref.read(apiServiceProvider);
    apiService.cancelRequest(viewingRound.id);
  }
  Future<void> switchBranch(String targetRoundId) async {
    if (state.session == null) return;
    final session = state.session!;
    final newRoundId = BranchNavigator.switchBranch(session, targetRoundId);
    final viewState = ChatViewStateBuilder.buildForRound(session, newRoundId);
    state = state.copyWithCurrentRoundId(newRoundId).copyWith(
          pageList: viewState.pageList,
        );
  }
  void changePage(int pageIndex) {
    if (state.pageList == null) return;
    final pages = state.pageList!.pages;
    if (pageIndex < 0 || pageIndex >= pages.length) return;
    final targetPage = pages[pageIndex];
    final newRoundId = targetPage.round.id;
    state = state.copyWithCurrentRoundId(newRoundId).copyWith(
          pageList: state.pageList!.copyWith(currentPageIndex: pageIndex),
        );
  }
}
final chatProvider =
    StateNotifierProvider.family<ChatNotifier, ChatState, String>(
  (ref, fileName) {
    return ChatNotifier(ref, fileName);
  },
);
```

## File: lib/presentation/providers/config_notifier.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../di/providers.dart';
class ConfigNotifier extends StateNotifier<AsyncValue<AppConfig>> {
  final Ref ref;
  ConfigNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadInitialConfig();
  }
  Future<void> _loadInitialConfig() async {
    try {
      final repository = ref.read(configRepositoryProvider);
      final config = await repository.getConfig();
      state = AsyncValue.data(config);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<AppConfig> _fetchLatestConfig() async {
    final repository = ref.read(configRepositoryProvider);
    return await repository.getConfig();
  }
  Future<void> _reloadConfigWithoutLoading() async {
    final config = await _fetchLatestConfig();
    state = AsyncValue.data(config);
  }
  Future<void> updateApiKey(String apiKey) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateApiKey(apiKey);
    await _reloadConfigWithoutLoading();
  }
  Future<void> updateBaseUrl(String baseUrl) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateBaseUrl(baseUrl);
    await _reloadConfigWithoutLoading();
  }
  Future<void> updateModelsPath(String modelsPath) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateModelsPath(modelsPath);
    await _reloadConfigWithoutLoading();
  }
  Future<void> updateChatPath(String chatPath) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateChatPath(chatPath);
    await _reloadConfigWithoutLoading();
  }
  Future<void> updateApiMode(String apiMode) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateApiMode(apiMode);
    await _reloadConfigWithoutLoading();
  }
  Future<void> updateSelectedModel(String? model) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateSelectedModel(model);
    await _reloadConfigWithoutLoading();
  }
  Future<void> saveFullConfig(AppConfig config) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.saveFullConfig(config);
    state = AsyncValue.data(config);
  }
  Future<void> saveAndRefreshModels(AppConfig config) async {
    final repository = ref.read(configRepositoryProvider);
    state = AsyncValue.data(
      config.copyWith(
        availableModels: [],
      ),
    );
    await repository.saveAndRefreshModels(config);
    await _reloadConfigWithoutLoading();
  }
  Future<void> refreshModels() async {
    final repository = ref.read(configRepositoryProvider);
    await repository.refreshModels();
    await _reloadConfigWithoutLoading();
  }
}
final configProvider =
    StateNotifierProvider<ConfigNotifier, AsyncValue<AppConfig>>((ref) {
  return ConfigNotifier(ref);
});
```

## File: lib/presentation/providers/input_draft_provider.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/pending_attachment.dart';
final globalInputDraftProvider = StateProvider<String>((ref) => '');
final globalAttachmentDraftProvider =
    StateProvider<List<PendingAttachment>>((ref) => []);
```

## File: lib/presentation/providers/session_list_notifier.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import '../../di/providers.dart';
class SessionListNotifier extends StateNotifier<AsyncValue<List<Session>>> {
  final Ref ref;
  SessionListNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadSessions();
  }
  Future<void> _loadSessions() async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final sessions = await repository.getAllSessions();
      state = AsyncValue.data(sessions);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<void> refresh() async {
    await _loadSessions();
  }
  Future<void> deleteSession(String fileName) async {
    try {
      final repository = ref.read(conversationRepositoryProvider);
      await repository.deleteSession(fileName);
      await _loadSessions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<void> updateSessionTitle(String fileName, String newTitle) async {
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final cleanTitle = newTitle.trim();
      if (cleanTitle.isEmpty) return;
      await repository.updateSessionTitle(fileName, cleanTitle);
      await _loadSessions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<String> createSession(String title) async {
    final repository = ref.read(conversationRepositoryProvider);
    final cleanTitle = title.trim().isEmpty ? '新对话' : title.trim();
    final session = await repository.createSessionWithGeneratedId(
      title: cleanTitle,
    );
    await _loadSessions();
    return '${session.id}.json';
  }
}
final sessionListProvider =
    StateNotifierProvider<SessionListNotifier, AsyncValue<List<Session>>>((ref) {
  return SessionListNotifier(ref);
});
```

## File: lib/presentation/themes/app_theme.dart
```dart
import 'package:flutter/material.dart';
import 'app_tokens.dart';
class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppTokens.primary,
      brightness: Brightness.light,
      primary: AppTokens.primary,
      surface: AppTokens.surface,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppTokens.bg,
      canvasColor: AppTokens.bg,
      dividerColor: AppTokens.border,
      splashFactory: InkRipple.splashFactory,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppTokens.textPrimary,
        centerTitle: false,
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppTokens.textPrimary,
          letterSpacing: -0.4,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppTokens.textPrimary,
          letterSpacing: -0.2,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppTokens.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          height: 1.65,
          color: AppTokens.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.6,
          color: AppTokens.textPrimary,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.45,
          color: AppTokens.textSecondary,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppTokens.textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppTokens.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.brLg,
          side: const BorderSide(color: AppTokens.border),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppTokens.surface,
        hintStyle: const TextStyle(
          color: AppTokens.textTertiary,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: AppTokens.brMd,
          borderSide: const BorderSide(color: AppTokens.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppTokens.brMd,
          borderSide: const BorderSide(color: AppTokens.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppTokens.brMd,
          borderSide: const BorderSide(
            color: AppTokens.primary,
            width: 1.4,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppTokens.brMd,
          borderSide: const BorderSide(color: AppTokens.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppTokens.brMd,
          borderSide: const BorderSide(
            color: AppTokens.danger,
            width: 1.4,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          backgroundColor: AppTokens.primary,
          foregroundColor: AppTokens.textOnPrimary,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppTokens.brMd,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppTokens.textPrimary,
          side: const BorderSide(color: AppTokens.border),
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppTokens.brMd,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppTokens.primary,
          shape: RoundedRectangleBorder(
            borderRadius: AppTokens.brSm,
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppTokens.textPrimary,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: AppTokens.brSm,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppTokens.surfaceMuted,
        selectedColor: AppTokens.primarySoft,
        side: const BorderSide(color: AppTokens.border),
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.brSm,
        ),
        labelStyle: const TextStyle(
          fontSize: 13,
          color: AppTokens.textPrimary,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppTokens.textPrimary,
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppTokens.brMd,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppTokens.primary,
      ),
      dividerTheme: const DividerThemeData(
        color: AppTokens.border,
        thickness: 1,
        space: 1,
      ),
    );
  }
  static ThemeData get darkTheme {
    return lightTheme.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTokens.primary,
        brightness: Brightness.dark,
      ),
    );
  }
}
```

## File: lib/presentation/themes/app_tokens.dart
```dart
import 'package:flutter/material.dart';
abstract class AppTokens {
  // Brand
  static const Color primary = Color(0xFF4F46E5);
  static const Color primarySoft = Color(0xFFEEF2FF);
  // Background / Surface
  static const Color bg = Color(0xFFF5F7FB);
  static const Color surface = Colors.white;
  static const Color surfaceSoft = Color(0xFFF8FAFC);
  static const Color surfaceMuted = Color(0xFFF3F4F6);
  // Text
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Colors.white;
  // Border
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderStrong = Color(0xFFD1D5DB);
  // Status
  static const Color success = Color(0xFF10B981);
  static const Color successSoft = Color(0xFFECFDF5);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningSoft = Color(0xFFFFFBEB);
  static const Color danger = Color(0xFFEF4444);
  static const Color dangerSoft = Color(0xFFFEF2F2);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoSoft = Color(0xFFEFF6FF);
  // Chat specific
  static const Color userBubble = Color(0xFF111827);
  static const Color aiBubble = Colors.white;
  static const Color thoughtBubble = Color(0xFFFFFBEB);
  // Radius
  static const double radiusSm = 14;
  static const double radiusMd = 18;
  static const double radiusLg = 24;
  static const double radiusXl = 28;
  // Spacing
  static const double space4 = 4;
  static const double space6 = 6;
  static const double space8 = 8;
  static const double space10 = 10;
  static const double space12 = 12;
  static const double space14 = 14;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space32 = 32;
  // Border radius helpers
  static BorderRadius get brSm => BorderRadius.circular(radiusSm);
  static BorderRadius get brMd => BorderRadius.circular(radiusMd);
  static BorderRadius get brLg => BorderRadius.circular(radiusLg);
  static BorderRadius get brXl => BorderRadius.circular(radiusXl);
  // Shadows
  static List<BoxShadow> get shadowSm => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.03),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];
  static List<BoxShadow> get shadowMd => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
      ];
  static List<BoxShadow> get shadowLg => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 24,
          offset: const Offset(0, 12),
        ),
      ];
}
```

## File: lib/presentation/widgets/attachment_list.dart
```dart
import 'package:flutter/material.dart';
import '../../core/models/attachment.dart';
import '../themes/app_tokens.dart';
class AttachmentList extends StatelessWidget {
  final List<Attachment> attachments;
  const AttachmentList({
    super.key,
    required this.attachments,
  });
  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: AppTokens.space8,
      runSpacing: AppTokens.space8,
      children: attachments.map((attachment) {
        return _AttachmentChip(attachment: attachment);
      }).toList(),
    );
  }
}
class _AttachmentChip extends StatelessWidget {
  final Attachment attachment;
  const _AttachmentChip({
    required this.attachment,
  });
  @override
  Widget build(BuildContext context) {
    final icon =
        attachment.isImage ? Icons.image_outlined : Icons.attach_file_outlined;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTokens.space10,
        vertical: AppTokens.space8,
      ),
      decoration: BoxDecoration(
        color: AppTokens.surfaceSoft,
        borderRadius: AppTokens.brMd,
        border: Border.all(color: AppTokens.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppTokens.surface,
              borderRadius: AppTokens.brSm,
              border: Border.all(color: AppTokens.border),
            ),
            child: Icon(
              icon,
              size: 16,
              color: AppTokens.textSecondary,
            ),
          ),
          const SizedBox(width: AppTokens.space8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 180),
            child: Text(
              attachment.name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    color: AppTokens.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## File: lib/presentation/widgets/common/app_badge.dart
```dart
import 'package:flutter/material.dart';
import '../../themes/app_tokens.dart';
class AppBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final IconData? icon;
  const AppBadge({
    super.key,
    required this.text,
    required this.color,
    required this.backgroundColor,
    this.icon,
  });
  factory AppBadge.primary(String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: AppTokens.primary,
      backgroundColor: AppTokens.primarySoft,
      icon: icon,
    );
  }
  factory AppBadge.success(String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: AppTokens.success,
      backgroundColor: AppTokens.successSoft,
      icon: icon,
    );
  }
  factory AppBadge.warning(String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: AppTokens.warning,
      backgroundColor: AppTokens.warningSoft,
      icon: icon,
    );
  }
  factory AppBadge.info(String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: AppTokens.info,
      backgroundColor: AppTokens.infoSoft,
      icon: icon,
    );
  }
  factory AppBadge.danger(String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: AppTokens.danger,
      backgroundColor: AppTokens.dangerSoft,
      icon: icon,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: color.withValues(alpha: 0.20),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              height: 1.1,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
```

## File: lib/presentation/widgets/common/app_card.dart
```dart
import 'package:flutter/material.dart';
import '../../themes/app_tokens.dart';
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppTokens.space16),
    this.margin,
    this.color,
    this.borderRadius,
    this.boxShadow,
    this.border,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? AppTokens.surface,
        borderRadius: borderRadius ?? AppTokens.brLg,
        border: border ?? Border.all(color: AppTokens.border),
        boxShadow: boxShadow ?? AppTokens.shadowMd,
      ),
      child: child,
    );
  }
}
```

## File: lib/presentation/widgets/common/app_page_scaffold.dart
```dart
import 'package:flutter/material.dart';
import '../../themes/app_tokens.dart';
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
      backgroundColor: backgroundColor ?? AppTokens.bg,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: content,
    );
  }
}
```

## File: lib/presentation/widgets/common/app_section.dart
```dart
import 'package:flutter/material.dart';
import '../../themes/app_tokens.dart';
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
    return AppCard(
      margin: margin ?? const EdgeInsets.only(bottom: AppTokens.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppTokens.space6),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
          const SizedBox(height: AppTokens.space16),
          ...children,
        ],
      ),
    );
  }
}
```

## File: lib/presentation/widgets/input_bar.dart
```dart
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/utils/id_generator.dart';
import '../models/pending_attachment.dart';
import '../providers/input_draft_provider.dart';
import '../themes/app_tokens.dart';
class InputBar extends ConsumerStatefulWidget {
  final void Function(String text, List<PendingAttachment> attachments) onSend;
  final VoidCallback? onStop;
  final bool isStreaming;
  final bool enabled;
  final String hintText;
  const InputBar({
    super.key,
    required this.onSend,
    this.onStop,
    this.isStreaming = false,
    this.enabled = true,
    this.hintText = '输入消息...',
  });
  @override
  ConsumerState<InputBar> createState() => _InputBarState();
}
class _InputBarState extends ConsumerState<InputBar> {
  late final TextEditingController _controller;
  late final ProviderSubscription<String> _draftSubscription;
  final GlobalKey _addButtonKey = GlobalKey();
  final ImagePicker _imagePicker = ImagePicker();
  bool _isSyncingText = false;
  OverlayEntry? _attachmentMenuOverlay;
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
    _removeAttachmentMenu();
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
  void _clearDraft() {
    ref.read(globalInputDraftProvider.notifier).state = '';
  }
  void _clearAttachmentDraft() {
    ref.read(globalAttachmentDraftProvider.notifier).state = [];
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
      id: IdGenerator.generate(),
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
      id: IdGenerator.generate(),
      name: name,
      path: file.path,
      isImage: true,
      mimeType: _guessMimeType(name) ?? 'image/*',
    );
    final notifier = ref.read(globalAttachmentDraftProvider.notifier);
    notifier.state = [...notifier.state, attachment];
  }
  void _removeAttachmentMenu() {
    _attachmentMenuOverlay?.remove();
    _attachmentMenuOverlay = null;
  }
  void _toggleAttachmentMenu() {
    if (!widget.enabled) return;
    if (_attachmentMenuOverlay != null) {
      _removeAttachmentMenu();
      return;
    }
    final buttonContext = _addButtonKey.currentContext;
    if (buttonContext == null) return;
    final buttonRenderBox = buttonContext.findRenderObject() as RenderBox;
    final overlayRenderBox =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final buttonOffset = buttonRenderBox.localToGlobal(
      Offset.zero,
      ancestor: overlayRenderBox,
    );
    final buttonSize = buttonRenderBox.size;
    const menuWidth = 148.0;
    const menuItemHeight = 48.0;
    const menuPadding = 8.0;
    final menuHeight = menuPadding * 2 + menuItemHeight * 2;
    final left = buttonOffset.dx;
    final top = buttonOffset.dy - menuHeight - 10;
    _attachmentMenuOverlay = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _removeAttachmentMenu,
                child: const SizedBox.expand(),
              ),
            ),
            Positioned(
              left: left,
              top: top < 0 ? buttonOffset.dy + buttonSize.height + 10 : top,
              child: Material(
                color: Colors.transparent,
                child: _AttachmentPopupMenu(
                  width: menuWidth,
                  onFileTap: () async {
                    _removeAttachmentMenu();
                    await _pickFileAttachment();
                  },
                  onGalleryTap: () async {
                    _removeAttachmentMenu();
                    await _pickImageFromGallery();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context).insert(_attachmentMenuOverlay!);
  }
  void _removeAttachment(String id) {
    final notifier = ref.read(globalAttachmentDraftProvider.notifier);
    notifier.state = notifier.state.where((item) => item.id != id).toList();
  }
  void _handleSend() {
    if (!widget.enabled) return;
    final content = _controller.text.trim();
    final attachments = ref.read(globalAttachmentDraftProvider);
    if (content.isEmpty && attachments.isEmpty) return;
    _removeAttachmentMenu();
    widget.onSend(content, attachments);
    _clearDraft();
    _clearAttachmentDraft();
  }
  @override
  Widget build(BuildContext context) {
    final attachments = ref.watch(globalAttachmentDraftProvider);
    final hasText = _controller.text.trim().isNotEmpty;
    final hasAttachments = attachments.isNotEmpty;
    final canSend = (hasText || hasAttachments) && widget.enabled;
    final showStopButton = widget.isStreaming && widget.onStop != null;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: bottomInset > 0 ? bottomInset : 0),
      child: SafeArea(
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            color: AppTokens.surface,
            border: Border(
              top: BorderSide(color: AppTokens.border),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(
            AppTokens.space12,
            AppTokens.space10,
            AppTokens.space12,
            AppTokens.space12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (attachments.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppTokens.space10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: AppTokens.space8,
                      runSpacing: AppTokens.space8,
                      children: attachments.map((attachment) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTokens.space10,
                            vertical: AppTokens.space8,
                          ),
                          decoration: BoxDecoration(
                            color: AppTokens.surfaceSoft,
                            borderRadius: AppTokens.brMd,
                            border: Border.all(color: AppTokens.border),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                attachment.isImage
                                    ? Icons.image_outlined
                                    : Icons.attach_file_outlined,
                                size: 16,
                                color: AppTokens.textSecondary,
                              ),
                              const SizedBox(width: AppTokens.space6),
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 180),
                                child: Text(
                                  attachment.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 13,
                                        color: AppTokens.textPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              const SizedBox(width: AppTokens.space6),
                              GestureDetector(
                                onTap: () => _removeAttachment(attachment.id),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: AppTokens.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _SideActionButton(
                    key: _addButtonKey,
                    icon: Icons.add,
                    tooltip: '添加附件',
                    onTap: widget.enabled ? _toggleAttachmentMenu : null,
                  ),
                  const SizedBox(width: AppTokens.space8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTokens.surfaceSoft,
                        borderRadius: AppTokens.brLg,
                        border: Border.all(color: AppTokens.border),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTokens.space12,
                        vertical: AppTokens.space12,
                      ),
                      child: TextField(
                        controller: _controller,
                        minLines: 1,
                        maxLines: 6,
                        enabled: widget.enabled,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTokens.textPrimary,
                            ),
                        decoration: InputDecoration(
                          hintText: widget.hintText,
                          isCollapsed: true,
                          filled: false,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          hintStyle: const TextStyle(
                            color: AppTokens.textTertiary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTokens.space8),
                  if (showStopButton)
                    _PrimaryActionButton(
                      icon: Icons.stop_rounded,
                      tooltip: '停止生成',
                      onTap: widget.enabled
                          ? () {
                              _removeAttachmentMenu();
                              widget.onStop?.call();
                            }
                          : null,
                      isDanger: true,
                    )
                  else
                    _PrimaryActionButton(
                      icon: Icons.arrow_upward_rounded,
                      tooltip: '发送',
                      onTap: canSend ? _handleSend : null,
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
class _AttachmentPopupMenu extends StatelessWidget {
  final double width;
  final VoidCallback onFileTap;
  final VoidCallback onGalleryTap;
  const _AttachmentPopupMenu({
    required this.width,
    required this.onFileTap,
    required this.onGalleryTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTokens.surface,
        borderRadius: AppTokens.brLg,
        border: Border.all(color: AppTokens.border),
        boxShadow: AppTokens.shadowLg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _AttachmentMenuItem(
            icon: Icons.attach_file_outlined,
            label: '文件',
            onTap: onFileTap,
          ),
          const SizedBox(height: 6),
          _AttachmentMenuItem(
            icon: Icons.photo_library_outlined,
            label: '相册',
            onTap: onGalleryTap,
          ),
        ],
      ),
    );
  }
}
class _AttachmentMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _AttachmentMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppTokens.brMd,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: AppTokens.surfaceSoft,
          borderRadius: AppTokens.brMd,
          border: Border.all(color: AppTokens.border),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: AppTokens.textPrimary,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTokens.textPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
class _SideActionButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback? onTap;
  const _SideActionButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppTokens.brMd,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppTokens.surfaceSoft,
            borderRadius: AppTokens.brMd,
            border: Border.all(color: AppTokens.border),
          ),
          child: Icon(
            icon,
            size: 20,
            color: onTap == null
                ? AppTokens.textTertiary
                : AppTokens.textSecondary,
          ),
        ),
      ),
    );
  }
}
class _PrimaryActionButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback? onTap;
  final bool isDanger;
  const _PrimaryActionButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.isDanger = false,
  });
  @override
  Widget build(BuildContext context) {
    final bg = isDanger ? AppTokens.danger : AppTokens.primary;
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppTokens.brMd,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: onTap == null ? AppTokens.border : bg,
            borderRadius: AppTokens.brMd,
            boxShadow: onTap == null ? [] : AppTokens.shadowSm,
          ),
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
```

## File: lib/presentation/widgets/message_bubble.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../themes/app_tokens.dart';
class MessageBubble extends StatelessWidget {
  final String content;
  final bool isUser;
  final VoidCallback? onCopy;
  final VoidCallback? onRetryReply;
  const MessageBubble({
    super.key,
    required this.content,
    required this.isUser,
    this.onCopy,
    this.onRetryReply,
  });
  @override
  Widget build(BuildContext context) {
    final bubbleColor = isUser ? AppTokens.userBubble : AppTokens.aiBubble;
    final borderColor = isUser ? Colors.transparent : AppTokens.border;
    final textColor =
        isUser ? AppTokens.textOnPrimary : AppTokens.textPrimary;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.88,
        ),
        margin: const EdgeInsets.symmetric(vertical: AppTokens.space4),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTokens.space14,
                vertical: AppTokens.space12,
              ),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(AppTokens.radiusLg),
                  topRight: const Radius.circular(AppTokens.radiusLg),
                  bottomLeft: Radius.circular(
                    isUser ? AppTokens.radiusLg : AppTokens.radiusSm,
                  ),
                  bottomRight: Radius.circular(
                    isUser ? AppTokens.radiusSm : AppTokens.radiusLg,
                  ),
                ),
                border: Border.all(color: borderColor),
                boxShadow: isUser ? [] : AppTokens.shadowSm,
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
                    backgroundColor: isUser
                        ? Colors.white.withOpacity(0.10)
                        : AppTokens.surfaceMuted,
                  ),
                  codeblockPadding: const EdgeInsets.all(12),
                  codeblockDecoration: BoxDecoration(
                    color: isUser
                        ? Colors.white.withOpacity(0.08)
                        : AppTokens.surfaceSoft,
                    borderRadius: AppTokens.brSm,
                    border: Border.all(
                      color: isUser
                          ? Colors.white.withOpacity(0.08)
                          : AppTokens.border,
                    ),
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
                    color: isUser ? Colors.white : AppTokens.primary,
                    decoration: TextDecoration.underline,
                  ),
                  blockquote: TextStyle(
                    color: isUser
                        ? Colors.white.withOpacity(0.85)
                        : AppTokens.textSecondary,
                    height: 1.6,
                  ),
                  blockquoteDecoration: BoxDecoration(
                    color: isUser
                        ? Colors.white.withOpacity(0.06)
                        : AppTokens.surfaceMuted,
                    borderRadius: AppTokens.brSm,
                    border: Border(
                      left: BorderSide(
                        color: isUser
                            ? Colors.white.withOpacity(0.20)
                            : AppTokens.borderStrong,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (onCopy != null || onRetryReply != null) ...[
              const SizedBox(height: AppTokens.space6),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (onCopy != null)
                    _ActionIconButton(
                      icon: Icons.content_copy_outlined,
                      tooltip: '复制',
                      onTap: onCopy!,
                    ),
                  if (onRetryReply != null) ...[
                    const SizedBox(width: AppTokens.space4),
                    _ActionIconButton(
                      icon: Icons.refresh_outlined,
                      tooltip: '重新生成',
                      onTap: onRetryReply!,
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
class _ActionIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  const _ActionIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppTokens.brSm,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTokens.surface,
              borderRadius: AppTokens.brSm,
              border: Border.all(color: AppTokens.border),
            ),
            child: Icon(
              icon,
              size: 16,
              color: AppTokens.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
```

## File: lib/presentation/widgets/page_indicator.dart
```dart
import 'package:flutter/material.dart';
class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${currentPage + 1} / $totalPages',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
```

## File: lib/presentation/widgets/thought_bubble.dart
```dart
import 'package:flutter/material.dart';
import '../themes/app_tokens.dart';
class ThoughtBubble extends StatelessWidget {
  final String content;
  const ThoughtBubble({
    super.key,
    required this.content,
  });
  @override
  Widget build(BuildContext context) {
    final text = content.trim();
    if (text.isEmpty) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppTokens.space12),
      padding: const EdgeInsets.all(AppTokens.space12),
      decoration: BoxDecoration(
        color: AppTokens.thoughtBubble,
        borderRadius: AppTokens.brMd,
        border: Border.all(
          color: AppTokens.warning.withOpacity(0.18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.psychology_alt_outlined,
                size: 16,
                color: AppTokens.warning,
              ),
              const SizedBox(width: AppTokens.space6),
              Text(
                '推理过程',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTokens.warning,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppTokens.space8),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  height: 1.65,
                  color: AppTokens.textSecondary,
                ),
          ),
        ],
      ),
    );
  }
}
```
