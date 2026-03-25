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
lib/core/models/app_config_store.dart
lib/core/models/app_config_store.freezed.dart
lib/core/models/app_config_store.g.dart
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
lib/core/utils/app_route_observer.dart
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
lib/presentation/pages/text_attachment_viewer_page.dart
lib/presentation/providers/attachment_bytes_provider.dart
lib/presentation/providers/chat_notifier.dart
lib/presentation/providers/config_notifier.dart
lib/presentation/providers/global_streaming_provider.dart
lib/presentation/providers/home_session_list_provider.dart
lib/presentation/providers/input_draft_provider.dart
lib/presentation/providers/session_card_provider.dart
lib/presentation/providers/session_list_notifier.dart
lib/presentation/themes/app_theme.dart
lib/presentation/themes/app_tokens.dart
lib/presentation/widgets/attachment_list.dart
lib/presentation/widgets/common/app_badge.dart
lib/presentation/widgets/common/app_card.dart
lib/presentation/widgets/common/app_page_scaffold.dart
lib/presentation/widgets/common/app_section.dart
lib/presentation/widgets/common/app_toast.dart
lib/presentation/widgets/input_bar.dart
lib/presentation/widgets/message_bubble.dart
lib/presentation/widgets/page_indicator.dart
lib/presentation/widgets/thought_bubble.dart
```

# Files

## File: lib/presentation/widgets/common/app_toast.dart
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

## File: lib/core/models/app_config_store.dart
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

## File: lib/core/models/app_config_store.freezed.dart
```dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of 'app_config_store.dart';
// **************************************************************************
// FreezedGenerator
// **************************************************************************
T _$identity<T>(T value) => value;
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);
ConfigProfile _$ConfigProfileFromJson(Map<String, dynamic> json) {
  return _ConfigProfile.fromJson(json);
}
/// @nodoc
mixin _$ConfigProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AppConfig get config => throw _privateConstructorUsedError;
  /// Serializes this ConfigProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigProfileCopyWith<ConfigProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $ConfigProfileCopyWith<$Res> {
  factory $ConfigProfileCopyWith(
    ConfigProfile value,
    $Res Function(ConfigProfile) then,
  ) = _$ConfigProfileCopyWithImpl<$Res, ConfigProfile>;
  @useResult
  $Res call({String id, String name, AppConfig config});
  $AppConfigCopyWith<$Res> get config;
}
/// @nodoc
class _$ConfigProfileCopyWithImpl<$Res, $Val extends ConfigProfile>
    implements $ConfigProfileCopyWith<$Res> {
  _$ConfigProfileCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? config = null}) {
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
            config: null == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as AppConfig,
          )
          as $Val,
    );
  }
  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppConfigCopyWith<$Res> get config {
    return $AppConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}
