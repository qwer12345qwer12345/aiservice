This file is a merged representation of a subset of the codebase, containing specifically included files, combined into a single document by Repomix.

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
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
lib/core/constants/app_constants.dart
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
lib/core/models/generation_event.dart
lib/core/models/generation_event.freezed.dart
lib/core/models/model_info.dart
lib/core/models/model_info.freezed.dart
lib/core/models/model_info.g.dart
lib/core/models/session.dart
lib/core/models/session.freezed.dart
lib/core/models/session.g.dart
lib/core/models/sse_event.dart
lib/core/utils/sse_parser.dart
lib/data/data_sources/api_builders/api_request_builder.dart
lib/data/data_sources/api_builders/chat_completions_api_builder.dart
lib/data/data_sources/api_builders/google_api_builder.dart
lib/data/data_sources/api_builders/model_info_parser.dart
lib/data/data_sources/api_builders/responses_api_builder.dart
lib/data/data_sources/chat_source_router.dart
lib/data/data_sources/chat_source.dart
lib/data/data_sources/local_chat_source.dart
lib/data/data_sources/local_file_source.dart
lib/data/data_sources/remote_chat_source.dart
lib/data/data_sources/sse_event_decoder.dart
lib/data/database/database.dart
lib/data/database/database.g.dart
lib/data/repositories/conversation_repository.dart
lib/data/services/config_service.dart
lib/di/providers.dart
lib/domain/models/session_card_meta.dart
lib/domain/models/session_list_item.dart
lib/domain/models/tree_node.dart
lib/domain/models/tree_node.freezed.dart
lib/domain/models/tree_node.g.dart
lib/domain/services/attachment_preparer.dart
lib/domain/services/character_card_parser.dart
lib/domain/services/chat_context_builder.dart
lib/domain/services/chat_generation_service.dart
lib/domain/services/chat_service.dart
lib/domain/services/stream_processor.dart
lib/domain/services/tree_builder.dart
lib/main.dart
lib/presentation/models/input_state.dart
lib/presentation/models/input_state.freezed.dart
lib/presentation/models/pending_attachment.dart
lib/presentation/pages/branch_tree_page.dart
lib/presentation/pages/chat_page.dart
lib/presentation/pages/home_page.dart
lib/presentation/pages/image_attachment_viewer_page.dart
lib/presentation/pages/settings_page.dart
lib/presentation/pages/text_attachment_viewer_page.dart
lib/presentation/providers/attachment_bytes_provider.dart
lib/presentation/providers/character_provider.dart
lib/presentation/providers/chat_notifier.dart
lib/presentation/providers/config_notifier.dart
lib/presentation/providers/input_notifier.dart
lib/presentation/providers/session_list_notifier.dart
lib/presentation/providers/settings_form_notifier.dart
lib/presentation/widgets/attachment_list.dart
lib/presentation/widgets/common/app_page_scaffold.dart
lib/presentation/widgets/common/app_toast.dart
lib/presentation/widgets/common/declarative_text_field.dart
lib/presentation/widgets/input_bar.dart
lib/presentation/widgets/markdown_parser.dart
lib/presentation/widgets/markdown_widget.dart
lib/presentation/widgets/message_bubble.dart
lib/presentation/widgets/thought_bubble.dart
```

# Files

## File: lib/core/models/api_message.dart
````dart
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
````

## File: lib/core/models/api_message.freezed.dart
````dart
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
````

## File: lib/core/models/api_message.g.dart
````dart
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
````

## File: lib/core/models/app_config_store.dart
````dart
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
````

## File: lib/core/models/app_config_store.freezed.dart
````dart
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
````

## File: lib/core/models/app_config_store.g.dart
````dart
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
````

## File: lib/core/models/app_config.dart
````dart
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
````

## File: lib/core/models/app_config.freezed.dart
````dart
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
````

## File: lib/core/models/app_config.g.dart
````dart
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
````

## File: lib/core/models/attachment.dart
````dart
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
````

## File: lib/core/models/attachment.freezed.dart
````dart
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
````

## File: lib/core/models/attachment.g.dart
````dart
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
````

## File: lib/core/models/chat_chunk.dart
````dart
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
````

## File: lib/core/models/chat_chunk.freezed.dart
````dart
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
````

## File: lib/core/models/generation_event.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_event.freezed.dart';

/// 生成过程中的统一事件
@freezed
class GenerationEvent with _$GenerationEvent {
  const factory GenerationEvent.partial({
    required String content,
    required String reasoning,
  }) = PartialGeneration;

  const factory GenerationEvent.completed({
    required String content,
    required String reasoning,
  }) = CompletedGeneration;

  const factory GenerationEvent.failed({
    required String error,
  }) = FailedGeneration;
}
````

## File: lib/core/models/generation_event.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GenerationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content, String reasoning) partial,
    required TResult Function(String content, String reasoning) completed,
    required TResult Function(String error) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PartialGeneration value) partial,
    required TResult Function(CompletedGeneration value) completed,
    required TResult Function(FailedGeneration value) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PartialGeneration value)? partial,
    TResult? Function(CompletedGeneration value)? completed,
    TResult? Function(FailedGeneration value)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PartialGeneration value)? partial,
    TResult Function(CompletedGeneration value)? completed,
    TResult Function(FailedGeneration value)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationEventCopyWith<$Res> {
  factory $GenerationEventCopyWith(
    GenerationEvent value,
    $Res Function(GenerationEvent) then,
  ) = _$GenerationEventCopyWithImpl<$Res, GenerationEvent>;
}

/// @nodoc
class _$GenerationEventCopyWithImpl<$Res, $Val extends GenerationEvent>
    implements $GenerationEventCopyWith<$Res> {
  _$GenerationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PartialGenerationImplCopyWith<$Res> {
  factory _$$PartialGenerationImplCopyWith(
    _$PartialGenerationImpl value,
    $Res Function(_$PartialGenerationImpl) then,
  ) = __$$PartialGenerationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content, String reasoning});
}

/// @nodoc
class __$$PartialGenerationImplCopyWithImpl<$Res>
    extends _$GenerationEventCopyWithImpl<$Res, _$PartialGenerationImpl>
    implements _$$PartialGenerationImplCopyWith<$Res> {
  __$$PartialGenerationImplCopyWithImpl(
    _$PartialGenerationImpl _value,
    $Res Function(_$PartialGenerationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? reasoning = null}) {
    return _then(
      _$PartialGenerationImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        reasoning: null == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PartialGenerationImpl implements PartialGeneration {
  const _$PartialGenerationImpl({
    required this.content,
    required this.reasoning,
  });

  @override
  final String content;
  @override
  final String reasoning;

  @override
  String toString() {
    return 'GenerationEvent.partial(content: $content, reasoning: $reasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartialGenerationImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, reasoning);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartialGenerationImplCopyWith<_$PartialGenerationImpl> get copyWith =>
      __$$PartialGenerationImplCopyWithImpl<_$PartialGenerationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content, String reasoning) partial,
    required TResult Function(String content, String reasoning) completed,
    required TResult Function(String error) failed,
  }) {
    return partial(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error)? failed,
  }) {
    return partial?.call(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (partial != null) {
      return partial(content, reasoning);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PartialGeneration value) partial,
    required TResult Function(CompletedGeneration value) completed,
    required TResult Function(FailedGeneration value) failed,
  }) {
    return partial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PartialGeneration value)? partial,
    TResult? Function(CompletedGeneration value)? completed,
    TResult? Function(FailedGeneration value)? failed,
  }) {
    return partial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PartialGeneration value)? partial,
    TResult Function(CompletedGeneration value)? completed,
    TResult Function(FailedGeneration value)? failed,
    required TResult orElse(),
  }) {
    if (partial != null) {
      return partial(this);
    }
    return orElse();
  }
}

abstract class PartialGeneration implements GenerationEvent {
  const factory PartialGeneration({
    required final String content,
    required final String reasoning,
  }) = _$PartialGenerationImpl;

  String get content;
  String get reasoning;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartialGenerationImplCopyWith<_$PartialGenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompletedGenerationImplCopyWith<$Res> {
  factory _$$CompletedGenerationImplCopyWith(
    _$CompletedGenerationImpl value,
    $Res Function(_$CompletedGenerationImpl) then,
  ) = __$$CompletedGenerationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content, String reasoning});
}

/// @nodoc
class __$$CompletedGenerationImplCopyWithImpl<$Res>
    extends _$GenerationEventCopyWithImpl<$Res, _$CompletedGenerationImpl>
    implements _$$CompletedGenerationImplCopyWith<$Res> {
  __$$CompletedGenerationImplCopyWithImpl(
    _$CompletedGenerationImpl _value,
    $Res Function(_$CompletedGenerationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? reasoning = null}) {
    return _then(
      _$CompletedGenerationImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        reasoning: null == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CompletedGenerationImpl implements CompletedGeneration {
  const _$CompletedGenerationImpl({
    required this.content,
    required this.reasoning,
  });

  @override
  final String content;
  @override
  final String reasoning;

  @override
  String toString() {
    return 'GenerationEvent.completed(content: $content, reasoning: $reasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletedGenerationImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, reasoning);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletedGenerationImplCopyWith<_$CompletedGenerationImpl> get copyWith =>
      __$$CompletedGenerationImplCopyWithImpl<_$CompletedGenerationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content, String reasoning) partial,
    required TResult Function(String content, String reasoning) completed,
    required TResult Function(String error) failed,
  }) {
    return completed(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error)? failed,
  }) {
    return completed?.call(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(content, reasoning);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PartialGeneration value) partial,
    required TResult Function(CompletedGeneration value) completed,
    required TResult Function(FailedGeneration value) failed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PartialGeneration value)? partial,
    TResult? Function(CompletedGeneration value)? completed,
    TResult? Function(FailedGeneration value)? failed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PartialGeneration value)? partial,
    TResult Function(CompletedGeneration value)? completed,
    TResult Function(FailedGeneration value)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class CompletedGeneration implements GenerationEvent {
  const factory CompletedGeneration({
    required final String content,
    required final String reasoning,
  }) = _$CompletedGenerationImpl;

  String get content;
  String get reasoning;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompletedGenerationImplCopyWith<_$CompletedGenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedGenerationImplCopyWith<$Res> {
  factory _$$FailedGenerationImplCopyWith(
    _$FailedGenerationImpl value,
    $Res Function(_$FailedGenerationImpl) then,
  ) = __$$FailedGenerationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailedGenerationImplCopyWithImpl<$Res>
    extends _$GenerationEventCopyWithImpl<$Res, _$FailedGenerationImpl>
    implements _$$FailedGenerationImplCopyWith<$Res> {
  __$$FailedGenerationImplCopyWithImpl(
    _$FailedGenerationImpl _value,
    $Res Function(_$FailedGenerationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$FailedGenerationImpl(
        error: null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FailedGenerationImpl implements FailedGeneration {
  const _$FailedGenerationImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GenerationEvent.failed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedGenerationImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedGenerationImplCopyWith<_$FailedGenerationImpl> get copyWith =>
      __$$FailedGenerationImplCopyWithImpl<_$FailedGenerationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content, String reasoning) partial,
    required TResult Function(String content, String reasoning) completed,
    required TResult Function(String error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PartialGeneration value) partial,
    required TResult Function(CompletedGeneration value) completed,
    required TResult Function(FailedGeneration value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PartialGeneration value)? partial,
    TResult? Function(CompletedGeneration value)? completed,
    TResult? Function(FailedGeneration value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PartialGeneration value)? partial,
    TResult Function(CompletedGeneration value)? completed,
    TResult Function(FailedGeneration value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailedGeneration implements GenerationEvent {
  const factory FailedGeneration({required final String error}) =
      _$FailedGenerationImpl;

  String get error;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedGenerationImplCopyWith<_$FailedGenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/core/utils/sse_parser.dart
````dart
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
````

## File: lib/data/data_sources/api_builders/api_request_builder.dart
````dart
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class ApiUriUtils {
  static Uri buildNormalizedUri(String base, String path) {
    final normalizedBase = base.trim().replaceAll(RegExp(r'/+$'), '');
    final normalizedPath = path.trim().replaceAll(RegExp(r'^/+'), '');
    return Uri.parse('$normalizedBase/$normalizedPath');
  }
}

/// 构建请求所需的上下文
class ApiBuildContext {
  final String model;
  final List<ApiMessage> context;
  final bool enableReasoning;
  final String apiKey;
  final String baseUrl;
  final String chatPath;
  final String modelsPath;

  ApiBuildContext({
    required this.model,
    required this.context,
    required this.enableReasoning,
    required this.apiKey,
    required this.baseUrl,
    required this.chatPath,
    required this.modelsPath,
  });
}

/// API 请求构建器接口
abstract class ApiRequestBuilder {
  /// 构建请求 Headers
  Map<String, String> buildHeaders(ApiBuildContext ctx);

  /// 构建请求 URI
  Uri buildUri(ApiBuildContext ctx);
  Uri buildModelsUri(ApiBuildContext ctx);
  
  /// 构建请求 Body
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx);

  /// 解析模型列表响应
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json);
}
````

## File: lib/data/data_sources/chat_source_router.dart
````dart
import '../../core/models/app_config.dart';
import 'chat_source.dart';
import 'local_chat_source.dart';
import 'remote_chat_source.dart';

class ChatSourceRouter {
  final RemoteChatSource remote;
  final LocalChatSource local;

  ChatSourceRouter(this.remote, this.local);

  ChatSource getSource(String apiMode) {
    return apiMode == 'local' ? local : remote;
  }
  
  ChatSource getSourceFromConfig(AppConfig config) {
    return getSource(config.apiMode);
  }
}
````

## File: lib/data/data_sources/chat_source.dart
````dart
import '../../core/models/app_config.dart';
import '../../core/models/api_message.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/models/model_info.dart';

abstract class ChatSource {
  Future<List<ModelInfo>> fetchModels(AppConfig config);
  Stream<ChatChunk> chatStream({
    required AppConfig config,
    required List<ApiMessage> context,
  });
}
````

## File: lib/data/data_sources/local_chat_source.dart
````dart
import 'dart:async';
import 'package:flutter_llama/flutter_llama.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/models/model_info.dart';
import 'chat_source.dart';

class LocalChatSource implements ChatSource {
  static final FlutterLlama _llama = FlutterLlama.instance;
  static String? _loadedModelPath;
  static bool _isLoaded = false;

  @override
  Future<List<ModelInfo>> fetchModels(AppConfig config) async {
    return []; 
  }

  @override
  Stream<ChatChunk> chatStream({
    required AppConfig config,
    required List<ApiMessage> context,
  }) async* {
    final modelPath = config.selectedModel?.trim() ?? '';
    if (modelPath.isEmpty) {
      yield const ChatChunk(isDone: true, error: '未选择本地模型');
      return;
    }

    final prompt = _buildPromptFromContext(context);

    if (!_isLoaded || _loadedModelPath != modelPath) {
      if (_isLoaded) await _llama.unloadModel();
      try {
        final loadConfig = LlamaConfig(
          modelPath: modelPath,
          nThreads: 4,
          nGpuLayers: -1,
          contextSize: 16384,
          batchSize: 512,
          useGpu: true,
          verbose: false,
        );
        final success = await _llama.loadModel(loadConfig);
        if (!success) {
          yield const ChatChunk(isDone: true, error: '模型加载失败');
          return;
        }
        _isLoaded = true;
        _loadedModelPath = modelPath;
      } catch (e) {
        yield ChatChunk(isDone: true, error: '加载模型异常：$e');
        return;
      }
    }

    final params = GenerationParams(prompt: prompt);
    try {
      await for (final token in _llama.generateStream(params)) {
        yield ChatChunk(content: token, isDone: false);
      }
      yield const ChatChunk(isDone: true);
    } catch (e) {
      yield ChatChunk(isDone: true, error: '生成失败：$e');
    }
  }

  String _buildPromptFromContext(List<ApiMessage> context) {
    final buffer = StringBuffer();
    int round = 0;
    for (final msg in context) {
      if (msg.role == 'user') {
        round++;
        String text = msg.content ?? '';
        if (text.isEmpty && msg.parts.isNotEmpty) {
          final textParts = msg.parts.whereType<ApiMessageTextPart>();
          text = textParts.map((p) => p.text).join('\n');
        }
        if (text.isNotEmpty) {
          buffer.writeln('User $round: $text');
        }
      } else if (msg.role == 'assistant') {
        String text = msg.content ?? '';
        if (text.isNotEmpty) {
          buffer.writeln('Assistant $round: $text');
        }
      }
    }
    buffer.write('Assistant $round: ');
    return buffer.toString();
  }
}
````

## File: lib/data/data_sources/remote_chat_source.dart
````dart
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import '../../core/models/model_info.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/utils/sse_parser.dart';
import 'chat_source.dart';
import 'sse_event_decoder.dart';
import 'api_builders/api_request_builder.dart';
import 'api_builders/google_api_builder.dart';
import 'api_builders/chat_completions_api_builder.dart';
import 'api_builders/responses_api_builder.dart';

class RemoteChatSource implements ChatSource {
  ApiRequestBuilder _getBuilder(String apiMode) {
    switch (apiMode) {
      case 'google':
        return GoogleApiBuilder();
      case 'responses':
        return ResponsesApiBuilder();
      case 'chat_completions':
      default:
        return ChatCompletionsApiBuilder();
    }
  }

  @override
  Future<List<ModelInfo>> fetchModels(AppConfig config) async {
    final builder = _getBuilder(config.apiMode);
    final ctx = ApiBuildContext(
      model: '',
      context: [],
      enableReasoning: false,
      apiKey: config.apiKey,
      baseUrl: config.baseUrl,
      chatPath: '',
      modelsPath: config.modelsPath,
    );

    final url = builder.buildModelsUri(ctx);
    final response = await http.get(url, headers: builder.buildHeaders(ctx));

    if (response.statusCode != 200) {
      throw Exception('获取模型列表失败：${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return builder.parseModelsResponse(json);
  }

  @override
  Stream<ChatChunk> chatStream({
    required AppConfig config,
    required List<ApiMessage> context,
  }) async* {
    final client = http.Client();
    try {
      final apiMode = config.apiMode.trim();
      final selectedId = config.selectedModel;
      final selectedModel = config.availableModels?.firstWhereOrNull((m) => m.id == selectedId);
      final enableReasoning = selectedModel?.overrideSupportsReasoning == true;
      final model = config.selectedModel?.trim() ?? '';

      if (config.baseUrl.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'Base URL 为空'); return;
      }
      if (config.apiKey.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'API Key 为空'); return;
      }
      if (config.chatPath.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'Chat Path 为空'); return;
      }
      if (model.isEmpty) {
        yield const ChatChunk(isDone: true, error: '未选择模型'); return;
      }

      final builder = _getBuilder(apiMode);
      String resolvedChatPath = config.chatPath.trim();
      if (resolvedChatPath.contains('{model}')) {
        resolvedChatPath = resolvedChatPath.replaceAll('{model}', model);
      }

      final ctx = ApiBuildContext(
        model: model, context: context, enableReasoning: enableReasoning,
        apiKey: config.apiKey.trim(), baseUrl: config.baseUrl.trim(),
        chatPath: resolvedChatPath, modelsPath: config.modelsPath.trim(),
      );

      final uri = builder.buildUri(ctx);
      final requestBody = builder.buildRequestBody(ctx);

      final request = http.Request('POST', uri)
        ..headers.addAll(builder.buildHeaders(ctx))
        ..headers.addAll({'Accept': 'text/event-stream', 'Cache-Control': 'no-cache'})
        ..body = jsonEncode(requestBody);

      final streamedResponse = await client.send(request);

      if (streamedResponse.statusCode < 200 || streamedResponse.statusCode >= 300) {
        final errorBody = await streamedResponse.stream.bytesToString();
        throw Exception('${streamedResponse.statusCode} $errorBody');
      }

      final parser = SseParser();
      final stream = streamedResponse.stream.transform(utf8.decoder);

      await for (final rawChunk in stream) {
        final events = parser.addChunk(rawChunk);
        for (final event in events) {
          try {
            final decoded = SseEventDecoder.decode(apiMode: apiMode, event: event);
            if (decoded == null) continue;
            yield decoded;
            if (decoded.isDone) return;
          } catch (_) {}
        }
      }

      final lastEvent = parser.close();
      if (lastEvent != null) {
        try {
          final decoded = SseEventDecoder.decode(apiMode: apiMode, event: lastEvent);
          if (decoded != null) {
            yield decoded;
            if (decoded.isDone) return;
          }
        } catch (_) {}
      }
      yield const ChatChunk(isDone: true);
    } catch (e) {
      yield ChatChunk(isDone: true, error: '$e');
    } finally {
      client.close();
    }
  }
}
````

## File: lib/data/database/database.dart
````dart
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
````

## File: lib/data/database/database.g.dart
````dart
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
````

## File: lib/domain/services/stream_processor.dart
````dart
import 'dart:async';
import '../../core/models/chat_chunk.dart';
import '../../core/models/generation_event.dart';

/// 流处理器
///
/// 职责：
/// - 累加 content 和 reasoning
/// - 节流输出 partial 事件
/// - 映射错误和完成状态
/// - 纯逻辑，无副作用，易于测试
class StreamProcessor {
  final Duration throttleInterval;

  StreamProcessor({this.throttleInterval = const Duration(seconds: 1)});

  /// 处理输入流并输出生成事件流
  Stream<GenerationEvent> process(Stream<ChatChunk> input) async* {
    final contentBuffer = StringBuffer();
    final reasoningBuffer = StringBuffer();
    String? error;
    DateTime? lastEmitTime;

    // 辅助函数：检查是否需要节流输出
    bool shouldEmit() {
      final now = DateTime.now();
      if (lastEmitTime == null) {
        lastEmitTime = now;
        return true;
      }
      if (now.difference(lastEmitTime!) >= throttleInterval) {
        lastEmitTime = now;
        return true;
      }
      return false;
    }

    try {
      await for (final chunk in input) {
        // 错误处理
        if (chunk.error != null) {
          error = chunk.error;
          break;
        }

        // 累加数据
        if (chunk.content != null) {
          contentBuffer.write(chunk.content);
        }
        if (chunk.reasoningContent != null) {
          reasoningBuffer.write(chunk.reasoningContent);
        }

        // 节流输出
        if (shouldEmit()) {
          yield GenerationEvent.partial(
            content: contentBuffer.toString(),
            reasoning: reasoningBuffer.toString(),
          );
        }

        // 完成处理
        if (chunk.isDone) {
          break;
        }
      }

      // 最终输出
      if (error != null) {
        yield GenerationEvent.failed(error: error);
      } else {
        yield GenerationEvent.completed(
          content: contentBuffer.toString(),
          reasoning: reasoningBuffer.toString(),
        );
      }
    } catch (e) {
      yield GenerationEvent.failed(error: e.toString());
    }
  }
}
````

## File: lib/presentation/models/input_state.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'pending_attachment.dart';

part 'input_state.freezed.dart';

@freezed
class InputState with _$InputState {
  const factory InputState({
    /// 输入框文本
    @Default('') String text,

    /// 附件列表
    @Default([]) List<PendingAttachment> attachments,
  }) = _InputState;
}

/// 扩展方法：计算是否允许发送
extension InputStateX on InputState {
  bool get canSend => text.trim().isNotEmpty || attachments.isNotEmpty;
}
````

## File: lib/presentation/models/input_state.freezed.dart
````dart
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$InputState {
  /// 输入框文本
  String get text => throw _privateConstructorUsedError;

  /// 附件列表
  List<PendingAttachment> get attachments => throw _privateConstructorUsedError;

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputStateCopyWith<InputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputStateCopyWith<$Res> {
  factory $InputStateCopyWith(
    InputState value,
    $Res Function(InputState) then,
  ) = _$InputStateCopyWithImpl<$Res, InputState>;
  @useResult
  $Res call({String text, List<PendingAttachment> attachments});
}

/// @nodoc
class _$InputStateCopyWithImpl<$Res, $Val extends InputState>
    implements $InputStateCopyWith<$Res> {
  _$InputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? attachments = null}) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            attachments: null == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                      as List<PendingAttachment>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InputStateImplCopyWith<$Res>
    implements $InputStateCopyWith<$Res> {
  factory _$$InputStateImplCopyWith(
    _$InputStateImpl value,
    $Res Function(_$InputStateImpl) then,
  ) = __$$InputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, List<PendingAttachment> attachments});
}

/// @nodoc
class __$$InputStateImplCopyWithImpl<$Res>
    extends _$InputStateCopyWithImpl<$Res, _$InputStateImpl>
    implements _$$InputStateImplCopyWith<$Res> {
  __$$InputStateImplCopyWithImpl(
    _$InputStateImpl _value,
    $Res Function(_$InputStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? attachments = null}) {
    return _then(
      _$InputStateImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        attachments: null == attachments
            ? _value._attachments
            : attachments // ignore: cast_nullable_to_non_nullable
                  as List<PendingAttachment>,
      ),
    );
  }
}

/// @nodoc

class _$InputStateImpl implements _InputState {
  const _$InputStateImpl({
    this.text = '',
    final List<PendingAttachment> attachments = const [],
  }) : _attachments = attachments;

  /// 输入框文本
  @override
  @JsonKey()
  final String text;

  /// 附件列表
  final List<PendingAttachment> _attachments;

  /// 附件列表
  @override
  @JsonKey()
  List<PendingAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'InputState(text: $text, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputStateImpl &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    text,
    const DeepCollectionEquality().hash(_attachments),
  );

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputStateImplCopyWith<_$InputStateImpl> get copyWith =>
      __$$InputStateImplCopyWithImpl<_$InputStateImpl>(this, _$identity);
}

abstract class _InputState implements InputState {
  const factory _InputState({
    final String text,
    final List<PendingAttachment> attachments,
  }) = _$InputStateImpl;

  /// 输入框文本
  @override
  String get text;

  /// 附件列表
  @override
  List<PendingAttachment> get attachments;

  /// Create a copy of InputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputStateImplCopyWith<_$InputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
````

## File: lib/presentation/models/pending_attachment.dart
````dart
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
````

## File: lib/presentation/providers/character_provider.dart
````dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/services/character_card_parser.dart';

/// 当前会话激活的角色（可为 null）
final currentCharacterProvider = StateProvider<CharacterData?>((ref) => null);

/// 角色开场白是否已发送（避免重复发送）
final characterGreetingSentProvider = StateProvider<bool>((ref) => false);
````

## File: lib/presentation/widgets/common/declarative_text_field.dart
````dart
import 'package:flutter/cupertino.dart';

/// 声明式受控文本输入框
/// 自动与外部 value 同步，无需手动管理 TextEditingController
class DeclarativeCupertinoTextField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final String? placeholder;
  final TextInputType? keyboardType;
  final bool obscureText;

  const DeclarativeCupertinoTextField({
    super.key,
    required this.value,
    required this.onChanged,
    this.placeholder,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  State<DeclarativeCupertinoTextField> createState() => _DeclarativeCupertinoTextFieldState();
}

class _DeclarativeCupertinoTextFieldState extends State<DeclarativeCupertinoTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(DeclarativeCupertinoTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      final selection = _controller.selection;
      _controller.text = widget.value;
      // 尽量保持光标位置
      if (selection.isValid && selection.baseOffset <= widget.value.length) {
        _controller.selection = selection;
      } else {
        _controller.selection = TextSelection.collapsed(offset: widget.value.length);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _controller,
      placeholder: widget.placeholder,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
    );
  }
}
````

## File: lib/presentation/widgets/markdown_parser.dart
````dart
/// Markdown 块级节点类型
enum MarkdownBlockType {
  heading,
  paragraph,
  code,
  table,
}

/// 内联元素类型
enum InlineType { text, bold }

/// 内联片段
class InlineSpan {
  final InlineType type;
  final String text;

  const InlineSpan(this.type, this.text);
}

/// 表格行
class TableRowData {
  final List<String> cells;
  TableRowData(this.cells);
}

/// 块级节点
class MarkdownBlock {
  final MarkdownBlockType type;
  final int? level; // 标题级别 1-6
  final String? text; // 段落/标题/代码的文本内容
  final String? codeLanguage;
  final List<TableRowData>? tableRows; // 表格数据，第一行为表头

  MarkdownBlock.heading(this.level, this.text)
      : type = MarkdownBlockType.heading,
        codeLanguage = null,
        tableRows = null;

  MarkdownBlock.paragraph(this.text)
      : type = MarkdownBlockType.paragraph,
        level = null,
        codeLanguage = null,
        tableRows = null;

  MarkdownBlock.code(this.text, {this.codeLanguage})
      : type = MarkdownBlockType.code,
        level = null,
        tableRows = null;

  MarkdownBlock.table(this.tableRows)
      : type = MarkdownBlockType.table,
        level = null,
        text = null,
        codeLanguage = null;
}

/// Markdown 解析器（仅支持标题、粗体、代码块、表格）
class MarkdownParser {
  /// 解析完整文本
  static List<MarkdownBlock> parse(String data) {
    final lines = data.split('\n');
    final blocks = <MarkdownBlock>[];
    int i = 0;
    final n = lines.length;

    while (i < n) {
      final line = lines[i];
      // 空行跳过
      if (line.trim().isEmpty) {
        i++;
        continue;
      }

      // 标题
      final headingMatch = RegExp(r'^(#{1,6})\s+(.*)$').firstMatch(line);
      if (headingMatch != null) {
        final level = headingMatch.group(1)!.length;
        final text = headingMatch.group(2)!;
        blocks.add(MarkdownBlock.heading(level, text));
        i++;
        continue;
      }

      // 代码块
      if (line.trim().startsWith('```')) {
        final lang = line.trim().substring(3).trim();
        final codeLines = <String>[];
        i++;
        while (i < n && !lines[i].trim().startsWith('```')) {
          codeLines.add(lines[i]);
          i++;
        }
        i++; // 跳过结束 ```
        final codeText = codeLines.join('\n');
        blocks.add(MarkdownBlock.code(codeText, codeLanguage: lang.isEmpty ? null : lang));
        continue;
      }

      // 表格：以 | 开头和结尾的行，且下一行是分隔行（|---|...）或者连续收集
      if (line.trim().startsWith('|') && line.trim().endsWith('|')) {
        final tableLines = <String>[];
        // 收集所有表格行直到遇到空行或非表格行
        while (i < n && lines[i].trim().startsWith('|') && lines[i].trim().endsWith('|')) {
          tableLines.add(lines[i].trim());
          i++;
        }
        final rows = _parseTable(tableLines);
        if (rows != null && rows.isNotEmpty) {
          blocks.add(MarkdownBlock.table(rows));
        }
        continue;
      }

      // 普通段落
      blocks.add(MarkdownBlock.paragraph(line));
      i++;
    }

    return blocks;
  }

  /// 解析表格，返回行列表（第一行为表头）
  static List<TableRowData>? _parseTable(List<String> lines) {
    if (lines.length < 2) return null;

    // 分隔行校验
    final separatorLine = lines[1];
    if (!_isTableSeparator(separatorLine)) return null;

    final rows = <TableRowData>[];
    // 表头
    rows.add(TableRowData(_splitTableRow(lines[0])));
    // 数据行
    for (int i = 2; i < lines.length; i++) {
      rows.add(TableRowData(_splitTableRow(lines[i])));
    }
    return rows;
  }

  static bool _isTableSeparator(String line) {
    return RegExp(r'^\|[\s\-:|]+\|$').hasMatch(line);
  }

  static List<String> _splitTableRow(String line) {
    // 去掉首尾的 |，然后按 | 分割
    final trimmed = line.substring(1, line.length - 1);
    return trimmed.split('|').map((s) => s.trim()).toList();
  }

  /// 解析内联格式（粗体、斜体），返回 InlineSpan 列表
  static List<InlineSpan> parseInline(String text) {
    final spans = <InlineSpan>[];
    final buffer = StringBuffer();
    bool inBold = false;
    int i = 0;
    final len = text.length;

    while (i < len) {
      // 粗体 **
      if (i + 1 < len && text[i] == '*' && text[i + 1] == '*') {
        _flushBuffer(buffer, spans, inBold);
        inBold = !inBold;
        i += 2;
        continue;
      }
      buffer.write(text[i]);
      i++;
    }
    _flushBuffer(buffer, spans, inBold);
    return spans;
  }

  static void _flushBuffer(StringBuffer buffer, List<InlineSpan> spans, bool inBold) {
    if (buffer.isEmpty) return;
    final text = buffer.toString();
    buffer.clear();
    if (inBold) {
      spans.add(InlineSpan(InlineType.bold, text));
    } 
    else {
      spans.add(InlineSpan(InlineType.text, text));
    }
  }
}
````

