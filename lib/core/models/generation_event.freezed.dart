// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GenerationEvent {

 String get content; String get reasoning;
/// Create a copy of GenerationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerationEventCopyWith<GenerationEvent> get copyWith => _$GenerationEventCopyWithImpl<GenerationEvent>(this as GenerationEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GenerationEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerationEvent&&(identical(other.content, _this.content) || other.content == _this.content)&&(identical(other.reasoning, _this.reasoning) || other.reasoning == _this.reasoning));
}


@override
int get hashCode {
  final _this = this as GenerationEvent;
  return Object.hash(runtimeType,_this.content,_this.reasoning);
}

@override
String toString() {
  final _this = this as GenerationEvent;
  return 'GenerationEvent(content: ${_this.content}, reasoning: ${_this.reasoning})';
}


}

/// @nodoc
abstract mixin class $GenerationEventCopyWith<$Res>  {
  factory $GenerationEventCopyWith(GenerationEvent value, $Res Function(GenerationEvent) _then) = _$GenerationEventCopyWithImpl;
@useResult
$Res call({
 String content, String reasoning
});




}
/// @nodoc
class _$GenerationEventCopyWithImpl<$Res>
    implements $GenerationEventCopyWith<$Res> {
  _$GenerationEventCopyWithImpl(this._self, this._then);

  final GenerationEvent _self;
  final $Res Function(GenerationEvent) _then;

/// Create a copy of GenerationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? reasoning = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerationEvent].
extension GenerationEventPatterns on GenerationEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PartialGeneration value)?  partial,TResult Function( CompletedGeneration value)?  completed,TResult Function( FailedGeneration value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PartialGeneration() when partial != null:
return partial(_that);case CompletedGeneration() when completed != null:
return completed(_that);case FailedGeneration() when failed != null:
return failed(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PartialGeneration value)  partial,required TResult Function( CompletedGeneration value)  completed,required TResult Function( FailedGeneration value)  failed,}){
final _that = this;
switch (_that) {
case PartialGeneration():
return partial(_that);case CompletedGeneration():
return completed(_that);case FailedGeneration():
return failed(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PartialGeneration value)?  partial,TResult? Function( CompletedGeneration value)?  completed,TResult? Function( FailedGeneration value)?  failed,}){
final _that = this;
switch (_that) {
case PartialGeneration() when partial != null:
return partial(_that);case CompletedGeneration() when completed != null:
return completed(_that);case FailedGeneration() when failed != null:
return failed(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String content,  String reasoning)?  partial,TResult Function( String content,  String reasoning)?  completed,TResult Function( String error,  String content,  String reasoning)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PartialGeneration() when partial != null:
return partial(_that.content,_that.reasoning);case CompletedGeneration() when completed != null:
return completed(_that.content,_that.reasoning);case FailedGeneration() when failed != null:
return failed(_that.error,_that.content,_that.reasoning);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String content,  String reasoning)  partial,required TResult Function( String content,  String reasoning)  completed,required TResult Function( String error,  String content,  String reasoning)  failed,}) {final _that = this;
switch (_that) {
case PartialGeneration():
return partial(_that.content,_that.reasoning);case CompletedGeneration():
return completed(_that.content,_that.reasoning);case FailedGeneration():
return failed(_that.error,_that.content,_that.reasoning);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String content,  String reasoning)?  partial,TResult? Function( String content,  String reasoning)?  completed,TResult? Function( String error,  String content,  String reasoning)?  failed,}) {final _that = this;
switch (_that) {
case PartialGeneration() when partial != null:
return partial(_that.content,_that.reasoning);case CompletedGeneration() when completed != null:
return completed(_that.content,_that.reasoning);case FailedGeneration() when failed != null:
return failed(_that.error,_that.content,_that.reasoning);case _:
  return null;

}
}

}

/// @nodoc


class PartialGeneration implements GenerationEvent {
  const PartialGeneration({required this.content, required this.reasoning});
  

@override final  String content;
@override final  String reasoning;

/// Create a copy of GenerationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartialGenerationCopyWith<PartialGeneration> get copyWith => _$PartialGenerationCopyWithImpl<PartialGeneration>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PartialGeneration&&(identical(other.content, content) || other.content == content)&&(identical(other.reasoning, reasoning) || other.reasoning == reasoning));
}


