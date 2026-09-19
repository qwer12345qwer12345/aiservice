// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_chunk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatChunk {

 String? get content; String? get reasoningContent; bool get isDone; String? get error;
/// Create a copy of ChatChunk
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatChunkCopyWith<ChatChunk> get copyWith => _$ChatChunkCopyWithImpl<ChatChunk>(this as ChatChunk, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChatChunk;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatChunk&&(identical(other.content, _this.content) || other.content == _this.content)&&(identical(other.reasoningContent, _this.reasoningContent) || other.reasoningContent == _this.reasoningContent)&&(identical(other.isDone, _this.isDone) || other.isDone == _this.isDone)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as ChatChunk;
  return Object.hash(runtimeType,_this.content,_this.reasoningContent,_this.isDone,_this.error);
}

@override
String toString() {
  final _this = this as ChatChunk;
  return 'ChatChunk(content: ${_this.content}, reasoningContent: ${_this.reasoningContent}, isDone: ${_this.isDone}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $ChatChunkCopyWith<$Res>  {
  factory $ChatChunkCopyWith(ChatChunk value, $Res Function(ChatChunk) _then) = _$ChatChunkCopyWithImpl;
@useResult
$Res call({
 String? content, String? reasoningContent, bool isDone, String? error
});




}
/// @nodoc
class _$ChatChunkCopyWithImpl<$Res>
    implements $ChatChunkCopyWith<$Res> {
  _$ChatChunkCopyWithImpl(this._self, this._then);

  final ChatChunk _self;
  final $Res Function(ChatChunk) _then;

/// Create a copy of ChatChunk
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = freezed,Object? reasoningContent = freezed,Object? isDone = null,Object? error = freezed,}) {
  return _then(ChatChunk(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,reasoningContent: freezed == reasoningContent ? _self.reasoningContent : reasoningContent // ignore: cast_nullable_to_non_nullable
as String?,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatChunk].
extension ChatChunkPatterns on ChatChunk {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatChunk value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatChunk() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatChunk value)  $default,){
final _that = this;
switch (_that) {
case _ChatChunk():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatChunk value)?  $default,){
final _that = this;
switch (_that) {
case _ChatChunk() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? content,  String? reasoningContent,  bool isDone,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatChunk() when $default != null:
return $default(_that.content,_that.reasoningContent,_that.isDone,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? content,  String? reasoningContent,  bool isDone,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ChatChunk():
return $default(_that.content,_that.reasoningContent,_that.isDone,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? content,  String? reasoningContent,  bool isDone,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ChatChunk() when $default != null:
return $default(_that.content,_that.reasoningContent,_that.isDone,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ChatChunk implements ChatChunk {
  const _ChatChunk({this.content, this.reasoningContent, required this.isDone, this.error});
  

@override final  String? content;
@override final  String? reasoningContent;
@override final  bool isDone;
@override final  String? error;

/// Create a copy of ChatChunk
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatChunkCopyWith<_ChatChunk> get copyWith => __$ChatChunkCopyWithImpl<_ChatChunk>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatChunk&&(identical(other.content, content) || other.content == content)&&(identical(other.reasoningContent, reasoningContent) || other.reasoningContent == reasoningContent)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,content,reasoningContent,isDone,error);
}

@override
String toString() {
    return 'ChatChunk(content: $content, reasoningContent: $reasoningContent, isDone: $isDone, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ChatChunkCopyWith<$Res> implements $ChatChunkCopyWith<$Res> {
  factory _$ChatChunkCopyWith(_ChatChunk value, $Res Function(_ChatChunk) _then) = __$ChatChunkCopyWithImpl;
@override @useResult
$Res call({
 String? content, String? reasoningContent, bool isDone, String? error
});




}
/// @nodoc
class __$ChatChunkCopyWithImpl<$Res>
    implements _$ChatChunkCopyWith<$Res> {
  __$ChatChunkCopyWithImpl(this._self, this._then);

  final _ChatChunk _self;
  final $Res Function(_ChatChunk) _then;

/// Create a copy of ChatChunk
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = freezed,Object? reasoningContent = freezed,Object? isDone = null,Object? error = freezed,}) {
  return _then(_ChatChunk(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,reasoningContent: freezed == reasoningContent ? _self.reasoningContent : reasoningContent // ignore: cast_nullable_to_non_nullable
as String?,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