## File: lib/presentation/widgets/markdown_widget.dart
````dart
import 'package:flutter/cupertino.dart';
import 'markdown_parser.dart';

class MarkdownWidget extends StatelessWidget {
  final String data;
  final TextStyle? baseStyle;

  const MarkdownWidget({super.key, required this.data, this.baseStyle});

  @override
  Widget build(BuildContext context) {
    final blocks = MarkdownParser.parse(data);
    final theme = CupertinoTheme.of(context);
    final defaultStyle = baseStyle ?? theme.textTheme.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: blocks.map((block) => _buildBlock(block, defaultStyle, theme, context)).toList(),
    );
  }

  Widget _buildBlock(
    MarkdownBlock block, 
    TextStyle defaultStyle, 
    CupertinoThemeData theme, 
    BuildContext context) {
    switch (block.type) {
      case MarkdownBlockType.heading:
        final level = block.level ?? 1;
        double fontSizeFactor;
        switch (level) {
          case 1:
            fontSizeFactor = 1.8;
            break;
          case 2:
            fontSizeFactor = 1.6;
            break;
          case 3:
            fontSizeFactor = 1.4;
            break;
          default:
            fontSizeFactor = 1.2;
        }
        final style = defaultStyle.copyWith(
          fontSize: theme.textTheme.textStyle.fontSize! * fontSizeFactor,
        );
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: _buildRichText(block.text ?? '', style),
        );

      case MarkdownBlockType.paragraph:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: _buildRichText(block.text ?? '', defaultStyle),
        );

      case MarkdownBlockType.code:
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              block.text ?? '',
              style: defaultStyle.copyWith(
                fontFamily: 'monospace',
                fontSize: 13,
              ),
            ),
          ),
        );

      case MarkdownBlockType.table:
        final rows = block.tableRows;
        if (rows == null || rows.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Table(
            border: TableBorder.all(color: CupertinoDynamicColor.resolve(CupertinoColors.separator, context)),
            children: rows.map((row) {
              final isHeader = rows.indexOf(row) == 0;
              return TableRow(
                decoration: BoxDecoration(
                  color: isHeader ? CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context) : null, // 修改这里
                ),
                children: row.cells.map((cell) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: isHeader
                        ? _buildRichText(cell, defaultStyle)
                        : _buildRichText(cell, defaultStyle),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        );
    }
  }

  Widget _buildRichText(String text, TextStyle baseStyle) {
    final spans = MarkdownParser.parseInline(text);
    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: spans.map((span) {
          TextStyle style = baseStyle;
          if (span.type == InlineType.bold) {
            style = baseStyle.copyWith(fontWeight: FontWeight.bold);
          }
          return TextSpan(text: span.text, style: style);
        }).toList(),
      ),
    );
  }
}
````