/// @nodoc
abstract class _$$ConfigProfileImplCopyWith<$Res>
    implements $ConfigProfileCopyWith<$Res> {
  factory _$$ConfigProfileImplCopyWith(
    _$ConfigProfileImpl value,
    $Res Function(_$ConfigProfileImpl) then,
  ) = __$$ConfigProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, AppConfig config});
  @override
  $AppConfigCopyWith<$Res> get config;
}
/// @nodoc
class __$$ConfigProfileImplCopyWithImpl<$Res>
    extends _$ConfigProfileCopyWithImpl<$Res, _$ConfigProfileImpl>
    implements _$$ConfigProfileImplCopyWith<$Res> {
  __$$ConfigProfileImplCopyWithImpl(
    _$ConfigProfileImpl _value,
    $Res Function(_$ConfigProfileImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? config = null}) {
    return _then(
      _$ConfigProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        config: null == config
            ? _value.config
            : config // ignore: cast_nullable_to_non_nullable
                  as AppConfig,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$ConfigProfileImpl implements _ConfigProfile {
  const _$ConfigProfileImpl({
    required this.id,
    required this.name,
    required this.config,
  });
  factory _$ConfigProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigProfileImplFromJson(json);
  @override
  final String id;
  @override
  final String name;
  @override
  final AppConfig config;
  @override
  String toString() {
    return 'ConfigProfile(id: $id, name: $name, config: $config)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.config, config) || other.config == config));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, config);
  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigProfileImplCopyWith<_$ConfigProfileImpl> get copyWith =>
      __$$ConfigProfileImplCopyWithImpl<_$ConfigProfileImpl>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigProfileImplToJson(this);
  }
}
abstract class _ConfigProfile implements ConfigProfile {
  const factory _ConfigProfile({
    required final String id,
    required final String name,
    required final AppConfig config,
  }) = _$ConfigProfileImpl;
  factory _ConfigProfile.fromJson(Map<String, dynamic> json) =
      _$ConfigProfileImpl.fromJson;
  @override
  String get id;
  @override
  String get name;
  @override
  AppConfig get config;
  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigProfileImplCopyWith<_$ConfigProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
AppConfigStore _$AppConfigStoreFromJson(Map<String, dynamic> json) {
  return _AppConfigStore.fromJson(json);
}
/// @nodoc
mixin _$AppConfigStore {
  String get activeProfileId => throw _privateConstructorUsedError;
  List<ConfigProfile> get profiles => throw _privateConstructorUsedError;
  /// Serializes this AppConfigStore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  /// Create a copy of AppConfigStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigStoreCopyWith<AppConfigStore> get copyWith =>
      throw _privateConstructorUsedError;
}
/// @nodoc
abstract class $AppConfigStoreCopyWith<$Res> {
  factory $AppConfigStoreCopyWith(
    AppConfigStore value,
    $Res Function(AppConfigStore) then,
  ) = _$AppConfigStoreCopyWithImpl<$Res, AppConfigStore>;
  @useResult
  $Res call({String activeProfileId, List<ConfigProfile> profiles});
}
/// @nodoc
class _$AppConfigStoreCopyWithImpl<$Res, $Val extends AppConfigStore>
    implements $AppConfigStoreCopyWith<$Res> {
  _$AppConfigStoreCopyWithImpl(this._value, this._then);
  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
  /// Create a copy of AppConfigStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeProfileId = null, Object? profiles = null}) {
    return _then(
      _value.copyWith(
            activeProfileId: null == activeProfileId
                ? _value.activeProfileId
                : activeProfileId // ignore: cast_nullable_to_non_nullable
                      as String,
            profiles: null == profiles
                ? _value.profiles
                : profiles // ignore: cast_nullable_to_non_nullable
                      as List<ConfigProfile>,
          )
          as $Val,
    );
  }
}
/// @nodoc
abstract class _$$AppConfigStoreImplCopyWith<$Res>
    implements $AppConfigStoreCopyWith<$Res> {
  factory _$$AppConfigStoreImplCopyWith(
    _$AppConfigStoreImpl value,
    $Res Function(_$AppConfigStoreImpl) then,
  ) = __$$AppConfigStoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String activeProfileId, List<ConfigProfile> profiles});
}
/// @nodoc
class __$$AppConfigStoreImplCopyWithImpl<$Res>
    extends _$AppConfigStoreCopyWithImpl<$Res, _$AppConfigStoreImpl>
    implements _$$AppConfigStoreImplCopyWith<$Res> {
  __$$AppConfigStoreImplCopyWithImpl(
    _$AppConfigStoreImpl _value,
    $Res Function(_$AppConfigStoreImpl) _then,
  ) : super(_value, _then);
  /// Create a copy of AppConfigStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeProfileId = null, Object? profiles = null}) {
    return _then(
      _$AppConfigStoreImpl(
        activeProfileId: null == activeProfileId
            ? _value.activeProfileId
            : activeProfileId // ignore: cast_nullable_to_non_nullable
                  as String,
        profiles: null == profiles
            ? _value._profiles
            : profiles // ignore: cast_nullable_to_non_nullable
                  as List<ConfigProfile>,
      ),
    );
  }
}
/// @nodoc
@JsonSerializable()
class _$AppConfigStoreImpl implements _AppConfigStore {
  const _$AppConfigStoreImpl({
    required this.activeProfileId,
    final List<ConfigProfile> profiles = const [],
  }) : _profiles = profiles;
  factory _$AppConfigStoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigStoreImplFromJson(json);
  @override
  final String activeProfileId;
  final List<ConfigProfile> _profiles;
  @override
  @JsonKey()
  List<ConfigProfile> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }
  @override
  String toString() {
    return 'AppConfigStore(activeProfileId: $activeProfileId, profiles: $profiles)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigStoreImpl &&
            (identical(other.activeProfileId, activeProfileId) ||
                other.activeProfileId == activeProfileId) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    activeProfileId,
    const DeepCollectionEquality().hash(_profiles),
  );
  /// Create a copy of AppConfigStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigStoreImplCopyWith<_$AppConfigStoreImpl> get copyWith =>
      __$$AppConfigStoreImplCopyWithImpl<_$AppConfigStoreImpl>(
        this,
        _$identity,
      );
  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigStoreImplToJson(this);
  }
}
abstract class _AppConfigStore implements AppConfigStore {
  const factory _AppConfigStore({
    required final String activeProfileId,
    final List<ConfigProfile> profiles,
  }) = _$AppConfigStoreImpl;
  factory _AppConfigStore.fromJson(Map<String, dynamic> json) =
      _$AppConfigStoreImpl.fromJson;
  @override
  String get activeProfileId;
  @override
  List<ConfigProfile> get profiles;
  /// Create a copy of AppConfigStore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigStoreImplCopyWith<_$AppConfigStoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
```

## File: lib/core/models/app_config_store.g.dart
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

## File: lib/core/utils/app_route_observer.dart
```dart
import 'package:flutter/material.dart';
final RouteObserver<ModalRoute<void>> appRouteObserver =
    RouteObserver<ModalRoute<void>>();
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
  bool get isStreaming => throw _privateConstructorUsedError;
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
  $Res call({String content, String reasoning, bool isStreaming});
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
    Object? isStreaming = null,
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
            isStreaming: null == isStreaming
                ? _value.isStreaming
                : isStreaming // ignore: cast_nullable_to_non_nullable
                      as bool,
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
  $Res call({String content, String reasoning, bool isStreaming});
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
    Object? isStreaming = null,
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
        isStreaming: null == isStreaming
            ? _value.isStreaming
            : isStreaming // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
/// @nodoc
class _$StreamStatusImpl implements _StreamStatus {
  const _$StreamStatusImpl({
    this.content = '',
    this.reasoning = '',
    this.isStreaming = false,
  });
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String reasoning;
  @override
  @JsonKey()
  final bool isStreaming;
  @override
  String toString() {
    return 'StreamStatus(content: $content, reasoning: $reasoning, isStreaming: $isStreaming)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamStatusImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.isStreaming, isStreaming) ||
                other.isStreaming == isStreaming));
  }
  @override
  int get hashCode => Object.hash(runtimeType, content, reasoning, isStreaming);
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
    final bool isStreaming,
  }) = _$StreamStatusImpl;
  @override
  String get content;
  @override
  String get reasoning;
  @override
  bool get isStreaming;
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
    this.error,
    this.isLoading = false,
  });
  @override
  final Session? session;
  @override
  final String? currentRoundId;
  @override
  final ChatPageList? pageList;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  String toString() {
    return 'ChatState(session: $session, currentRoundId: $currentRoundId, pageList: $pageList, error: $error, isLoading: $isLoading)';
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

## File: lib/presentation/pages/text_attachment_viewer_page.dart
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

## File: lib/presentation/providers/home_session_list_provider.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import '../../domain/services/branch_navigator.dart';
import 'session_list_notifier.dart';
class HomeSessionItem {
  final Session session;
  final bool hasUnseen;
  final String userPreview;
  final int roundCount;
  final int updatedAt;
  final String? previewRoundId;
  const HomeSessionItem({
    required this.session,
    required this.hasUnseen,
    required this.userPreview,
    required this.roundCount,
    required this.updatedAt,
    required this.previewRoundId,
  });
}
final homeSessionListProvider =
    Provider<AsyncValue<List<HomeSessionItem>>>((ref) {
  final sessionsAsync = ref.watch(sessionListProvider);
  return sessionsAsync.whenData((sessions) {
    final items = sessions.map((session) {
      final hasUnseen = session.rounds.any((r) => r.hasUnseenUpdate);
      final roundCount = session.rounds.length;
      final previewRoundId = session.rounds.isEmpty
          ? null
          : BranchNavigator.getAllBranchLeaves(session).isNotEmpty
              ? BranchNavigator.getAllBranchLeaves(session).last.id
              : session.rounds.last.id;
      final previewRound = previewRoundId == null
          ? null
          : session.rounds.firstWhere(
              (r) => r.id == previewRoundId,
              orElse: () => session.rounds.last,
            );
      final userPreview = previewRound == null
          ? '点击开始新的对话'
          : previewRound.userContent.trim().isEmpty
              ? '（空输入）'
              : previewRound.userContent.trim();
      return HomeSessionItem(
        session: session,
        hasUnseen: hasUnseen,
        userPreview: userPreview,
        roundCount: roundCount,
        updatedAt: session.updatedAt,
        previewRoundId: previewRoundId,
      );
    }).toList();
    items.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return items;
  });
});
```

## File: lib/presentation/providers/session_card_provider.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import '../../di/providers.dart';
final sessionFileNamesProvider = FutureProvider<List<String>>((ref) async {
  final repository = ref.read(conversationRepositoryProvider);
  final fileNames = await repository.getAllSessionFileNames();
  final sessions = <Session>[];
  for (final fileName in fileNames) {
    try {
      final session = await repository.getSession(fileName);
      sessions.add(session);
    } catch (_) {}
  }
  sessions.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  return sessions.map((e) => '${e.id}.json').toList();
});
final sessionCardProvider =
    FutureProvider.family<Session, String>((ref, fileName) async {
  final repository = ref.read(conversationRepositoryProvider);
  return repository.getSession(fileName);
});
```

## File: lib/presentation/themes/app_theme.dart
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

## File: lib/presentation/widgets/common/app_badge.dart
```dart
import 'package:flutter/material.dart';
class AppBadge extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon;
  const AppBadge({
    super.key,
    required this.text,
    required this.color,
    this.icon,
  });
  factory AppBadge.primary(BuildContext context, String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: Theme.of(context).colorScheme.primary,
      icon: icon,
    );
  }
  factory AppBadge.success(BuildContext context, String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: Colors.green,
      icon: icon,
    );
  }
  factory AppBadge.warning(BuildContext context, String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: Colors.orange,
      icon: icon,
    );
  }
  factory AppBadge.info(BuildContext context, String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: Theme.of(context).colorScheme.secondary,
      icon: icon,
    );
  }
  factory AppBadge.danger(BuildContext context, String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: Theme.of(context).colorScheme.error,
      icon: icon,
    );
  }
  @override
  Widget build(BuildContext context) {
    final backgroundColor = color.withValues(alpha: 0.12);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: const StadiumBorder(),
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
              fontSize: 12,
              fontWeight: FontWeight.w600,
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

## File: lib/presentation/widgets/common/app_section.dart
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

## File: lib/presentation/widgets/input_bar.dart
```dart
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/utils/id_generator.dart';
import '../models/pending_attachment.dart';
import '../providers/input_draft_provider.dart';
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
            Row(
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
              ],
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## File: lib/core/interfaces/config_service.dart
```dart
import '../models/app_config.dart';
import '../models/app_config_store.dart';
abstract class IConfigService {
  Future<AppConfigStore> loadConfigStore();
  Future<AppConfig> loadConfig();
  Future<void> saveConfig(AppConfig config);
  Future<void> refreshModels();
  Future<List<ConfigProfile>> getProfiles();
  Future<String> getActiveProfileId();
  Future<void> switchProfile(String profileId);
  Future<void> createProfile(String name);
  Future<void> renameProfile(String profileId, String name);
  Future<void> deleteProfile(String profileId);
}
```

## File: lib/core/interfaces/file_service.dart
```dart
import 'dart:typed_data';
import '../models/session.dart';
import '../models/app_config_store.dart';
abstract class IFileService {
  // 配置
  Future<AppConfigStore> readConfigStore();
  Future<void> writeConfigStore(AppConfigStore store);
  // 会话
  Future<List<String>> getConversationFileList();
  Future<Session> readSession(String fileName);
  Future<void> writeSession(String fileName, Session session);
  Future<void> deleteSession(String fileName);
  // 附件
  Future<String> saveAttachment(Uint8List data, String fileName);
  Future<Uint8List> readAttachment(String relativePath);
  Future<void> deleteAttachment(String relativePath);
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
    @Default(false) bool hasUnseenUpdate,
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
  bool get hasUnseenUpdate => throw _privateConstructorUsedError;
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
    bool hasUnseenUpdate,
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
    Object? hasUnseenUpdate = null,
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
            hasUnseenUpdate: null == hasUnseenUpdate
                ? _value.hasUnseenUpdate
                : hasUnseenUpdate // ignore: cast_nullable_to_non_nullable
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
    bool hasUnseenUpdate,
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
    Object? hasUnseenUpdate = null,
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
        hasUnseenUpdate: null == hasUnseenUpdate
            ? _value.hasUnseenUpdate
            : hasUnseenUpdate // ignore: cast_nullable_to_non_nullable
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
    this.hasUnseenUpdate = false,
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
  @JsonKey()
  final bool hasUnseenUpdate;
  @override
  String toString() {
    return 'ChatRound(id: $id, parentId: $parentId, createdAt: $createdAt, userContent: $userContent, userAttachments: $userAttachments, assistantThinking: $assistantThinking, assistantContent: $assistantContent, isIncomplete: $isIncomplete, hasUnseenUpdate: $hasUnseenUpdate)';
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
                other.isIncomplete == isIncomplete) &&
            (identical(other.hasUnseenUpdate, hasUnseenUpdate) ||
                other.hasUnseenUpdate == hasUnseenUpdate));
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
    hasUnseenUpdate,
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
    final bool hasUnseenUpdate,
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
  @override
  bool get hasUnseenUpdate;
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
  bool get hasUnseenUpdate => throw _privateConstructorUsedError;
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
    bool hasUnseenUpdate,
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
    Object? hasUnseenUpdate = null,
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
            hasUnseenUpdate: null == hasUnseenUpdate
                ? _value.hasUnseenUpdate
                : hasUnseenUpdate // ignore: cast_nullable_to_non_nullable
                      as bool,
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
    bool hasUnseenUpdate,
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
    Object? hasUnseenUpdate = null,
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
        hasUnseenUpdate: null == hasUnseenUpdate
            ? _value.hasUnseenUpdate
            : hasUnseenUpdate // ignore: cast_nullable_to_non_nullable
                  as bool,
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
    this.hasUnseenUpdate = false,
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
  @JsonKey()
  final bool hasUnseenUpdate;
  @override
  String toString() {
    return 'Session(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, rounds: $rounds, config: $config, hasUnseenUpdate: $hasUnseenUpdate)';
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
            (identical(other.config, config) || other.config == config) &&
            (identical(other.hasUnseenUpdate, hasUnseenUpdate) ||
                other.hasUnseenUpdate == hasUnseenUpdate));
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
    hasUnseenUpdate,
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
    final bool hasUnseenUpdate,
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
  @override
  bool get hasUnseenUpdate;
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

## File: lib/data/data_sources/local_file_source.dart
```dart
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as path;
import '../../core/constants/app_constants.dart';
import '../../core/errors/exceptions.dart';
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

## File: lib/data/repositories/config_repository.dart
```dart
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/interfaces/config_service.dart';
class ConfigRepository {
  final IConfigService _configService;
  ConfigRepository(this._configService);
  Future<AppConfig> getConfig() async {
    return await _configService.loadConfig();
  }
  Future<AppConfigStore> getConfigStore() async {
    return await _configService.loadConfigStore();
  }
  Future<List<ConfigProfile>> getProfiles() async {
    return await _configService.getProfiles();
  }
  Future<String> getActiveProfileId() async {
    return await _configService.getActiveProfileId();
  }
  Future<void> switchProfile(String profileId) async {
    await _configService.switchProfile(profileId);
  }
  Future<void> createProfile(String name) async {
    await _configService.createProfile(name);
  }
  Future<void> renameProfile(String profileId, String name) async {
    await _configService.renameProfile(profileId, name);
  }
  Future<void> deleteProfile(String profileId) async {
    await _configService.deleteProfile(profileId);
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
import '../../core/interfaces/file_service.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../../core/utils/id_generator.dart';
class ConversationRepository {
  final IFileService _fileService;
  final Map<String, Lock> _locks = {};
  ConversationRepository(this._fileService);
  Future<T> _runWithLock<T>(String fileName, Future<T> Function() action) {
    final lock = _locks.putIfAbsent(fileName, () => Lock());
    return lock.synchronized(action);
  }
  Set<String> _collectAttachmentPaths(Session session) {
    return session.rounds
        .expand((round) => round.userAttachments)
        .map((attachment) => attachment.relativePath)
        .toSet();
  }
  Future<Set<String>> _findRemovableAttachmentPaths({
    required String targetFileName,
    required Set<String> candidatePaths,
  }) async {
    if (candidatePaths.isEmpty) return <String>{};
    final allFileNames = await _fileService.getConversationFileList();
    final otherFileNames =
        allFileNames.where((name) => name != targetFileName).toList();
    final referencedByOthers = <String>{};
    for (final otherFileName in otherFileNames) {
      try {
        final otherSession = await _fileService.readSession(otherFileName);
        for (final round in otherSession.rounds) {
          for (final attachment in round.userAttachments) {
            if (candidatePaths.contains(attachment.relativePath)) {
              referencedByOthers.add(attachment.relativePath);
            }
          }
        }
      } catch (_) {
        // 忽略损坏/不可读会话
      }
    }
    return candidatePaths.difference(referencedByOthers);
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
  Future<void> saveSessionAndCleanupOrphanAttachments(
    String fileName,
    Session oldSession,
    Session newSession,
  ) async {
    return _runWithLock(fileName, () async {
      final oldPaths = _collectAttachmentPaths(oldSession);
      final newPaths = _collectAttachmentPaths(newSession);
      final removedPaths = oldPaths.difference(newPaths);
      final removablePaths = await _findRemovableAttachmentPaths(
        targetFileName: fileName,
        candidatePaths: removedPaths,
      );
      await _fileService.writeSession(fileName, newSession);
      for (final relativePath in removablePaths) {
        try {
          await _fileService.deleteAttachment(relativePath);
        } catch (_) {
          // 忽略单个附件删除失败，避免整个流程失败
        }
      }
    });
  }
  Future<void> deleteSession(String fileName) async {
    return _runWithLock(fileName, () async {
      Session? targetSession;
      try {
        targetSession = await _fileService.readSession(fileName);
      } catch (_) {
        targetSession = null;
      }
      if (targetSession != null) {
        final targetAttachmentPaths = _collectAttachmentPaths(targetSession);
        final removablePaths = await _findRemovableAttachmentPaths(
          targetFileName: fileName,
          candidatePaths: targetAttachmentPaths,
        );
        for (final relativePath in removablePaths) {
          try {
            await _fileService.deleteAttachment(relativePath);
          } catch (_) {
            // 忽略单个附件删除失败，避免整个会话删除失败
          }
        }
      }
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

## File: lib/data/services/config_service.dart
```dart
import '../../core/interfaces/config_service.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/interfaces/file_service.dart';
import '../../core/interfaces/api_service.dart';
import '../../core/utils/id_generator.dart';
class ConfigService implements IConfigService {
  final IFileService _fileService;
  final IApiService _apiService;
  AppConfigStore? _cachedStore;
  ConfigService(this._fileService, this._apiService);
  ConfigProfile _getActiveProfile(AppConfigStore store) {
    for (final profile in store.profiles) {
      if (profile.id == store.activeProfileId) {
        return profile;
      }
    }
    return store.profiles.first;
  }
  AppConfigStore _ensureNonEmptyStore(AppConfigStore store) {
    if (store.profiles.isNotEmpty) return store;
    return AppConfigStore.defaultStore();
  }
  @override
  Future<AppConfigStore> loadConfigStore() async {
    try {
      _cachedStore = await _fileService.readConfigStore();
      _cachedStore = _ensureNonEmptyStore(_cachedStore!);
    } catch (_) {
      _cachedStore = AppConfigStore.defaultStore();
      await _fileService.writeConfigStore(_cachedStore!);
    }
    return _cachedStore!;
  }
  @override
  Future<AppConfig> loadConfig() async {
    if (_cachedStore == null) {
      await loadConfigStore();
    }
    return _getActiveProfile(_cachedStore!).config;
  }
  @override
  Future<void> saveConfig(AppConfig config) async {
    if (_cachedStore == null) {
      await loadConfigStore();
    }
    final store = _cachedStore!;
    final updatedProfiles = store.profiles.map((profile) {
      if (profile.id == store.activeProfileId) {
        return profile.copyWith(config: config);
      }
      return profile;
    }).toList();
    _cachedStore = store.copyWith(profiles: updatedProfiles);
    await _fileService.writeConfigStore(_cachedStore!);
  }
  @override
  Future<void> refreshModels() async {
    if (_cachedStore == null) {
      await loadConfigStore();
    }
    final activeConfig = await loadConfig();
    final models = await _apiService.fetchModels(
      baseUrl: activeConfig.baseUrl,
      apiKey: activeConfig.apiKey,
      modelsPath: activeConfig.modelsPath,
    );
    final updatedConfig = activeConfig.copyWith(availableModels: models);
    await saveConfig(updatedConfig);
  }
  @override
  Future<List<ConfigProfile>> getProfiles() async {
    final store = await loadConfigStore();
    return store.profiles;
  }
  @override
  Future<String> getActiveProfileId() async {
    final store = await loadConfigStore();
    return store.activeProfileId;
  }
  @override
  Future<void> switchProfile(String profileId) async {
    final store = await loadConfigStore();
    final exists = store.profiles.any((p) => p.id == profileId);
    if (!exists) return;
    _cachedStore = store.copyWith(activeProfileId: profileId);
    await _fileService.writeConfigStore(_cachedStore!);
  }
  @override
  Future<void> createProfile(String name) async {
    final store = await loadConfigStore();
    final activeConfig = _getActiveProfile(store).config;
    final newId = IdGenerator.generate();
    final cleanName = name.trim().isEmpty ? '新配置' : name.trim();
    final newProfile = ConfigProfile(
      id: newId,
      name: cleanName,
      config: activeConfig,
    );
    _cachedStore = store.copyWith(
      activeProfileId: newId,
      profiles: [...store.profiles, newProfile],
    );
    await _fileService.writeConfigStore(_cachedStore!);
  }
  @override
  Future<void> renameProfile(String profileId, String name) async {
    final store = await loadConfigStore();
    final cleanName = name.trim();
    if (cleanName.isEmpty) return;
    final updatedProfiles = store.profiles.map((profile) {
      if (profile.id == profileId) {
        return profile.copyWith(name: cleanName);
      }
      return profile;
    }).toList();
    _cachedStore = store.copyWith(profiles: updatedProfiles);
    await _fileService.writeConfigStore(_cachedStore!);
  }
  @override
  Future<void> deleteProfile(String profileId) async {
    final store = await loadConfigStore();
    if (store.profiles.length <= 1) {
      return;
    }
    final updatedProfiles =
        store.profiles.where((p) => p.id != profileId).toList();
    if (updatedProfiles.isEmpty) return;
    final newActiveId = store.activeProfileId == profileId
        ? updatedProfiles.first.id
        : store.activeProfileId;
    _cachedStore = store.copyWith(
      activeProfileId: newActiveId,
      profiles: updatedProfiles,
    );
    await _fileService.writeConfigStore(_cachedStore!);
  }
}
```

## File: lib/data/services/file_service.dart
```dart
import 'dart:typed_data';
import '../../core/interfaces/file_service.dart';
import '../../core/models/session.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/json_utils.dart';
import '../data_sources/local_file_source.dart';
class FileService implements IFileService {
  final ILocalFileSource _fileSource;
  FileService(this._fileSource);
  @override
  Future<AppConfigStore> readConfigStore() async {
    final content = await _fileSource.readTextFile(AppConstants.fileConfig);
    final json = JsonUtils.decode(content);
    // 新格式：多配置存档
    if (json.containsKey('profiles')) {
      return AppConfigStore.fromJson(json);
    }
    // 兼容旧格式：单配置
    final oldConfig = AppConfig.fromJson(json);
    return AppConfigStore(
      activeProfileId: 'default',
      profiles: [
        ConfigProfile(
          id: 'default',
          name: '默认配置',
          config: oldConfig,
        ),
      ],
    );
  }
  @override
  Future<void> writeConfigStore(AppConfigStore store) async {
    final json = store.toJson();
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
  static ChatRound createEditedRetryRound({
    required ChatRound sourceRound,
    required String newContent,
    required List<Attachment> attachments,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return ChatRound(
      id: IdGenerator.generate(),
      parentId: sourceRound.parentId,
      createdAt: now,
      userContent: newContent,
      userAttachments: attachments,
      isIncomplete: true,
    );
  }
}
```

## File: lib/presentation/pages/settings_page.dart
```dart
import 'package:flutter/material.dart';
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
  List<Widget> _buildModelChips(ModelInfo model) {
    final widgets = <Widget>[];
    if (model.supportsVision == true) {
      widgets.add(
        const Chip(
          avatar: Icon(Icons.image_outlined, size: 16),
          label: Text('Vision'),
          visualDensity: VisualDensity.compact,
        ),
      );
    }
    if (model.supportsReasoning == true) {
      widgets.add(
        const Chip(
          avatar: Icon(Icons.psychology_alt_outlined, size: 16),
          label: Text('Reasoning'),
          visualDensity: VisualDensity.compact,
        ),
      );
    }
    return widgets;
  }
  Widget _buildSelectedModelSupportsCard() {
    final model = _selectedModelInfo();
    if (model == null) return const SizedBox.shrink();
    final chips = _buildModelChips(model);
    if (chips.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: chips,
        ),
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
      await ref.read(configProfilesProvider.notifier).load();
      await AppToast.show('设置已保存');
    } catch (e) {
      await AppToast.show('保存失败：$e');
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
        final mergedModels = (refreshed.availableModels ?? const []).map((model) {
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
      await ref.read(configProfilesProvider.notifier).load();
      await AppToast.show('模型列表已同步');
    } catch (e) {
      await AppToast.show('同步模型失败：$e');
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        const Text(
          '手动覆盖模型能力',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('支持 Vision'),
          subtitle: const Text('用于图片输入能力声明'),
          value: model.supportsVision == true,
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
          onChanged: (value) {
            _updateSelectedModelOverride(overrideReasoning: value);
          },
        ),
      ],
    );
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
          decoration: const InputDecoration(
            hintText: '输入配置名称',
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
            child: const Text('创建'),
          ),
        ],
      ),
    );
    if (result == null) return;
    await ref.read(configProfilesProvider.notifier).createProfile(result);
    _initialized = false;
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
          decoration: const InputDecoration(
            hintText: '输入配置名称',
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
    if (result == null || result.isEmpty) return;
    await ref
        .read(configProfilesProvider.notifier)
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
            content: Text('确定删除“${profile.name}”吗？'),
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
    await ref.read(configProfilesProvider.notifier).deleteProfile(profile.id);
    _initialized = false;
  }
  Future<void> _confirmRestoreDefaults() async {
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('恢复默认设置'),
            content: const Text(
              '确定要将当前配置存档恢复为默认设置吗？\n\n仅会影响当前选中的配置存档，不会影响其他配置存档。',
            ),
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
    await _restoreCurrentProfileDefaults();
  }
  Future<void> _restoreCurrentProfileDefaults() async {
    try {
      final defaultConfig = AppConfig.defaultConfig();
      await ref.read(configProvider.notifier).saveFullConfig(defaultConfig);
      await ref.read(configProfilesProvider.notifier).load();
      setState(() {
        _applyConfig(defaultConfig);
      });
    } catch (e) {
      await AppToast.show('恢复默认失败：$e');
    }
  }
  @override
  Widget build(BuildContext context) {
    final configState = ref.watch(configProvider);
    final profilesState = ref.watch(configProfilesProvider);
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
    return AppPageScaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: profilesState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('加载配置存档失败：$e'),
          ),
        ),
        data: (store) {
          final activeProfile = store.profiles.firstWhere(
            (p) => p.id == store.activeProfileId,
          );
          return configState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
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
              final models = _models;
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  AppSection(
                    title: '配置存档',
                    subtitle: '可保存多套 API 与模型配置，并快速切换。',
                    children: [
                      DropdownButtonFormField<String>(
                        value: store.activeProfileId,
                        decoration: const InputDecoration(
                          labelText: '当前配置存档',
                        ),
                        items: store.profiles.map((profile) {
                          return DropdownMenuItem(
                            value: profile.id,
                            child: Text(profile.name),
                          );
                        }).toList(),
                        onChanged: isBusy
                            ? null
                            : (value) async {
                                if (value == null) return;
                                await ref
                                    .read(configProfilesProvider.notifier)
                                    .switchProfile(value);
                                _initialized = false;
                              },
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          OutlinedButton(
                            onPressed: isBusy ? null : _showCreateProfileDialog,
                            child: const Text('新建'),
                          ),
                          OutlinedButton(
                            onPressed: isBusy
                                ? null
                                : () => _showRenameProfileDialog(activeProfile),
                            child: const Text('重命名'),
                          ),
                          OutlinedButton(
                            onPressed: isBusy
                                ? null
                                : () => _deleteProfile(
                                      activeProfile,
                                      store.profiles.length,
                                    ),
                            child: const Text('删除'),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                      const SizedBox(height: 12),
                      TextField(
                        controller: _apiKeyController,
                        enabled: !isBusy,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'API Key',
                          hintText: '输入 API Key',
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _modelsPathController,
                        enabled: !isBusy,
                        decoration: const InputDecoration(
                          labelText: 'Models Path',
                          hintText: _defaultModelsPath,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _chatPathController,
                        enabled: !isBusy,
                        decoration: InputDecoration(
                          labelText: 'Chat Path',
                          hintText: _defaultChatPathForApiMode(_apiMode),
                        ),
                      ),
                      const SizedBox(height: 12),
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
                                          _defaultChatPathForApiMode(
                                              'responses')) {
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
                                    decoration: const InputDecoration(
                                      labelText: '当前模型',
                                      suffixIcon: Icon(Icons.arrow_drop_down),
                                    ),
                                    child: Text(
                                      _getSelectedModelDisplayText(models),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              },
                              suggestionsBuilder: (context, controller) {
                                final query =
                                    controller.text.trim().toLowerCase();
                                final filteredModels = models.where((model) {
                                  final id = model.id.toLowerCase();
                                  final name =
                                      (model.name ?? '').toLowerCase();
                                  return query.isEmpty ||
                                      id.contains(query) ||
                                      name.contains(query);
                                }).toList();
                                if (filteredModels.isEmpty) {
                                  return const [
                                    ListTile(title: Text('没有匹配的模型')),
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
                                  final chips = _buildModelChips(model);
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
                                        if (chips.isNotEmpty) ...[
                                          const SizedBox(height: 6),
                                          Wrap(
                                            spacing: 6,
                                            runSpacing: 6,
                                            children: chips,
                                          ),
                                        ],
                                      ],
                                    ),
                                    trailing: isSelected
                                        ? const Icon(Icons.check)
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
                          const SizedBox(width: 12),
                          FilledButton(
                            onPressed: isBusy ? null : _refreshModels,
                            child: _isRefreshingModels
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('同步模型'),
                          ),
                        ],
                      ),
                      _buildSelectedModelSupportsCard(),
                      _buildManualCapabilityEditor(),
                    ],
                  ),
                  AppSection(
                    title: '操作',
                    subtitle: '保存或重置当前配置存档。',
                    children: [
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          OutlinedButton(
                            onPressed: isBusy ? null : _confirmRestoreDefaults,
                            child: const Text('恢复默认'),
                          ),
                          FilledButton(
                            onPressed: isBusy ? null : _saveSettings,
                            child: const Text('保存设置'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
```

## File: lib/presentation/providers/attachment_bytes_provider.dart
```dart
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';
final attachmentBytesProvider =
    FutureProvider.autoDispose.family<Uint8List, String>(
  (ref, relativePath) async {
    final repository = ref.read(conversationRepositoryProvider);
    return repository.getAttachment(relativePath);
  },
);
```

## File: lib/presentation/providers/config_notifier.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
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
class ConfigProfilesNotifier
    extends StateNotifier<AsyncValue<AppConfigStore>> {
  final Ref ref;
  ConfigProfilesNotifier(this.ref) : super(const AsyncValue.loading()) {
    load();
  }
  Future<void> load() async {
    try {
      final repository = ref.read(configRepositoryProvider);
      final store = await repository.getConfigStore();
      state = AsyncValue.data(store);
      final config = await repository.getConfig();
      ref.read(configProvider.notifier).state = AsyncValue.data(config);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<void> switchProfile(String profileId) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.switchProfile(profileId);
    await load();
  }
  Future<void> createProfile(String name) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.createProfile(name);
    await load();
  }
  Future<void> renameProfile(String profileId, String name) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.renameProfile(profileId, name);
    await load();
  }
  Future<void> deleteProfile(String profileId) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.deleteProfile(profileId);
    await load();
  }
}
final configProfilesProvider =
    StateNotifierProvider<ConfigProfilesNotifier, AsyncValue<AppConfigStore>>(
        (ref) {
  return ConfigProfilesNotifier(ref);
});
```

## File: lib/presentation/providers/global_streaming_provider.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../domain/states/chat_state.dart';
typedef SessionStreamMap = Map<String, StreamStatus>;
typedef GlobalStreamMap = Map<String, SessionStreamMap>;
class GlobalStreamCacheNotifier extends StateNotifier<GlobalStreamMap> {
  GlobalStreamCacheNotifier() : super(const {});
  StreamStatus? getRoundStream(String fileName, String roundId) {
    return state[fileName]?[roundId];
  }
  bool hasRoundStream(String fileName, String roundId) {
    return state[fileName]?.containsKey(roundId) ?? false;
  }
  void setRoundStream(
    String fileName,
    String roundId,
    StreamStatus status,
  ) {
    final sessionMap = Map<String, StreamStatus>.from(state[fileName] ?? {});
    sessionMap[roundId] = status;
    state = {
      ...state,
      fileName: sessionMap,
    };
  }
  void updateRoundStream(
    String fileName,
    String roundId, {
    String? content,
    String? reasoning,
    bool? isStreaming,
  }) {
    final sessionMap = Map<String, StreamStatus>.from(state[fileName] ?? {});
    final current = sessionMap[roundId] ?? const StreamStatus();
    sessionMap[roundId] = current.copyWith(
      content: content ?? current.content,
      reasoning: reasoning ?? current.reasoning,
      isStreaming: isStreaming ?? current.isStreaming,
    );
    state = {
      ...state,
      fileName: sessionMap,
    };
  }
  void ensureRoundLoaded(String fileName, ChatRound round) {
    if (hasRoundStream(fileName, round.id)) return;
    final sessionMap = Map<String, StreamStatus>.from(state[fileName] ?? {});
    sessionMap[round.id] = StreamStatus(
      content: round.assistantContent ?? '',
      reasoning: round.assistantThinking ?? '',
      isStreaming: false,
    );
    state = {
      ...state,
      fileName: sessionMap,
    };
  }
  void ensureRoundsLoaded(String fileName, List<ChatRound> rounds) {
    if (rounds.isEmpty) return;
    final sessionMap = Map<String, StreamStatus>.from(state[fileName] ?? {});
    var changed = false;
    for (final round in rounds) {
      if (sessionMap.containsKey(round.id)) continue;
      sessionMap[round.id] = StreamStatus(
        content: round.assistantContent ?? '',
        reasoning: round.assistantThinking ?? '',
        isStreaming: false,
      );
      changed = true;
    }
    if (!changed) return;
    state = {
      ...state,
      fileName: sessionMap,
    };
  }
  void clearNonStreamingForSession(String fileName) {
    final sessionMap = state[fileName];
    if (sessionMap == null) return;
    final retained = <String, StreamStatus>{};
    for (final entry in sessionMap.entries) {
      if (entry.value.isStreaming) {
        retained[entry.key] = entry.value;
      }
    }
    state = {
      ...state,
      fileName: retained,
    };
  }
  void clearSession(String fileName) {
    final next = Map<String, SessionStreamMap>.from(state);
    next.remove(fileName);
    state = next;
  }
}
final globalStreamCacheProvider =
    StateNotifierProvider<GlobalStreamCacheNotifier, GlobalStreamMap>((ref) {
  return GlobalStreamCacheNotifier();
});
final sessionStreamMapProvider =
    Provider.family<SessionStreamMap, String>((ref, fileName) {
  final globalMap = ref.watch(globalStreamCacheProvider);
  return globalMap[fileName] ?? const {};
});
final roundStreamProvider =
    Provider.family<StreamStatus?, ({String fileName, String roundId})>(
  (ref, args) {
    final sessionMap = ref.watch(sessionStreamMapProvider(args.fileName));
    return sessionMap[args.roundId];
  },
);
```

## File: lib/presentation/providers/input_draft_provider.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/pending_attachment.dart';
final globalInputDraftProvider = StateProvider<String>((ref) => '');
final globalAttachmentDraftProvider =
    StateProvider<List<PendingAttachment>>((ref) => []);
final globalEditSourceRoundIdProvider =
    StateProvider<String?>((ref) => null);
```

## File: lib/presentation/providers/session_list_notifier.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import '../../di/providers.dart';
class SessionListNotifier extends StateNotifier<AsyncValue<List<Session>>> {
  final Ref ref;
  SessionListNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadSessions(initial: true);
  }
  Future<void> _loadSessions({bool initial = false}) async {
    if (initial || !state.hasValue) {
      state = const AsyncValue.loading();
    }
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final sessions = await repository.getAllSessions();
      state = AsyncValue.data(sessions);
    } catch (e, st) {
      if (initial || !state.hasValue) {
        state = AsyncValue.error(e, st);
      }
    }
  }
  Future<void> refresh() async {
    await _loadSessions(initial: false);
  }
  Future<void> deleteSession(String fileName) async {
    try {
      final repository = ref.read(conversationRepositoryProvider);
      await repository.deleteSession(fileName);
      await _loadSessions(initial: false);
    } catch (e, st) {
      if (!state.hasValue) {
        state = AsyncValue.error(e, st);
      }
    }
  }
  Future<void> updateSessionTitle(String fileName, String newTitle) async {
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final cleanTitle = newTitle.trim();
      if (cleanTitle.isEmpty) return;
      await repository.updateSessionTitle(fileName, cleanTitle);
      await _loadSessions(initial: false);
    } catch (e, st) {
      if (!state.hasValue) {
        state = AsyncValue.error(e, st);
      }
    }
  }
  Future<String> createSession(String title) async {
    final repository = ref.read(conversationRepositoryProvider);
    final cleanTitle = title.trim().isEmpty ? '新对话' : title.trim();
    final session = await repository.createSessionWithGeneratedId(
      title: cleanTitle,
    );
    await _loadSessions(initial: false);
    return '${session.id}.json';
  }
}
final sessionListProvider =
    StateNotifierProvider<SessionListNotifier, AsyncValue<List<Session>>>((ref) {
  return SessionListNotifier(ref);
});
```

## File: lib/presentation/themes/app_tokens.dart
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

## File: lib/presentation/widgets/attachment_list.dart
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

## File: lib/presentation/widgets/common/app_page_scaffold.dart
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

## File: lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/utils/app_route_observer.dart';
import 'di/providers.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/themes/app_theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(initProvider.notifier).initialize();
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
      navigatorObservers: [appRouteObserver],
      home: const HomePage(),
    );
  }
}
```

## File: lib/presentation/pages/chat_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../core/utils/app_route_observer.dart';
import '../../core/utils/time_format_utils.dart';
import '../../domain/states/chat_state.dart';
import '../models/pending_attachment.dart';
import '../providers/chat_notifier.dart';
import '../providers/global_streaming_provider.dart';
import '../providers/input_draft_provider.dart';
import '../widgets/attachment_list.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/thought_bubble.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
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
class _ChatPageState extends ConsumerState<ChatPage> with RouteAware {
  late final PageController _pageController;
  late final ProviderSubscription<ChatState> _chatSubscription;
  bool _initialMessageHandled = false;
  bool _isMarkingSeen = false;
  bool _isRouteVisible = false;
  ModalRoute<dynamic>? _route;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _chatSubscription = ref.listenManual<ChatState>(
      chatProvider(widget.fileName),
      (previous, next) {
        final prevIndex = previous?.pageList?.currentPageIndex;
        final nextIndex = next.pageList?.currentPageIndex;
        if (next.pageList == null || next.pageList!.pages.isEmpty) return;
        if (!_pageController.hasClients) return;
        if (nextIndex == null) return;
        if (prevIndex == nextIndex) return;
        final currentPage =
            _pageController.page?.round() ?? _pageController.initialPage;
        if (currentPage == nextIndex) return;
        _pageController.jumpToPage(nextIndex);
      },
    );
    Future.microtask(() async {
      final notifier = ref.read(chatProvider(widget.fileName).notifier);
      await notifier.loadSession();
      final state = ref.read(chatProvider(widget.fileName));
      final initialIndex = state.pageList?.currentPageIndex;
      if (initialIndex != null && _pageController.hasClients) {
        _pageController.jumpToPage(initialIndex);
      }
      final currentRoundId = state.currentRoundId;
      if (currentRoundId != null) {
        await notifier.ensureRoundLoaded(currentRoundId);
      }
      final message = widget.initialMessage?.trim() ?? '';
      final attachments = widget.initialAttachments ?? const <PendingAttachment>[];
      final hasMessage = message.isNotEmpty;
      final hasAttachments = attachments.isNotEmpty;
      if (!_initialMessageHandled && (hasMessage || hasAttachments) && mounted) {
        _initialMessageHandled = true;
        await notifier.sendMessage(
          message,
          attachments: attachments,
        );
      }
    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null && route != _route) {
      if (_route != null) {
        appRouteObserver.unsubscribe(this);
      }
      _route = route;
      appRouteObserver.subscribe(this, route as PageRoute);
    }
  }
  @override
  void dispose() {
    if (_isInEditMode()) {
      _cancelEditMode();
    }
    _chatSubscription.close();
    appRouteObserver.unsubscribe(this);
    _pageController.dispose();
    super.dispose();
  }
  @override
  void didPush() {
    _isRouteVisible = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await _syncSeenWithVisiblePage();
    });
  }
  @override
  void didPopNext() {
    _isRouteVisible = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await _syncSeenWithVisiblePage();
    });
  }
  @override
  void didPushNext() {
    _isRouteVisible = false;
  }
  @override
  void didPop() {
    _isRouteVisible = false;
  }
  Future<void> _copyText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    await AppToast.show('已复制到剪贴板');
  }
  void _enterEditMode(String roundId, String text) {
    ref.read(globalInputDraftProvider.notifier).state = text;
    ref.read(globalEditSourceRoundIdProvider.notifier).state = roundId;
    FocusScope.of(context).unfocus();
  }
  void _cancelEditMode() {
    ref.read(globalEditSourceRoundIdProvider.notifier).state = null;
    ref.read(globalInputDraftProvider.notifier).state = '';
    ref.read(globalAttachmentDraftProvider.notifier).state = [];
  }
  bool _isInEditMode() {
    return ref.read(globalEditSourceRoundIdProvider) != null;
  }
  Future<void> _syncSeenWithVisiblePage() async {
    if (!_isRouteVisible) return;
    if (_isMarkingSeen) return;
    if (!_pageController.hasClients) return;
    final state = ref.read(chatProvider(widget.fileName));
    final pageList = state.pageList;
    if (pageList == null || pageList.pages.isEmpty) return;
    final page = _pageController.page;
    final index = (page?.round() ?? pageList.currentPageIndex)
        .clamp(0, pageList.pages.length - 1);
    final round = pageList.pages[index].round;
    if (!round.hasUnseenUpdate) return;
    _isMarkingSeen = true;
    try {
      await ref
          .read(chatProvider(widget.fileName).notifier)
          .markRoundSeen(round.id);
    } finally {
      _isMarkingSeen = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider(widget.fileName));
    final notifier = ref.read(chatProvider(widget.fileName).notifier);
    final editSourceRoundId = ref.watch(globalEditSourceRoundIdProvider);
    final isEditMode = editSourceRoundId != null;
    final hasPages = state.pageList != null && state.pageList!.pages.isNotEmpty;
    final textTheme = Theme.of(context).textTheme;
    final currentRoundId = state.currentRoundId;
    final currentStream = currentRoundId == null
        ? null
        : ref.watch(
            roundStreamProvider(
              (fileName: widget.fileName, roundId: currentRoundId),
            ),
          );
    final currentIsStreaming = currentStream?.isStreaming == true;
    return AppPageScaffold(
      appBar: AppBar(
        title: Text(
          state.session?.title ?? '对话',
          style: textTheme.titleMedium,
        ),
        actions: [
          if (state.session != null)
            IconButton(
              tooltip: isEditMode ? '编辑模式下不可切换页面' : '查看分支树',
              icon: const Icon(Icons.account_tree_outlined),
              onPressed: isEditMode
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BranchTreePage(
                            fileName: widget.fileName,
                            initialFocusRoundId: state.currentRoundId,
                          ),
                        ),
                      );
                    },
            ),
        ],
      ),
      body: Column(
        children: [
          if (state.pageList != null && state.pageList!.totalPages > 0)
            _PaginationBar(
              currentIndex: state.pageList!.currentPageIndex,
              totalPages: state.pageList!.totalPages,
              onPrev: isEditMode
                  ? null
                  : state.pageList!.currentPageIndex > 0
                      ? () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeOutCubic,
                          )
                      : null,
              onNext: isEditMode
                  ? null
                  : state.pageList!.currentPageIndex <
                          state.pageList!.totalPages - 1
                      ? () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeOutCubic,
                          )
                      : null,
              isEditMode: isEditMode,
            ),
          if (isEditMode)
            _EditModeBanner(
              onCancel: _cancelEditMode,
            ),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.session == null
                    ? _buildErrorState(state.error ?? '会话不存在')
                    : !hasPages
                        ? _buildWelcomeEmpty(context)
                        : PageView.builder(
                            controller: _pageController,
                            physics: isEditMode
                                ? const NeverScrollableScrollPhysics()
                                : const PageScrollPhysics(),
                            itemCount: state.pageList?.pages.length ?? 0,
                            onPageChanged: (index) async {
                              if (state.pageList == null) return;
                              if (index != state.pageList!.currentPageIndex) {
                                notifier.changePage(index);
                              }
                              final round =
                                  state.pageList!.pages[index].round;
                              await notifier.ensureRoundLoaded(round.id);
                              await _syncSeenWithVisiblePage();
                            },
                            itemBuilder: (context, index) {
                              final round = state.pageList!.pages[index].round;
                              final stream = ref.watch(
                                roundStreamProvider(
                                  (fileName: widget.fileName, roundId: round.id),
                                ),
                              );
                              final canEdit = stream?.isStreaming != true;
                              return _ChatRoundPage(
                                key: ValueKey(round.id),
                                fileName: widget.fileName,
                                round: round,
                                canEdit: canEdit,
                                onRetryReply: () =>
                                    notifier.retryFromRound(round.id),
                                onEdit: canEdit
                                    ? () => _enterEditMode(
                                          round.id,
                                          round.userContent,
                                        )
                                    : null,
                                onCopyText: _copyText,
                              );
                            },
                          ),
          ),
          InputBar(
            hintText: isEditMode ? '修改文本后发送（保留原附件）' : '发送消息',
            isStreaming: currentIsStreaming,
            onStop: notifier.stopGeneration,
            onSend: (text, attachments) async {
              if (editSourceRoundId != null) {
                await notifier.editAndResendFromRound(
                  editSourceRoundId,
                  text,
                  attachments: attachments,
                );
                _cancelEditMode();
                return;
              }
              await notifier.sendMessage(text, attachments: attachments);
            },
          ),
        ],
      ),
    );
  }
  Widget _buildErrorState(String message) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AppCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 40,
                color: colorScheme.error,
              ),
              const SizedBox(height: 12),
              Text(
                '无法加载会话',
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildWelcomeEmpty(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AppCard(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_awesome_outlined,
                size: 36,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 18),
              Text(
                '开始一段新的对话',
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                '你可以输入问题、上传图片或文件，并在不同分支中回看每一轮回复。',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _ChatRoundPage extends StatelessWidget {
  final String fileName;
  final ChatRound round;
  final bool canEdit;
  final VoidCallback onRetryReply;
  final VoidCallback? onEdit;
  final Future<void> Function(String text) onCopyText;
  const _ChatRoundPage({
    super.key,
    required this.fileName,
    required this.round,
    required this.canEdit,
    required this.onRetryReply,
    required this.onEdit,
    required this.onCopyText,
  });
  @override
  Widget build(BuildContext context) {
    final hasUser = round.userContent.trim().isNotEmpty;
    final hasAttachments = round.userAttachments.isNotEmpty;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      children: [
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RoundHeader(createdAt: round.createdAt),
              const SizedBox(height: 16),
              const _SectionLabel(
                icon: Icons.person_outline,
                text: '你的输入',
              ),
              const SizedBox(height: 10),
              if (hasUser)
                MessageBubble(
                  content: round.userContent,
                  isUser: true,
                  onCopy: () => onCopyText(round.userContent),
                  onRetryReply: onRetryReply,
                  onEdit: onEdit,
                ),
              if (hasAttachments) ...[
                if (hasUser) const SizedBox(height: 8),
                AttachmentList(
                  attachments: round.userAttachments,
                  rightAligned: true,
                ),
              ],
              _RoundAnswerSection(
                fileName: fileName,
                roundId: round.id,
                onRetryReply: onRetryReply,
                onCopyText: onCopyText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class _RoundAnswerSection extends ConsumerWidget {
  final String fileName;
  final String roundId;
  final VoidCallback onRetryReply;
  final Future<void> Function(String text) onCopyText;
  const _RoundAnswerSection({
    required this.fileName,
    required this.roundId,
    required this.onRetryReply,
    required this.onCopyText,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(
      roundStreamProvider((fileName: fileName, roundId: roundId)),
    );
    if (stream == null) {
      return const SizedBox.shrink();
    }
    final thinking = stream.reasoning;
    final assistantContent = stream.content;
    final hasThinking = thinking.trim().isNotEmpty;
    final hasAssistant = assistantContent.trim().isNotEmpty;
    final isStreaming = stream.isStreaming;
    if (!hasThinking && !hasAssistant && !isStreaming) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasThinking) ...[
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 16),
          const _SectionLabel(
            icon: Icons.psychology_alt_outlined,
            text: '推理过程',
          ),
          const SizedBox(height: 10),
          ThoughtBubble(content: thinking),
        ],
        if (hasAssistant || isStreaming) ...[
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 16),
          const _SectionLabel(
            icon: Icons.smart_toy_outlined,
            text: '回答',
          ),
          const SizedBox(height: 10),
          if (hasAssistant)
            MessageBubble(
              content: assistantContent,
              isUser: false,
              onCopy: () => onCopyText(assistantContent),
              onRetryReply: onRetryReply,
            )
          else
            const Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    SizedBox(width: 12),
                    Text('正在生成回答...'),
                  ],
                ),
              ),
            ),
        ],
      ],
    );
  }
}
class _EditModeBanner extends StatelessWidget {
  final VoidCallback onCancel;
  const _EditModeBanner({
    required this.onCancel,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      content: const Text('正在编辑重试，发送前不可切换页面，发送时将保留原附件'),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text('取消编辑'),
        ),
      ],
    );
  }
}
class _RoundHeader extends StatelessWidget {
  final int createdAt;
  const _RoundHeader({
    required this.createdAt,
  });
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(TimeFormatUtils.formatTimestamp(createdAt)),
      visualDensity: VisualDensity.compact,
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
        Icon(icon, size: 18),
        const SizedBox(width: 6),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
class _PaginationBar extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;
  final bool isEditMode;
  const _PaginationBar({
    required this.currentIndex,
    required this.totalPages,
    required this.onPrev,
    required this.onNext,
    required this.isEditMode,
  });
  @override
  Widget build(BuildContext context) {
    final progress = totalPages == 0
        ? 0.0
        : (currentIndex + 1).clamp(0, totalPages) / totalPages;
    final textTheme = Theme.of(context).textTheme;
    return Material(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Row(
          children: [
            IconButton(
              onPressed: onPrev,
              icon: const Icon(Icons.chevron_left_rounded),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isEditMode
                        ? '编辑中｜第 ${currentIndex + 1} 页 / 共 $totalPages 页'
                        : '第 ${currentIndex + 1} 页 / 共 $totalPages 页',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: progress),
                ],
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: onNext,
              icon: const Icon(Icons.chevron_right_rounded),
            ),
          ],
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

## File: lib/presentation/pages/home_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../core/models/session.dart';
import '../../core/utils/time_format_utils.dart';
import '../providers/global_streaming_provider.dart';
import '../providers/home_session_list_provider.dart';
import '../providers/session_list_notifier.dart';
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
        title: const Text('重命名会话'),
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
    final colorScheme = Theme.of(context).colorScheme;
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('删除会话'),
            content: Text('确定要删除 “${session.title}” 吗？\n此操作无法撤销。'),
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
      await notifier.deleteSession('${session.id}.json');
    }
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(homeSessionListProvider);
    final notifier = ref.read(sessionListProvider.notifier);
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
                  await notifier.refresh();
                },
              ),
              data: (items) {
                if (items.isEmpty) {
                  return const _HomeEmptyState();
                }
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _SessionCard(
                      item: item,
                      notifier: notifier,
                      onRename: (session) =>
                          _showRenameDialog(context, notifier, session),
                      onDelete: (session) =>
                          _showDeleteConfirmDialog(context, notifier, session),
                    );
                  },
                );
              },
            ),
          ),
          InputBar(
            hintText: '发送消息',
            onSend: (content, attachments) async {
              final newFileName = await notifier.createSession('新对话');
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
                if (context.mounted) {
                  await notifier.refresh();
                }
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
class _SessionCard extends ConsumerStatefulWidget {
  final HomeSessionItem item;
  final SessionListNotifier notifier;
  final Future<void> Function(Session session) onRename;
  final Future<void> Function(Session session) onDelete;
  const _SessionCard({
    required this.item,
    required this.notifier,
    required this.onRename,
    required this.onDelete,
  });
  @override
  ConsumerState<_SessionCard> createState() => _SessionCardState();
}
class _SessionCardState extends ConsumerState<_SessionCard> {
  bool _requested = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ensurePreviewLoaded();
  }
  @override
  void didUpdateWidget(covariant _SessionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item.previewRoundId != widget.item.previewRoundId ||
        oldWidget.item.session.id != widget.item.session.id) {
      _requested = false;
      _ensurePreviewLoaded();
    }
  }
  void _ensurePreviewLoaded() {
    final previewRoundId = widget.item.previewRoundId;
    if (_requested || previewRoundId == null) return;
    _requested = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final fileName = '${widget.item.session.id}.json';
      final previewRound = widget.item.session.rounds.firstWhere(
        (r) => r.id == previewRoundId,
        orElse: () => widget.item.session.rounds.last,
      );
      ref
          .read(globalStreamCacheProvider.notifier)
          .ensureRoundLoaded(fileName, previewRound);
    });
  }
  Widget _buildMetaChip(String label, {IconData? icon}) {
    return Chip(
      avatar: icon == null ? null : Icon(icon, size: 16),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }
  @override
  Widget build(BuildContext context) {
    final session = widget.item.session;
    final fileName = '${session.id}.json';
    final updatedAt = TimeFormatUtils.formatTimestamp(widget.item.updatedAt);
    final previewRoundId = widget.item.previewRoundId;
    final stream = previewRoundId == null
        ? null
        : ref.watch(
            roundStreamProvider((fileName: fileName, roundId: previewRoundId)),
          );
    final aiPreview = stream == null
        ? '加载中...'
        : stream.content.trim().isEmpty
            ? (stream.isStreaming ? '正在生成...' : '（等待回复）')
            : stream.content;
    final isStreaming = stream?.isStreaming == true;
    return Slidable(
      key: ValueKey(fileName),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.34,
        children: [
          CustomSlidableAction(
            onPressed: (_) => widget.onRename(session),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ),
          CustomSlidableAction(
            onPressed: (_) => widget.onDelete(session),
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
                builder: (_) => ChatPage(fileName: fileName),
              ),
            );
            if (context.mounted) {
              await widget.notifier.refresh();
            }
          },
          leading: const Icon(Icons.forum_outlined),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  session.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isStreaming) ...[
                const SizedBox(width: 8),
                _buildMetaChip('生成中', icon: Icons.bolt_outlined),
              ],
              if (widget.item.hasUnseen) ...[
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
                _PreviewLine(label: 'YOU', text: widget.item.userPreview),
                const SizedBox(height: 4),
                _PreviewLine(label: 'AI', text: aiPreview),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildMetaChip(
                      '${widget.item.roundCount} 轮',
                      icon: Icons.chat_bubble_outline,
                    ),
                    _buildMetaChip(updatedAt, icon: Icons.schedule_outlined),
                  ],
                ),
              ],
            ),
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),
      ),
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

