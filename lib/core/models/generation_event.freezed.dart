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
  String get content => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content, String reasoning) partial,
    required TResult Function(String content, String reasoning) completed,
    required TResult Function(String error, String content, String reasoning)
    failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error, String content, String reasoning)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error, String content, String reasoning)? failed,
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

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerationEventCopyWith<GenerationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationEventCopyWith<$Res> {
  factory $GenerationEventCopyWith(
    GenerationEvent value,
    $Res Function(GenerationEvent) then,
  ) = _$GenerationEventCopyWithImpl<$Res, GenerationEvent>;
  @useResult
  $Res call({String content, String reasoning});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? reasoning = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PartialGenerationImplCopyWith<$Res>
    implements $GenerationEventCopyWith<$Res> {
  factory _$$PartialGenerationImplCopyWith(
    _$PartialGenerationImpl value,
    $Res Function(_$PartialGenerationImpl) then,
  ) = __$$PartialGenerationImplCopyWithImpl<$Res>;
  @override
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
    required TResult Function(String error, String content, String reasoning)
    failed,
  }) {
    return partial(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error, String content, String reasoning)? failed,
  }) {
    return partial?.call(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error, String content, String reasoning)? failed,
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

  @override
  String get content;
  @override
  String get reasoning;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartialGenerationImplCopyWith<_$PartialGenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompletedGenerationImplCopyWith<$Res>
    implements $GenerationEventCopyWith<$Res> {
  factory _$$CompletedGenerationImplCopyWith(
    _$CompletedGenerationImpl value,
    $Res Function(_$CompletedGenerationImpl) then,
  ) = __$$CompletedGenerationImplCopyWithImpl<$Res>;
  @override
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
    required TResult Function(String error, String content, String reasoning)
    failed,
  }) {
    return completed(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error, String content, String reasoning)? failed,
  }) {
    return completed?.call(content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error, String content, String reasoning)? failed,
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

  @override
  String get content;
  @override
  String get reasoning;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompletedGenerationImplCopyWith<_$CompletedGenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedGenerationImplCopyWith<$Res>
    implements $GenerationEventCopyWith<$Res> {
  factory _$$FailedGenerationImplCopyWith(
    _$FailedGenerationImpl value,
    $Res Function(_$FailedGenerationImpl) then,
  ) = __$$FailedGenerationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error, String content, String reasoning});
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
  $Res call({
    Object? error = null,
    Object? content = null,
    Object? reasoning = null,
  }) {
    return _then(
      _$FailedGenerationImpl(
        error: null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String,
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

class _$FailedGenerationImpl implements FailedGeneration {
  const _$FailedGenerationImpl({
    required this.error,
    this.content = '',
    this.reasoning = '',
  });

  @override
  final String error;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String reasoning;

  @override
  String toString() {
    return 'GenerationEvent.failed(error: $error, content: $content, reasoning: $reasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedGenerationImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, content, reasoning);

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
    required TResult Function(String error, String content, String reasoning)
    failed,
  }) {
    return failed(error, content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content, String reasoning)? partial,
    TResult? Function(String content, String reasoning)? completed,
    TResult? Function(String error, String content, String reasoning)? failed,
  }) {
    return failed?.call(error, content, reasoning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content, String reasoning)? partial,
    TResult Function(String content, String reasoning)? completed,
    TResult Function(String error, String content, String reasoning)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error, content, reasoning);
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
  const factory FailedGeneration({
    required final String error,
    final String content,
    final String reasoning,
  }) = _$FailedGenerationImpl;

  String get error;
  @override
  String get content;
  @override
  String get reasoning;

  /// Create a copy of GenerationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedGenerationImplCopyWith<_$FailedGenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