## File: lib/core/models/chat_round.dart
````dart
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
````

## File: lib/core/models/chat_round.freezed.dart
````dart
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
````

## File: lib/core/models/chat_round.g.dart
````dart
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
````

## File: lib/core/models/session.dart
````dart
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
````

## File: lib/core/models/session.freezed.dart
````dart
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
````

## File: lib/core/models/session.g.dart
````dart
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
````

## File: lib/data/data_sources/api_builders/chat_completions_api_builder.dart
````dart
import 'package:aiservice/data/data_sources/api_builders/model_info_parser.dart';

import 'api_request_builder.dart';
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class ChatCompletionsApiBuilder implements ApiRequestBuilder {
  @override
  Map<String, String> buildHeaders(ApiBuildContext ctx) {
    return {
      'Authorization': 'Bearer ${ctx.apiKey}',
      'Content-Type': 'application/json',
    };
  }

  @override
  Uri buildUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.chatPath);
  }

  @override
  Uri buildModelsUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath);
  }
  
  @override
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx) {
    return {
      'model': ctx.model,
      'messages': _buildMessages(ctx.context),
      'stream': true,
      if (ctx.enableReasoning) 'reasoning_effort': 'medium',
    };
  }

  @override
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    return ModelInfoParser.parseModelsResponse(json);
  }

  List<Map<String, dynamic>> _buildMessages(List<ApiMessage> context) {
    return context.map(_buildMessage).toList();
  }

  Map<String, dynamic> _buildMessage(ApiMessage message) {
    if (message.role == 'assistant') {
      final result = <String, dynamic>{
        'role': 'assistant',
        'content': message.content ?? '',
      };
      if ((message.reasoning ?? '').trim().isNotEmpty) {
        result['reasoning_content'] = message.reasoning;
      }
      return result;
    }

    if (message.parts.isEmpty) {
      return {
        'role': message.role,
        'content': message.content ?? '',
      };
    }

    return {
      'role': message.role,
      'content': message.parts.map((part) => part.when(
            text: (type, text) => {'type': 'text', 'text': text},
            imageUrl: (type, imageUrl) => {
              'type': 'image_url',
              'image_url': {'url': imageUrl.url},
            },
          )).toList(),
    };
  }
}
````

## File: lib/data/data_sources/api_builders/google_api_builder.dart
````dart
import 'api_request_builder.dart';
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class GoogleApiBuilder implements ApiRequestBuilder {
  @override
  Map<String, String> buildHeaders(ApiBuildContext ctx) {
    return {
      'x-goog-api-key': ctx.apiKey,
      'Content-Type': 'application/json',
    };
  }

  @override
  Uri buildUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath).replace(
      queryParameters: {'alt': 'sse'},
    );
  }

  @override
  Uri buildModelsUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath);
  }

  @override
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx) {
    return {
      'contents': _buildGoogleContents(ctx.context),
      'generationConfig': {},
      'safetySettings': [
        {'category': 'HARM_CATEGORY_HARASSMENT', 'threshold': 'BLOCK_NONE'},
        {'category': 'HARM_CATEGORY_HATE_SPEECH', 'threshold': 'BLOCK_NONE'},
        {'category': 'HARM_CATEGORY_SEXUALLY_EXPLICIT', 'threshold': 'BLOCK_NONE'},
        {'category': 'HARM_CATEGORY_DANGEROUS_CONTENT', 'threshold': 'BLOCK_NONE'},
      ],
    };
  }

  @override
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    final models = json['models'] as List<dynamic>?;
    if (models == null) return [];

    return models.map((e) {
      final m = e as Map<String, dynamic>;
      final name = (m['name'] ?? '').toString();
      final id = name.startsWith('models/') ? name.substring(7) : name;

      final methods = m['supportedGenerationMethods'] as List<dynamic>?;
      if (methods != null && !methods.contains('generateContent')) {
        return null;
      }

      return ModelInfo(
        id: id,
      );
    }).whereType<ModelInfo>().toList();
  }

  List<Map<String, dynamic>> _buildGoogleContents(List<ApiMessage> context) {
    return context.map((message) {
      final role = message.role == 'assistant' ? 'model' : message.role;
      final parts = <Map<String, dynamic>>[];

      if (message.parts.isEmpty) {
        final text = message.content?.trim() ?? '';
        if (text.isNotEmpty) {
          parts.add({'text': text});
        }
      } else {
        for (final part in message.parts) {
          parts.addAll(part.when(
            text: (type, text) => [{'text': text}],
            imageUrl: (type, imageUrl) {
              final url = imageUrl.url;
              if (url.startsWith('data:')) {
                final commaIndex = url.indexOf(',');
                if (commaIndex != -1) {
                  final mime = url.substring(5, commaIndex);
                  final base64Data = url.substring(commaIndex + 1);
                  return [
                    {
                      'inlineData': {
                        'mimeType': mime,
                        'data': base64Data,
                      }
                    }
                  ];
                }
              }
              return [{'text': '[Image: $url]'}];
            },
          ));
        }
      }

      if (parts.isEmpty) return null;
      return {'role': role, 'parts': parts};
    }).whereType<Map<String, dynamic>>().toList();
  }
}
````

## File: lib/data/data_sources/api_builders/model_info_parser.dart
````dart
// lib/data/data_sources/api_builders/model_info_parser.dart
import '../../../core/models/model_info.dart';

class ModelInfoParser {
  /// 从 /v1/models 或 /v1/responses 等标准 OpenAI 风格响应中解析模型列表
  static List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>? ?? [];
    return data.map((e) => _parseModelInfo(e as Map<String, dynamic>)).toList();
  }

  static ModelInfo _parseModelInfo(Map<String, dynamic> json) {
    bool? readBool(Map<String, dynamic> json, List<String> keys) {
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

    return ModelInfo(
      id: (json['id'] ?? '').toString(),
      overrideSupportsReasoning:
          readBool(json, ['overrideSupportsReasoning', 'override_supports_reasoning']),
      overrideSupportsVision:
          readBool(json, ['overrideSupportsVision', 'override_supports_vision']),
    );
  }
}
````

## File: lib/data/data_sources/api_builders/responses_api_builder.dart
````dart
import 'package:aiservice/data/data_sources/api_builders/model_info_parser.dart';
import 'api_request_builder.dart';
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class ResponsesApiBuilder implements ApiRequestBuilder {
  @override
  Map<String, String> buildHeaders(ApiBuildContext ctx) {
    return {
      'Authorization': 'Bearer ${ctx.apiKey}',
      'Content-Type': 'application/json',
    };
  }

  @override
  Uri buildUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.chatPath);
  }

  @override
  Uri buildModelsUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath);
  }
  
  @override
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx) {
    return {
      'model': ctx.model,
      'input': _buildInput(ctx.context),
      'stream': true,
      'store': false,
      if (ctx.enableReasoning)
        'reasoning': {
          'effort': 'medium',
        },
    };
  }

  @override
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    return ModelInfoParser.parseModelsResponse(json);
  }
  
  List<Map<String, dynamic>> _buildInput(List<ApiMessage> context) {
    final result = <Map<String, dynamic>>[];
    for (final message in context) {
      if (message.role == 'assistant') {
        result.addAll(_buildAssistantItems(message));
      } else {
        result.add(_buildUserLikeMessage(message));
      }
    }
    return result;
  }

  Map<String, dynamic> _buildUserLikeMessage(ApiMessage message) {
    if (message.parts.isEmpty) {
      return {'role': message.role, 'content': message.content ?? ''};
    }

    return {
      'role': message.role,
      'content': message.parts.map((part) => part.when(
            text: (type, text) => {'type': 'input_text', 'text': text},
            imageUrl: (type, imageUrl) => {
              'type': 'input_image',
              'image_url': imageUrl.url,
            },
          )).toList(),
    };
  }

  List<Map<String, dynamic>> _buildAssistantItems(ApiMessage message) {
    final items = <Map<String, dynamic>>[];
    if ((message.reasoning ?? '').trim().isNotEmpty) {
      items.add({
        'type': 'reasoning',
        'summary': [
          {'type': 'summary_text', 'text': message.reasoning}
        ],
      });
    }
    if ((message.content ?? '').trim().isNotEmpty) {
      items.add({'role': 'assistant', 'content': message.content});
    }
    return items;
  }
}
````