## File: lib/presentation/providers/chat_notifier.dart
```dart
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/model_info.dart';
import '../../di/providers.dart';
import '../../domain/models/chat_page.dart';
import '../../domain/services/attachment_preparer.dart';
import '../../domain/services/branch_navigator.dart';
import '../../domain/services/chat_context_builder.dart';
import '../../domain/services/chat_round_factory.dart';
import '../../domain/services/chat_stream_accumulator.dart';
import '../../domain/services/chat_view_state_builder.dart';
import '../../domain/states/chat_state.dart';
import '../models/pending_attachment.dart';
import 'global_streaming_provider.dart';
import 'session_card_provider.dart';
import 'session_list_notifier.dart';
class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;
  final String fileName;
  final Set<String> _stoppingRoundIds = <String>{};
  ChatNotifier(this.ref, this.fileName) : super(ChatState.initial());
  GlobalStreamCacheNotifier get _streamCache =>
      ref.read(globalStreamCacheProvider.notifier);
  StreamStatus? _getRoundStream(String roundId) {
    final globalMap = ref.read(globalStreamCacheProvider);
    return globalMap[fileName]?[roundId];
  }
  Future<void> ensureRoundLoaded(String roundId) async {
    final session = state.session;
    if (session == null) return;
    final round = session.rounds.firstWhereOrNull((r) => r.id == roundId);
    if (round == null) return;
    _streamCache.ensureRoundLoaded(fileName, round);
  }
  Future<void> ensureRoundsLoaded(List<String> roundIds) async {
    final session = state.session;
    if (session == null || roundIds.isEmpty) return;
    final ids = roundIds.toSet();
    final rounds = session.rounds.where((r) => ids.contains(r.id)).toList();
    _streamCache.ensureRoundsLoaded(fileName, rounds);
  }
  Future<void> loadSession() async {
    state = state.copyWithLoading(true);
    try {
      final repository = ref.read(conversationRepositoryProvider);
      var session = await repository.getSession(fileName);
      if (session.hasUnseenUpdate) {
        final cleared = session.copyWith(hasUnseenUpdate: false);
        await repository.saveSession(fileName, cleared);
        session = cleared;
        await ref.read(sessionListProvider.notifier).refresh();
      }
      final viewState = ChatViewStateBuilder.buildInitial(session);
      state = state.copyWithSession(session).copyWith(
            currentRoundId: viewState.currentRoundId,
            pageList: viewState.pageList,
            error: null,
          );
      if (viewState.currentRoundId != null) {
        await ensureRoundLoaded(viewState.currentRoundId!);
      }
      ref.invalidate(sessionCardProvider(fileName));
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
  Future<void> markRoundSeen(String roundId) async {
    final session = state.session;
    if (session == null) return;
    final target = session.rounds.firstWhereOrNull((r) => r.id == roundId);
    if (target == null || !target.hasUnseenUpdate) return;
    final updatedRound = target.copyWith(hasUnseenUpdate: false);
    final updatedSession = session.copyWith(
      rounds: session.rounds.map((r) {
        if (r.id == roundId) return updatedRound;
        return r;
      }).toList(),
      hasUnseenUpdate:
          session.rounds.any((r) => r.id != roundId && r.hasUnseenUpdate),
    );
    final repository = ref.read(conversationRepositoryProvider);
    await repository.saveSession(fileName, updatedSession);
    final updatedPageList = _replaceRoundInPageList(
      state.pageList,
      updatedRound,
    );
    state = state.copyWith(
      session: updatedSession,
      pageList: updatedPageList,
    );
    ref.invalidate(sessionCardProvider(fileName));
    await ref.read(sessionListProvider.notifier).refresh();
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
  Future<void> editAndResendFromRound(
    String roundId,
    String newContent, {
    List<PendingAttachment>? attachments,
  }) async {
    if (state.session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final config = await ref.read(configRepositoryProvider).getConfig();
      final pendingAttachments = attachments ?? const <PendingAttachment>[];
      _validateRequestCapability(
        config: config,
        attachments: pendingAttachments,
      );
      final sourceRound =
          state.session!.rounds.firstWhereOrNull((round) => round.id == roundId);
      if (sourceRound == null) {
        state = state.copyWithError('未找到要编辑重试的对话');
        return;
      }
      final selectedModel = _findSelectedModelInfo(config);
      if (selectedModel != null) {
        final hasImage = sourceRound.userAttachments.any((a) => a.isImage) ||
            pendingAttachments.any((a) => a.isImage);
        if (hasImage && selectedModel.supportsVision != true) {
          state = state.copyWithError('当前模型未声明支持图片输入');
          return;
        }
      }
      final savedAttachments = await AttachmentPreparer.savePendingAttachments(
        repository,
        pendingAttachments,
      );
      final mergedAttachments = [
        ...sourceRound.userAttachments,
        ...savedAttachments,
      ];
      final newRound = ChatRoundFactory.createEditedRetryRound(
        sourceRound: sourceRound,
        newContent: newContent,
        attachments: mergedAttachments,
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
    state = state.copyWithSession(updatedSession).copyWith(
          currentRoundId: viewState.currentRoundId,
          pageList: viewState.pageList,
          error: null,
        );
    _streamCache.setRoundStream(
      fileName,
      round.id,
      const StreamStatus(
        content: '',
        reasoning: '',
        isStreaming: true,
      ),
    );
    ref.invalidate(sessionCardProvider(fileName));
    await ref.read(sessionListProvider.notifier).refresh();
  }
  String _appendStoppedSuffix(String content) {
    final trimmed = content.trim();
    if (trimmed.isEmpty) return '[已停止]';
    return '$trimmed\n\n[已停止]';
  }
  String _appendErrorSuffix(String content, String? message) {
    final trimmed = content.trim();
    final cleanMessage = (message ?? '').trim();
    final errorText = cleanMessage.isEmpty ? '[错误]' : '[错误]\n$cleanMessage';
    if (trimmed.isEmpty) return errorText;
    return '$trimmed\n\n$errorText';
  }
  Future<void> _handleStreamTask(
    ChatRound round,
    List<ApiMessage> apiContext,
    AppConfig config,
  ) async {
    final apiService = ref.read(apiServiceProvider);
    final accumulator = ChatStreamAccumulator();
    var hasError = false;
    String? errorMessage;
    var wasStopped = false;
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
          hasError = true;
          errorMessage = chunk.error;
          break;
        }
        if (!chunk.isDone) {
          accumulator.add(chunk);
          _streamCache.updateRoundStream(
            fileName,
            round.id,
            content: accumulator.content,
            reasoning: accumulator.reasoning,
            isStreaming: true,
          );
          continue;
        }
        if (_stoppingRoundIds.contains(round.id)) {
          wasStopped = true;
        }
        break;
      }
    } catch (e) {
      if (_stoppingRoundIds.contains(round.id)) {
        wasStopped = true;
      } else {
        hasError = true;
        errorMessage = e.toString();
      }
    } finally {
      var finalContent = accumulator.content;
      final finalReasoning = accumulator.reasoning;
      if (hasError) {
        finalContent = _appendErrorSuffix(finalContent, errorMessage);
      } else if (wasStopped) {
        finalContent = _appendStoppedSuffix(finalContent);
      }
      _streamCache.updateRoundStream(
        fileName,
        round.id,
        content: finalContent,
        reasoning: finalReasoning,
        isStreaming: true,
      );
      await _finalizeRoundPersistence(round.id);
      _stoppingRoundIds.remove(round.id);
    }
  }
  Future<void> _finalizeRoundPersistence(String roundId) async {
    final repository = ref.read(conversationRepositoryProvider);
    final session = state.session;
    if (session == null) return;
    final stream = _getRoundStream(roundId);
    if (stream == null) return;
    final updatedRounds = session.rounds.map((round) {
      if (round.id != roundId) return round;
      return round.copyWith(
        assistantContent: stream.content.trim().isEmpty ? null : stream.content,
        assistantThinking:
            stream.reasoning.trim().isEmpty ? null : stream.reasoning,
        isIncomplete: false,
        hasUnseenUpdate: true,
      );
    }).toList();
    final updatedRound = updatedRounds.firstWhere((r) => r.id == roundId);
    final updatedSession = session.copyWith(
      rounds: updatedRounds,
      hasUnseenUpdate: true,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
    await repository.saveSession(fileName, updatedSession);
    state = state.copyWith(
      session: updatedSession,
      pageList: _replaceRoundInCurrentPages(updatedRound),
      error: null,
    );
    _streamCache.updateRoundStream(
      fileName,
      roundId,
      isStreaming: false,
    );
    ref.invalidate(sessionCardProvider(fileName));
    await ref.read(sessionListProvider.notifier).refresh();
  }
  ChatPageList? _replaceRoundInCurrentPages(ChatRound updatedRound) {
    final currentPageList = state.pageList;
    if (currentPageList == null) return null;
    return _replaceRoundInPageList(currentPageList, updatedRound);
  }
  ChatPageList? _replaceRoundInPageList(
    ChatPageList? pageList,
    ChatRound updatedRound,
  ) {
    if (pageList == null) return null;
    final updatedPages = pageList.pages.map((page) {
      if (page.round.id == updatedRound.id) {
        return page.copyWith(round: updatedRound);
      }
      return page;
    }).toList();
    return pageList.copyWith(pages: updatedPages);
  }
  void stopGeneration() {
    if (state.pageList == null || state.pageList!.pages.isEmpty) return;
    final viewingRound =
        state.pageList!.pages[state.pageList!.currentPageIndex].round;
    final stream = _getRoundStream(viewingRound.id);
    if (stream?.isStreaming != true) return;
    _stoppingRoundIds.add(viewingRound.id);
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
    await ensureRoundLoaded(newRoundId);
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
    ensureRoundLoaded(newRoundId);
  }
}
final chatProvider =
    StateNotifierProvider.family<ChatNotifier, ChatState, String>(
  (ref, fileName) {
    return ChatNotifier(ref, fileName);
  },
);
```

