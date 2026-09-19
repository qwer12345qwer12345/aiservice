// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_round.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatRound {

 String get id; String? get parentId; int get createdAt; String get userContent; List<Attachment> get userAttachments; String? get assistantThinking; String? get assistantContent; bool get isIncomplete; bool get hasUnseenUpdate;
/// Create a copy of ChatRound
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoundCopyWith<ChatRound> get copyWith => _$ChatRoundCopyWithImpl<ChatRound>(this as ChatRound, _$identity);

  /// Serializes this ChatRound to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChatRound;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRound&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.parentId, _this.parentId) || other.parentId == _this.parentId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.userContent, _this.userContent) || other.userContent == _this.userContent)&&const DeepCollectionEquality().equals(other.userAttachments, _this.userAttachments)&&(identical(other.assistantThinking, _this.assistantThinking) || other.assistantThinking == _this.assistantThinking)&&(identical(other.assistantContent, _this.assistantContent) || other.assistantContent == _this.assistantContent)&&(identical(other.isIncomplete, _this.isIncomplete) || other.isIncomplete == _this.isIncomplete)&&(identical(other.hasUnseenUpdate, _this.hasUnseenUpdate) || other.hasUnseenUpdate == _this.hasUnseenUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChatRound;
  return Object.hash(runtimeType,_this.id,_this.parentId,_this.createdAt,_this.userContent,const DeepCollectionEquality().hash(_this.userAttachments),_this.assistantThinking,_this.assistantContent,_this.isIncomplete,_this.hasUnseenUpdate);
}

@override
String toString() {
  final _this = this as ChatRound;
  return 'ChatRound(id: ${_this.id}, parentId: ${_this.parentId}, createdAt: ${_this.createdAt}, userContent: ${_this.userContent}, userAttachments: ${_this.userAttachments}, assistantThinking: ${_this.assistantThinking}, assistantContent: ${_this.assistantContent}, isIncomplete: ${_this.isIncomplete}, hasUnseenUpdate: ${_this.hasUnseenUpdate})';
}


}