## File: lib/data/data_sources/sse_event_decoder.dart
````dart
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
      case 'google':
        return _decodeGoogle(event);
      case 'chat_completions':
      default:
        return _decodeChatCompletions(event);
    }
  }

  static ChatChunk? _decodeGoogle(SseEvent event) {
    try {
      final json = jsonDecode(event.data) as Map<String, dynamic>;

      // 检查错误
      if (json['error'] != null) {
        return ChatChunk(
          isDone: true,
          error: _extractErrorMessage(json['error']),
        );
      }

      // 检查 promptFeedback 拦截
      final promptFeedback = json['promptFeedback'] as Map<String, dynamic>?;
      if (promptFeedback != null && promptFeedback['blockReason'] != null) {
        return ChatChunk(
          isDone: true,
          error: 'Prompt blocked: ${promptFeedback['blockReason']}',
        );
      }

      final candidates = json['candidates'] as List<dynamic>?;
      if (candidates == null || candidates.isEmpty) {
        // 某些块可能只包含 usageMetadata，忽略
        return null;
      }

      final candidate = candidates.first as Map<String, dynamic>;
      final content = candidate['content'] as Map<String, dynamic>?;
      final finishReason = candidate['finishReason'] as String?;

      String text = '';

      if (content != null) {
        final parts = content['parts'] as List<dynamic>?;
        if (parts != null) {
          for (final part in parts) {
            if (part is Map<String, dynamic>) {
              text += part['text'] as String? ?? '';
            }
          }
        }
      }

      // 如果有 finishReason，表示结束
      if (finishReason != null) {
        return ChatChunk(
          content: text.isEmpty ? null : text,
          isDone: true,
        );
      }

      if (text.isEmpty) return null;

      return ChatChunk(
        content: text,
        isDone: false,
      );
    } catch (e) {
      return null;
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
````

## File: lib/domain/models/session_card_meta.dart
````dart
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
````

## File: lib/domain/models/tree_node.g.dart
````dart
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
````

## File: lib/domain/services/attachment_preparer.dart
````dart
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
````

## File: lib/domain/services/character_card_parser.dart
````dart
import 'dart:convert';
import 'dart:typed_data';
import 'package:png_chunks_extract/png_chunks_extract.dart' as pngExtract;
import 'package:uuid/uuid.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';

extension CharacterDataPersistenceX on CharacterData {
  Future<String> appendGreeting({
    required ConversationRepository repository,
    required String sessionId,
  }) async {
    final newRound = ChatRound(
      id: const Uuid().v4(),
      parentId: null, 
      createdAt: DateTime.now().millisecondsSinceEpoch,
      userContent: '',
      userAttachments: const [],
      assistantContent: firstMes,
      isIncomplete: false,
      hasUnseenUpdate: true,
    );
    await repository.appendRound(sessionId, newRound);
    return newRound.id;
  }
}

/// 解析后的角色数据结构（支持 V2/V3）
class CharacterData {
  final String name;
  final String description;
  final String personality;
  final String scenario;
  final String firstMes;
  final String mesExample;
  final String systemPrompt;
  final String postHistoryInstructions;
  final List<String> alternateGreetings;
  final Map<String, dynamic>? characterBook;
  final Map<String, dynamic>? extensions;

  CharacterData({
    required this.name,
    required this.description,
    required this.personality,
    required this.scenario,
    required this.firstMes,
    required this.mesExample,
    required this.systemPrompt,
    required this.postHistoryInstructions,
    required this.alternateGreetings,
    this.characterBook,
    this.extensions,
  });

  /// 生成系统提示词（供模型使用）
  String buildSystemPrompt() {
    final buffer = StringBuffer();
    buffer.writeln('# 角色设定');
    buffer.writeln('你是 $name。\n');

    if (description.isNotEmpty) {
      buffer.writeln('## 外貌与背景');
      buffer.writeln(description);
      buffer.writeln();
    }

    if (personality.isNotEmpty) {
      buffer.writeln('## 性格特点');
      buffer.writeln(personality);
      buffer.writeln();
    }

    if (scenario.isNotEmpty) {
      buffer.writeln('## 当前场景');
      buffer.writeln(scenario);
      buffer.writeln();
    }

    if (systemPrompt.isNotEmpty) {
      buffer.writeln('## 核心指令');
      buffer.writeln(systemPrompt);
      buffer.writeln();
    }

    buffer.writeln('## 对话要求');
    buffer.writeln('- 请严格按照以上设定进行角色扮演');
    buffer.writeln('- 保持角色性格和语气的一致性');
    buffer.writeln('- 根据对话历史适当推进情节');

    if (mesExample.isNotEmpty) {
      buffer.writeln('\n## 对话范例参考');
      buffer.writeln(mesExample);
    }

    return buffer.toString();
  }
}

/// 角色卡解析器
class CharacterCardParser {
  /// 解析文件（支持 PNG 和 JSON）
  static Future<CharacterData> parseFile(Uint8List bytes, String fileName) async {
    final lowerName = fileName.toLowerCase();
    if (lowerName.endsWith('.png')) {
      return _parsePngCard(bytes);
    } else if (lowerName.endsWith('.json')) {
      return _parseJsonCard(bytes);
    } else {
      throw Exception('不支持的文件格式，请使用 PNG 或 JSON 文件');
    }
  }

  /// 解析 PNG 角色卡（V2/V3）
  static CharacterData _parsePngCard(Uint8List bytes) {
    final chunks = pngExtract.extractChunks(bytes);
    
    String? base64Data;
    for (final chunk in chunks) {
      final chunkName = chunk['name'] as String;
      if (chunkName == 'tEXt') {
        final dataBytes = chunk['data'] as List<int>;
        // 解析 tEXt 块：keyword + 0x00 + text
        final zeroIndex = dataBytes.indexOf(0);
        if (zeroIndex == -1) continue;
        final keyword = utf8.decode(dataBytes.sublist(0, zeroIndex));
        final textBytes = dataBytes.sublist(zeroIndex + 1);
        final text = utf8.decode(textBytes);
        
        if (keyword == 'ccv3') {
          base64Data = text;
          break;
        } else if (keyword == 'chara' && base64Data == null) {
          base64Data = text;
        }
      }
    }
    
    if (base64Data == null) {
      throw Exception('未找到角色数据块（ccv3/chara）');
    }
    
    final jsonString = utf8.decode(base64.decode(base64Data));
    return _parseJsonString(jsonString);
  }

  /// 解析 JSON 角色卡
  static CharacterData _parseJsonCard(Uint8List bytes) {
    final jsonString = utf8.decode(bytes);
    return _parseJsonString(jsonString);
  }

  static CharacterData _parseJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    final spec = json['spec'] as String?;
    
    if (spec == 'chara_card_v3') {
      return _parseV3(json);
    } else if (spec == 'chara_card_v2') {
      return _parseV2(json);
    } else {
      // 兼容旧格式
      return _parseV2({'data': json});
    }
  }

  static CharacterData _parseV3(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return CharacterData(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      personality: data['personality'] ?? '',
      scenario: data['scenario'] ?? '',
      firstMes: data['first_mes'] ?? '',
      mesExample: data['mes_example'] ?? '',
      systemPrompt: data['system_prompt'] ?? '',
      postHistoryInstructions: data['post_history_instructions'] ?? '',
      alternateGreetings: (data['alternate_greetings'] as List?)?.cast<String>() ?? [],
      characterBook: data['character_book'],
      extensions: data['extensions'],
    );
  }

  static CharacterData _parseV2(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? json;
    return CharacterData(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      personality: data['personality'] ?? '',
      scenario: data['scenario'] ?? '',
      firstMes: data['first_mes'] ?? '',
      mesExample: data['mes_example'] ?? '',
      systemPrompt: data['system_prompt'] ?? '',
      postHistoryInstructions: data['post_history_instructions'] ?? '',
      alternateGreetings: (data['alternate_greetings'] as List?)?.cast<String>() ?? [],
      characterBook: data['character_book'],
      extensions: data['extensions'],
    );
  }
}
````

## File: lib/domain/services/chat_generation_service.dart
````dart
import 'package:aiservice/data/data_sources/chat_source_router.dart';
import 'package:aiservice/domain/services/character_card_parser.dart';
import '../../core/models/generation_event.dart';
import '../../data/repositories/conversation_repository.dart';
import '../../data/services/config_service.dart';
import 'chat_context_builder.dart';
import 'stream_processor.dart';

/// 流式生成服务（纯 Dart，依赖通过参数传递）
class ChatGenerationService {
  static Stream<GenerationEvent> generateStream({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSourceRouter sourceRouter,
    required String roundId,
    CharacterData? character,
  }) async* {
    final contextRounds = await repository.getContextRounds(roundId);
    final apiContext = await buildApiContextFromRounds(
      contextRounds,
      repository,
      character,
    );

    final config = await configService.loadConfig();

    final source = sourceRouter.getSourceFromConfig(config);
    final chatStream = source.chatStream(
      config: config,
      context: apiContext,
    );

    final processor = StreamProcessor();
    yield* processor.process(chatStream);
  }
}
````

## File: lib/domain/services/chat_service.dart
````dart
import 'dart:async';
import 'package:aiservice/data/data_sources/chat_source_router.dart';
import 'package:uuid/uuid.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';
import '../../data/services/config_service.dart';
import '../../presentation/models/pending_attachment.dart';
import 'attachment_preparer.dart';
import 'character_card_parser.dart';
import 'chat_generation_service.dart';

class ChatService {
  static final Map<String, StreamSubscription> _activeGenerations = {};

  static Future<String> sendMessage({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSourceRouter sourceRouter,
    required String sessionId,
    required String content,
    required String? parentRoundId,
    required List<PendingAttachment> pendingAttachments,
    CharacterData? character,
  }) async {
    final savedAttachments = await savePendingAttachments(repository, pendingAttachments);
    final newRoundId = await _createRound(
      repository: repository,
      sessionId: sessionId,
      content: content,
      parentRoundId: parentRoundId,
      attachments: savedAttachments,
    );
    
    _startGeneration(
      repository: repository,
      configService: configService,
      sourceRouter: sourceRouter,
      roundId: newRoundId,
      character: character,
    );
    
    return newRoundId;
  }

  static Future<String> retryFromRound({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSourceRouter sourceRouter,
    required String sessionId,
    required ChatRound sourceRound,
    CharacterData? character,
  }) async {
    final newRoundId = await _createRound(
      repository: repository,
      sessionId: sessionId,
      content: sourceRound.userContent,
      parentRoundId: sourceRound.parentId,
      attachments: sourceRound.userAttachments,
    );

    _startGeneration(
      repository: repository,
      configService: configService,
      sourceRouter: sourceRouter,
      roundId: newRoundId,
      character: character,
    );

    return newRoundId;
  }

  static void stopGeneration(String roundId, ConversationRepository repository) {
    final subscription = _activeGenerations.remove(roundId);
    if (subscription != null) {
      subscription.cancel();
      repository.updateRound(
        roundId: roundId,
        isIncomplete: false,
        hasUnseenUpdate: true,
      );
    }
  }

  static void _startGeneration({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSourceRouter sourceRouter,
    required String roundId,
    CharacterData? character,
  }) {
    final stream = ChatGenerationService.generateStream(
      repository: repository,
      configService: configService,
      sourceRouter: sourceRouter,
      roundId: roundId,
      character: character,
    );

    final subscription = stream.listen(
      (event) {
        event.when(
          partial: (content, reasoning) {
            repository.updateRound(
              roundId: roundId,
              assistantContent: content,
              assistantThinking: reasoning,
              isIncomplete: true,
            );
          },
          completed: (content, reasoning) {
            repository.updateRound(
              roundId: roundId,
              assistantContent: content,
              assistantThinking: reasoning,
              isIncomplete: false,
              hasUnseenUpdate: true,
            );
            _activeGenerations.remove(roundId);
          },
          failed: (error) {
            repository.updateRound(
              roundId: roundId,
              assistantContent: '[错误]\n$error',
              assistantThinking: '',
              isIncomplete: false,
              hasUnseenUpdate: true,
            );
            _activeGenerations.remove(roundId);
          },
        );
      },
    );

    _activeGenerations[roundId] = subscription;
  }

  static Future<String> _createRound({
    required ConversationRepository repository,
    required String sessionId,
    required String content,
    required String? parentRoundId,
    required List<Attachment> attachments,
  }) async {
    final newRound = ChatRound(
      id: const Uuid().v4(),
      parentId: parentRoundId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      userContent: content,
      userAttachments: attachments,
      isIncomplete: true,
      hasUnseenUpdate: false,
    );
    await repository.appendRound(sessionId, newRound);
    return newRound.id;
  }
}
````

## File: lib/presentation/pages/image_attachment_viewer_page.dart
````dart
import 'dart:typed_data';
import 'package:aiservice/presentation/widgets/common/app_page_scaffold.dart';
import 'package:flutter/cupertino.dart';

class ImageAttachmentViewerPage extends StatelessWidget {
  final Uint8List imageBytes;

  const ImageAttachmentViewerPage({super.key, required this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('图片预览')),      
      body: InteractiveViewer(
        minScale: 0.5,
        maxScale: 4.0,
        child: Center(
          child: Image.memory(
            imageBytes,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
````

## File: lib/presentation/providers/input_notifier.dart
````dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/input_state.dart';
import '../models/pending_attachment.dart';

/// 输入状态 Notifier
///
/// 职责：
/// - 管理输入框文本和附件列表
/// - 提供状态变更方法
/// - 不包含发送逻辑、不包含编辑模式、不包含 isSending 状态
class InputNotifier extends Notifier<InputState> {
  @override
  InputState build() => const InputState();

  /// 更新输入文本
  void updateText(String text) {
    state = state.copyWith(text: text);
  }

  /// 添加附件
  void addAttachment(PendingAttachment attachment) {
    state = state.copyWith(
      attachments: [...state.attachments, attachment],
    );
  }

  /// 移除指定 ID 的附件
  void removeAttachment(String id) {
    state = state.copyWith(
      attachments: state.attachments.where((a) => a.id != id).toList(),
    );
  }

  /// 清空输入状态（文本和附件）
  void clear() {
    state = const InputState();
  }
}

/// 全局输入状态 Provider
///
/// 特点：
/// - 全局单例：所有会话共享同一份输入草稿
/// - 自动保留：切换会话时草稿不会丢失
final inputStateProvider =
    NotifierProvider<InputNotifier, InputState>(InputNotifier.new);
````

## File: lib/core/models/model_info.dart
````dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_info.freezed.dart';
part 'model_info.g.dart';

@freezed
class ModelInfo with _$ModelInfo {
  const factory ModelInfo({
    required String id,

    bool? overrideSupportsReasoning,
    bool? overrideSupportsVision,
  }) = _ModelInfo;

  factory ModelInfo.fromJson(Map<String, dynamic> json) =>
      _$ModelInfoFromJson(json);
}
````

## File: lib/core/models/model_info.freezed.dart
````dart
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
    Object? overrideSupportsReasoning = freezed,
    Object? overrideSupportsVision = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
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
    Object? overrideSupportsReasoning = freezed,
    Object? overrideSupportsVision = freezed,
  }) {
    return _then(
      _$ModelInfoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
    this.overrideSupportsReasoning,
    this.overrideSupportsVision,
  });

  factory _$ModelInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelInfoImplFromJson(json);

  @override
  final String id;
  @override
  final bool? overrideSupportsReasoning;
  @override
  final bool? overrideSupportsVision;

  @override
  String toString() {
    return 'ModelInfo(id: $id, overrideSupportsReasoning: $overrideSupportsReasoning, overrideSupportsVision: $overrideSupportsVision)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
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
    final bool? overrideSupportsReasoning,
    final bool? overrideSupportsVision,
  }) = _$ModelInfoImpl;

  factory _ModelInfo.fromJson(Map<String, dynamic> json) =
      _$ModelInfoImpl.fromJson;

  @override
  String get id;
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
````

## File: lib/core/models/model_info.g.dart
````dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelInfoImpl _$$ModelInfoImplFromJson(Map<String, dynamic> json) =>
    _$ModelInfoImpl(
      id: json['id'] as String,
      overrideSupportsReasoning: json['overrideSupportsReasoning'] as bool?,
      overrideSupportsVision: json['overrideSupportsVision'] as bool?,
    );

Map<String, dynamic> _$$ModelInfoImplToJson(_$ModelInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'overrideSupportsReasoning': instance.overrideSupportsReasoning,
      'overrideSupportsVision': instance.overrideSupportsVision,
    };
````

## File: lib/core/models/sse_event.dart
````dart
// 保持你原有SseEvent的非空约定，避免修改下游Decoder
class SseEvent {
  final String? id;
  final String? event;
  final String data; // 保持非空，和你原有逻辑一致

  const SseEvent({
    this.id,
    this.event,
    required this.data,
  });
}
````

## File: lib/domain/models/session_list_item.dart
````dart
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
````

## File: lib/domain/models/tree_node.dart
````dart
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
````

## File: lib/domain/models/tree_node.freezed.dart
````dart
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
  List<TreeNode> get children => throw _privateConstructorUsedError;
  int get depth => throw _privateConstructorUsedError;

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
  $Res call({String id, String? parentId, List<TreeNode> children, int depth});
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
    Object? children = null,
    Object? depth = null,
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
            children: null == children
                ? _value.children
                : children // ignore: cast_nullable_to_non_nullable
                      as List<TreeNode>,
            depth: null == depth
                ? _value.depth
                : depth // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
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
  $Res call({String id, String? parentId, List<TreeNode> children, int depth});
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
    Object? children = null,
    Object? depth = null,
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
        children: null == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<TreeNode>,
        depth: null == depth
            ? _value.depth
            : depth // ignore: cast_nullable_to_non_nullable
                  as int,
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
    required final List<TreeNode> children,
    required this.depth,
  }) : _children = children;

  factory _$TreeNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeImplFromJson(json);

  @override
  final String id;
  @override
  final String? parentId;
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
  String toString() {
    return 'TreeNode(id: $id, parentId: $parentId, children: $children, depth: $depth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.depth, depth) || other.depth == depth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    parentId,
    const DeepCollectionEquality().hash(_children),
    depth,
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
    required final List<TreeNode> children,
    required final int depth,
  }) = _$TreeNodeImpl;

  factory _TreeNode.fromJson(Map<String, dynamic> json) =
      _$TreeNodeImpl.fromJson;

  @override
  String get id;
  @override
  String? get parentId;
  @override
  List<TreeNode> get children;
  @override
  int get depth;

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
````

## File: lib/presentation/providers/attachment_bytes_provider.dart
````dart
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
````

## File: lib/presentation/providers/settings_form_notifier.dart
````dart
// lib/presentation/providers/settings_form_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/model_info.dart';
import '../../data/services/config_service.dart';
import '../../di/providers.dart';
import 'config_notifier.dart'; // 导入 configProvider
import 'package:file_picker/file_picker.dart';

/// 设置表单的状态
class SettingsFormState {
  final AppConfig config;
  final bool isSaving;
  final String? error;
  final bool isRefreshingModels;
  final String? modelsRefreshError;

  const SettingsFormState({
    required this.config,
    this.isSaving = false,
    this.error,
    this.isRefreshingModels = false,
    this.modelsRefreshError,
  });

  SettingsFormState copyWith({
    AppConfig? config,
    bool? isSaving,
    String? error,
    bool? isRefreshingModels,
    String? modelsRefreshError,
  }) {
    return SettingsFormState(
      config: config ?? this.config,
      isSaving: isSaving ?? this.isSaving,
      error: error,
      isRefreshingModels: isRefreshingModels ?? this.isRefreshingModels,
      modelsRefreshError: modelsRefreshError,
    );
  }
}

/// 设置表单 Notifier
class SettingsFormNotifier extends Notifier<SettingsFormState> {
  late final ConfigService _configService;
  AppConfig? _lastLoadedConfig;

