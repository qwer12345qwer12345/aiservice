// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
ApiMessageContentPart _$ApiMessageContentPartFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'text':
          return ApiMessageTextPart.fromJson(
            json
          );
                case 'imageUrl':
          return ApiMessageImageUrlPart.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ApiMessageContentPart',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ApiMessageContentPart {

 String get type;
/// Create a copy of ApiMessageContentPart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiMessageContentPartCopyWith<ApiMessageContentPart> get copyWith => _$ApiMessageContentPartCopyWithImpl<ApiMessageContentPart>(this as ApiMessageContentPart, _$identity);

  /// Serializes this ApiMessageContentPart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApiMessageContentPart;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiMessageContentPart&&(identical(other.type, _this.type) || other.type == _this.type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApiMessageContentPart;
  return Object.hash(runtimeType,_this.type);
}

@override
String toString() {
  final _this = this as ApiMessageContentPart;
  return 'ApiMessageContentPart(type: ${_this.type})';
}


}

/// @nodoc
abstract mixin class $ApiMessageContentPartCopyWith<$Res>  {
  factory $ApiMessageContentPartCopyWith(ApiMessageContentPart value, $Res Function(ApiMessageContentPart) _then) = _$ApiMessageContentPartCopyWithImpl;
@useResult
$Res call({
 String type
});




}
/// @nodoc
class _$ApiMessageContentPartCopyWithImpl<$Res>
    implements $ApiMessageContentPartCopyWith<$Res> {
  _$ApiMessageContentPartCopyWithImpl(this._self, this._then);

  final ApiMessageContentPart _self;
  final $Res Function(ApiMessageContentPart) _then;

/// Create a copy of ApiMessageContentPart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiMessageContentPart].
extension ApiMessageContentPartPatterns on ApiMessageContentPart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApiMessageTextPart value)?  text,TResult Function( ApiMessageImageUrlPart value)?  imageUrl,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApiMessageTextPart() when text != null:
return text(_that);case ApiMessageImageUrlPart() when imageUrl != null:
return imageUrl(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApiMessageTextPart value)  text,required TResult Function( ApiMessageImageUrlPart value)  imageUrl,}){
final _that = this;
switch (_that) {
case ApiMessageTextPart():
return text(_that);case ApiMessageImageUrlPart():
return imageUrl(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApiMessageTextPart value)?  text,TResult? Function( ApiMessageImageUrlPart value)?  imageUrl,}){
final _that = this;
switch (_that) {
case ApiMessageTextPart() when text != null:
return text(_that);case ApiMessageImageUrlPart() when imageUrl != null:
return imageUrl(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String type,  String text)?  text,TResult Function( String type, @JsonKey(name: 'image_url')  ApiImageUrl imageUrl)?  imageUrl,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApiMessageTextPart() when text != null:
return text(_that.type,_that.text);case ApiMessageImageUrlPart() when imageUrl != null:
return imageUrl(_that.type,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String type,  String text)  text,required TResult Function( String type, @JsonKey(name: 'image_url')  ApiImageUrl imageUrl)  imageUrl,}) {final _that = this;
switch (_that) {
case ApiMessageTextPart():
return text(_that.type,_that.text);case ApiMessageImageUrlPart():
return imageUrl(_that.type,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String type,  String text)?  text,TResult? Function( String type, @JsonKey(name: 'image_url')  ApiImageUrl imageUrl)?  imageUrl,}) {final _that = this;
switch (_that) {
case ApiMessageTextPart() when text != null:
return text(_that.type,_that.text);case ApiMessageImageUrlPart() when imageUrl != null:
return imageUrl(_that.type,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ApiMessageTextPart implements ApiMessageContentPart {
  const ApiMessageTextPart({this.type = 'text', required this.text,  String? $type}): $type = $type ?? 'text';
  factory ApiMessageTextPart.fromJson(Map<String, dynamic> json) => _$ApiMessageTextPartFromJson(json);

@override@JsonKey() final  String type;
 final  String text;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ApiMessageContentPart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiMessageTextPartCopyWith<ApiMessageTextPart> get copyWith => _$ApiMessageTextPartCopyWithImpl<ApiMessageTextPart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiMessageTextPartToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiMessageTextPart&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,text);
}

@override
String toString() {
    return 'ApiMessageContentPart.text(type: $type, text: $text)';
}


}

/// @nodoc
abstract mixin class $ApiMessageTextPartCopyWith<$Res> implements $ApiMessageContentPartCopyWith<$Res> {
  factory $ApiMessageTextPartCopyWith(ApiMessageTextPart value, $Res Function(ApiMessageTextPart) _then) = _$ApiMessageTextPartCopyWithImpl;
@override @useResult
$Res call({
 String type, String text
});




}
/// @nodoc
class _$ApiMessageTextPartCopyWithImpl<$Res>
    implements $ApiMessageTextPartCopyWith<$Res> {
  _$ApiMessageTextPartCopyWithImpl(this._self, this._then);

  final ApiMessageTextPart _self;
  final $Res Function(ApiMessageTextPart) _then;

/// Create a copy of ApiMessageContentPart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? text = null,}) {
  return _then(ApiMessageTextPart(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ApiMessageImageUrlPart implements ApiMessageContentPart {
  const ApiMessageImageUrlPart({this.type = 'image_url', @JsonKey(name: 'image_url') required this.imageUrl,  String? $type}): $type = $type ?? 'imageUrl';
  factory ApiMessageImageUrlPart.fromJson(Map<String, dynamic> json) => _$ApiMessageImageUrlPartFromJson(json);

@override@JsonKey() final  String type;
@JsonKey(name: 'image_url') final  ApiImageUrl imageUrl;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ApiMessageContentPart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiMessageImageUrlPartCopyWith<ApiMessageImageUrlPart> get copyWith => _$ApiMessageImageUrlPartCopyWithImpl<ApiMessageImageUrlPart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiMessageImageUrlPartToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiMessageImageUrlPart&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,imageUrl);
}

@override
String toString() {
    return 'ApiMessageContentPart.imageUrl(type: $type, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $ApiMessageImageUrlPartCopyWith<$Res> implements $ApiMessageContentPartCopyWith<$Res> {
  factory $ApiMessageImageUrlPartCopyWith(ApiMessageImageUrlPart value, $Res Function(ApiMessageImageUrlPart) _then) = _$ApiMessageImageUrlPartCopyWithImpl;
@override @useResult
$Res call({
 String type,@JsonKey(name: 'image_url') ApiImageUrl imageUrl
});


$ApiImageUrlCopyWith<$Res> get imageUrl;

}
/// @nodoc
class _$ApiMessageImageUrlPartCopyWithImpl<$Res>
    implements $ApiMessageImageUrlPartCopyWith<$Res> {
  _$ApiMessageImageUrlPartCopyWithImpl(this._self, this._then);

  final ApiMessageImageUrlPart _self;
  final $Res Function(ApiMessageImageUrlPart) _then;

/// Create a copy of ApiMessageContentPart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? imageUrl = null,}) {
  return _then(ApiMessageImageUrlPart(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as ApiImageUrl,
  ));
}

/// Create a copy of ApiMessageContentPart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiImageUrlCopyWith<$Res> get imageUrl {
  
  return $ApiImageUrlCopyWith<$Res>(_self.imageUrl, (value) {
    return _then(_self.copyWith(imageUrl: value));
  });
}
}


/// @nodoc
mixin _$ApiImageUrl {

 String get url;
/// Create a copy of ApiImageUrl
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiImageUrlCopyWith<ApiImageUrl> get copyWith => _$ApiImageUrlCopyWithImpl<ApiImageUrl>(this as ApiImageUrl, _$identity);

  /// Serializes this ApiImageUrl to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApiImageUrl;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiImageUrl&&(identical(other.url, _this.url) || other.url == _this.url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApiImageUrl;
  return Object.hash(runtimeType,_this.url);
}

@override
String toString() {
  final _this = this as ApiImageUrl;
  return 'ApiImageUrl(url: ${_this.url})';
}


}

