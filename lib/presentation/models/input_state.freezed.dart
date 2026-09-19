// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InputState {

/// 输入框文本
 String get text;/// 附件列表
 List<PendingAttachment> get attachments;
/// Create a copy of InputState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputStateCopyWith<InputState> get copyWith => _$InputStateCopyWithImpl<InputState>(this as InputState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as InputState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputState&&(identical(other.text, _this.text) || other.text == _this.text)&&const DeepCollectionEquality().equals(other.attachments, _this.attachments));
}


@override
int get hashCode {
  final _this = this as InputState;
  return Object.hash(runtimeType,_this.text,const DeepCollectionEquality().hash(_this.attachments));
}

@override
String toString() {
  final _this = this as InputState;
  return 'InputState(text: ${_this.text}, attachments: ${_this.attachments})';
}


}

/// @nodoc
abstract mixin class $InputStateCopyWith<$Res>  {
  factory $InputStateCopyWith(InputState value, $Res Function(InputState) _then) = _$InputStateCopyWithImpl;
@useResult
$Res call({
 String text, List<PendingAttachment> attachments
});




}
/// @nodoc
class _$InputStateCopyWithImpl<$Res>
    implements $InputStateCopyWith<$Res> {
  _$InputStateCopyWithImpl(this._self, this._then);

  final InputState _self;
  final $Res Function(InputState) _then;

/// Create a copy of InputState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? attachments = null,}) {
  return _then(InputState(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<PendingAttachment>,
  ));
}

}


/// Adds pattern-matching-related methods to [InputState].
extension InputStatePatterns on InputState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InputState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InputState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InputState value)  $default,){
final _that = this;
switch (_that) {
case _InputState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InputState value)?  $default,){
final _that = this;
switch (_that) {
case _InputState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  List<PendingAttachment> attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InputState() when $default != null:
return $default(_that.text,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  List<PendingAttachment> attachments)  $default,) {final _that = this;
switch (_that) {
case _InputState():
return $default(_that.text,_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  List<PendingAttachment> attachments)?  $default,) {final _that = this;
switch (_that) {
case _InputState() when $default != null:
return $default(_that.text,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc


class _InputState implements InputState {
  const _InputState({this.text = '',  List<PendingAttachment> attachments = const []}): _attachments = attachments;
  

/// 输入框文本
@override@JsonKey() final  String text;
/// 附件列表
 final  List<PendingAttachment> _attachments;
/// 附件列表
@override@JsonKey() List<PendingAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


/// Create a copy of InputState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InputStateCopyWith<_InputState> get copyWith => __$InputStateCopyWithImpl<_InputState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InputState&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.attachments, _attachments));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_attachments));
}

@override
String toString() {
    return 'InputState(text: $text, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$InputStateCopyWith<$Res> implements $InputStateCopyWith<$Res> {
  factory _$InputStateCopyWith(_InputState value, $Res Function(_InputState) _then) = __$InputStateCopyWithImpl;
@override @useResult
$Res call({
 String text, List<PendingAttachment> attachments
});




}
/// @nodoc
class __$InputStateCopyWithImpl<$Res>
    implements _$InputStateCopyWith<$Res> {
  __$InputStateCopyWithImpl(this._self, this._then);

  final _InputState _self;
  final $Res Function(_InputState) _then;

/// Create a copy of InputState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? attachments = null,}) {
  return _then(_InputState(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<PendingAttachment>,
  ));
}


}

// dart format on