  @override
  SettingsFormState build() {
    _configService = ref.read(configServiceProvider);

    // 1. 尝试获取初始值（如果已经加载）
    final initialConfig = ref.read(configProvider).valueOrNull;
    if (initialConfig != null) {
      _lastLoadedConfig = initialConfig;
      state = SettingsFormState(config: initialConfig);
    } else {
      state = SettingsFormState(config: AppConfig.defaultConfig());
    }

    // 2. 监听全局配置变化，自动同步
    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      next.whenData((config) {
        if (_lastLoadedConfig != config) {
          _lastLoadedConfig = config;
          _load(config);
        }
      });
    });

    return state;
  }

  void _load(AppConfig config) {
    state = state.copyWith(config: config, error: null);
  }

  void updateBaseUrl(String value) {
    state = state.copyWith(config: state.config.copyWith(baseUrl: value));
  }

  void updateApiKey(String value) {
    state = state.copyWith(config: state.config.copyWith(apiKey: value));
  }

  void updateModelsPath(String value) {
    state = state.copyWith(config: state.config.copyWith(modelsPath: value));
  }

  void updateChatPath(String value) {
    state = state.copyWith(config: state.config.copyWith(chatPath: value));
  }

  void updateApiMode(String value) {
    final defaults = _defaultPathsForMode(value);
    state = state.copyWith(
      config: state.config.copyWith(
        apiMode: value,
        modelsPath: defaults['models']!,
        chatPath: defaults['chat']!,
      ),
    );
  }

  void updateSelectedModel(String value) {
    state = state.copyWith(
      config: state.config.copyWith(selectedModel: value.isEmpty ? null : value),
    );
  }

  void toggleReasoning(bool value) {
    _updateModelCapability(overrideSupportsReasoning: value);
  }

  void toggleVision(bool value) {
    _updateModelCapability(overrideSupportsVision: value);
  }

  void _updateModelCapability({bool? overrideSupportsReasoning, bool? overrideSupportsVision}) {
    final modelId = state.config.selectedModel;
    if (modelId == null || modelId.isEmpty) return;

    final models = [...(state.config.availableModels ?? const <ModelInfo>[])];
    final index = models.indexWhere((m) => m.id == modelId);
    final baseModel = index >= 0 ? models[index] : ModelInfo(id: modelId);

    final updatedModel = baseModel.copyWith(
      overrideSupportsReasoning: overrideSupportsReasoning ?? baseModel.overrideSupportsReasoning,
      overrideSupportsVision: overrideSupportsVision ?? baseModel.overrideSupportsVision,
    );

    if (index >= 0) {
      models[index] = updatedModel;
    } else {
      models.add(updatedModel);
    }

    state = state.copyWith(config: state.config.copyWith(availableModels: models));
  }

  Future<void> save() async {
    state = state.copyWith(isSaving: true, error: null);
    try {
      await _configService.saveConfig(state.config);
      state = state.copyWith(isSaving: false);
    } catch (e) {
      state = state.copyWith(isSaving: false, error: e.toString());
      rethrow;
    }
  }

  void restoreDefaults() {
    state = state.copyWith(config: AppConfig.defaultConfig());
  }

  Future<void> refreshModels() async {
    if (state.isRefreshingModels) return;
    if (state.config.apiMode == 'local') {
      await addLocalModel();
      return;
    }

    state = state.copyWith(isRefreshingModels: true, modelsRefreshError: null);
    try {
      await _configService.refreshModels();
      state = state.copyWith(isRefreshingModels: false);
    } catch (e) {
      state = state.copyWith(
        isRefreshingModels: false,
        modelsRefreshError: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> addLocalModel() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['gguf'],
    );
    if (result == null || result.files.single.path == null) return;

    final path = result.files.single.path!;

    final newModel = ModelInfo(id: path);

    final currentModels = List<ModelInfo>.from(state.config.availableModels ?? []);
    if (currentModels.any((m) => m.id == path)) {
      // 已存在则直接选中
      state = state.copyWith(config: state.config.copyWith(selectedModel: path));
      return;
    }

    currentModels.add(newModel);
    state = state.copyWith(
      config: state.config.copyWith(
        availableModels: currentModels,
        selectedModel: path,
      ),
    );
  }

  Map<String, String> _defaultPathsForMode(String apiMode) {
    switch (apiMode) {
      case 'google':
        return {'models': 'v1beta/models', 'chat': 'v1beta/models/{model}:streamGenerateContent'};
      case 'responses':
        return {'models': 'v1/models', 'chat': 'v1/responses'};
      default:
        return {'models': 'v1/models', 'chat': 'v1/chat/completions'};
    }
  }
}

final settingsFormProvider = NotifierProvider<SettingsFormNotifier, SettingsFormState>(
  SettingsFormNotifier.new,
);
````

## File: lib/presentation/widgets/common/app_toast.dart
````dart
// lib/presentation/widgets/common/app_toast.dart
import 'package:flutter/cupertino.dart';
import '../../../main.dart'; // 全局 navigatorKey

abstract class AppToast {
  static OverlayEntry? _entry;

  static void show(String message, {Duration duration = const Duration(seconds: 1)}) {
    _entry?.remove();
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    _entry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: IgnorePointer(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                color: const Color(0xE6111827),
                child: Text(
                  message,
                  style: const TextStyle(color: CupertinoColors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_entry!);
    Future.delayed(duration, () {
      _entry?.remove();
      if (_entry != null) _entry = null;
    });
  }
}
````

## File: lib/core/constants/app_constants.dart
````dart
abstract class AppConstants {
  // 文件夹名称
  static const String dirAttachments = 'attachments';

  // 配置键
  static const String keyBaseUrl = 'baseUrl';
  static const String keyApiKey = 'apiKey';
  static const String keyTheme = 'theme';
  static const String keyModel = 'selectedModel';

  // 默认值
  static const String defaultBaseUrl = 'https://api.openai.com';
  static const String defaultTheme = 'system';
}
````

## File: lib/domain/services/chat_context_builder.dart
````dart
import 'dart:convert';
import 'package:aiservice/core/models/attachment.dart';
import 'package:aiservice/domain/services/character_card_parser.dart';

import '../../core/models/api_message.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';

Future<List<ApiMessage>> buildApiContextFromRounds(
  List<ChatRound> rounds,
  ConversationRepository repository,
  CharacterData? character,
) async {
  final result = <ApiMessage>[];

  if (character != null) {
    final systemPrompt = character.buildSystemPrompt();
    result.add(ApiMessage(
      role: 'system',
      content: systemPrompt,
    ));
  }

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
  Attachment attachment,
  ConversationRepository repository,
) async {
  if (attachment.isImage) {
    final bytes = await repository.getAttachment(attachment.relativePath);
    final mimeType = attachment.mimeType;
    final base64Data = base64Encode(bytes);
    return [ApiMessageContentPart.imageUrl(imageUrl: ApiImageUrl(url: 'data:$mimeType;base64,$base64Data'))];
  } else {
    // 上层保证非图片一定是可读文本文件
    final bytes = await repository.getAttachment(attachment.relativePath);
    final text = utf8.decode(bytes, allowMalformed: true);
    return [ApiMessageContentPart.text(text: text)];
  }
}
````

## File: lib/domain/services/tree_builder.dart
````dart
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
````

## File: lib/data/data_sources/local_file_source.dart
````dart
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
    await Directory(path.join(_baseDir, AppConstants.dirAttachments))
      .create(recursive: true);
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
````

## File: lib/di/providers.dart
````dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../data/data_sources/local_file_source.dart';
import '../data/data_sources/local_chat_source.dart'; // 新增
import '../data/data_sources/remote_chat_source.dart'; // 替换原 remote_api_source
import '../data/data_sources/chat_source_router.dart'; // 新增
import '../data/database/database.dart';
import '../data/services/config_service.dart';
import '../data/repositories/conversation_repository.dart';

final localFileSourceProvider = FutureProvider<LocalFileSource>((ref) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileSource = LocalFileSource(appDir.path);
  await fileSource.initDirectories();
  return fileSource;
});

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  ref.watch(localFileSourceProvider);
  return AppDatabase();
});

// --- 新增 Data Sources ---
final remoteChatSourceProvider = Provider<RemoteChatSource>((ref) => RemoteChatSource());
final localChatSourceProvider = Provider<LocalChatSource>((ref) => LocalChatSource());

final chatSourceRouterProvider = Provider<ChatSourceRouter>((ref) {
  return ChatSourceRouter(
    ref.watch(remoteChatSourceProvider),
    ref.watch(localChatSourceProvider),
  );
});

// --- 更新 Service 依赖 ---
final configServiceProvider = Provider<ConfigService>((ref) {
  return ConfigService(
    ref.watch(appDatabaseProvider),
    ref.watch(chatSourceRouterProvider), // 替换原 remoteApiSourceProvider
  );
});

final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  return ConversationRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(localFileSourceProvider).requireValue,
  );
});
````

## File: lib/presentation/pages/text_attachment_viewer_page.dart
````dart
import 'package:flutter/cupertino.dart';
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
    AppToast.show('全文已复制');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CupertinoTheme.of(context).textTheme;

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: CupertinoButton(
          onPressed: _copyAll,
          child: const Icon(CupertinoIcons.doc_on_doc),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            content,
            style: textTheme.textStyle.copyWith(
              fontFamily: 'monospace',
            ),
          ),
        ),
      ),
    );
  }
}
````

## File: lib/presentation/providers/config_notifier.dart
````dart
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
````

## File: lib/presentation/widgets/common/app_page_scaffold.dart
````dart
import 'package:flutter/cupertino.dart';

class AppPageScaffold extends StatelessWidget {
  final ObstructingPreferredSizeWidget? navigationBar;
  final Widget body;
  final bool useSafeArea;

  const AppPageScaffold({
    super.key,
    this.navigationBar,
    required this.body,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoDynamicColor.resolve(CupertinoColors.systemGroupedBackground, context),
      navigationBar: navigationBar,

      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        
        child: SafeArea(child: body),
      ),
    );
  }
}
````