/// @nodoc
abstract mixin class $ApiImageUrlCopyWith<$Res>  {
  factory $ApiImageUrlCopyWith(ApiImageUrl value, $Res Function(ApiImageUrl) _then) = _$ApiImageUrlCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$ApiImageUrlCopyWithImpl<$Res>
    implements $ApiImageUrlCopyWith<$Res> {
  _$ApiImageUrlCopyWithImpl(this._self, this._then);

  final ApiImageUrl _self;
  final $Res Function(ApiImageUrl) _then;

/// Create a copy of ApiImageUrl
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(ApiImageUrl(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiImageUrl].
extension ApiImageUrlPatterns on ApiImageUrl {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiImageUrl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiImageUrl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiImageUrl value)  $default,){
final _that = this;
switch (_that) {
case _ApiImageUrl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiImageUrl value)?  $default,){
final _that = this;
switch (_that) {
case _ApiImageUrl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiImageUrl() when $default != null:
return $default(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url)  $default,) {final _that = this;
switch (_that) {
case _ApiImageUrl():
return $default(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url)?  $default,) {final _that = this;
switch (_that) {
case _ApiImageUrl() when $default != null:
return $default(_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiImageUrl implements ApiImageUrl {
  const _ApiImageUrl({required this.url});
  factory _ApiImageUrl.fromJson(Map<String, dynamic> json) => _$ApiImageUrlFromJson(json);

@override final  String url;

/// Create a copy of ApiImageUrl
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiImageUrlCopyWith<_ApiImageUrl> get copyWith => __$ApiImageUrlCopyWithImpl<_ApiImageUrl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiImageUrlToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiImageUrl&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,url);
}

@override
String toString() {
    return 'ApiImageUrl(url: $url)';
}


}

/// @nodoc
abstract mixin class _$ApiImageUrlCopyWith<$Res> implements $ApiImageUrlCopyWith<$Res> {
  factory _$ApiImageUrlCopyWith(_ApiImageUrl value, $Res Function(_ApiImageUrl) _then) = __$ApiImageUrlCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$ApiImageUrlCopyWithImpl<$Res>
    implements _$ApiImageUrlCopyWith<$Res> {
  __$ApiImageUrlCopyWithImpl(this._self, this._then);

  final _ApiImageUrl _self;
  final $Res Function(_ApiImageUrl) _then;

/// Create a copy of ApiImageUrl
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_ApiImageUrl(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ApiMessage {

 String get role; String? get content; String? get reasoning; List<ApiMessageContentPart> get parts; List<ToolCall> get toolCalls; String? get toolCallId;
/// Create a copy of ApiMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiMessageCopyWith<ApiMessage> get copyWith => _$ApiMessageCopyWithImpl<ApiMessage>(this as ApiMessage, _$identity);

  /// Serializes this ApiMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApiMessage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiMessage&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.content, _this.content) || other.content == _this.content)&&(identical(other.reasoning, _this.reasoning) || other.reasoning == _this.reasoning)&&const DeepCollectionEquality().equals(other.parts, _this.parts)&&const DeepCollectionEquality().equals(other.toolCalls, _this.toolCalls)&&(identical(other.toolCallId, _this.toolCallId) || other.toolCallId == _this.toolCallId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApiMessage;
  return Object.hash(runtimeType,_this.role,_this.content,_this.reasoning,const DeepCollectionEquality().hash(_this.parts),const DeepCollectionEquality().hash(_this.toolCalls),_this.toolCallId);
}

@override
String toString() {
  final _this = this as ApiMessage;
  return 'ApiMessage(role: ${_this.role}, content: ${_this.content}, reasoning: ${_this.reasoning}, parts: ${_this.parts}, toolCalls: ${_this.toolCalls}, toolCallId: ${_this.toolCallId})';
}


}

/// @nodoc
abstract mixin class $ApiMessageCopyWith<$Res>  {
  factory $ApiMessageCopyWith(ApiMessage value, $Res Function(ApiMessage) _then) = _$ApiMessageCopyWithImpl;
@useResult
$Res call({
 String role, String? content, String? reasoning, List<ApiMessageContentPart> parts, List<ToolCall> toolCalls, String? toolCallId
});




}
/// @nodoc
class _$ApiMessageCopyWithImpl<$Res>
    implements $ApiMessageCopyWith<$Res> {
  _$ApiMessageCopyWithImpl(this._self, this._then);

  final ApiMessage _self;
  final $Res Function(ApiMessage) _then;

/// Create a copy of ApiMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? content = freezed,Object? reasoning = freezed,Object? parts = null,Object? toolCalls = null,Object? toolCallId = freezed,}) {
  return _then(ApiMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,reasoning: freezed == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as String?,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<ApiMessageContentPart>,toolCalls: null == toolCalls ? _self.toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>,toolCallId: freezed == toolCallId ? _self.toolCallId : toolCallId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiMessage].
extension ApiMessagePatterns on ApiMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiMessage value)  $default,){
final _that = this;
switch (_that) {
case _ApiMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ApiMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role,  String? content,  String? reasoning,  List<ApiMessageContentPart> parts,  List<ToolCall> toolCalls,  String? toolCallId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiMessage() when $default != null:
return $default(_that.role,_that.content,_that.reasoning,_that.parts,_that.toolCalls,_that.toolCallId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role,  String? content,  String? reasoning,  List<ApiMessageContentPart> parts,  List<ToolCall> toolCalls,  String? toolCallId)  $default,) {final _that = this;
switch (_that) {
case _ApiMessage():
return $default(_that.role,_that.content,_that.reasoning,_that.parts,_that.toolCalls,_that.toolCallId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role,  String? content,  String? reasoning,  List<ApiMessageContentPart> parts,  List<ToolCall> toolCalls,  String? toolCallId)?  $default,) {final _that = this;
switch (_that) {
case _ApiMessage() when $default != null:
return $default(_that.role,_that.content,_that.reasoning,_that.parts,_that.toolCalls,_that.toolCallId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiMessage implements ApiMessage {
  const _ApiMessage({required this.role, this.content, this.reasoning,  List<ApiMessageContentPart> parts = const [],  List<ToolCall> toolCalls = const [], this.toolCallId}): _parts = parts,_toolCalls = toolCalls;
  factory _ApiMessage.fromJson(Map<String, dynamic> json) => _$ApiMessageFromJson(json);

@override final  String role;
@override final  String? content;
@override final  String? reasoning;
 final  List<ApiMessageContentPart> _parts;
@override@JsonKey() List<ApiMessageContentPart> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}

 final  List<ToolCall> _toolCalls;
@override@JsonKey() List<ToolCall> get toolCalls {
  if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_toolCalls);
}

@override final  String? toolCallId;

/// Create a copy of ApiMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiMessageCopyWith<_ApiMessage> get copyWith => __$ApiMessageCopyWithImpl<_ApiMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiMessageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.reasoning, reasoning) || other.reasoning == reasoning)&&const DeepCollectionEquality().equals(other.parts, _parts)&&const DeepCollectionEquality().equals(other.toolCalls, _toolCalls)&&(identical(other.toolCallId, toolCallId) || other.toolCallId == toolCallId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,role,content,reasoning,const DeepCollectionEquality().hash(_parts),const DeepCollectionEquality().hash(_toolCalls),toolCallId);
}

@override
String toString() {
    return 'ApiMessage(role: $role, content: $content, reasoning: $reasoning, parts: $parts, toolCalls: $toolCalls, toolCallId: $toolCallId)';
}


}

/// @nodoc
abstract mixin class _$ApiMessageCopyWith<$Res> implements $ApiMessageCopyWith<$Res> {
  factory _$ApiMessageCopyWith(_ApiMessage value, $Res Function(_ApiMessage) _then) = __$ApiMessageCopyWithImpl;
@override @useResult
$Res call({
 String role, String? content, String? reasoning, List<ApiMessageContentPart> parts, List<ToolCall> toolCalls, String? toolCallId
});




}
/// @nodoc
class __$ApiMessageCopyWithImpl<$Res>
    implements _$ApiMessageCopyWith<$Res> {
  __$ApiMessageCopyWithImpl(this._self, this._then);

  final _ApiMessage _self;
  final $Res Function(_ApiMessage) _then;

/// Create a copy of ApiMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = freezed,Object? reasoning = freezed,Object? parts = null,Object? toolCalls = null,Object? toolCallId = freezed,}) {
  return _then(_ApiMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,reasoning: freezed == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as String?,parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<ApiMessageContentPart>,toolCalls: null == toolCalls ? _self._toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>,toolCallId: freezed == toolCallId ? _self.toolCallId : toolCallId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
