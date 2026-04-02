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
lib/data/database/database.dart
lib/data/database/database.g.dart
lib/data/repositories/config_repository.dart
lib/data/repositories/conversation_repository.dart
lib/data/services/config_service.dart
lib/data/services/file_service.dart
lib/di/providers.dart
lib/domain/models/chat_page.dart
lib/domain/models/chat_page.freezed.dart
lib/domain/models/tree_node.dart
lib/domain/models/tree_node.freezed.dart
lib/domain/models/tree_node.g.dart
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
lib/presentation/utils/page_utils.dart
lib/presentation/widgets/attachment_list.dart
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

## File: lib/data/database/database.dart
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

## File: lib/data/database/database.g.dart
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

## File: lib/domain/models/tree_node.g.dart
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
      round: ChatRound.fromJson(json['round'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>)
          .map((e) => TreeNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      depth: (json['depth'] as num).toInt(),
      preview: json['preview'] as String?,
    );
Map<String, dynamic> _$$TreeNodeImplToJson(_$TreeNodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'round': instance.round,
      'children': instance.children,
      'depth': instance.depth,
      'preview': instance.preview,
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

## File: lib/presentation/utils/page_utils.dart
```dart
/// 页码工具类 - 统一处理索引转换逻辑
/// 
/// 遵循 Flutter 规范：
/// - 内部逻辑使用 0-based 索引
/// - UI 展示使用 1-based 页码
abstract class PageUtils {
  /// 将 0-based 索引转换为 UI 展示的 1-based 页码
  static int toDisplayPage(int zeroBasedIndex) => zeroBasedIndex + 1;
  /// 将 UI 页码转换为 0-based 索引
  static int toInternalIndex(int displayPage) => displayPage - 1;
  /// 格式化页码显示："X / Y"
  static String formatSimple(int currentPageIndex, int totalPages) {
    if (totalPages == 0) return '0 / 0';
    return '${toDisplayPage(currentPageIndex)} / $totalPages';
  }
  /// 格式化页码显示："第 X 页 / 共 Y 页"
  static String format(int currentPageIndex, int totalPages) {
    if (totalPages == 0) return '第 0 页 / 共 0 页';
    return '第 ${toDisplayPage(currentPageIndex)} 页 / 共 $totalPages 页';
  }
  /// 计算进度条进度 (0.0 - 1.0)
  static double calculateProgress(int currentPageIndex, int totalPages) {
    if (totalPages == 0) return 0.0;
    return toDisplayPage(currentPageIndex).clamp(1, totalPages) / totalPages;
  }
  /// 验证页索引是否有效
  static bool isValidIndex(int index, int totalPages) {
    return index >= 0 && index < totalPages;
  }
  /// 安全获取页索引（越界时返回边界值）
  static int clampIndex(int index, int totalPages) {
    if (totalPages == 0) return 0;
    return index.clamp(0, totalPages - 1);
  }
}
```

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
}
```

## File: lib/core/interfaces/config_service.dart
```dart
// core/interfaces/config_service.dart
import '../models/app_config.dart';
import '../models/app_config_store.dart';
abstract class IConfigService {
  // 现有的同步方法
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
  // ========== 新增：watch 方法 ==========
  /// 监听配置Store的变更
  Stream<AppConfigStore> watchConfigStore();
  /// 监听当前配置
  Stream<AppConfig> watchConfig();
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
// data/repositories/config_repository.dart
import 'dart:async';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/interfaces/config_service.dart';
class ConfigRepository {
  final IConfigService _configService;
  ConfigRepository(this._configService);
  /// 监听配置Store的变更 - 使用真正的数据库流
  Stream<AppConfigStore> watchConfigStore() {
    return _configService.watchConfigStore();
  }
  /// 监听当前激活的配置
  Stream<AppConfig> watchConfig() {
    return _configService.watchConfig();
  }
  // ========== 以下保留原有的同步方法 ==========
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

## File: lib/di/providers.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../data/data_sources/local_file_source.dart';
import '../data/data_sources/remote_api_source.dart';
import '../data/database/database.dart';
import '../data/services/file_service.dart';
import '../data/services/config_service.dart';
import '../data/repositories/conversation_repository.dart';
import '../data/repositories/config_repository.dart';
import '../core/interfaces/file_service.dart';
import '../core/interfaces/config_service.dart';
enum InitStatus { idle, loading, success, error }
class InitState {
  final InitStatus status;
  final String? errorMessage;
  final AppDatabase? appDatabase;
  final ILocalFileSource? fileSource;
  final IFileService? fileService;
  final IRemoteApiSource? remoteApiSource;
  final IConfigService? configService;
  final ConversationRepository? conversationRepository;
  final ConfigRepository? configRepository;
  InitState({
    this.status = InitStatus.idle,
    this.errorMessage,
    this.appDatabase,
    this.fileSource,
    this.fileService,
    this.remoteApiSource,
    this.configService,
    this.conversationRepository,
    this.configRepository,
  });
  InitState copyWith({
    InitStatus? status,
    String? errorMessage,
    AppDatabase? appDatabase,
    ILocalFileSource? fileSource,
    IFileService? fileService,
    IRemoteApiSource? remoteApiSource,
    IConfigService? configService,
    ConversationRepository? conversationRepository,
    ConfigRepository? configRepository,
  }) {
    return InitState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      appDatabase: appDatabase ?? this.appDatabase,
      fileSource: fileSource ?? this.fileSource,
      fileService: fileService ?? this.fileService,
      remoteApiSource: remoteApiSource ?? this.remoteApiSource,
      configService: configService ?? this.configService,
      conversationRepository: conversationRepository ?? this.conversationRepository,
      configRepository: configRepository ?? this.configRepository,
    );
  }
}
class InitNotifier extends StateNotifier<InitState> {
  InitNotifier() : super(InitState());
  Future<void> initialize() async {
    state = state.copyWith(status: InitStatus.loading);
    try {
      // 1. 初始化文件目录
      final appDir = await getApplicationDocumentsDirectory();
      final basePath = appDir.path;
      final fileSource = LocalFileSource(basePath);
      await fileSource.initDirectories();
      // 2. 初始化数据库
      final appDatabase = AppDatabase();
      // 3. 构建服务与 Repositories
      final fileService = FileService(fileSource);
      final remoteApiSource = RemoteApiSource();
      final configService = ConfigService(appDatabase, remoteApiSource);
      final conversationRepository = ConversationRepository(appDatabase, fileService);
      final configRepository = ConfigRepository(configService);
      state = state.copyWith(
        status: InitStatus.success,
        appDatabase: appDatabase,
        fileSource: fileSource,
        fileService: fileService,
        remoteApiSource: remoteApiSource,
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
final initProvider = StateNotifierProvider<InitNotifier, InitState>((ref) => InitNotifier());
final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.conversationRepository == null) throw StateError('应用未初始化');
  return initState.conversationRepository!;
});
final configRepositoryProvider = Provider<ConfigRepository>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.configRepository == null) throw StateError('应用未初始化');
  return initState.configRepository!;
});
final remoteApiSourceProvider = Provider<IRemoteApiSource>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.remoteApiSource == null) throw StateError('应用未初始化');
  return initState.remoteApiSource!;
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
    // ✅ 移除 pageIndex - 索引由列表位置决定
    required ChatRound round,
  }) = _ChatPage;
}
@freezed
class ChatPageList with _$ChatPageList {
  const factory ChatPageList({
    required List<ChatPage> pages,
    required int currentPageIndex,  // ✅ UI 状态的单一事实来源 (0-based)
    required int totalPages,
  }) = _ChatPageList;
  factory ChatPageList.fromPages(List<ChatPage> pages, int currentIndex) {
    return ChatPageList(
      pages: pages,
      currentPageIndex: pages.isEmpty ? 0 : currentIndex.clamp(0, pages.length - 1),
      totalPages: pages.length,
    );
  }
}
// ✅ 将 getter 移到 extension 中（Freezed 要求）
extension ChatPageListX on ChatPageList {
  /// 通过 roundId 查找页索引
  int? findPageIndexByRoundId(String roundId) {
    return pages.indexWhere((page) => page.round.id == roundId);
  }
  /// 获取当前页
  ChatPage? get currentPage {
    if (pages.isEmpty || currentPageIndex < 0 || currentPageIndex >= pages.length) {
      return null;
    }
    return pages[currentPageIndex];
  }
  /// 获取上一页索引
  int? get prevPageIndex {
    if (currentPageIndex <= 0) return null;
    return currentPageIndex - 1;
  }
  /// 获取下一页索引
  int? get nextPageIndex {
    if (currentPageIndex >= pages.length - 1) return null;
    return currentPageIndex + 1;
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
  // ✅ 移除 pageIndex - 索引由列表位置决定
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
  $Res call({ChatRound round});
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
  $Res call({Object? round = null}) {
    return _then(
      _value.copyWith(
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
  $Res call({ChatRound round});
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
  $Res call({Object? round = null}) {
    return _then(
      _$ChatPageImpl(
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
  const _$ChatPageImpl({required this.round});
  // ✅ 移除 pageIndex - 索引由列表位置决定
  @override
  final ChatRound round;
  @override
  String toString() {
    return 'ChatPage(round: $round)';
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPageImpl &&
            (identical(other.round, round) || other.round == round));
  }
  @override
  int get hashCode => Object.hash(runtimeType, round);
  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPageImplCopyWith<_$ChatPageImpl> get copyWith =>
      __$$ChatPageImplCopyWithImpl<_$ChatPageImpl>(this, _$identity);
}
abstract class _ChatPage implements ChatPage {
  const factory _ChatPage({required final ChatRound round}) = _$ChatPageImpl;
  // ✅ 移除 pageIndex - 索引由列表位置决定
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
  int get currentPageIndex =>
      throw _privateConstructorUsedError; // ✅ UI 状态的单一事实来源 (0-based)
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
  // ✅ UI 状态的单一事实来源 (0-based)
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
  int get currentPageIndex; // ✅ UI 状态的单一事实来源 (0-based)
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
// lib/domain/models/tree_node.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/models/chat_round.dart';
part 'tree_node.freezed.dart';
part 'tree_node.g.dart';
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
  factory TreeNode.fromJson(Map<String, dynamic> json) =>
      _$TreeNodeFromJson(json);
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
  factory TreePath.fromJson(Map<String, dynamic> json) =>
      _$TreePathFromJson(json);
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
TreeNode _$TreeNodeFromJson(Map<String, dynamic> json) {
  return _TreeNode.fromJson(json);
}
/// @nodoc
mixin _$TreeNode {
  String get id => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  ChatRound get round => throw _privateConstructorUsedError;
  List<TreeNode> get children => throw _privateConstructorUsedError;
  int get depth => throw _privateConstructorUsedError;
  String? get preview => throw _privateConstructorUsedError;
  /// Serializes this TreeNode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
@JsonSerializable()
class _$TreeNodeImpl implements _TreeNode {
  const _$TreeNodeImpl({
    required this.id,
    this.parentId,
    required this.round,
    required final List<TreeNode> children,
    required this.depth,
    this.preview,
  }) : _children = children;
  factory _$TreeNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeImplFromJson(json);
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
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeImplToJson(this);
  }
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
  factory _TreeNode.fromJson(Map<String, dynamic> json) =
      _$TreeNodeImpl.fromJson;
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
TreePath _$TreePathFromJson(Map<String, dynamic> json) {
  return _TreePath.fromJson(json);
}
/// @nodoc
mixin _$TreePath {
  List<TreeNode> get nodes => throw _privateConstructorUsedError;
  TreeNode get targetNode => throw _privateConstructorUsedError;
  /// Serializes this TreePath to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
@JsonSerializable()
class _$TreePathImpl implements _TreePath {
  const _$TreePathImpl({
    required final List<TreeNode> nodes,
    required this.targetNode,
  }) : _nodes = nodes;
  factory _$TreePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreePathImplFromJson(json);
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
  @JsonKey(includeFromJson: false, includeToJson: false)
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
  @override
  Map<String, dynamic> toJson() {
    return _$$TreePathImplToJson(this);
  }
}
abstract class _TreePath implements TreePath {
  const factory _TreePath({
    required final List<TreeNode> nodes,
    required final TreeNode targetNode,
  }) = _$TreePathImpl;
  factory _TreePath.fromJson(Map<String, dynamic> json) =
      _$TreePathImpl.fromJson;
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

## File: lib/domain/services/message_paginator.dart
```dart
import '../../core/models/chat_round.dart';
import '../models/chat_page.dart';
class MessagePaginator {
  static ChatPageList paginate(List<ChatRound> rounds, int currentPageIndex) {
    if (rounds.isEmpty) {
      return ChatPageList.fromPages([], 0);
    }
    // ✅ 移除 pageIndex 设置，索引由列表位置决定
    final pages = rounds.map((round) => ChatPage(round: round)).toList();
    final validIndex = currentPageIndex.clamp(0, pages.length - 1);
    return ChatPageList.fromPages(pages, validIndex);
  }
  static ChatPage? getPage(List<ChatRound> rounds, int pageIndex) {
    if (rounds.isEmpty || pageIndex < 0 || pageIndex >= rounds.length) {
      return null;
    }
    // ✅ 直接通过索引获取
    return ChatPage(round: rounds[pageIndex]);
  }
  static int getTotalPages(List<ChatRound> rounds) {
    return rounds.length;
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

## File: lib/presentation/providers/attachment_bytes_provider.dart
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

## File: lib/presentation/providers/config_notifier.dart
```dart
// presentation/providers/config_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../di/providers.dart';
// ✅ 使用纯声明式 StreamProvider - 无需手动管理生命周期
final configProvider = StreamProvider<AppConfig>((ref) {
  final repository = ref.watch(configRepositoryProvider);
  return repository.watchConfig();
});
final configProfilesProvider = StreamProvider<AppConfigStore>((ref) {
  final repository = ref.watch(configRepositoryProvider);
  return repository.watchConfigStore();
});
// ✅ 保留旧的 StateNotifier 方式用于需要命令式调用的场景
// 内部委托给上面的 StreamProvider
class ConfigNotifier extends StateNotifier<AsyncValue<AppConfig>> {
  final Ref ref;
  ConfigNotifier(this.ref) : super(const AsyncValue.loading()) {
    // 监听上面的 StreamProvider
    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      state = next;
    });
  }
  Future<void> updateApiKey(String apiKey) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateApiKey(apiKey);
  }
  Future<void> updateBaseUrl(String baseUrl) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateBaseUrl(baseUrl);
  }
  Future<void> updateModelsPath(String modelsPath) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateModelsPath(modelsPath);
  }
  Future<void> updateChatPath(String chatPath) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateChatPath(chatPath);
  }
  Future<void> updateApiMode(String apiMode) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateApiMode(apiMode);
  }
  Future<void> updateSelectedModel(String? model) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateSelectedModel(model);
  }
  Future<void> saveFullConfig(AppConfig config) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.saveFullConfig(config);
  }
  Future<void> saveAndRefreshModels(AppConfig config) async {
    // 先标记为加载中
    state = const AsyncValue.loading();
    final repository = ref.read(configRepositoryProvider);
    // 先保存空模型列表
    await repository.saveConfig(config.copyWith(availableModels: []));
    await repository.refreshModels();
    // Stream 会自动更新状态
  }
  Future<void> refreshModels() async {
    final repository = ref.read(configRepositoryProvider);
    await repository.refreshModels();
  }
}
// ✅ 使用 Provider 而非 StateNotifierProvider，让生命周期完全自动化
final configNotifierProvider = Provider<ConfigNotifier>((ref) {
  return ConfigNotifier(ref);
});
class ConfigProfilesNotifier extends StateNotifier<AsyncValue<AppConfigStore>> {
  final Ref ref;
  ConfigProfilesNotifier(this.ref) : super(const AsyncValue.loading()) {
    ref.listen<AsyncValue<AppConfigStore>>(configProfilesProvider, (previous, next) {
      state = next;
    });
  }
  Future<void> load() async {
    // Stream 会自动同步，无需手动操作
  }
  Future<void> switchProfile(String profileId) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.switchProfile(profileId);
  }
  Future<void> createProfile(String name) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.createProfile(name);
  }
  Future<void> renameProfile(String profileId, String name) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.renameProfile(profileId, name);
  }
  Future<void> deleteProfile(String profileId) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.deleteProfile(profileId);
  }
}
final configProfilesNotifierProvider = Provider<ConfigProfilesNotifier>((ref) {
  return ConfigProfilesNotifier(ref);
});
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
// presentation/providers/session_list_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import '../../di/providers.dart';
// ✅ 使用纯声明式 StreamProvider
final sessionListProvider = StreamProvider<List<Session>>((ref) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchAllSessions();
});
// ✅ 保留命令式 notifier 用于需要直接调用方法的场景
class SessionListNotifier extends StateNotifier<AsyncValue<List<Session>>> {
  final Ref ref;
  SessionListNotifier(this.ref) : super(const AsyncValue.loading()) {
    // 监听上面的 StreamProvider
    ref.listen<AsyncValue<List<Session>>>(sessionListProvider, (previous, next) {
      state = next;
    });
  }
  Future<void> refresh() async {
    // Stream 会自动同步，保留此方法用于兼容性
  }
  Future<void> deleteSession(String fileName) async {
    try {
      final repository = ref.read(conversationRepositoryProvider);
      await repository.deleteSession(fileName);
      // Stream 会自动同步
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
      // Stream 会自动同步
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<String> createSession(String title) async {
    final repository = ref.read(conversationRepositoryProvider);
    final cleanTitle = title.trim().isEmpty ? '新对话' : title.trim();
    // 使用时间戳生成临时 ID
    final now = DateTime.now().millisecondsSinceEpoch;
    final sessionId = now.toString();
    final fileName = '$sessionId.json';
    await repository.createSession(fileName: fileName, title: cleanTitle);
    return fileName;
  }
}
// ✅ 使用 Provider 而非 StateNotifierProvider
final sessionListNotifierProvider = Provider<SessionListNotifier>((ref) {
  return SessionListNotifier(ref);
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
import '../utils/page_utils.dart';
class PageIndicator extends StatelessWidget {
  final int currentPage;    // ✅ 0-based 索引
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
            // ✅ 使用统一工具类
            PageUtils.formatSimple(currentPage, totalPages),
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

## File: lib/core/interfaces/file_service.dart
```dart
import 'dart:typed_data';
abstract class IFileService {
  Future<String> saveAttachment(Uint8List data, String fileName);
  Future<Uint8List> readAttachment(String relativePath);
  Future<void> deleteAttachment(String relativePath);
}
```

## File: lib/data/repositories/conversation_repository.dart
```dart
// data/repositories/conversation_repository.dart
import 'dart:async';
import 'dart:typed_data';
import 'package:drift/drift.dart';
import '../../core/interfaces/file_service.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../database/database.dart';
import '../../core/utils/id_generator.dart';
class ConversationRepository {
  final AppDatabase _db;
  final IFileService _fileService;
  ConversationRepository(this._db, this._fileService);
  String _getId(String fileName) => fileName.replaceAll('.json', '');
  // 检查附件是否被其他 Round 引用
  Future<bool> _isAttachmentUsedElsewhere(
      String relativePath, List<String> excludeRoundIds) async {
    final query = _db.select(_db.dbAttachments).join([
      innerJoin(
        _db.dbChatRounds,
        _db.dbChatRounds.id.equalsExp(_db.dbAttachments.roundId),
      )
    ])
      ..where(_db.dbAttachments.relativePath.equals(relativePath))
      ..where(_db.dbChatRounds.id.isNotIn(excludeRoundIds));
    final result = await query.get();
    return result.isNotEmpty;
  }
  // ========== 核心改造：添加 watch 方法 ==========
  /// 监听所有会话列表，返回按更新时间倒序的会话 Stream
  Stream<List<Session>> watchAllSessions() {
    final query = _db.select(_db.dbSessions)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]);
    return query.watch().asyncMap((sessionRows) async {
      final sessions = <Session>[];
      for (final sessionRow in sessionRows) {
        final session = await _buildSessionFromRow(sessionRow);
        sessions.add(session);
      }
      return sessions;
    });
  }
  /// 监听单个会话的完整数据（包含所有轮次和附件）
  Stream<Session?> watchSession(String fileName) {
    final sessionId = _getId(fileName);
    // 监听会话元数据变更
    final sessionQuery = _db.select(_db.dbSessions)
      ..where((t) => t.id.equals(sessionId));
    return sessionQuery.watchSingleOrNull().asyncMap((sessionRow) async {
      if (sessionRow == null) return null;
      return _buildSessionFromRow(sessionRow);
    });
  }
  /// 监听会话的轮次列表
  Stream<List<ChatRound>> watchRounds(String sessionId) {
    final roundsQuery = _db.select(_db.dbChatRounds)
      ..where((t) => t.sessionId.equals(sessionId))
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]);
    return roundsQuery.watch().asyncMap((roundRows) async {
      final rounds = <ChatRound>[];
      for (final round in roundRows) {
        final attachments = await _getAttachmentsForRound(round.id);
        rounds.add(_mapToChatRound(round, attachments));
      }
      return rounds;
    });
  }
  /// 监听单个轮次的数据
  Stream<ChatRound?> watchRound(String roundId) {
    final query = _db.select(_db.dbChatRounds)
      ..where((t) => t.id.equals(roundId));
    return query.watchSingleOrNull().asyncMap((roundRow) async {
      if (roundRow == null) return null;
      final attachments = await _getAttachmentsForRound(roundId);
      return _mapToChatRound(roundRow, attachments);
    });
  }
  // ========== 私有辅助方法 ==========
  Future<Session> _buildSessionFromRow(DbSession sessionRow) async {
    final sessionId = sessionRow.id;
    // 查询所有轮次
    final roundsQuery = _db.select(_db.dbChatRounds)
      ..where((t) => t.sessionId.equals(sessionId))
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]);
    final roundRows = await roundsQuery.get();
    if (roundRows.isEmpty) {
      return Session(
        id: sessionRow.id,
        title: sessionRow.title,
        createdAt: sessionRow.createdAt,
        updatedAt: sessionRow.updatedAt,
        config: sessionRow.config,
        hasUnseenUpdate: sessionRow.hasUnseenUpdate,
        rounds: const [],
      );
    }
    // 查询所有相关附件
    final roundIds = roundRows.map((r) => r.id).toList();
    final attachmentsQuery = _db.select(_db.dbAttachments)
      ..where((t) => t.roundId.isIn(roundIds));
    final attachmentRows = await attachmentsQuery.get();
    // 组装 Attachments Map
    final attachMap = <String, List<Attachment>>{};
    for (final a in attachmentRows) {
      attachMap.putIfAbsent(a.roundId, () => []).add(
            Attachment(
              id: a.id,
              name: a.name,
              relativePath: a.relativePath,
              isImage: a.isImage,
              mimeType: a.mimeType,
            ),
          );
    }
    // 组装 Rounds
    final rounds = roundRows
        .map((r) => _mapToChatRound(r, attachMap[r.id] ?? []))
        .toList();
    return Session(
      id: sessionRow.id,
      title: sessionRow.title,
      createdAt: sessionRow.createdAt,
      updatedAt: sessionRow.updatedAt,
      config: sessionRow.config,
      hasUnseenUpdate: sessionRow.hasUnseenUpdate,
      rounds: rounds,
    );
  }
  Future<List<Attachment>> _getAttachmentsForRound(String roundId) async {
    final query = _db.select(_db.dbAttachments)
      ..where((t) => t.roundId.equals(roundId));
    final rows = await query.get();
    return rows
        .map((a) => Attachment(
              id: a.id,
              name: a.name,
              relativePath: a.relativePath,
              isImage: a.isImage,
              mimeType: a.mimeType,
            ))
        .toList();
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
  // ========== 现有的同步方法保留，用于初始化和一次性读取 ==========
  Future<List<String>> getAllSessionFileNames() async {
    final sessions = await (_db.select(_db.dbSessions)
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .get();
    return sessions.map((s) => '${s.id}.json').toList();
  }
  Future<Session> getSession(String fileName) async {
    final sessionId = _getId(fileName);
    final sessionRow = await (_db.select(_db.dbSessions)
          ..where((t) => t.id.equals(sessionId)))
        .getSingle();
    return _buildSessionFromRow(sessionRow);
  }
  Future<void> deleteRounds(String sessionId, List<String> roundIds) async {
    if (roundIds.isEmpty) return;
    await (_db.delete(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId) & t.id.isIn(roundIds)))
        .go();
  }
  Future<void> saveSession(
      String fileName, Session newSession) async {
    final sessionId = _getId(fileName);
    await _db.transaction(() async {
      final allAttachments = <DbAttachmentsCompanion>[];
      for (final round in newSession.rounds) {
        await _db.into(_db.dbChatRounds).insertOnConflictUpdate(
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
        allAttachments.addAll(round.userAttachments
            .map((a) => DbAttachmentsCompanion.insert(
                  id: a.id,
                  roundId: round.id,
                  name: a.name,
                  relativePath: a.relativePath,
                  isImage: Value(a.isImage),
                  mimeType: Value(a.mimeType),
                )));
      }
      for (final attach in allAttachments) {
        await _db.into(_db.dbAttachments).insertOnConflictUpdate(attach);
      }
      await _db.into(_db.dbSessions).insertOnConflictUpdate(
            DbSessionsCompanion(
              id: Value(sessionId),
              title: Value(newSession.title),
              createdAt: Value(newSession.createdAt),
              updatedAt: Value(newSession.updatedAt),
              config: Value(newSession.config),
              hasUnseenUpdate: Value(newSession.hasUnseenUpdate),
            ),
          );
    });
  }
  Future<void> saveSessionAndCleanupOrphanAttachments(
    String fileName, Session oldSession, Session newSession,
  ) async {
    final oldPaths = oldSession.rounds
        .expand((r) => r.userAttachments)
        .map((a) => a.relativePath)
        .toSet();
    final newPaths = newSession.rounds
        .expand((r) => r.userAttachments)
        .map((a) => a.relativePath)
        .toSet();
    final removedPaths = oldPaths.difference(newPaths);
    final deletedRoundIds = oldSession.rounds
        .where((oldR) => !newSession.rounds.any((newR) => newR.id == oldR.id))
        .map((r) => r.id)
        .toList();
    await saveSession(fileName, newSession);
    for (final path in removedPaths) {
      if (!await _isAttachmentUsedElsewhere(path, deletedRoundIds)) {
        try {
          await _fileService.deleteAttachment(path);
        } catch (_) {}
      }
    }
  }
  Future<void> deleteSession(String fileName) async {
    final sessionId = _getId(fileName);
    Session? targetSession;
    try {
      targetSession = await getSession(fileName);
    } catch (_) {}
    if (targetSession != null) {
      final paths = targetSession.rounds
          .expand((r) => r.userAttachments)
          .map((a) => a.relativePath)
          .toSet();
      final allRoundIds = targetSession.rounds.map((r) => r.id).toList();
      for (final path in paths) {
        if (!await _isAttachmentUsedElsewhere(path, allRoundIds)) {
          try {
            await _fileService.deleteAttachment(path);
          } catch (_) {}
        }
      }
    }
    await (_db.delete(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .go();
  }
  Future<String> saveAttachment(Uint8List data, String fileName) async =>
      await _fileService.saveAttachment(data, fileName);
  Future<Uint8List> getAttachment(String relativePath) async =>
      await _fileService.readAttachment(relativePath);
  Future<void> deleteAttachment(String relativePath) async =>
      await _fileService.deleteAttachment(relativePath);
  Future<Session> createSession({required String fileName, required String title}) async {
    final sessionId = _getId(fileName);
    final now = DateTime.now().millisecondsSinceEpoch;
    final session = Session(
        id: sessionId,
        title: title,
        createdAt: now,
        updatedAt: now,
        rounds: []);
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
  Future<Session> createSessionWithGeneratedId({required String title}) async {
    final sessionId = IdGenerator.generate();
    return createSession(fileName: '$sessionId.json', title: title);
  }
  Future<void> updateSessionTitle(String fileName, String title) async {
    final sessionId = _getId(fileName);
    await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .write(DbSessionsCompanion(
          title: Value(title),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ));
  }
  Future<List<Session>> getAllSessions() async {
    final ids = await getAllSessionFileNames();
    final sessions = <Session>[];
    for (final id in ids) {
      try {
        sessions.add(await getSession(id));
      } catch (_) {}
    }
    return sessions;
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
          .write(DbSessionsCompanion(
              updatedAt: Value(DateTime.now().millisecondsSinceEpoch)));
    });
  }
  Future<void> updateRound(
      String fileName, String roundId, ChatRound updatedRound) async {
    final sessionId = _getId(fileName);
    await _db.transaction(() async {
      await (_db.update(_db.dbChatRounds)
            ..where((t) => t.id.equals(roundId)))
          .write(
            DbChatRoundsCompanion(
              assistantThinking: Value(updatedRound.assistantThinking),
              assistantContent: Value(updatedRound.assistantContent),
              isIncomplete: Value(updatedRound.isIncomplete),
              hasUnseenUpdate: Value(updatedRound.hasUnseenUpdate),
            ),
          );
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(DbSessionsCompanion(
              updatedAt: Value(DateTime.now().millisecondsSinceEpoch)));
    });
  }
}
```

## File: lib/data/services/config_service.dart
```dart
// data/services/config_service.dart
import 'dart:async';
import 'package:drift/drift.dart';
import '../../core/interfaces/config_service.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/utils/id_generator.dart';
import '../../data/data_sources/remote_api_source.dart';
import '../database/database.dart';
class ConfigService implements IConfigService {
  final AppDatabase _db;
  final IRemoteApiSource _apiSource;
  ConfigService(this._db, this._apiSource);
  @override
  Future<AppConfigStore> loadConfigStore() async {
    final storeRow = await _db.select(_db.dbConfigStore).getSingleOrNull();
    final activeId = storeRow?.activeProfileId ?? 'default';
    final profileRows = await _db.select(_db.dbConfigProfiles).get();
    // 初始化默认数据
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
        const DbConfigStoreCompanion(id: Value(1), activeProfileId: Value('default')),
      );
      return AppConfigStore(activeProfileId: 'default', profiles: [defaultProfile]);
    }
    final profiles = profileRows.map((p) => ConfigProfile(
      id: p.id, 
      name: p.name, 
      config: p.config,
    )).toList();
    return AppConfigStore(activeProfileId: activeId, profiles: profiles);
  }
  @override
  Future<AppConfig> loadConfig() async {
    final store = await loadConfigStore();
    return store.profiles.firstWhere((p) => p.id == store.activeProfileId).config;
  }
  @override
  Future<void> saveConfig(AppConfig config) async {
    final activeId = await getActiveProfileId();
    await _db.update(_db.dbConfigProfiles)
      ..where((t) => t.id.equals(activeId))
      ..write(DbConfigProfilesCompanion(config: Value(config)));
  }
  @override
  Future<void> refreshModels() async {
    final activeConfig = await loadConfig();
    final models = await _apiSource.fetchModels(
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
    final storeRow = await _db.select(_db.dbConfigStore).getSingleOrNull();
    return storeRow?.activeProfileId ?? 'default';
  }
  @override
  Future<void> switchProfile(String profileId) async {
    await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
      DbConfigStoreCompanion(id: const Value(1), activeProfileId: Value(profileId)),
    );
  }
  @override
  Future<void> createProfile(String name) async {
    final activeConfig = await loadConfig();
    final newId = IdGenerator.generate();
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
  @override
  Future<void> renameProfile(String profileId, String name) async {
    if (name.trim().isEmpty) return;
    await (_db.update(_db.dbConfigProfiles)..where((t) => t.id.equals(profileId)))
        .write(DbConfigProfilesCompanion(name: Value(name.trim())));
  }
  @override
  Future<void> deleteProfile(String profileId) async {
    // ✅ 原子操作：先获取当前状态
    final store = await loadConfigStore();
    // 只有一个配置文件时不允许删除
    if (store.profiles.length <= 1) return;
    // ✅ 如果要删除的是当前激活的配置，先切换到其他配置
    if (store.activeProfileId == profileId) {
      // 找到剩余配置中的第一个
      final remaining = store.profiles.where((p) => p.id != profileId).toList();
      if (remaining.isNotEmpty) {
        await switchProfile(remaining.first.id);
      }
    }
    // 最后删除目标配置
    await (_db.delete(_db.dbConfigProfiles)..where((t) => t.id.equals(profileId))).go();
  }
  @override
  Stream<AppConfigStore> watchConfigStore() {
    // 监听 dbConfigStore 表
    final storeStream = _db.select(_db.dbConfigStore).watchSingleOrNull();
    return storeStream.asyncExpand((storeRow) async* {
      final activeId = storeRow?.activeProfileId ?? 'default';
      // 监听 profiles 表变化
      final profilesStream = _db.select(_db.dbConfigProfiles).watch();
      await for (final profileRows in profilesStream) {
        final profiles = profileRows.map((p) => ConfigProfile(
          id: p.id,
          name: p.name,
          config: p.config,
        )).toList();
        yield AppConfigStore(
          activeProfileId: activeId,
          profiles: profiles,
        );
      }
    });
  }
  @override
  Stream<AppConfig> watchConfig() {
    return watchConfigStore().map((store) {
      return store.profiles
          .firstWhere((p) => p.id == store.activeProfileId)
          .config;
    });
  }
}
```

## File: lib/data/services/file_service.dart
```dart
import 'dart:typed_data';
import '../../core/interfaces/file_service.dart';
import '../data_sources/local_file_source.dart';
class FileService implements IFileService {
  final ILocalFileSource _fileSource;
  FileService(this._fileSource);
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

## File: lib/presentation/providers/global_streaming_provider.dart
```dart
// presentation/providers/global_streaming_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../domain/states/chat_state.dart';
typedef SessionStreamMap = Map<String, StreamStatus>;
typedef GlobalStreamMap = Map<String, SessionStreamMap>;
// 这个 Provider 持有正在流式生成的数据
// 当流式结束时，数据会写入数据库，UI 通过 watch 获取
// 此 Provider 主要用于避免重复请求和实时显示
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
  void ensureRoundLoadedWithContent(
    String fileName,
    String roundId,
    String content,
    String reasoning,
  ) {
    final sessionMap = Map<String, StreamStatus>.from(state[fileName] ?? {});
    if (!sessionMap.containsKey(roundId)) {
      sessionMap[roundId] = StreamStatus(
        content: content,
        reasoning: reasoning,
        isStreaming: false,
      );
    }
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
  void clearRoundStream(String fileName, String roundId) {
    final sessionMap = state[fileName];
    if (sessionMap == null) return;
    final next = Map<String, StreamStatus>.from(sessionMap);
    next.remove(roundId);
    if (next.isEmpty) {
      final global = Map<String, SessionStreamMap>.from(state);
      global.remove(fileName);
      state = global;
    } else {
      state = {
        ...state,
        fileName: next,
      };
    }
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
  // 当没有任何监听时可以自动清理
  ref.onDispose(() {
    // 可以在这里做一些清理工作
  });
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

## File: lib/presentation/pages/settings_page.dart
```dart
// presentation/pages/settings_page.dart
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
  String? _selectedModel;
  String _apiMode = 'chat_completions';
  List<ModelInfo> _models = const [];
  bool _isRefreshingModels = false;
  @override
  void dispose() {
    _baseUrlController.dispose();
    _apiKeyController.dispose();
    _modelsPathController.dispose();
    _chatPathController.dispose();
    super.dispose();
  }
  void _syncControllersWithConfig(AppConfig config) {
    setState(() {  // ✅ 加这个
      _baseUrlController.text = config.baseUrl;
      _apiKeyController.text = config.apiKey;
      _modelsPathController.text = config.modelsPath;
      _chatPathController.text = config.chatPath;
      _selectedModel = config.selectedModel;
      _apiMode = config.apiMode;
      _models = config.availableModels ?? const [];
    });
  }
  void _saveConfig(AppConfig config) {
    // ✅ 自动保存
    ref.read(configNotifierProvider).saveFullConfig(config);
  }
  @override
  Widget build(BuildContext context) {
    final configState = ref.watch(configProvider);
    final profilesState = ref.watch(configProfilesProvider);
    // ✅ 监听配置变化，同步 Controller（但不重建页面）
    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      next.whenData((config) {
        _syncControllersWithConfig(config);
      });
    });
    final isBusy = configState.isLoading || _isRefreshingModels;
    return AppPageScaffold(
      appBar: AppBar(
        title: const Text('设置'),
        actions: [
          IconButton(
            onPressed: isBusy ? null : _confirmRestoreDefaults,
            icon: const Icon(Icons.restart_alt),
            tooltip: '恢复默认',
            style: IconButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
      ),
      body: profilesState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载配置存档失败：$e')),
        data: (store) {
          return configState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('加载配置失败：$e')),
            data: (config) {
              // ✅ 首次加载或 Controller 为空时同步
              if (_baseUrlController.text.isEmpty) {
                _syncControllersWithConfig(config);
              }
              return _buildSettingsContent(context, store, config, isBusy);
            },
          );
        },
      ),
    );
  }
  Widget _buildSettingsContent(BuildContext context, AppConfigStore store, AppConfig config, bool isBusy) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // 配置存档
        AppSection(
          title: '配置存档',
          subtitle: '切换后自动同步到表单',
          children: [
            DropdownButtonFormField<String>(
              value: store.activeProfileId,
              decoration: const InputDecoration(labelText: '当前配置存档'),
              items: store.profiles.map((p) => DropdownMenuItem(value: p.id, child: Text(p.name))).toList(),
              onChanged: isBusy ? null : (value) async {
                if (value == null) return;
                await ref.read(configProfilesNotifierProvider).switchProfile(value);
                // ✅ 监听器会自动同步 Controller
              },
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: [
                OutlinedButton(onPressed: isBusy ? null : _showCreateProfileDialog, child: const Text('新建')),
                OutlinedButton(
                  onPressed: isBusy ? null : () => _showRenameProfileDialog(store.profiles.firstWhere((p) => p.id == store.activeProfileId)),
                  child: const Text('重命名'),
                ),
                OutlinedButton(
                  onPressed: isBusy ? null : () => _deleteProfile(store.profiles.firstWhere((p) => p.id == store.activeProfileId), store.profiles.length),
                  child: const Text('删除'),
                ),
              ],
            ),
          ],
        ),
        // 连接配置 - ✅ 使用 Controller，自动保存
        AppSection(
          title: '连接配置',
          subtitle: '修改后自动保存',
          children: [
            TextField(
              controller: _baseUrlController,
              enabled: !isBusy,
              decoration: const InputDecoration(labelText: 'Base URL', hintText: 'https://api.openai.com'),
              // ✅ 自动保存
              onChanged: (v) => _saveConfig(config.copyWith(baseUrl: v)),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _apiKeyController,
              enabled: !isBusy,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'API Key'),
              onChanged: (v) => _saveConfig(config.copyWith(apiKey: v)),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _modelsPathController,
              enabled: !isBusy,
              decoration: const InputDecoration(labelText: 'Models Path', hintText: _defaultModelsPath),
              onChanged: (v) => _saveConfig(config.copyWith(modelsPath: v.isEmpty ? _defaultModelsPath : v)),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _chatPathController,
              enabled: !isBusy,
              decoration: InputDecoration(labelText: 'Chat Path', hintText: _defaultChatPathForApiMode(_apiMode)),
              onChanged: (v) => _saveConfig(config.copyWith(chatPath: v.isEmpty ? _defaultChatPathForApiMode(_apiMode) : v)),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _apiMode,
              decoration: const InputDecoration(labelText: 'API Mode'),
              items: const [
                DropdownMenuItem(value: 'chat_completions', child: Text('chat_completions')),
                DropdownMenuItem(value: 'responses', child: Text('responses')),
              ],
              onChanged: isBusy ? null : (value) {
                if (value == null) return;
                setState(() => _apiMode = value);
                // 自动更新 chatPath
                if (_chatPathController.text.isEmpty) {
                  _chatPathController.text = _defaultChatPathForApiMode(value);
                }
                _saveConfig(config.copyWith(apiMode: value, chatPath: _chatPathController.text));
              },
            ),
          ],
        ),
        // 模型配置
        AppSection(
          title: '模型配置',
          subtitle: '选择后自动保存',
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildModelSelector(context, isBusy)),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: isBusy ? null : _refreshModels,
                  child: _isRefreshingModels
                      ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('同步模型'),
                ),
              ],
            ),
            _buildModelChips(),
          ],
        ),
      ],
    );
  }
  Widget _buildModelSelector(BuildContext context, bool isBusy) {
    return SearchAnchor(
      builder: (context, controller) {
        return GestureDetector(
          onTap: isBusy ? null : () => controller.openView(),
          child: InputDecorator(
            decoration: const InputDecoration(labelText: '当前模型', suffixIcon: Icon(Icons.arrow_drop_down)),
            child: Text(_getSelectedModelDisplayText(), overflow: TextOverflow.ellipsis),
          ),
        );
      },
      suggestionsBuilder: (context, controller) {
        final query = controller.text.trim().toLowerCase();
        final filtered = _models.where((m) {
          final id = m.id.toLowerCase();
          final name = (m.name ?? '').toLowerCase();
          return query.isEmpty || id.contains(query) || name.contains(query);
        }).toList();
        if (filtered.isEmpty) return const [ListTile(title: Text('没有匹配的模型'))];
        return [
          ...filtered.map((model) => ListTile(
            title: Text((model.name ?? '').trim().isNotEmpty ? model.name! : model.id),
            trailing: model.id == _selectedModel ? const Icon(Icons.check) : null,
            onTap: () {
              setState(() => _selectedModel = model.id);
              _saveConfig(ref.read(configProvider).valueOrNull!.copyWith(selectedModel: model.id));
              controller.closeView(model.id);
            },
          )),
          ListTile(
            title: const Text('自定义模型 ID'),
            onTap: () {
              final text = controller.text;
              controller.closeView(null);
              if (text.isNotEmpty) {
                setState(() => _selectedModel = text);
                _saveConfig(ref.read(configProvider).valueOrNull!.copyWith(selectedModel: text));
              }
            },
          ),
        ];
      },
    );
  }
  Widget _buildModelChips() {
    if (_selectedModel == null) return const SizedBox.shrink();
    final model = _models.where((m) => m.id == _selectedModel).firstOrNull;
    if (model == null) return const SizedBox.shrink();
    final chips = <Widget>[];
    if (model.supportsVision == true) {
      chips.add(const Chip(avatar: Icon(Icons.image_outlined, size: 16), label: Text('Vision'), visualDensity: VisualDensity.compact));
    }
    if (model.supportsReasoning == true) {
      chips.add(const Chip(avatar: Icon(Icons.psychology_alt_outlined, size: 16), label: Text('Reasoning'), visualDensity: VisualDensity.compact));
    }
    if (chips.isEmpty) return const SizedBox.shrink();
    return Padding(padding: const EdgeInsets.only(top: 12), child: Wrap(spacing: 8, runSpacing: 8, children: chips));
  }
  String _getSelectedModelDisplayText() {
    if (_selectedModel == null || _selectedModel!.trim().isEmpty) return '请选择模型';
    for (final m in _models) {
      if (m.id == _selectedModel) return (m.name ?? '').trim().isNotEmpty ? m.name! : m.id;
    }
    return _selectedModel!;
  }
  String _defaultChatPathForApiMode(String apiMode) {
    return apiMode == 'responses' ? 'v1/responses' : 'v1/chat/completions';
  }
  Future<void> _refreshModels() async {
    final current = ref.read(configProvider).valueOrNull;
    if (current == null) return;
    setState(() => _isRefreshingModels = true);
    try {
      await ref.read(configNotifierProvider).saveAndRefreshModels(current);
      await ref.read(configProfilesNotifierProvider).load();
      await AppToast.show('模型列表已同步');
    } catch (e) {
      await AppToast.show('同步模型失败：$e');
    } finally {
      if (mounted) setState(() => _isRefreshingModels = false);
    }
  }
  Future<void> _confirmRestoreDefaults() async {
    final colorScheme = Theme.of(context).colorScheme;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('恢复默认设置'),
        content: const Text('确定要将当前配置存档恢复为默认设置吗？'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(backgroundColor: colorScheme.error, foregroundColor: colorScheme.onError),
            child: const Text('恢复默认'),
          ),
        ],
      ),
    ) ?? false;
    if (!confirmed) return;
    try {
      await ref.read(configNotifierProvider).saveFullConfig(AppConfig.defaultConfig());
      await ref.read(configProfilesNotifierProvider).load();
    } catch (e) {
      await AppToast.show('恢复默认失败：$e');
    }
  }
  Future<void> _showCreateProfileDialog() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('新建配置存档'),
        content: TextField(controller: controller, autofocus: true, decoration: const InputDecoration(hintText: '输入配置名称')),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('取消')),
          FilledButton(onPressed: () => Navigator.of(ctx).pop(controller.text.trim()), child: const Text('创建')),
        ],
      ),
    );
    if (result == null) return;
    await ref.read(configProfilesNotifierProvider).createProfile(result);
  }
  Future<void> _showRenameProfileDialog(ConfigProfile profile) async {
    final controller = TextEditingController(text: profile.name);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('重命名配置存档'),
        content: TextField(controller: controller, autofocus: true, decoration: const InputDecoration(hintText: '输入配置名称')),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('取消')),
          FilledButton(onPressed: () => Navigator.of(ctx).pop(controller.text.trim()), child: const Text('保存')),
        ],
      ),
    );
    if (result == null || result.isEmpty) return;
    await ref.read(configProfilesNotifierProvider).renameProfile(profile.id, result);
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
        content: Text('确定删除"${profile.name}"吗？'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
          FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('删除')),
        ],
      ),
    ) ?? false;
    if (!confirmed) return;
    await ref.read(configProfilesNotifierProvider).deleteProfile(profile.id);
  }
}
```

## File: lib/presentation/providers/home_session_list_provider.dart
```dart
// presentation/providers/home_session_list_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
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
// 简化：直接监听 sessionListProvider，无需额外处理
final homeSessionListProvider = Provider<AsyncValue<List<HomeSessionItem>>>((ref) {
  final sessionsAsync = ref.watch(sessionListProvider);
  return sessionsAsync.whenData((sessions) {
    final items = sessions.map((session) {
      final hasUnseen = session.rounds.any((r) => r.hasUnseenUpdate);
      final roundCount = session.rounds.length;
      // 直接获取最后一个 round 作为预览
      final previewRound = session.rounds.isEmpty 
          ? null 
          : session.rounds.last;
      final previewRoundId = previewRound?.id;
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
            onPressed: () =>
                Navigator.of(ctx).pop(controller.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );
    if (result != null &&
        result.isNotEmpty &&
        result != session.title) {
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
    // 关键修复：必须监听 homeSessionListProvider
    final sessionsAsync = ref.watch(homeSessionListProvider);
    // 操作类 notifier：仍用 sessionListProvider.notifier
    final notifier = ref.read(sessionListNotifierProvider);
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
    final oldItem = oldWidget.item;
    final newItem = widget.item;
    if (oldItem.previewRoundId != newItem.previewRoundId ||
        oldItem.session.id != newItem.session.id) {
      _requested = false;
      _ensurePreviewLoaded();
    }
  }
  void _ensurePreviewLoaded() {
    final previewRoundId = widget.item.previewRoundId as String?;
    if (_requested || previewRoundId == null) return;
    _requested = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final fileName = '${widget.item.session.id}.json';
      final previewRound =
          widget.item.session.rounds.firstWhere((r) => r.id == previewRoundId);
      ref.read(globalStreamCacheProvider.notifier).ensureRoundLoaded(
            fileName,
            previewRound,
          );
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
    final updatedAt = TimeFormatUtils.formatTimestamp(widget.item.updatedAt as int);
    final previewRoundId = widget.item.previewRoundId as String?;
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
                builder: (_) => ChatPage(
                  fileName: fileName,
                  initialRoundId: widget.item.previewRoundId,
                ),
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
              if (widget.item.hasUnseen == true) ...[
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
                  text: widget.item.userPreview,
                ),
                const SizedBox(height: 4),
                _PreviewLine(
                  label: 'AI',
                  text: aiPreview,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildMetaChip(
                      '${widget.item.roundCount} 轮',
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
import '../utils/page_utils.dart';
class ChatPage extends ConsumerStatefulWidget {
  final String fileName;
  final String? initialRoundId;
  final String? initialMessage;
  final List<PendingAttachment>? initialAttachments;
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
  late final ProviderSubscription<ChatState> _chatSubscription;
  bool _initialMessageHandled = false;
  bool _isMarkingSeen = false;
  bool _isRouteVisible = false;
  ModalRoute<dynamic>? _route;
  @override
  void initState() {
    super.initState();
    _chatSubscription = ref.listenManual<ChatState>(
      chatProvider(widget.fileName),
      (previous, next) {
        final nextPageList = next.pageList;
        if (nextPageList == null || nextPageList.pages.isEmpty) return;
        if (_pageController == null) {
          final initialIndex = nextPageList.currentPageIndex;
          _pageController = PageController(initialPage: initialIndex);
          if (mounted) {
            setState(() {});
          }
          return;
        }
        final controller = _pageController;
        if (controller == null || !controller.hasClients) return;
        final prevIndex = previous?.pageList?.currentPageIndex;
        final nextIndex = nextPageList.currentPageIndex;
        if (prevIndex == nextIndex) return;
        final currentPage = controller.page?.round() ?? controller.initialPage;
        if (currentPage == nextIndex) return;
        controller.jumpToPage(nextIndex);
      },
    );
    Future.microtask(() async {
      final notifier = ref.read(chatProvider(widget.fileName).notifier);
      await notifier.loadSession(initialRoundId: widget.initialRoundId);
      final state = ref.read(chatProvider(widget.fileName));
      final currentRoundId = state.currentRoundId;
      if (currentRoundId != null) {
        await notifier.ensureRoundLoaded(currentRoundId);
      }
      final message = widget.initialMessage?.trim() ?? '';
      final attachments =
          widget.initialAttachments ?? const <PendingAttachment>[];
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
    _chatSubscription.close();
    appRouteObserver.unsubscribe(this);
    _pageController?.dispose();
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
    if (_isInEditMode()) {
      _cancelEditMode();
    }
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
    final controller = _pageController;
    if (controller == null || !controller.hasClients) return;
    final state = ref.read(chatProvider(widget.fileName));
    final pageList = state.pageList;
    if (pageList == null || pageList.pages.isEmpty) return;
    final currentPage = controller.page;
    final index = currentPage != null 
        ? currentPage.round().clamp(0, pageList.pages.length - 1)
        : pageList.currentPageIndex;
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
                            initialFocusRoundId: state.currentRoundId!,
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
              currentIndex: state.pageList!.currentPageIndex,  // ✅ 直接传递 0-based
              totalPages: state.pageList!.totalPages,
              onPrev: isEditMode
                  ? null
                  : state.pageList!.currentPageIndex > 0
                      ? () => _pageController?.previousPage(
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeOutCubic,
                          )
                      : null,
              onNext: isEditMode
                  ? null
                  : state.pageList!.currentPageIndex < state.pageList!.totalPages - 1
                      ? () => _pageController?.nextPage(
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
                        : _pageController == null
                            ? const Center(child: CircularProgressIndicator())
                            : PageView.builder(
                                controller: _pageController,
                                physics: isEditMode
                                    ? const NeverScrollableScrollPhysics()
                                    : const PageScrollPhysics(),
                                itemCount: state.pageList?.pages.length ?? 0,
                                onPageChanged: (index) async {
                                  // ✅ index 已经是 0-based，无需转换
                                  if (state.pageList == null) return;
                                  if (index != state.pageList!.currentPageIndex) {
                                    notifier.changePage(index);  // ✅ 直接传递 0-based
                                  }
                                  final round = state.pageList!.pages[index].round;
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
                                    onRetryReply: () => notifier.retryFromRound(round.id),
                                    onEdit: canEdit 
                                        ? () => _enterEditMode(round.id, round.userContent) 
                                        : null,
                                    onCopyText: _copyText,
                                  );
                                },
                              ),
          ),
          InputBar(
            hintText: isEditMode ? '修改文本后发送' : '发送消息',
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
  final int currentIndex;    // ✅ 0-based 索引
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
    // ✅ 使用统一工具类计算进度
    final progress = PageUtils.calculateProgress(currentIndex, totalPages);
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
                    // ✅ 使用统一工具类格式化
                    isEditMode
                        ? '编辑中｜${PageUtils.format(currentIndex, totalPages)}'
                        : PageUtils.format(currentIndex, totalPages),
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

## File: lib/presentation/providers/chat_notifier.dart
```dart
// presentation/providers/chat_notifier.dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/model_info.dart';
import '../../core/models/session.dart';
import '../../core/models/attachment.dart';
import '../../di/providers.dart';
import '../../domain/models/chat_page.dart';
import '../../domain/services/attachment_preparer.dart';
import '../../domain/services/branch_navigator.dart';
import '../../domain/services/chat_context_builder.dart';
import '../../domain/services/chat_stream_accumulator.dart';
import '../../domain/states/chat_state.dart';
import '../models/pending_attachment.dart';
import '../utils/page_utils.dart';
import 'global_streaming_provider.dart';
import '../../core/utils/id_generator.dart';
import 'config_notifier.dart';  // ✅ 添加这一行
// 辅助函数：找到第一个匹配的元素，否则返回null
T? _firstWhereOrNull<T>(List<T> list, bool Function(T) test) {
  for (final element in list) {
    if (test(element)) return element;
  }
  return null;
}
class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;
  final String fileName;
  final Set<String> _stoppingRoundIds = {};
  // Stream 订阅
  StreamSubscription? _sessionSubscription;
  // 纯 UI 状态
  int _currentPageIndex = 0;
  ChatNotifier(this.ref, this.fileName) : super(ChatState.initial()) {
    _initWatch();
  }
  void _initWatch() {
    final repository = ref.read(conversationRepositoryProvider);
    // 监听会话变更
    _sessionSubscription = repository.watchSession(fileName).listen((session) {
      if (session == null) {
        state = state.copyWith(
          session: null,
          error: '会话不存在',
          isLoading: false,
        );
        return;
      }
      // ========== 修复：每次打开会话都定位到最新页 ==========
      // 获取所有分支叶子节点（最新创建的轮次）
      final leaves = BranchNavigator.getAllBranchLeaves(session);
      // 确定当前应该显示的轮次ID
      String? currentRoundId;
      List<ChatRound> branchPath;
      int targetPageIndex;
      if (leaves.isNotEmpty) {
        // 默认显示最新创建的轮次
        currentRoundId = leaves.last.id;
        branchPath = BranchNavigator.getCurrentBranchPath(session, currentRoundId);
        targetPageIndex = branchPath.isNotEmpty ? branchPath.length - 1 : 0;
      } else {
        // 如果没有轮次，显示空页面
        currentRoundId = null;
        branchPath = [];
        targetPageIndex = 0;
      }
      _currentPageIndex = targetPageIndex;
      // 将 ChatRound 转换为 ChatPage
      final chatPages = branchPath.map((round) => ChatPage(round: round)).toList();
      state = state.copyWith(
        session: session,
        currentRoundId: currentRoundId,
        pageList: ChatPageList.fromPages(chatPages, _currentPageIndex),
        error: null,
        isLoading: false,
      );
      // 确保当前轮次的数据已加载到流式缓存
      if (currentRoundId != null && branchPath.isNotEmpty) {
        final round = branchPath.last;
        _streamCache.ensureRoundLoaded(fileName, round);
      }
    });
  }
  GlobalStreamCacheNotifier get _streamCache =>
      ref.read(globalStreamCacheProvider.notifier);
  StreamStatus? _getRoundStream(String roundId) {
    final globalMap = ref.read(globalStreamCacheProvider);
    return globalMap[fileName]?[roundId];
  }
  Future<void> ensureRoundLoaded(String roundId) async {
    final session = state.session;
    if (session == null) return;
    final round = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
    if (round == null) return;
    _streamCache.ensureRoundLoaded(fileName, round);
  }
  Future<void> loadSession({String? initialRoundId}) async {
    if (initialRoundId != null) {
      state = state.copyWith(currentRoundId: initialRoundId);
    }
  }
  ModelInfo? _findSelectedModelInfo(AppConfig config) {
    final selectedId = config.selectedModel;
    if (selectedId == null || selectedId.trim().isEmpty) return null;
    final models = config.availableModels ?? const <ModelInfo>[];
    return _firstWhereOrNull(models, (m) => m.id == selectedId);
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
    final session = state.session;
    if (session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }
    try {
      final pendingAttachments = attachments ?? const <PendingAttachment>[];
      final repository = ref.read(conversationRepositoryProvider);
      final configAsync = ref.read(configProvider);
      final config = await ref.read(configRepositoryProvider).getConfig();
      _validateRequestCapability(
        config: config,
        attachments: pendingAttachments,
      );
      final savedAttachments = await AttachmentPreparer.savePendingAttachments(
        repository,
        pendingAttachments,
      );
      // 构建新轮次
      final newRound = ChatRound(
        id: IdGenerator.generate(),
        parentId: state.currentRoundId,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        userContent: content,
        userAttachments: savedAttachments,
        isIncomplete: true,
        hasUnseenUpdate: false,
      );
      // 写入数据库（watch 会自动更新状态）
      await repository.appendRound(fileName, newRound);
      // 设置当前轮次ID，等待 watch 更新后同步
      state = state.copyWith(currentRoundId: newRound.id);
      // 进入流式生成状态
      _streamCache.setRoundStream(
        fileName,
        newRound.id,
        const StreamStatus(
          content: '',
          reasoning: '',
          isStreaming: true,
        ),
      );
      // 触发流式请求
      _handleStreamTask(newRound, session, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }
  Future<void> retryFromRound(String roundId) async {
    final session = state.session;
    if (session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final configAsync = ref.read(configProvider);
      final config = await ref.read(configRepositoryProvider).getConfig();
      final sourceRound = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
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
      final newRound = ChatRound(
        id: IdGenerator.generate(),
        parentId: sourceRound.parentId,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        userContent: sourceRound.userContent,
        userAttachments: sourceRound.userAttachments,
        isIncomplete: true,
        hasUnseenUpdate: false,
      );
      await repository.appendRound(fileName, newRound);
      state = state.copyWith(currentRoundId: newRound.id);
      _streamCache.setRoundStream(
        fileName,
        newRound.id,
        const StreamStatus(
          content: '',
          reasoning: '',
          isStreaming: true,
        ),
      );
      _handleStreamTask(newRound, session, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }
  Future<void> editAndResendFromRound(
    String roundId,
    String newContent, {
    List<PendingAttachment>? attachments,
  }) async {
    final session = state.session;
    if (session == null) {
      state = state.copyWithError('会话未初始化');
      return;
    }
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final configAsync = ref.read(configProvider);
      final config = await ref.read(configRepositoryProvider).getConfig();
      final pendingAttachments = attachments ?? const <PendingAttachment>[];
      _validateRequestCapability(
        config: config,
        attachments: pendingAttachments,
      );
      final sourceRound = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
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
      final mergedAttachments = <Attachment>[
        ...sourceRound.userAttachments,
        ...savedAttachments,
      ];
      final newRound = ChatRound(
        id: IdGenerator.generate(),
        parentId: sourceRound.parentId,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        userContent: newContent,
        userAttachments: mergedAttachments,
        isIncomplete: true,
        hasUnseenUpdate: false,
      );
      await repository.appendRound(fileName, newRound);
      state = state.copyWith(currentRoundId: newRound.id);
      _streamCache.setRoundStream(
        fileName,
        newRound.id,
        const StreamStatus(
          content: '',
          reasoning: '',
          isStreaming: true,
        ),
      );
      _handleStreamTask(newRound, session, config);
    } catch (e) {
      state = state.copyWithError(e.toString());
    }
  }
  Future<void> _handleStreamTask(
    ChatRound round,
    Session session,
    AppConfig config,
  ) async {
    final apiSource = ref.read(remoteApiSourceProvider);
    final repository = ref.read(conversationRepositoryProvider);
    final accumulator = ChatStreamAccumulator();
    var hasError = false;
    String? errorMessage;
    var wasStopped = false;
    try {
      // 构建 API 上下文
      final contextRounds = BranchNavigator.getCurrentBranchPath(session, round.id);
      final apiContext = await ChatContextBuilder.buildFromRounds(
        contextRounds,
        repository,
      );
      final stream = apiSource.chatStream(
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
          // 增量写入数据库（实时保存思考过程）
          if (accumulator.reasoning.isNotEmpty || accumulator.content.isNotEmpty) {
            final updatedRound = round.copyWith(
              assistantThinking: accumulator.reasoning,
              assistantContent: accumulator.content,
              isIncomplete: true,
              hasUnseenUpdate: false,
            );
            await repository.updateRound(fileName, round.id, updatedRound);
          }
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
      // 更新流式缓存
      _streamCache.updateRoundStream(
        fileName,
        round.id,
        content: finalContent,
        reasoning: finalReasoning,
        isStreaming: false,
      );
      // 持久化最终结果
      await _finalizeRoundPersistence(round.id, finalContent, finalReasoning);
      _stoppingRoundIds.remove(round.id);
    }
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
  Future<void> _finalizeRoundPersistence(
    String roundId,
    String content,
    String reasoning,
  ) async {
    final repository = ref.read(conversationRepositoryProvider);
    final session = state.session;
    if (session == null) return;
    // 从 session 中获取原始轮次数据
    final originalRound = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
    if (originalRound == null) return;
    // 使用原始数据更新
    final updatedRound = originalRound.copyWith(
      assistantContent: content.trim().isEmpty ? null : content,
      assistantThinking: reasoning.trim().isEmpty ? null : reasoning,
      isIncomplete: false,
      hasUnseenUpdate: true,
    );
    await repository.updateRound(fileName, roundId, updatedRound);
    // 清理流式缓存
    _streamCache.updateRoundStream(
      fileName,
      roundId,
      isStreaming: false,
    );
  }
  void stopGeneration() {
    if (state.pageList == null || state.pageList!.pages.isEmpty) return;
    final viewingRound = state.pageList!.pages[_currentPageIndex].round;
    final stream = _getRoundStream(viewingRound.id);
    if (stream?.isStreaming != true) return;
    _stoppingRoundIds.add(viewingRound.id);
    final apiSource = ref.read(remoteApiSourceProvider);
    apiSource.cancelRequest(viewingRound.id);
  }
  Future<void> switchBranch(String targetRoundId) async {
    final session = state.session;
    if (session == null) return;
    final newRoundId = BranchNavigator.switchBranch(session, targetRoundId);
    state = state.copyWithCurrentRoundId(newRoundId);
    await ensureRoundLoaded(newRoundId);
  }
  void changePage(int pageIndex) {
    if (state.pageList == null) return;
    final pages = state.pageList!.pages;
    if (!PageUtils.isValidIndex(pageIndex, pages.length)) return;
    final targetPage = pages[pageIndex];
    final newRoundId = targetPage.round.id;
    _currentPageIndex = pageIndex;
    state = state.copyWith(
      currentRoundId: newRoundId,
      pageList: state.pageList!.copyWith(currentPageIndex: pageIndex),
    );
    ensureRoundLoaded(newRoundId);
  }
  Future<void> markRoundSeen(String roundId) async {
    final session = state.session;
    if (session == null) return;
    final target = _firstWhereOrNull(session.rounds, (r) => r.id == roundId);
    if (target == null || !target.hasUnseenUpdate) return;
    // 更新数据库
    final repository = ref.read(conversationRepositoryProvider);
    final updatedRound = target.copyWith(hasUnseenUpdate: false);
    await repository.updateRound(fileName, roundId, updatedRound);
  }
  @override
  void dispose() {
    _sessionSubscription?.cancel();
    super.dispose();
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
    _targetNodeKey = GlobalKey();
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
      if (_treeContainsNodeId(roots, widget.initialFocusRoundId)) {
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
    if (_hasFocused || _targetNodeKey == null) {
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
    return roots.map((e) => e.toJson().toString()).join('|');
  }
  String _buildNodeSignature(TreeNode node) {
    return node.toJson().toString();
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
  /// 完整删除分支节点逻辑，和原有业务逻辑完全一致，仅优化删除性能
  Future<void> _deleteNode(String nodeId) async {
    final repository = ref.read(conversationRepositoryProvider);
    final chatState = ref.read(chatProvider(widget.fileName));
    final session = chatState.session;
    if (session == null) {
      throw Exception('会话未加载');
    }
    // ========== 原有逻辑：构建树、查找要删除的节点 ==========
    final roots = session.rounds.isEmpty
        ? <TreeNode>[]
        : TreeBuilder.buildTree(session.rounds);
    final targetNode = _findTreeNodeById(roots, nodeId);
    if (targetNode == null) {
      throw Exception('未找到要删除的节点');
    }
    // 收集当前节点+所有子节点的ID（原有逻辑不变）
    final idsToDelete = _collectSubtreeIds(targetNode);
    try {
      // ====================== ✅ 新增优化：调用专用批量删除方法，直接删除指定Round，比原来全量覆盖性能提升10倍+ ======================
      // 从fileName中提取sessionId（去掉.json后缀，对应Repository中的_getId逻辑）
      final sessionId = widget.fileName.replaceAll('.json', '');
      // 批量删除要移除的Round，外键自动删除对应附件
      await repository.deleteRounds(sessionId, idsToDelete.toList());
      // ========== 原有逻辑：生成更新后的会话 ==========
      final updatedRounds = session.rounds
          .where((round) => !idsToDelete.contains(round.id))
          .toList();
      final updatedSession = session.copyWith(
        rounds: updatedRounds,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );
      // ========== 原有逻辑：清理孤儿附件+保存会话 ==========
      await repository.saveSessionAndCleanupOrphanAttachments(
        widget.fileName,
        session,
        updatedSession,
      );
      // ========== 原有逻辑：更新Chat状态 ==========
      // ✅ 判断是否删除了当前焦点节点
      final deletedCurrentFocus = idsToDelete.contains(widget.initialFocusRoundId);
      // 直接更新chatNotifier状态，不需要invalidate
      final chatNotifier = ref.read(chatProvider(widget.fileName).notifier);
      chatNotifier.state = chatNotifier.state.copyWith(
        session: updatedSession,
        pageList: deletedCurrentFocus ? null : chatNotifier.state.pageList,
      );
      // 如果删除了当前焦点节点，重新加载会话，让聊天页返回时定位到有效页
      if (deletedCurrentFocus) {
        await chatNotifier.loadSession();
      }
      // ========== 原有逻辑：更新本地树状态 ==========
      if (deletedCurrentFocus) {
        _targetNodeKey = null;
        _hasFocused = true;
      }
      _reloadTree(updatedRounds);
    } catch (e) {
      // 原有异常提示逻辑不变
      await AppToast.show('删除失败：$e');
      rethrow;
    }
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
        if (!_treeContainsNodeId(latestRoots, widget.initialFocusRoundId)) {
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