## File: lib/presentation/pages/branch_tree_page.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphview/GraphView.dart';
import '../../core/models/chat_round.dart';
import '../../core/utils/time_format_utils.dart';
import '../../di/providers.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
class BranchTreePage extends ConsumerStatefulWidget {
  final String fileName;
  final String? initialFocusRoundId;
  const BranchTreePage({
    super.key,
    required this.fileName,
    this.initialFocusRoundId,
  });
  @override
  ConsumerState<BranchTreePage> createState() => _BranchTreePageState();
}
class _BranchTreePageState extends ConsumerState<BranchTreePage> {
  final GlobalKey _viewerKey = GlobalKey();
  final TransformationController _transformationController =
      TransformationController();
  final BuchheimWalkerConfiguration _builder =
      BuchheimWalkerConfiguration();
  List<TreeNode> _roots = [];
  String _lastSignature = '';
  GlobalKey? _targetNodeKey;
  bool _hasFocused = false;
  int _focusRetryCount = 0;
  @override
  void initState() {
    super.initState();
    _builder
      ..siblingSeparation = 40
      ..levelSeparation = 78
      ..subtreeSeparation = 50
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
    if (widget.initialFocusRoundId != null) {
      _targetNodeKey = GlobalKey();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await ref.read(chatProvider(widget.fileName).notifier).loadSession();
    });
  }
  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }
  void _resetViewport() {
    _transformationController.value = Matrix4.identity();
    _hasFocused = false;
    _focusRetryCount = 0;
    _scheduleFocusToTarget();
  }
  bool _treeContainsNodeId(List<TreeNode> roots, String nodeId) {
    return _findTreeNodeById(roots, nodeId) != null;
  }
  void _reloadTree(
    List<ChatRound> rounds, {
    bool resetViewport = false,
  }) {
    final roots = rounds.isEmpty ? <TreeNode>[] : TreeBuilder.buildTree(rounds);
    final signature = _buildSignature(roots);
    if (!resetViewport && signature == _lastSignature) {
      return;
    }
    if (resetViewport) {
      _transformationController.value = Matrix4.identity();
      _hasFocused = false;
      _focusRetryCount = 0;
      if (widget.initialFocusRoundId != null &&
          _treeContainsNodeId(roots, widget.initialFocusRoundId!)) {
        _targetNodeKey = GlobalKey();
      } else {
        _targetNodeKey = null;
        _hasFocused = true;
      }
    }
    setState(() {
      _roots = roots;
      _lastSignature = signature;
    });
    _scheduleFocusToTarget();
  }
  void _scheduleFocusToTarget() {
    if (_hasFocused ||
        widget.initialFocusRoundId == null ||
        _targetNodeKey == null) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focusOnTargetNode();
    });
  }
  void _focusOnTargetNode() {
    if (_hasFocused) return;
    if (_targetNodeKey == null) return;
    final targetContext = _targetNodeKey!.currentContext;
    final viewerContext = _viewerKey.currentContext;
    if (targetContext == null || viewerContext == null) {
      _retryFocus();
      return;
    }
    final targetBox = targetContext.findRenderObject() as RenderBox?;
    final viewerBox = viewerContext.findRenderObject() as RenderBox?;
    if (targetBox == null || viewerBox == null) {
      _retryFocus();
      return;
    }
    if (!targetBox.hasSize || !viewerBox.hasSize) {
      _retryFocus();
      return;
    }
    final targetTopLeft = targetBox.localToGlobal(
      Offset.zero,
      ancestor: viewerBox,
    );
    final targetSize = targetBox.size;
    final viewerSize = viewerBox.size;
    final targetCenter = Offset(
      targetTopLeft.dx + targetSize.width / 2,
      targetTopLeft.dy + targetSize.height / 2,
    );
    final viewerCenter = Offset(
      viewerSize.width / 2,
      viewerSize.height / 2,
    );
    final dx = viewerCenter.dx - targetCenter.dx;
    final dy = viewerCenter.dy - targetCenter.dy;
    _transformationController.value = Matrix4.identity()
      ..translate(dx, dy)
      ..scale(1.0);
    _hasFocused = true;
  }
  void _retryFocus() {
    if (_hasFocused) return;
    if (_focusRetryCount >= 8) return;
    _focusRetryCount++;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focusOnTargetNode();
    });
  }
  String _buildSignature(List<TreeNode> roots) {
    dynamic toJsonNode(TreeNode node) {
      return {
        'id': node.id,
        'parentId': node.parentId,
        'assistantContent': node.round.assistantContent,
        'assistantThinking': node.round.assistantThinking,
        'isIncomplete': node.round.isIncomplete,
        'hasUnseenUpdate': node.round.hasUnseenUpdate,
        'children': node.children.map(toJsonNode).toList(),
      };
    }
    return roots.map((e) => toJsonNode(e).toString()).join('|');
  }
  String _buildNodeSignature(TreeNode node) {
    dynamic toJsonNode(TreeNode n) {
      return {
        'id': n.id,
        'parentId': n.parentId,
        'assistantContent': n.round.assistantContent,
        'assistantThinking': n.round.assistantThinking,
        'isIncomplete': n.round.isIncomplete,
        'hasUnseenUpdate': n.round.hasUnseenUpdate,
        'children': n.children.map(toJsonNode).toList(),
      };
    }
    return toJsonNode(node).toString();
  }
  Set<String> _collectSubtreeIds(TreeNode node) {
    final ids = <String>{node.id};
    for (final child in node.children) {
      ids.addAll(_collectSubtreeIds(child));
    }
    return ids;
  }
  TreeNode? _findTreeNodeById(List<TreeNode> roots, String nodeId) {
    for (final root in roots) {
      final result = _findTreeNodeByIdRecursive(root, nodeId);
      if (result != null) return result;
    }
    return null;
  }
  TreeNode? _findTreeNodeByIdRecursive(TreeNode node, String nodeId) {
    if (node.id == nodeId) return node;
    for (final child in node.children) {
      final result = _findTreeNodeByIdRecursive(child, nodeId);
      if (result != null) return result;
    }
    return null;
  }
  Future<void> _deleteNode(String nodeId) async {
    final repository = ref.read(conversationRepositoryProvider);
    final chatState = ref.read(chatProvider(widget.fileName));
    final session = chatState.session;
    if (session == null) {
      throw Exception('会话未加载');
    }
    final roots = session.rounds.isEmpty
        ? <TreeNode>[]
        : TreeBuilder.buildTree(session.rounds);
    final targetNode = _findTreeNodeById(roots, nodeId);
    if (targetNode == null) {
      throw Exception('未找到要删除的节点');
    }
    final idsToDelete = _collectSubtreeIds(targetNode);
    final updatedRounds = session.rounds
        .where((round) => !idsToDelete.contains(round.id))
        .toList();
    final updatedSession = session.copyWith(
      rounds: updatedRounds,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
    await repository.saveSessionAndCleanupOrphanAttachments(
      widget.fileName,
      session,
      updatedSession,
    );
    if (widget.initialFocusRoundId != null &&
        idsToDelete.contains(widget.initialFocusRoundId)) {
      _targetNodeKey = null;
      _hasFocused = true;
    }
    await ref.read(chatProvider(widget.fileName).notifier).loadSession();
  }
  Future<bool> _confirmDelete(TreeNode node) async {
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('删除节点'),
            content: const Text('确定删除这一轮及其后续全部分支吗？'),
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
  }
  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider(widget.fileName));
    if (chatState.isLoading && chatState.session == null) {
      return AppPageScaffold(
        appBar: AppBar(
          title: const Text('分支树'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (chatState.session == null) {
      return AppPageScaffold(
        appBar: AppBar(
          title: const Text('分支树'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(chatState.error ?? '会话不存在'),
          ),
        ),
      );
    }
    final session = chatState.session!;
    final latestRoots = session.rounds.isEmpty
        ? <TreeNode>[]
        : TreeBuilder.buildTree(session.rounds);
    final latestSignature = _buildSignature(latestRoots);
    if (latestSignature != _lastSignature) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (widget.initialFocusRoundId != null &&
            !_treeContainsNodeId(latestRoots, widget.initialFocusRoundId!)) {
          _targetNodeKey = null;
          _hasFocused = true;
        }
        _reloadTree(session.rounds);
      });
    }
    final chatNotifier = ref.read(chatProvider(widget.fileName).notifier);
    return AppPageScaffold(
      appBar: AppBar(
        title: Text(
          session.title,
          overflow: TextOverflow.ellipsis,
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
                  onReset: _resetViewport,
                ),
                Expanded(
                  child: InteractiveViewer(
                    key: _viewerKey,
                    constrained: false,
                    boundaryMargin: const EdgeInsets.all(double.infinity),
                    minScale: 0.1,
                    maxScale: 3.0,
                    transformationController: _transformationController,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Wrap(
                        spacing: 40,
                        runSpacing: 40,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          for (final root in _roots)
                            _RootTreeGroup(
                              key: ValueKey(
                                'root-tree-${root.id}-${_buildNodeSignature(root)}',
                              ),
                              root: root,
                              graphSignature: _buildNodeSignature(root),
                              builderConfig: _builder,
                              targetNodeId: widget.initialFocusRoundId,
                              targetNodeKey: _targetNodeKey,
                              onSwitch: (treeNode) async {
                                await chatNotifier.switchBranch(treeNode.id);
                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              },
                              onDelete: (treeNode) async {
                                final confirmed =
                                    await _confirmDelete(treeNode);
                                if (!confirmed) return;
                                try {
                                  await _deleteNode(treeNode.id);
                                } catch (e) {
                                  await AppToast.show('删除失败：$e');
                                }
                              },
                            ),
                        ],
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
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.account_tree_outlined, size: 40),
                SizedBox(height: 16),
                Text(
                  '暂无分支结构',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                Text(
                  '当你对历史轮次重新生成回复时，这里会显示完整的分支关系。',
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
class _RootTreeGroup extends StatelessWidget {
  final TreeNode root;
  final String graphSignature;
  final BuchheimWalkerConfiguration builderConfig;
  final Future<void> Function(TreeNode treeNode) onSwitch;
  final Future<void> Function(TreeNode treeNode) onDelete;
  final String? targetNodeId;
  final GlobalKey? targetNodeKey;
  const _RootTreeGroup({
    super.key,
    required this.root,
    required this.graphSignature,
    required this.builderConfig,
    required this.onSwitch,
    required this.onDelete,
    this.targetNodeId,
    this.targetNodeKey,
  });
  @override
  Widget build(BuildContext context) {
    final graph = Graph()..isTree = true;
    final nodeMap = <String, Node>{};
    final graphNodeToTreeNodeMap = <Node, TreeNode>{};
    void addTree(TreeNode treeNode, TreeNode? parent) {
      final currentNode = Node.Id('${root.id}-${treeNode.id}-$graphSignature');
      nodeMap[treeNode.id] = currentNode;
      graphNodeToTreeNodeMap[currentNode] = treeNode;
      graph.addNode(currentNode);
      if (parent != null) {
        final parentNode = nodeMap[parent.id];
        if (parentNode != null) {
          graph.addEdge(parentNode, currentNode);
        }
      }
      for (final child in treeNode.children) {
        addTree(child, treeNode);
      }
    }
    addTree(root, null);
    return GraphView(
      key: ValueKey('graph-${root.id}-$graphSignature'),
      graph: graph,
      animated: false,
      algorithm: BuchheimWalkerAlgorithm(
        builderConfig,
        TreeEdgeRenderer(builderConfig),
      ),
      paint: Paint()
        ..color = Theme.of(context).dividerColor
        ..strokeWidth = 1.6
        ..style = PaintingStyle.stroke,
      builder: (Node node) {
        final treeNode = graphNodeToTreeNodeMap[node];
        if (treeNode == null) return const SizedBox.shrink();
        final isTarget = targetNodeId != null && treeNode.id == targetNodeId;
        return _GraphNodeCard(
          key: isTarget
              ? targetNodeKey
              : ValueKey('${treeNode.id}-$graphSignature'),
          treeNode: treeNode,
          onSwitch: () => onSwitch(treeNode),
          onDelete: () => onDelete(treeNode),
        );
      },
    );
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
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            const Icon(Icons.tune_outlined, size: 18),
            const SizedBox(width: 8),
            const Expanded(
              child: Text('缩放、拖拽查看对话分支结构'),
            ),
            IconButton(
              tooltip: '缩小',
              onPressed: onZoomOut,
              icon: const Icon(Icons.remove_rounded),
            ),
            IconButton(
              tooltip: '放大',
              onPressed: onZoomIn,
              icon: const Icon(Icons.add_rounded),
            ),
            TextButton.icon(
              onPressed: onReset,
              icon: const Icon(Icons.center_focus_strong_outlined, size: 18),
              label: const Text('重置'),
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
  Widget _buildChip(String label, {IconData? icon}) {
    return Chip(
      avatar: icon == null ? null : Icon(icon, size: 16),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }
  @override
  Widget build(BuildContext context) {
    final isIncomplete = treeNode.round.isIncomplete;
    final hasUnseenUpdate = treeNode.round.hasUnseenUpdate;
    final aiContent = (treeNode.round.assistantContent ?? '').trim().isEmpty
        ? '（等待回复）'
        : treeNode.round.assistantContent!;
    return Card(
      child: SizedBox(
        width: 290,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildChip(
                    '深度 ${treeNode.depth + 1}',
                    icon: Icons.layers_outlined,
                  ),
                  if (isIncomplete)
                    _buildChip(
                      '未完成',
                      icon: Icons.hourglass_empty_outlined,
                    ),
                  if (hasUnseenUpdate)
                    _buildChip(
                      '未查看',
                      icon: Icons.mark_chat_unread_outlined,
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                TimeFormatUtils.formatTimestamp(treeNode.round.createdAt),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              _PreviewBlock(
                label: 'YOU',
                content: treeNode.round.userContent.trim().isEmpty
                    ? '（空输入）'
                    : treeNode.round.userContent,
              ),
              const SizedBox(height: 8),
              _PreviewBlock(
                label: 'AI',
                content: aiContent,
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: onSwitch,
                      child: const Text('切换到此分支'),
                    ),
                  ),
                  IconButton(
                    tooltip: '删除',
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline),
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
class _PreviewBlock extends StatelessWidget {
  final String label;
  final String content;
  const _PreviewBlock({
    required this.label,
    required this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$label  ',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Expanded(
              child: Text(
                content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