@override
int get hashCode {
    return Object.hash(runtimeType,content,reasoning);
}

@override
String toString() {
    return 'GenerationEvent.partial(content: $content, reasoning: $reasoning)';
}


}

/// @nodoc
abstract mixin class $PartialGenerationCopyWith<$Res> implements $GenerationEventCopyWith<$Res> {
  factory $PartialGenerationCopyWith(PartialGeneration value, $Res Function(PartialGeneration) _then) = _$PartialGenerationCopyWithImpl;
@override @useResult
$Res call({
 String content, String reasoning
});




}
/// @nodoc
class _$PartialGenerationCopyWithImpl<$Res>
    implements $PartialGenerationCopyWith<$Res> {
  _$PartialGenerationCopyWithImpl(this._self, this._then);

  final PartialGeneration _self;
  final $Res Function(PartialGeneration) _then;

/// Create a copy of GenerationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? reasoning = null,}) {
  return _then(PartialGeneration(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CompletedGeneration implements GenerationEvent {
  const CompletedGeneration({required this.content, required this.reasoning});
  

@override final  String content;
@override final  String reasoning;

/// Create a copy of GenerationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompletedGenerationCopyWith<CompletedGeneration> get copyWith => _$CompletedGenerationCopyWithImpl<CompletedGeneration>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CompletedGeneration&&(identical(other.content, content) || other.content == content)&&(identical(other.reasoning, reasoning) || other.reasoning == reasoning));
}


@override
int get hashCode {
    return Object.hash(runtimeType,content,reasoning);
}

@override
String toString() {
    return 'GenerationEvent.completed(content: $content, reasoning: $reasoning)';
}


}

/// @nodoc
abstract mixin class $CompletedGenerationCopyWith<$Res> implements $GenerationEventCopyWith<$Res> {
  factory $CompletedGenerationCopyWith(CompletedGeneration value, $Res Function(CompletedGeneration) _then) = _$CompletedGenerationCopyWithImpl;
@override @useResult
$Res call({
 String content, String reasoning
});




}
/// @nodoc
class _$CompletedGenerationCopyWithImpl<$Res>
    implements $CompletedGenerationCopyWith<$Res> {
  _$CompletedGenerationCopyWithImpl(this._self, this._then);

  final CompletedGeneration _self;
  final $Res Function(CompletedGeneration) _then;

/// Create a copy of GenerationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? reasoning = null,}) {
  return _then(CompletedGeneration(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FailedGeneration implements GenerationEvent {
  const FailedGeneration({required this.error, this.content = '', this.reasoning = ''});
  

 final  String error;
@override@JsonKey() final  String content;
@override@JsonKey() final  String reasoning;

/// Create a copy of GenerationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedGenerationCopyWith<FailedGeneration> get copyWith => _$FailedGenerationCopyWithImpl<FailedGeneration>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FailedGeneration&&(identical(other.error, error) || other.error == error)&&(identical(other.content, content) || other.content == content)&&(identical(other.reasoning, reasoning) || other.reasoning == reasoning));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error,content,reasoning);
}

@override
String toString() {
    return 'GenerationEvent.failed(error: $error, content: $content, reasoning: $reasoning)';
}


}

/// @nodoc
abstract mixin class $FailedGenerationCopyWith<$Res> implements $GenerationEventCopyWith<$Res> {
  factory $FailedGenerationCopyWith(FailedGeneration value, $Res Function(FailedGeneration) _then) = _$FailedGenerationCopyWithImpl;
@override @useResult
$Res call({
 String error, String content, String reasoning
});




}
/// @nodoc
class _$FailedGenerationCopyWithImpl<$Res>
    implements $FailedGenerationCopyWith<$Res> {
  _$FailedGenerationCopyWithImpl(this._self, this._then);

  final FailedGeneration _self;
  final $Res Function(FailedGeneration) _then;

/// Create a copy of GenerationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? content = null,Object? reasoning = null,}) {
  return _then(FailedGeneration(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