/// @nodoc
abstract mixin class $ChatRoundCopyWith<$Res>  {
  factory $ChatRoundCopyWith(ChatRound value, $Res Function(ChatRound) _then) = _$ChatRoundCopyWithImpl;
@useResult
$Res call({
 String id, String? parentId, int createdAt, String userContent, List<Attachment> userAttachments, String? assistantThinking, String? assistantContent, bool isIncomplete, bool hasUnseenUpdate
});




}
/// @nodoc
class _$ChatRoundCopyWithImpl<$Res>
    implements $ChatRoundCopyWith<$Res> {
  _$ChatRoundCopyWithImpl(this._self, this._then);

  final ChatRound _self;
  final $Res Function(ChatRound) _then;

/// Create a copy of ChatRound
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? parentId = freezed,Object? createdAt = null,Object? userContent = null,Object? userAttachments = null,Object? assistantThinking = freezed,Object? assistantContent = freezed,Object? isIncomplete = null,Object? hasUnseenUpdate = null,}) {
  return _then(ChatRound(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,userContent: null == userContent ? _self.userContent : userContent // ignore: cast_nullable_to_non_nullable
as String,userAttachments: null == userAttachments ? _self.userAttachments : userAttachments // ignore: cast_nullable_to_non_nullable
as List<Attachment>,assistantThinking: freezed == assistantThinking ? _self.assistantThinking : assistantThinking // ignore: cast_nullable_to_non_nullable
as String?,assistantContent: freezed == assistantContent ? _self.assistantContent : assistantContent // ignore: cast_nullable_to_non_nullable
as String?,isIncomplete: null == isIncomplete ? _self.isIncomplete : isIncomplete // ignore: cast_nullable_to_non_nullable
as bool,hasUnseenUpdate: null == hasUnseenUpdate ? _self.hasUnseenUpdate : hasUnseenUpdate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatRound].
extension ChatRoundPatterns on ChatRound {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatRound value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatRound() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatRound value)  $default,){
final _that = this;
switch (_that) {
case _ChatRound():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatRound value)?  $default,){
final _that = this;
switch (_that) {
case _ChatRound() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? parentId,  int createdAt,  String userContent,  List<Attachment> userAttachments,  String? assistantThinking,  String? assistantContent,  bool isIncomplete,  bool hasUnseenUpdate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatRound() when $default != null:
return $default(_that.id,_that.parentId,_that.createdAt,_that.userContent,_that.userAttachments,_that.assistantThinking,_that.assistantContent,_that.isIncomplete,_that.hasUnseenUpdate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? parentId,  int createdAt,  String userContent,  List<Attachment> userAttachments,  String? assistantThinking,  String? assistantContent,  bool isIncomplete,  bool hasUnseenUpdate)  $default,) {final _that = this;
switch (_that) {
case _ChatRound():
return $default(_that.id,_that.parentId,_that.createdAt,_that.userContent,_that.userAttachments,_that.assistantThinking,_that.assistantContent,_that.isIncomplete,_that.hasUnseenUpdate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? parentId,  int createdAt,  String userContent,  List<Attachment> userAttachments,  String? assistantThinking,  String? assistantContent,  bool isIncomplete,  bool hasUnseenUpdate)?  $default,) {final _that = this;
switch (_that) {
case _ChatRound() when $default != null:
return $default(_that.id,_that.parentId,_that.createdAt,_that.userContent,_that.userAttachments,_that.assistantThinking,_that.assistantContent,_that.isIncomplete,_that.hasUnseenUpdate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatRound implements ChatRound {
  const _ChatRound({required this.id, this.parentId, required this.createdAt, required this.userContent,  List<Attachment> userAttachments = const [], this.assistantThinking, this.assistantContent, this.isIncomplete = false, this.hasUnseenUpdate = false}): _userAttachments = userAttachments;
  factory _ChatRound.fromJson(Map<String, dynamic> json) => _$ChatRoundFromJson(json);

@override final  String id;
@override final  String? parentId;
@override final  int createdAt;
@override final  String userContent;
 final  List<Attachment> _userAttachments;
@override@JsonKey() List<Attachment> get userAttachments {
  if (_userAttachments is EqualUnmodifiableListView) return _userAttachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userAttachments);
}

@override final  String? assistantThinking;
@override final  String? assistantContent;
@override@JsonKey() final  bool isIncomplete;
@override@JsonKey() final  bool hasUnseenUpdate;

/// Create a copy of ChatRound
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatRoundCopyWith<_ChatRound> get copyWith => __$ChatRoundCopyWithImpl<_ChatRound>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatRoundToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatRound&&(identical(other.id, id) || other.id == id)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.userContent, userContent) || other.userContent == userContent)&&const DeepCollectionEquality().equals(other.userAttachments, _userAttachments)&&(identical(other.assistantThinking, assistantThinking) || other.assistantThinking == assistantThinking)&&(identical(other.assistantContent, assistantContent) || other.assistantContent == assistantContent)&&(identical(other.isIncomplete, isIncomplete) || other.isIncomplete == isIncomplete)&&(identical(other.hasUnseenUpdate, hasUnseenUpdate) || other.hasUnseenUpdate == hasUnseenUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,parentId,createdAt,userContent,const DeepCollectionEquality().hash(_userAttachments),assistantThinking,assistantContent,isIncomplete,hasUnseenUpdate);
}

@override
String toString() {
    return 'ChatRound(id: $id, parentId: $parentId, createdAt: $createdAt, userContent: $userContent, userAttachments: $userAttachments, assistantThinking: $assistantThinking, assistantContent: $assistantContent, isIncomplete: $isIncomplete, hasUnseenUpdate: $hasUnseenUpdate)';
}


}

/// @nodoc
abstract mixin class _$ChatRoundCopyWith<$Res> implements $ChatRoundCopyWith<$Res> {
  factory _$ChatRoundCopyWith(_ChatRound value, $Res Function(_ChatRound) _then) = __$ChatRoundCopyWithImpl;
@override @useResult
$Res call({
 String id, String? parentId, int createdAt, String userContent, List<Attachment> userAttachments, String? assistantThinking, String? assistantContent, bool isIncomplete, bool hasUnseenUpdate
});




}
/// @nodoc
class __$ChatRoundCopyWithImpl<$Res>
    implements _$ChatRoundCopyWith<$Res> {
  __$ChatRoundCopyWithImpl(this._self, this._then);

  final _ChatRound _self;
  final $Res Function(_ChatRound) _then;

/// Create a copy of ChatRound
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? parentId = freezed,Object? createdAt = null,Object? userContent = null,Object? userAttachments = null,Object? assistantThinking = freezed,Object? assistantContent = freezed,Object? isIncomplete = null,Object? hasUnseenUpdate = null,}) {
  return _then(_ChatRound(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,userContent: null == userContent ? _self.userContent : userContent // ignore: cast_nullable_to_non_nullable
as String,userAttachments: null == userAttachments ? _self._userAttachments : userAttachments // ignore: cast_nullable_to_non_nullable
as List<Attachment>,assistantThinking: freezed == assistantThinking ? _self.assistantThinking : assistantThinking // ignore: cast_nullable_to_non_nullable
as String?,assistantContent: freezed == assistantContent ? _self.assistantContent : assistantContent // ignore: cast_nullable_to_non_nullable
as String?,isIncomplete: null == isIncomplete ? _self.isIncomplete : isIncomplete // ignore: cast_nullable_to_non_nullable
as bool,hasUnseenUpdate: null == hasUnseenUpdate ? _self.hasUnseenUpdate : hasUnseenUpdate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