## File: lib/presentation/widgets/thought_bubble.dart
````dart
import 'package:flutter/cupertino.dart';

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
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.content.trim();
    if (text.isEmpty) return const SizedBox.shrink();

    final textTheme = CupertinoTheme.of(context).textTheme;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            onPressed: () => setState(() => _isExpanded = !_isExpanded),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.lightbulb,
                  size: 16,
                  color: CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context),
                ),
                const SizedBox(width: 6),
                Text(
                  '推理过程',
                  style: textTheme.textStyle.copyWith(
                    color: CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context),
                  ),
                ),
                const Spacer(),
                Icon(
                  _isExpanded ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                  size: 18,
                  color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey, context),
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                text,
                style: textTheme.textStyle.copyWith(
                  fontSize: 13,
                  height: 1.5,
                  color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
````

## File: lib/presentation/widgets/attachment_list.dart
````dart
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:aiservice/presentation/pages/image_attachment_viewer_page.dart';
import 'package:flutter/cupertino.dart';
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
      AppToast.show('共享文件失败：$e');
    }
  }

  static Future<void> previewImage(BuildContext context, Uint8List bytes) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => ImageAttachmentViewerPage(imageBytes: bytes),
      ),
    );
  }

  static Future<void> openTextViewer(
    BuildContext context,
    String title,
    Uint8List bytes,
  ) async {
    final text = utf8.decode(bytes, allowMalformed: true);
    await Navigator.of(context).push(
      CupertinoPageRoute(
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
          child: CupertinoActivityIndicator(),
        ),
      ),
      error: (e, st) => const SizedBox(
        width: 108,
        height: 108,
        child: Center(
          child: Icon(CupertinoIcons.exclamationmark_triangle),
        ),
      ),
      data: (bytes) {
        return GestureDetector(
          onTap: () => _AttachmentActionHelper.previewImage(context, bytes),
          onLongPress: () => _AttachmentActionHelper.shareAttachmentFromBytes(attachment, bytes),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 108,
              height: 108,
              child: Image.memory(bytes, fit: BoxFit.cover, gaplessPlayback: true),
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

    final leadingIcon = isText ? CupertinoIcons.doc_text : CupertinoIcons.doc;

    return bytesAsync.when(
      loading: () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(leadingIcon, size: 16),
            const SizedBox(width: 6),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 180),
              child: Text(
                attachment.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      error: (e, st) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CupertinoIcons.exclamationmark_triangle, size: 16),
            const SizedBox(width: 6),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 180),
              child: Text(
                attachment.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      data: (bytes) {
        return GestureDetector(
          onTap: () async {
            if (isText) {
              await _AttachmentActionHelper.openTextViewer(
                context,
                attachment.name,
                bytes,
              );
              return;
            }
            AppToast.show('该文件暂不支持直接预览，请长按进行分享');
          },
          onLongPress: () => _AttachmentActionHelper.shareAttachmentFromBytes(attachment, bytes),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(leadingIcon, size: 16),
                const SizedBox(width: 6),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 180),
                  child: Text(
                    attachment.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
````

## File: lib/presentation/widgets/message_bubble.dart
````dart
import 'package:flutter/cupertino.dart';
import 'markdown_widget.dart';

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
    final bubbleColor = isUser
        ? CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context)
        : CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context);

    final textColor = isUser
        ? CupertinoDynamicColor.resolve(CupertinoColors.white, context)
        : CupertinoDynamicColor.resolve(CupertinoColors.label, context);

    final actions = <Widget>[
      CupertinoContextMenuAction(
        child: const Text('复制'),
        onPressed: onCopy ?? () {},
      ),
      if (onRetryReply != null)
        CupertinoContextMenuAction(
          child: const Text('重试回复'),
          onPressed: onRetryReply!,
        ),
    ];

    // 获取屏幕可用宽度（减去左右边距，与原气泡逻辑一致）
    final maxWidth = MediaQuery.of(context).size.width * 0.88;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: CupertinoContextMenu(
        actions: actions,
        child: Container(
          // 移除 width 属性，让 Container 由父级 ConstrainedBox 约束
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: MarkdownWidget(
            data: content,
            baseStyle: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
````

## File: lib/main.dart
````dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'di/providers.dart'; // 仅导入 providers
import 'presentation/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
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
    return CupertinoApp(
      title: 'AI Chat',
      navigatorKey: navigatorKey,
      home: const HomePage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
    );
  }
}
````

## File: lib/presentation/providers/session_list_notifier.dart
````dart
// lib/presentation/providers/session_list_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';
import '../../domain/models/session_list_item.dart';
import '../../domain/models/session_card_meta.dart';

final sessionListProvider = StreamProvider<List<SessionListItem>>((ref) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSessionListItems();
});

final sessionCardMetaProvider =
    StreamProvider.family<SessionCardMeta, String>((ref, sessionId) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSessionCardMeta(sessionId);
});
````

## File: lib/data/services/config_service.dart
````dart
import 'dart:async';
import 'package:aiservice/data/data_sources/chat_source_router.dart';
import 'package:drift/drift.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/models/model_info.dart';
import '../database/database.dart';
import 'package:uuid/uuid.dart';

class ConfigService{
  final AppDatabase _db;
  final ChatSourceRouter _sourceRouter;

  ConfigService(this._db, this._sourceRouter);

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
    final store = await loadConfigStore();
    final activeId = store.activeProfileId;
    await (_db.update(_db.dbConfigProfiles)..where((t) => t.id.equals(activeId)))
        .write(DbConfigProfilesCompanion(config: Value(config)));
  }

  Future<void> refreshModels() async {
    final activeConfig = await loadConfig();

    final source = _sourceRouter.getSourceFromConfig(activeConfig);
    final remoteModels = await source.fetchModels(activeConfig);

    final oldModels = activeConfig.availableModels ?? const <ModelInfo>[];
    final oldById = {for (final model in oldModels) model.id: model};

    final updatedModels = remoteModels.map((remote) {
      final old = oldById[remote.id];
      return remote.copyWith(
        overrideSupportsReasoning: old?.overrideSupportsReasoning,
        overrideSupportsVision: old?.overrideSupportsVision,
      );
    }).toList();

    final updatedConfig = activeConfig.copyWith(
      availableModels: updatedModels,
    );

    await saveConfig(updatedConfig);
  }

  Future<List<ConfigProfile>> getProfiles() async {
    final store = await loadConfigStore();
    return store.profiles;
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
````

## File: lib/presentation/widgets/input_bar.dart
````dart
import 'package:aiservice/domain/services/character_card_parser.dart';
import 'package:aiservice/presentation/models/input_state.dart';
import 'package:aiservice/presentation/providers/character_provider.dart';
import 'package:aiservice/presentation/widgets/common/app_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../models/pending_attachment.dart';
import '../providers/input_notifier.dart';

class InputBar extends ConsumerStatefulWidget {
  final Future<void> Function(String text, List<PendingAttachment> attachments) onSend;
  final VoidCallback? onStop;
  final bool isIncomplete;
  final String hintText;

  const InputBar({
    super.key,
    required this.onSend,
    this.onStop,
    this.isIncomplete = false,
    this.hintText = '输入消息...',
  });

  @override
  ConsumerState<InputBar> createState() => _InputBarState();
}

class _InputBarState extends ConsumerState<InputBar> {
  late final TextEditingController _controller;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addPendingAttachment({
    required String name,
    required String path,
    required bool isImage,
    required String mimeType,
  }) {
    final attachment = PendingAttachment(
      id: const Uuid().v4(),
      name: name,
      path: path,
      isImage: isImage,
      mimeType: mimeType,
    );
    ref.read(inputStateProvider.notifier).addAttachment(attachment);
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

  bool _isTextFile(String name) {
    final lower = name.toLowerCase();
    return lower.endsWith('.txt') ||
        lower.endsWith('.md') ||
        lower.endsWith('.json') ||
        lower.endsWith('.dart') ||
        lower.endsWith('.yaml') ||
        lower.endsWith('.yml') ||
        lower.endsWith('.log') ||
        lower.endsWith('.csv');
  }

  String _mimeForImage(String fileName) {
    final lower = fileName.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.bmp')) return 'image/bmp';
    return 'image/png';
  }

  String _mimeForText(String fileName) {
    return 'text/plain';
  }

  Future<void> _pickFileAttachment() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: false,
      type: FileType.any,
    );
    if (result == null || result.files.isEmpty) return;
    final file = result.files.single;
    final filePath = file.path;
    if (filePath == null || filePath.trim().isEmpty) return;

    final isImage = _isImageFile(file.name);
    final isText = _isTextFile(file.name);

    if (!isImage && !isText) {
      if (mounted) {
        AppToast.show('仅支持图片和文本文件（.txt, .md, .json, .dart, .yaml 等）');
      }
      return;
    }

    final mimeType = isImage ? _mimeForImage(file.name) : _mimeForText(file.name);

    _addPendingAttachment(
      name: file.name,
      path: filePath,
      isImage: isImage,
      mimeType: mimeType,
    );
  }

  Future<void> _pickImageFromGallery() async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (file == null) return;

    final mimeType = file.mimeType ?? _mimeForImage(file.name);

    _addPendingAttachment(
      name: file.name,
      path: file.path,
      isImage: true,
      mimeType: mimeType,
    );
  }

  void _removeAttachment(String id) {
    ref.read(inputStateProvider.notifier).removeAttachment(id);
  }

  Future<void> _importCharacterCard() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'json'],
    );
    if (result == null || result.files.isEmpty) return;
    final file = result.files.single;
    final bytes = file.bytes;
    if (bytes == null) {
      AppToast.show('无法读取文件');
      return;
    }
    try {
      final character = await CharacterCardParser.parseFile(bytes, file.name);
      ref.read(currentCharacterProvider.notifier).state = character;
      ref.read(characterGreetingSentProvider.notifier).state = false;
      AppToast.show('已导入角色：${character.name}');
    } catch (e) {
      AppToast.show('导入失败：$e');
    }
  }

  Future<void> _showAddAttachmentSheet() async {
    FocusScope.of(context).unfocus();
    
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop();
                _importCharacterCard();
              },
              child: const Text('酒馆角色卡'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop();
                _pickFileAttachment();
              },
              child: const Text('文件'),
            ),
            CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  _pickImageFromGallery();
                },
                child: const Text('相册'),
              ),              
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
        );
      },
    );
  }

  String _sanitizeInput(String input) {
    var result = input.replaceAll('\uFEFF', '');               // 移除 BOM
    result = result.replaceAll(RegExp(r'[\u200B\u200C\u200D]'), ''); // 移除零宽字符
    result = result.replaceAll('\r\n', '\n').replaceAll('\r', '\n');   // 统一换行符
    return result;
  }

  Future<void> _handleSend() async {
    FocusScope.of(context).unfocus();

    final state = ref.read(inputStateProvider);
    if (!state.canSend) return;

    final sanitizedText = _sanitizeInput(state.text);

    try {
      await widget.onSend(sanitizedText, state.attachments);
      ref.read(inputStateProvider.notifier).clear();
    } catch (e) {
      // 发送失败，保持输入内容和附件不变
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String>(
      inputStateProvider.select((s) => s.text),
      (previous, next) {
        if (next != _controller.text) {
          _controller.value = TextEditingValue(
            text: next,
            selection: TextSelection.collapsed(offset: next.length),
            composing: TextRange.empty,
          );
        }
      },
    );

    final inputState = ref.watch(inputStateProvider);
    final attachments = inputState.attachments;
    final canSend = inputState.canSend;
    final showStopButton = widget.isIncomplete;

    return SafeArea(
      top: false,
      child: Container(
        color: CupertinoDynamicColor.resolve(CupertinoColors.systemGroupedBackground, context),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
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
                      return CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        borderRadius: BorderRadius.circular(8),
                        color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              attachment.isImage
                                  ? CupertinoIcons.photo
                                  : CupertinoIcons.doc,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 180),
                              child: Text(
                                attachment.name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () => _removeAttachment(attachment.id),
                              child: const Icon(CupertinoIcons.xmark_circle_fill, size: 16),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: _showAddAttachmentSheet,
                  child: const Icon(CupertinoIcons.add),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CupertinoTextField(
                      controller: _controller,
                      minLines: 1,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      placeholder: widget.hintText,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onChanged: (value) {
                        ref.read(inputStateProvider.notifier).updateText(value);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (showStopButton)
                  CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    borderRadius: BorderRadius.circular(8),
                    onPressed: widget.onStop,
                    child: const Icon(CupertinoIcons.stop_fill, size: 20),
                  )
                else
                  CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    borderRadius: BorderRadius.circular(8),
                    onPressed: canSend ? _handleSend : null,
                    child: const Icon(CupertinoIcons.arrow_up, size: 20),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
````

## File: lib/data/repositories/conversation_repository.dart
````dart
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
import 'package:rxdart/rxdart.dart';

class ConversationRepository {
  final AppDatabase _db;
  final LocalFileSource _fileService;
  ConversationRepository(this._db, this._fileService);

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
    final lastRoundStream = (_db.select(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(1))
        .watchSingleOrNull();

    final countStream = (_db.selectOnly(_db.dbChatRounds)
          ..addColumns([countAll()])
          ..where(_db.dbChatRounds.sessionId.equals(sessionId)))
        .watchSingle()
        .map((row) => row.read(countAll()) ?? 0);

    final hasUnseenStream = (_db.select(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId))
          ..where((t) => t.hasUnseenUpdate.equals(true))
          ..limit(1))
        .watchSingleOrNull()
        .map((row) => row != null);

    return Rx.combineLatest3(lastRoundStream, countStream, hasUnseenStream,
        (lastRound, count, hasUnseen) {
      final previewRound = lastRound;
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
        roundCount: count,
        previewRoundId: previewRound?.id,
        userPreview: userPreview,
        aiPreview: aiPreview,
        hasUnseen: hasUnseen,
        isStreaming: previewRound?.isIncomplete == true,
      );
    });
  }

  // ========== 细粒度监听（新增） ==========

  Stream<List<({String id, String? parentId})>> watchSessionTopology(String sessionId) {
    final query = _db.selectOnly(_db.dbChatRounds)
      ..addColumns([_db.dbChatRounds.id, _db.dbChatRounds.parentId])
      ..where(_db.dbChatRounds.sessionId.equals(sessionId))
      ..orderBy([OrderingTerm.asc(_db.dbChatRounds.createdAt)]);
    return query.watch().map((rows) => rows.map((r) => (
      id: r.read(_db.dbChatRounds.id)!,
      parentId: r.read(_db.dbChatRounds.parentId)
    )).toList());
  }

  /// 仅监听单条消息的完整详情（含附件）- 改用 rxdart 组合两个独立查询
  Stream<ChatRound?> watchSingleRound(String roundId) {
    final roundStream = (_db.select(_db.dbChatRounds)
          ..where((t) => t.id.equals(roundId)))
        .watchSingleOrNull();

    final attachmentsStream = (_db.select(_db.dbAttachments)
          ..where((t) => t.roundId.equals(roundId)))
        .watch()
        .map((rows) => rows.map((a) => Attachment(
              id: a.id,
              name: a.name,
              relativePath: a.relativePath,
              isImage: a.isImage,
              mimeType: a.mimeType,
            )).toList());

    return Rx.combineLatest2(roundStream, attachmentsStream,
        (DbChatRound? round, List<Attachment> attachments) {
      if (round == null) return null;
      return ChatRound(
        id: round.id,
        parentId: round.parentId,
        createdAt: round.createdAt,
        userContent: round.userContent,
        userAttachments: attachments,
        assistantThinking: round.assistantThinking,
        assistantContent: round.assistantContent,
        isIncomplete: round.isIncomplete,
        hasUnseenUpdate: round.hasUnseenUpdate,
      );
    });
  }

  Future<List<ChatRound>> getContextRounds(String roundId) async {
    final roundsQuery = _db.customSelect(
      '''
      WITH RECURSIVE ctx_chain AS (
        SELECT id, session_id, parent_id, created_at, user_content,
              assistant_thinking, assistant_content, is_incomplete, has_unseen_update
        FROM db_chat_rounds WHERE id = :roundId
        UNION ALL
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

    final roundIds = dbRounds.map((r) => r.id).toList();
    final dbAttachments = await (_db.select(_db.dbAttachments)
          ..where((t) => t.roundId.isIn(roundIds)))
        .get();

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

    return dbRounds.map((round) => _mapToChatRound(round, attachmentMap[round.id] ?? [])).toList();
  }

  Stream<String?> watchSessionTitle(String sessionId) {
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
      } catch (_) {}
    }
  }

  // ========== 写操作 ==========

  Future<void> deleteRoundsAndCleanupOrphanAttachments(
    String sessionId,
    List<String> roundIds,
  ) async {
    if (roundIds.isEmpty) return;

    // 1. 收集候选附件路径（改用直接查询，不用 join）
    final candidatePaths = (await (_db.select(_db.dbAttachments)
          ..where((t) => t.roundId.isIn(roundIds)))
        .get())
        .map((a) => a.relativePath)
        .toSet();

    // 2. 提交数据库变更
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

  Future<void> deleteSession(String sessionId) async {
    // 1. 收集候选附件路径（先查出所有 round id，再查附件）
    final roundIds = await (_db.select(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId)))
        .map((r) => r.id)
        .get();

    final candidatePaths = <String>{};
    if (roundIds.isNotEmpty) {
      final attachments = await (_db.select(_db.dbAttachments)
            ..where((t) => t.roundId.isIn(roundIds)))
          .get();
      candidatePaths.addAll(attachments.map((a) => a.relativePath));
    }

    // 2. 提交数据库变更
    await (_db.delete(_db.dbSessions)..where((t) => t.id.equals(sessionId))).go();

    // 3. 基于最终态清理物理文件
    await _cleanupOrphanAttachments(candidatePaths);
  }

  Future<Session> createSession({
    required String sessionId,
    required String title,
  }) async {
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

  Future<void> updateSessionTitle(String sessionId, String title) async {
    await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .write(
      DbSessionsCompanion(
        title: Value(title),
        updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  Future<void> appendRound(String sessionId, ChatRound round) async {
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

  Future<void> updateRound({
    required String roundId,
    String? assistantThinking,
    String? assistantContent,
    bool? isIncomplete,
    bool? hasUnseenUpdate,
  }) async {
    await (_db.update(_db.dbChatRounds)..where((t) => t.id.equals(roundId)))
        .write(DbChatRoundsCompanion(
          assistantThinking: assistantThinking != null
              ? Value(assistantThinking)
              : const Value.absent(),
          assistantContent: assistantContent != null
              ? Value(assistantContent)
              : const Value.absent(),
          isIncomplete: isIncomplete != null
              ? Value(isIncomplete)
              : const Value.absent(),
          hasUnseenUpdate: hasUnseenUpdate != null
              ? Value(hasUnseenUpdate)
              : const Value.absent(),
        ));
  }

  // ========== 附件读写接口保留 ==========
  Future<String> saveAttachment(Uint8List data, String fileName) async =>
      await _fileService.saveAttachment(data, fileName);

  Future<Uint8List> getAttachment(String relativePath) async =>
      await _fileService.readAttachment(relativePath);

  Future<void> deleteAttachment(String relativePath) async =>
      await _fileService.deleteAttachment(relativePath);
}
````

## File: lib/presentation/pages/settings_page.dart
````dart
// lib/presentation/pages/settings_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config_store.dart';
import '../../core/models/model_info.dart';
import '../../data/services/config_service.dart';
import '../../di/providers.dart';
import '../providers/config_notifier.dart';
import '../providers/settings_form_notifier.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import '../widgets/common/declarative_text_field.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(settingsFormProvider);
    final formNotifier = ref.read(settingsFormProvider.notifier);
    final profilesAsync = ref.watch(configProfilesProvider);
    final configService = ref.read(configServiceProvider);

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('设置'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _confirmRestoreDefaults(context, formNotifier),
          child: const Icon(CupertinoIcons.arrow_counterclockwise),
        ),
      ),
      body: profilesAsync.when(
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (e, _) => Center(child: Text('加载配置存档失败：$e')),
        data: (store) {
          return ListView(
            children: [
              _buildProfileSection(context, store, configService),
              _buildConnectionSection(formState, formNotifier),
              _buildModelSection(formState, formNotifier),
              _buildActionSection(formState, formNotifier),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileSection(
    BuildContext context,
    AppConfigStore store,
    ConfigService configService,
  ) {
    final activeProfile = store.profiles.firstWhere((p) => p.id == store.activeProfileId);
    return CupertinoFormSection.insetGrouped(
      header: const Text('配置存档'),
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
      children: [
        CupertinoFormRow(
          prefix: const Text('当前配置'),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showProfileManagementSheet(context, store, configService),
            child: Text(activeProfile.name),
          ),
        ),
      ],
    );
  }

  Widget _buildConnectionSection(SettingsFormState formState, SettingsFormNotifier notifier) {
    return CupertinoFormSection.insetGrouped(
      header: const Text('连接配置'),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      children: [
        CupertinoFormRow(
          prefix: const Text('Base URL'),
          child: _buildStyledTextField(
            value: formState.config.baseUrl,
            onChanged: notifier.updateBaseUrl,
            placeholder: 'https://api.openai.com',
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('API Key'),
          child: _buildStyledTextField(
            value: formState.config.apiKey,
            onChanged: notifier.updateApiKey,
            placeholder: 'API Key',
            obscureText: true,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('Models Path'),
          child: _buildStyledTextField(
            value: formState.config.modelsPath,
            onChanged: notifier.updateModelsPath,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('Chat Path'),
          child: _buildStyledTextField(
            value: formState.config.chatPath,
            onChanged: notifier.updateChatPath,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('API Mode'),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showApiModePicker(context, notifier),
            child: Text(formState.config.apiMode),
          ),
        ),
      ],
    );
  }

  Widget _buildModelSection(SettingsFormState formState, SettingsFormNotifier notifier) {
    final models = formState.config.availableModels ?? const <ModelInfo>[];
    final currentModelId = formState.config.selectedModel;
    final currentModel = currentModelId != null
        ? models.where((m) => m.id == currentModelId).firstOrNull
        : null;
    final supportsReasoning = currentModel?.overrideSupportsReasoning ?? false;
    final supportsVision = currentModel?.overrideSupportsVision ?? false;

    return CupertinoFormSection.insetGrouped(
      header: const Text('模型设置'),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      children: [
        CupertinoFormRow(
          prefix: const Text('模型 ID'),
          child: Row(
            children: [
              Expanded(
                child: _buildStyledTextField(
                  value: currentModelId ?? '',
                  onChanged: notifier.updateSelectedModel,
                  placeholder: '输入模型 ID',
                ),
              ),
              const SizedBox(width: 8),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                borderRadius: BorderRadius.circular(12),
                onPressed: models.isNotEmpty
                    ? () => _showModelPicker(context, models, notifier)
                    : null,
                child: const Text('从列表选择'),
              ),
              const SizedBox(width: 8),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                borderRadius: BorderRadius.circular(12),
                onPressed: () async {
                  try {
                    await notifier.refreshModels();
                    if (mounted) AppToast.show('模型列表已同步');
                  } catch (e) {
                    if (mounted) AppToast.show('同步模型失败：$e');
                  }
                },
                child: formState.isRefreshingModels
                    ? const SizedBox(width: 20, height: 20, child: CupertinoActivityIndicator())
                    : const Text('立即同步'),
              ),
            ],
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('启用思考'),
          child: CupertinoSwitch(
            value: supportsReasoning,
            onChanged: notifier.toggleReasoning,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('允许图片输入'),
          child: CupertinoSwitch(
            value: supportsVision,
            onChanged: notifier.toggleVision,
          ),
        ),
        if (formState.modelsRefreshError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              '同步错误：${formState.modelsRefreshError}',
              style: const TextStyle(color: CupertinoColors.systemRed),
            ),
          ),
      ],
    );
  }

  Widget _buildActionSection(SettingsFormState formState, SettingsFormNotifier notifier) {
    return CupertinoFormSection.insetGrouped(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
      children: [
        CupertinoFormRow(
          child: CupertinoButton.filled(
            borderRadius: BorderRadius.circular(12),
            onPressed: formState.isSaving
                ? null
                : () async {
                    try {
                      await notifier.save();
                      if (mounted) AppToast.show('设置已保存');
                    } catch (e) {
                      if (mounted) AppToast.show('保存失败：$e');
                    }
                  },
            child: formState.isSaving
                ? const CupertinoActivityIndicator()
                : const Text('保存设置'),
          ),
        ),
        if (formState.error != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              formState.error!,
              style: const TextStyle(color: CupertinoColors.systemRed),
            ),
          ),
      ],
    );
  }

  Widget _buildStyledTextField({
    required String value,
    required ValueChanged<String> onChanged,
    String? placeholder,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DeclarativeCupertinoTextField(
        value: value,
        onChanged: onChanged,
        placeholder: placeholder,
        obscureText: obscureText,
      ),
    );
  }

  // ------------------ 弹窗方法 ------------------
  void _showApiModePicker(BuildContext context, SettingsFormNotifier notifier) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('chat_completions'); Navigator.pop(context); },
            child: const Text('chat_completions'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('responses'); Navigator.pop(context); },
            child: const Text('responses'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('google'); Navigator.pop(context); },
            child: const Text('google'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('local'); Navigator.pop(context); },
            child: const Text('local'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  void _showModelPicker(BuildContext context, List<ModelInfo> models, SettingsFormNotifier notifier) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('选择模型'),
        actions: models.map((model) {
          final label = model.id;
          return CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              notifier.updateSelectedModel(model.id);
            },
            child: Text(label),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  void _showProfileManagementSheet(
    BuildContext context,
    AppConfigStore store,
    ConfigService configService,
  ) {
    final activeProfile = store.profiles.firstWhere((p) => p.id == store.activeProfileId);
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('配置存档管理'),
        actions: [
          ...store.profiles.map((p) => CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              if (p.id != store.activeProfileId) configService.switchProfile(p.id);
            },
            isDefaultAction: p.id == store.activeProfileId,
            child: Row(
              children: [
                Expanded(child: Text(p.name)),
                if (p.id == store.activeProfileId)
                  const Icon(CupertinoIcons.check_mark, size: 18, color: CupertinoColors.systemBlue),
              ],
            ),
          )),
          const SizedBox(height: 8),
          CupertinoActionSheetAction(
            onPressed: () { Navigator.pop(context); _showCreateProfileDialog(context, configService); },
            child: const Text('新建配置'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { Navigator.pop(context); _showRenameProfileDialog(context, activeProfile, configService); },
            child: const Text('重命名当前配置'),
          ),
          if (store.profiles.length > 1)
            CupertinoActionSheetAction(
              onPressed: () { Navigator.pop(context); _deleteProfile(context, activeProfile, store.profiles.length, configService); },
              isDestructiveAction: true,
              child: const Text('删除当前配置'),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  Future<void> _showCreateProfileDialog(BuildContext context, ConfigService configService) async {
    final controller = TextEditingController();
    final result = await showCupertinoDialog<String>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('新建配置存档'),
        content: CupertinoTextField(controller: controller, autofocus: true, placeholder: '输入配置名称'),
        actions: [
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(), child: const Text('取消')),
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(controller.text.trim()), child: const Text('创建')),
        ],
      ),
    );
    if (result != null && result.isNotEmpty) await configService.createProfile(result);
  }

  Future<void> _showRenameProfileDialog(BuildContext context, ConfigProfile profile, ConfigService configService) async {
    final controller = TextEditingController(text: profile.name);
    final result = await showCupertinoDialog<String>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('重命名配置存档'),
        content: CupertinoTextField(controller: controller, autofocus: true, placeholder: '输入配置名称'),
        actions: [
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(), child: const Text('取消')),
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(controller.text.trim()), child: const Text('保存')),
        ],
      ),
    );
    if (result != null && result.isNotEmpty) await configService.renameProfile(profile.id, result);
  }

  Future<void> _deleteProfile(BuildContext context, ConfigProfile profile, int profileCount, ConfigService configService) async {
    if (profileCount <= 1) {
      AppToast.show('至少保留一个配置存档');
      return;
    }
    final confirmed = await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('删除配置存档'),
            content: Text('确定删除 "${profile.name}" 吗？'),
            actions: [
              CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
              CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(true), isDestructiveAction: true, child: const Text('删除')),
            ],
          ),
        ) ??
        false;
    if (confirmed) await configService.deleteProfile(profile.id);
  }

  Future<void> _confirmRestoreDefaults(BuildContext context, SettingsFormNotifier notifier) async {
    final confirmed = await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('恢复默认设置'),
            content: const Text('确定要将当前配置存档恢复为默认设置吗？'),
            actions: [
              CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(true), 
                isDestructiveAction: true,
                child: const Text('恢复默认'),
              ),
            ],
          ),
        ) ??
        false;
    if (confirmed) {
      notifier.restoreDefaults();
      await notifier.save();
      if (mounted) AppToast.show('已恢复默认设置');
    }
  }
}
````

## File: lib/presentation/pages/home_page.dart
````dart
import 'package:aiservice/di/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/session_list_item.dart';
import '../providers/session_list_notifier.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/input_bar.dart';
import 'chat_page.dart';
import 'settings_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Future<void> _showRenameDialog(
    BuildContext context,
    WidgetRef ref,
    SessionListItem item,
  ) async {
    final controllerText = TextEditingController(text: item.title);
    final result = await showCupertinoDialog<String>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('重命名会话'),
        content: CupertinoTextField(
          controller: controllerText,
          autofocus: true,
          placeholder: '输入新的会话名称',
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('取消'),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(ctx).pop(controllerText.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );
    if (result != null && result.isNotEmpty && result != item.title) {
      final repository = ref.read(conversationRepositoryProvider);
      await repository.updateSessionTitle(item.id, result);
    }
  }

  Future<void> _showDeleteConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    SessionListItem item,
  ) async {
    final confirmed = await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('删除会话'),
            content: Text('确定要删除 "${item.title}" 吗？\n此操作无法撤销。'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(true),
                isDestructiveAction: true,
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;

    if (confirmed == true) {
      final repository = ref.read(conversationRepositoryProvider);
      await repository.deleteSession(item.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(sessionListProvider);

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('AI Chat'),
        trailing: CupertinoButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => const SettingsPage(),
              ),
            );
          },
          child: const Icon(CupertinoIcons.settings),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: sessionsAsync.when(
              loading: () => const Center(child: CupertinoActivityIndicator()),
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
                      onRename: (item) => _showRenameDialog(context, ref, item),
                      onDelete: (item) => _showDeleteConfirmDialog(context, ref, item),
                    );
                  },
                );
              },
            ),
          ),
          InputBar(
            hintText: '发送消息',
            onSend: (content, attachments) async {
              final repository = ref.read(conversationRepositoryProvider);
              final sessionId = const Uuid().v4();
              await repository.createSession(sessionId: sessionId, title: '新对话');
              if (context.mounted) {
                await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ChatPage(
                      sessionId: sessionId,
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
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(CupertinoIcons.sparkles, size: 40),
              SizedBox(height: 16),
              Text(
                '开始你的第一段对话',
                style: TextStyle(fontSize: 20),
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
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.exclamationmark_triangle,
                size: 40,
                color: CupertinoColors.systemRed,
              ),
              const SizedBox(height: 12),
              const Text(
                '出现了一点问题',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              CupertinoButton.filled(
                onPressed: onRetry,
                child: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlueDot extends StatelessWidget {
  const _BlueDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: CupertinoColors.systemBlue,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _BlinkingDot extends StatefulWidget {
  const _BlinkingDot();

  @override
  State<_BlinkingDot> createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<_BlinkingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemOrange,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _SessionCard extends ConsumerWidget {
  final SessionListItem item;
  final Future<void> Function(SessionListItem item) onRename;
  final Future<void> Function(SessionListItem item) onDelete;

  const _SessionCard({
    required this.item,
    required this.onRename,
    required this.onDelete,
  });

  Widget _buildMetaChip(String label, {IconData? icon}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 12),
          const SizedBox(width: 4),
        ],
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionId = item.id;
    final updatedAt = DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(DateTime.fromMillisecondsSinceEpoch(item.updatedAt));
    final metaAsync = ref.watch(sessionCardMetaProvider(item.id));

    return LayoutBuilder(
      builder: (context, constraints) {
        // 获取父级最大宽度，并减去可能的内边距（ListView 默认有 padding 16）
        final maxWidth = constraints.maxWidth - 32;
        return CupertinoContextMenu(
          actions: [
            CupertinoContextMenuAction(
              child: const Text('重命名'),
              onPressed: () => onRename(item),
            ),
            CupertinoContextMenuAction(
              child: const Text('删除'),
              isDestructiveAction: true,
              onPressed: () => onDelete(item),
            ),
          ],
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ChatPage(sessionId: sessionId),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CupertinoDynamicColor.resolve(
                    CupertinoColors.systemBackground,
                    context,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: metaAsync.when(
                  loading: () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      const Text('加载中...'),
                      const SizedBox(height: 8),
                      _buildMetaChip(updatedAt, icon: CupertinoIcons.clock),
                    ],
                  ),
                  error: (e, st) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      const Text('加载摘要失败'),
                      const SizedBox(height: 8),
                      _buildMetaChip(updatedAt, icon: CupertinoIcons.clock),
                    ],
                  ),
                  data: (meta) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                            const _BlinkingDot(),
                          ],
                          if (meta.hasUnseen) ...[
                            const SizedBox(width: 8),
                            const _BlueDot(),
                          ],
                        ],
                      ),
                      const SizedBox(height: 8),
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
                      _buildMetaChip(updatedAt, icon: CupertinoIcons.clock),
                    ],
                  ),
                ),
              ),
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
    final textTheme = CupertinoTheme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label  ',
          style: textTheme.textStyle,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.textStyle,
          ),
        ),
      ],
    );
  }
}
````

## File: lib/presentation/pages/branch_tree_page.dart
````dart
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../di/providers.dart';
import '../../domain/models/tree_node.dart';
import '../../domain/services/tree_builder.dart';
import '../providers/chat_notifier.dart' show chatTopologyProvider, roundDetailProvider;
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

const double _nodeWidth = 300.0;
const double _nodeHeight = 200.0;
const double _levelSeparation = 120.0;
const double _siblingSeparation = 40.0;
const double _canvasPadding = 2000.0;

class BranchTreePage extends ConsumerStatefulWidget {
  final String sessionId;
  final String initialFocusRoundId;

  const BranchTreePage({
    super.key,
    required this.sessionId,
    required this.initialFocusRoundId,
  });

  @override
  ConsumerState<BranchTreePage> createState() => _BranchTreePageState();
}

class _BranchTreePageState extends ConsumerState<BranchTreePage> {
  final TransformationController _transformationController = TransformationController();
  final GlobalKey _viewerKey = GlobalKey();
  final Map<String, double> _nodeWidthCache = {};
  bool _hasFocused = false;

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _computeWidthsForTree(TreeNode root) {
    void postOrder(TreeNode node) {
      if (node.children.isEmpty) {
        _nodeWidthCache[node.id] = _nodeWidth;
        return;
      }
      double total = 0;
      for (final child in node.children) {
        postOrder(child);
        total += _nodeWidthCache[child.id]!;
      }
      total += (node.children.length - 1) * _siblingSeparation;
      _nodeWidthCache[node.id] = total;
    }
    postOrder(root);
  }

  double _subtreeWidth(TreeNode node) {
    return _nodeWidthCache[node.id] ?? _nodeWidth;
  }

  void _layoutNode(TreeNode node, double x, double y, Map<String, Offset> positions) {
    positions[node.id] = Offset(x, y);
    if (node.children.isEmpty) return;

    final childWidths = node.children.map((c) => _subtreeWidth(c)).toList();
    final totalChildrenWidth = childWidths.fold(0.0, (a, b) => a + b) +
        (node.children.length - 1) * _siblingSeparation;
    double startX = x + (_nodeWidth - totalChildrenWidth) / 2;
    for (int i = 0; i < node.children.length; i++) {
      final child = node.children[i];
      final childWidth = childWidths[i];
      final childX = startX + childWidth / 2 - _nodeWidth / 2;
      _layoutNode(child, childX, y + _nodeHeight + _levelSeparation, positions);
      startX += childWidth + _siblingSeparation;
    }
  }

  _TreeLayout _computeLayout(List<TreeNode> roots) {
    _nodeWidthCache.clear();
    for (final root in roots) {
      _computeWidthsForTree(root);
    }
    final positions = <String, Offset>{};
    double currentX = 0;
    double maxHeight = 0;

    for (final root in roots) {
      final tempPositions = <String, Offset>{};
      _layoutNode(root, currentX, 0, tempPositions);

      double minX = double.infinity, maxX = -double.infinity;
      double minY = double.infinity, maxY = -double.infinity;
      for (final pos in tempPositions.values) {
        minX = min(minX, pos.dx);
        maxX = max(maxX, pos.dx + _nodeWidth);
        minY = min(minY, pos.dy);
        maxY = max(maxY, pos.dy + _nodeHeight);
      }
      final width = maxX - minX;
      final height = maxY - minY;

      final offsetX = currentX - minX;
      for (final entry in tempPositions.entries) {
        positions[entry.key] = Offset(entry.value.dx + offsetX, entry.value.dy);
      }

      currentX += width + _siblingSeparation;
      maxHeight = max(maxHeight, height);
    }

    final canvasWidth = currentX + _canvasPadding * 2;
    final canvasHeight = maxHeight + _canvasPadding * 2;
    return _TreeLayout(positions: positions, canvasSize: Size(canvasWidth, canvasHeight));
  }

  List<(Offset, Offset)> _buildParentChildPairs(List<TreeNode> roots, Map<String, Offset> positions) {
    final pairs = <(Offset, Offset)>[];
    void traverse(TreeNode node) {
      final parentPos = positions[node.id];
      if (parentPos == null) return;
      for (final child in node.children) {
        final childPos = positions[child.id];
        if (childPos != null) {
          pairs.add((parentPos, childPos));
        }
        traverse(child);
      }
    }
    for (final root in roots) traverse(root);
    return pairs;
  }

  List<Widget> _buildAllNodeWidgets(List<TreeNode> roots, Map<String, Offset> positions) {
    final widgets = <Widget>[];
    void addNode(TreeNode node) {
      final pos = positions[node.id];
      if (pos != null) {
        widgets.add(
          Positioned(
            left: pos.dx,
            top: pos.dy,
            child: _TreeNodeCard(
              roundId: node.id,
              onSwitch: () => Navigator.of(context).pop(node.id),
              onDelete: () async {
                if (await _confirmDelete()) await _deleteNode(node.id);
              },
            ),
          ),
        );
      }
      for (final child in node.children) addNode(child);
    }
    for (final root in roots) addNode(root);
    return widgets;
  }

  Future<void> _deleteNode(String nodeId) async {
    final topology = await ref.read(chatTopologyProvider(widget.sessionId).future);
    final roots = buildTree(topology);
    final target = _findNodeById(roots, nodeId);
    if (target == null) return;
    final ids = _collectSubtreeIds(target).toList();
    try {
      await ref.read(conversationRepositoryProvider)
          .deleteRoundsAndCleanupOrphanAttachments(widget.sessionId, ids);
    } catch (e) {
      if (mounted) AppToast.show('删除失败：$e');
    }
  }

  Future<bool> _confirmDelete() async {
    return await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('删除节点'),
            content: const Text('确定删除这一轮及其后续全部分支吗？'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(true),
                isDestructiveAction: true,
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;
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

  TreeNode? _findNodeById(List<TreeNode> roots, String targetId) {
    final stack = [...roots];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      if (node.id == targetId) return node;
      stack.addAll(node.children);
    }
    return null;
  }

  void _focusOnNode(String nodeId, Map<String, Offset> positions) {
    if (_hasFocused) return;
    final nodePos = positions[nodeId];
    if (nodePos == null) return;
    final viewerBox = _viewerKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewerBox == null) return;
    final viewerSize = viewerBox.size;
    final nodeCenter = Offset(nodePos.dx + _nodeWidth / 2, nodePos.dy + _nodeHeight / 2);
    final targetOffset = Offset(viewerSize.width / 2 - nodeCenter.dx, viewerSize.height / 2 - nodeCenter.dy);
    _transformationController.value = Matrix4.identity()..translate(targetOffset.dx, targetOffset.dy);
    _hasFocused = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final topology = ref.watch(chatTopologyProvider(widget.sessionId));
    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: const Text('分支树')),
      body: topology.when(
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (err, _) => Center(child: Text('加载分支结构失败：$err')),
        data: (topology) {
          final roots = buildTree(topology);
          if (roots.isEmpty) return const Center(child: Text('暂无分支结构'));
          final layout = _computeLayout(roots);
          final positions = layout.positions;
          final canvasSize = layout.canvasSize;
          final pairs = _buildParentChildPairs(roots, positions);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!_hasFocused) _focusOnNode(widget.initialFocusRoundId, positions);
          });
          return InteractiveViewer(
            key: _viewerKey,
            transformationController: _transformationController,
            minScale: 0.2,
            maxScale: 3.0,
            constrained: false,
            boundaryMargin: const EdgeInsets.all(_canvasPadding),
            child: SizedBox(
              width: canvasSize.width,
              height: canvasSize.height,
              child: Stack(
                children: [
                  CustomPaint(
                    painter: _OrthogonalLinePainter(pairs: pairs),
                    size: canvasSize,
                  ),
                  ..._buildAllNodeWidgets(roots, positions),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TreeLayout {
  final Map<String, Offset> positions;
  final Size canvasSize;
  _TreeLayout({required this.positions, required this.canvasSize});
}

class _OrthogonalLinePainter extends CustomPainter {
  final List<(Offset, Offset)> pairs;
  _OrthogonalLinePainter({required this.pairs});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CupertinoColors.separator
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;
    for (final pair in pairs) {
      final parentCenter = Offset(pair.$1.dx + _nodeWidth / 2, pair.$1.dy + _nodeHeight / 2);
      final childCenter = Offset(pair.$2.dx + _nodeWidth / 2, pair.$2.dy + _nodeHeight / 2);
      final start = Offset(parentCenter.dx, parentCenter.dy + _nodeHeight / 2);
      final end = Offset(childCenter.dx, childCenter.dy - _nodeHeight / 2);
      final midY = (start.dy + end.dy) / 2;
      final path = Path()
        ..moveTo(start.dx, start.dy)
        ..lineTo(start.dx, midY)
        ..lineTo(end.dx, midY)
        ..lineTo(end.dx, end.dy);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _OrthogonalLinePainter oldDelegate) => true;
}

class _TreeNodeCard extends ConsumerWidget {
  final String roundId;
  final VoidCallback onSwitch;
  final VoidCallback onDelete;

  const _TreeNodeCard({
    required this.roundId,
    required this.onSwitch,
    required this.onDelete,
  });

  Widget _buildStatusDot({required bool isStreaming, required bool hasUnseen}) {
    if (isStreaming) {
      return Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemOrange,
          shape: BoxShape.circle,
        ),
      );
    }
    if (hasUnseen) {
      return Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemBlue,
          shape: BoxShape.circle,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId)).valueOrNull;
    final dateText = round == null
        ? null
        : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(round.createdAt));
    final userText = round?.userContent;
    final aiText = round == null
        ? null
        : ((round.assistantContent ?? '').trim().isEmpty ? '（等待回复）' : round.assistantContent!);

    return CupertinoContextMenu(
      actions: [
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
            onDelete();
          },
          isDestructiveAction: true,
          child: const Text('删除节点'),
        ),
      ],
      child: Container(
        width: _nodeWidth,
        height: _nodeHeight,
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    dateText ?? '加载中...',
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (round != null && (round.isIncomplete || round.hasUnseenUpdate))
                  _buildStatusDot(isStreaming: round.isIncomplete, hasUnseen: round.hasUnseenUpdate),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(child: _PreviewSlot(label: 'YOU', content: userText, loading: round == null)),
            const SizedBox(height: 4),
            Expanded(child: _PreviewSlot(label: 'AI', content: aiText, loading: round == null)),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton.filled(
                borderRadius: BorderRadius.circular(12),
                onPressed: onSwitch,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text('切换到此分支'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PreviewSlot extends StatelessWidget {
  final String label;
  final String? content;
  final bool loading;

  const _PreviewSlot({
    required this.label,
    required this.content,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = CupertinoDynamicColor.resolve(CupertinoColors.label, context);
    final style = CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: textColor);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 34,
          child: Text('$label ', style: style),
        ),
        Expanded(
          child: loading
              ? const Text('加载中...', maxLines: 2, overflow: TextOverflow.ellipsis)
              : Text(
                  (content == null || content!.trim().isEmpty) ? '（空）' : content!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
        ),
      ],
    );
  }
}
````

## File: lib/presentation/providers/chat_notifier.dart
````dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/chat_round.dart';
import '../../di/providers.dart';

final sessionTitleProvider = StreamProvider.family<String, String>((ref, sessionId) {
  return ref.watch(conversationRepositoryProvider).watchSessionTitle(sessionId)
      .map((title) => title ?? '对话');
});

final chatTopologyProvider =
    StreamProvider.family<List<({String id, String? parentId})>, String>(
  (ref, sessionId) {
    return ref.watch(conversationRepositoryProvider).watchSessionTopology(sessionId);
  },
);

final roundDetailProvider = StreamProvider.family<ChatRound?, String>((ref, roundId) {
  return ref.watch(conversationRepositoryProvider).watchSingleRound(roundId);
});

final visibleRoundIdsProvider =
    Provider.family<List<String>, ({String sessionId, String? roundId})>(
  (ref, args) {
    final topology = ref.watch(chatTopologyProvider(args.sessionId)).valueOrNull ?? [];
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
````

## File: lib/presentation/pages/chat_page.dart
````dart
import 'package:aiservice/di/providers.dart';
import 'package:aiservice/domain/services/character_card_parser.dart';
import 'package:aiservice/domain/services/chat_service.dart';
import 'package:aiservice/presentation/models/pending_attachment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/chat_notifier.dart';
import '../widgets/attachment_list.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/thought_bubble.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import 'branch_tree_page.dart';
import '../providers/character_provider.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String sessionId;
  final String? initialRoundId;
  final String? initialMessage;
  final List<PendingAttachment>? initialAttachments;

  const ChatPage({
    super.key,
    required this.sessionId,
    this.initialRoundId,
    this.initialMessage,
    this.initialAttachments,
  });

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  PageController? _pageController;
  bool _initialMessageHandled = false;

  String? _branchLeafId;
  String? _currentRoundId;
  
  @override
  void initState() {
    super.initState();
    _branchLeafId = widget.initialRoundId;
    _currentRoundId = widget.initialRoundId;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ensureInitialRoundId();
    });
  }

  String _getTitleWithPage(String sessionTitle, List<String> visibleRoundIds, String? currentRoundId) {
    final total = visibleRoundIds.length;
    final currentIndex = visibleRoundIds.indexOf(currentRoundId ?? '');
    if (currentIndex == -1) return sessionTitle;
    return '$sessionTitle (${currentIndex + 1}/$total)';
  }

  Future<void> _ensureInitialRoundId() async {
    if (_branchLeafId != null) return;
    final topology = await ref.read(chatTopologyProvider(widget.sessionId).future);
    if (topology.isNotEmpty && mounted) {
      setState(() {
        _branchLeafId = topology.last.id;
        _currentRoundId = _branchLeafId;
      });
    }
  }

  Future<void> _maybeSendGreeting() async {
    final character = ref.read(currentCharacterProvider);
    final greetingSent = ref.read(characterGreetingSentProvider);
    
    if (character != null && !greetingSent && character.firstMes.isNotEmpty) {
      ref.read(characterGreetingSentProvider.notifier).state = true;
      
      final newId = await character.appendGreeting(
        repository: ref.read(conversationRepositoryProvider),
        sessionId: widget.sessionId,
      );
      _updateBranch(newId);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleInitialMessage();
  }

  void _handleInitialMessage() async { 
    if (_initialMessageHandled || widget.initialMessage == null) return;
    _initialMessageHandled = true;

    try {
      final newId = await ChatService.sendMessage(
        repository: ref.read(conversationRepositoryProvider),
        configService: ref.read(configServiceProvider),
        sourceRouter: ref.read(chatSourceRouterProvider),
        sessionId: widget.sessionId,
        content: widget.initialMessage!,
        parentRoundId: _currentRoundId,
        pendingAttachments: widget.initialAttachments ?? [],
        character: ref.read(currentCharacterProvider),
      );
      _updateBranch(newId);
    } catch (e) {
      AppToast.show('发送失败：$e');
    }
  }

  @override
  void dispose() {
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
    final hasUnseen = ref.watch(
      roundDetailProvider(_currentRoundId ?? '').select(
        (round) => round.valueOrNull?.hasUnseenUpdate ?? false,
      ),
    );

    if (hasUnseen && ModalRoute.of(context)?.isCurrent == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref.read(conversationRepositoryProvider).updateRound(
                roundId: _currentRoundId!,
                hasUnseenUpdate: false,
              );
        }
      });
    }

    final sessionTitle = ref.watch(sessionTitleProvider(widget.sessionId)).valueOrNull ?? '未加载';
    final currentRoundAsync = ref.watch(roundDetailProvider(_currentRoundId ?? ''));
    final isIncomplete = currentRoundAsync.valueOrNull?.isIncomplete ?? false;
    
    ref.listen<CharacterData?>(
      currentCharacterProvider,
      (previous, next) {
        if (previous?.name != next?.name) {
          ref.read(characterGreetingSentProvider.notifier).state = false;
        }
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maybeSendGreeting();
    });

    final visibleRoundIds = ref.watch(visibleRoundIdsProvider(( 
      sessionId: widget.sessionId,
      roundId: _branchLeafId,
    )));

    int currentIndex = visibleRoundIds.indexOf(_currentRoundId ?? '');

    if (currentIndex != -1) {
      _pageController ??= PageController(initialPage: currentIndex);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageController!.jumpToPage(currentIndex);
      });
    } else {
      _pageController ??= PageController(initialPage: 0);
    }

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_getTitleWithPage(sessionTitle, visibleRoundIds, _currentRoundId)),
        trailing: CupertinoButton(
          onPressed: () async {
            final selectedId = await Navigator.of(context).push<String>(
              CupertinoPageRoute(
                builder: (_) => BranchTreePage(
                  sessionId: widget.sessionId,
                  initialFocusRoundId: _currentRoundId!,
                ),
              ),
            );
            if (selectedId != null) _updateBranch(selectedId);
          },
          child: const Icon(CupertinoIcons.arrow_branch),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: visibleRoundIds.isEmpty
                ? const Center(child: Text('加载中'))
                : PageView.builder(
                    controller: _pageController,
                    physics: const PageScrollPhysics(),
                    itemCount: visibleRoundIds.length,
                    onPageChanged: (index) {
                      final targetId = visibleRoundIds[index];
                      setState(() => _currentRoundId = targetId);
                    },
                    itemBuilder: (_, index) => _ChatRoundPage(
                      key: ValueKey(visibleRoundIds[index]),
                      sessionId: widget.sessionId,
                      roundId: visibleRoundIds[index],
                      onRetryReply: () => _retry(visibleRoundIds[index]),
                    ),
                  ),
          ),
          InputBar(
            hintText: '发送消息',
            isIncomplete: isIncomplete, 
            onStop: () {
              ChatService.stopGeneration(
                _currentRoundId!, 
                ref.read(conversationRepositoryProvider),
              );
            },
            onSend: (text, attachments) async {
              final newId = await ChatService.sendMessage(
                repository: ref.read(conversationRepositoryProvider),
                configService: ref.read(configServiceProvider),
                sourceRouter: ref.read(chatSourceRouterProvider),
                sessionId: widget.sessionId,
                content: text,
                parentRoundId: _currentRoundId,
                pendingAttachments: attachments,
                character: ref.read(currentCharacterProvider),
              );
              _updateBranch(newId);
            },
          ),
        ],
      ),
    );
  }

  void _retry(String roundId) async {
    final sourceRound = await ref.read(roundDetailProvider(roundId).future);
    if (sourceRound == null) return;

    final newId = await ChatService.retryFromRound(
      repository: ref.read(conversationRepositoryProvider),
      configService: ref.read(configServiceProvider),
      sourceRouter: ref.read(chatSourceRouterProvider),
      sessionId: widget.sessionId,
      sourceRound: sourceRound,
      character: ref.read(currentCharacterProvider),
    );
    _updateBranch(newId);
  }
}

class _ChatRoundPage extends StatelessWidget {
  final String sessionId;
  final String roundId;
  final VoidCallback onRetryReply;

  const _ChatRoundPage({
    super.key,
    required this.sessionId,
    required this.roundId,
    required this.onRetryReply,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _UserSection(
              roundId: roundId,
              onRetryReply: onRetryReply,
            ),
            _ThinkingSection(roundId: roundId),
            _AiReplySection(
              roundId: roundId,
              onRetryReply: onRetryReply,
            ),
          ],
        ),
      ],
    );
  }
}

class _UserSection extends ConsumerWidget {
  final String roundId;
  final VoidCallback onRetryReply;

  const _UserSection({
    required this.roundId,
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
        Center(
          child: Text(
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(round.time)),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.88,
            ),
            child: MessageBubble(
              content: round.content,
              isUser: true,
              onCopy: () {
                Clipboard.setData(ClipboardData(text: round.content));
                AppToast.show('已复制');
              },
              onRetryReply: onRetryReply,
            ),
          ),
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
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.88,
        ),
        child: ThoughtBubble(content: thinking),
      ),
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
        if (ai.content != null)
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.88,
              ),
              child: MessageBubble(
                content: ai.content!,
                isUser: false,
                onCopy: () {
                  Clipboard.setData(ClipboardData(text: ai.content!));
                  AppToast.show('已复制');
                },
                onRetryReply: ai.isIncomplete ? null : onRetryReply,
              ),
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.all(8),
            child: CupertinoActivityIndicator(),
          ),
      ],
    );
  }
}
````
