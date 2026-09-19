// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToolCall {

 String get id; String get name; Map<String, dynamic> get arguments;
/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCallCopyWith<ToolCall> get copyWith => _$ToolCallCopyWithImpl<ToolCall>(this as ToolCall, _$identity);

  /// Serializes this ToolCall to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ToolCall;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolCall&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.arguments, _this.arguments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ToolCall;
  return Object.hash(runtimeType,_this.id,_this.name,const DeepCollectionEquality().hash(_this.arguments));
}

@override
String toString() {
  final _this = this as ToolCall;
  return 'ToolCall(id: ${_this.id}, name: ${_this.name}, arguments: ${_this.arguments})';
}


}

/// @nodoc
abstract mixin class $ToolCallCopyWith<$Res>  {
  factory $ToolCallCopyWith(ToolCall value, $Res Function(ToolCall) _then) = _$ToolCallCopyWithImpl;
@useResult
$Res call({
 String id, String name, Map<String, dynamic> arguments
});




}
/// @nodoc
class _$ToolCallCopyWithImpl<$Res>
    implements $ToolCallCopyWith<$Res> {
  _$ToolCallCopyWithImpl(this._self, this._then);

  final ToolCall _self;
  final $Res Function(ToolCall) _then;

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? arguments = null,}) {
  return _then(ToolCall(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolCall].
extension ToolCallPatterns on ToolCall {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolCall value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolCall value)  $default,){
final _that = this;
switch (_that) {
case _ToolCall():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolCall value)?  $default,){
final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  Map<String, dynamic> arguments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that.id,_that.name,_that.arguments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  Map<String, dynamic> arguments)  $default,) {final _that = this;
switch (_that) {
case _ToolCall():
return $default(_that.id,_that.name,_that.arguments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  Map<String, dynamic> arguments)?  $default,) {final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that.id,_that.name,_that.arguments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolCall implements ToolCall {
  const _ToolCall({required this.id, required this.name,  Map<String, dynamic> arguments = const {}}): _arguments = arguments;
  factory _ToolCall.fromJson(Map<String, dynamic> json) => _$ToolCallFromJson(json);

@override final  String id;
@override final  String name;
 final  Map<String, dynamic> _arguments;
@override@JsonKey() Map<String, dynamic> get arguments {
  if (_arguments is EqualUnmodifiableMapView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_arguments);
}


/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolCallCopyWith<_ToolCall> get copyWith => __$ToolCallCopyWithImpl<_ToolCall>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolCallToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolCall&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.arguments, _arguments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_arguments));
}

@override
String toString() {
    return 'ToolCall(id: $id, name: $name, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class _$ToolCallCopyWith<$Res> implements $ToolCallCopyWith<$Res> {
  factory _$ToolCallCopyWith(_ToolCall value, $Res Function(_ToolCall) _then) = __$ToolCallCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Map<String, dynamic> arguments
});




}
/// @nodoc
class __$ToolCallCopyWithImpl<$Res>
    implements _$ToolCallCopyWith<$Res> {
  __$ToolCallCopyWithImpl(this._self, this._then);

  final _ToolCall _self;
  final $Res Function(_ToolCall) _then;

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? arguments = null,}) {
  return _then(_ToolCall(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$ToolCallRequest {

 String get id; String get type; ToolCallRequestFunction get function;
/// Create a copy of ToolCallRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCallRequestCopyWith<ToolCallRequest> get copyWith => _$ToolCallRequestCopyWithImpl<ToolCallRequest>(this as ToolCallRequest, _$identity);

  /// Serializes this ToolCallRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ToolCallRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolCallRequest&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.function, _this.function) || other.function == _this.function));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ToolCallRequest;
  return Object.hash(runtimeType,_this.id,_this.type,_this.function);
}

@override
String toString() {
  final _this = this as ToolCallRequest;
  return 'ToolCallRequest(id: ${_this.id}, type: ${_this.type}, function: ${_this.function})';
}


}

/// @nodoc
abstract mixin class $ToolCallRequestCopyWith<$Res>  {
  factory $ToolCallRequestCopyWith(ToolCallRequest value, $Res Function(ToolCallRequest) _then) = _$ToolCallRequestCopyWithImpl;
@useResult
$Res call({
 String id, String type, ToolCallRequestFunction function
});


$ToolCallRequestFunctionCopyWith<$Res> get function;

}
/// @nodoc
class _$ToolCallRequestCopyWithImpl<$Res>
    implements $ToolCallRequestCopyWith<$Res> {
  _$ToolCallRequestCopyWithImpl(this._self, this._then);

  final ToolCallRequest _self;
  final $Res Function(ToolCallRequest) _then;

/// Create a copy of ToolCallRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? function = null,}) {
  return _then(ToolCallRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,function: null == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as ToolCallRequestFunction,
  ));
}
/// Create a copy of ToolCallRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolCallRequestFunctionCopyWith<$Res> get function {
  
  return $ToolCallRequestFunctionCopyWith<$Res>(_self.function, (value) {
    return _then(_self.copyWith(function: value));
  });
}
}


/// Adds pattern-matching-related methods to [ToolCallRequest].
extension ToolCallRequestPatterns on ToolCallRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolCallRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolCallRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolCallRequest value)  $default,){
final _that = this;
switch (_that) {
case _ToolCallRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolCallRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ToolCallRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  ToolCallRequestFunction function)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolCallRequest() when $default != null:
return $default(_that.id,_that.type,_that.function);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  ToolCallRequestFunction function)  $default,) {final _that = this;
switch (_that) {
case _ToolCallRequest():
return $default(_that.id,_that.type,_that.function);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  ToolCallRequestFunction function)?  $default,) {final _that = this;
switch (_that) {
case _ToolCallRequest() when $default != null:
return $default(_that.id,_that.type,_that.function);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolCallRequest implements ToolCallRequest {
  const _ToolCallRequest({required this.id, required this.type, required this.function});
  factory _ToolCallRequest.fromJson(Map<String, dynamic> json) => _$ToolCallRequestFromJson(json);

@override final  String id;
@override final  String type;
@override final  ToolCallRequestFunction function;

/// Create a copy of ToolCallRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolCallRequestCopyWith<_ToolCallRequest> get copyWith => __$ToolCallRequestCopyWithImpl<_ToolCallRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolCallRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolCallRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.function, function) || other.function == function));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,function);
}

@override
String toString() {
    return 'ToolCallRequest(id: $id, type: $type, function: $function)';
}


}

/// @nodoc
abstract mixin class _$ToolCallRequestCopyWith<$Res> implements $ToolCallRequestCopyWith<$Res> {
  factory _$ToolCallRequestCopyWith(_ToolCallRequest value, $Res Function(_ToolCallRequest) _then) = __$ToolCallRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, ToolCallRequestFunction function
});


@override $ToolCallRequestFunctionCopyWith<$Res> get function;

}
/// @nodoc
class __$ToolCallRequestCopyWithImpl<$Res>
    implements _$ToolCallRequestCopyWith<$Res> {
  __$ToolCallRequestCopyWithImpl(this._self, this._then);

  final _ToolCallRequest _self;
  final $Res Function(_ToolCallRequest) _then;

/// Create a copy of ToolCallRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? function = null,}) {
  return _then(_ToolCallRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,function: null == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as ToolCallRequestFunction,
  ));
}

/// Create a copy of ToolCallRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolCallRequestFunctionCopyWith<$Res> get function {
  
  return $ToolCallRequestFunctionCopyWith<$Res>(_self.function, (value) {
    return _then(_self.copyWith(function: value));
  });
}
}


/// @nodoc
mixin _$ToolCallRequestFunction {

 String get name; String get arguments;
/// Create a copy of ToolCallRequestFunction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCallRequestFunctionCopyWith<ToolCallRequestFunction> get copyWith => _$ToolCallRequestFunctionCopyWithImpl<ToolCallRequestFunction>(this as ToolCallRequestFunction, _$identity);

  /// Serializes this ToolCallRequestFunction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ToolCallRequestFunction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolCallRequestFunction&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.arguments, _this.arguments) || other.arguments == _this.arguments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ToolCallRequestFunction;
  return Object.hash(runtimeType,_this.name,_this.arguments);
}

@override
String toString() {
  final _this = this as ToolCallRequestFunction;
  return 'ToolCallRequestFunction(name: ${_this.name}, arguments: ${_this.arguments})';
}


}

/// @nodoc
abstract mixin class $ToolCallRequestFunctionCopyWith<$Res>  {
  factory $ToolCallRequestFunctionCopyWith(ToolCallRequestFunction value, $Res Function(ToolCallRequestFunction) _then) = _$ToolCallRequestFunctionCopyWithImpl;
@useResult
$Res call({
 String name, String arguments
});




}
/// @nodoc
class _$ToolCallRequestFunctionCopyWithImpl<$Res>
    implements $ToolCallRequestFunctionCopyWith<$Res> {
  _$ToolCallRequestFunctionCopyWithImpl(this._self, this._then);

  final ToolCallRequestFunction _self;
  final $Res Function(ToolCallRequestFunction) _then;

/// Create a copy of ToolCallRequestFunction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? arguments = null,}) {
  return _then(ToolCallRequestFunction(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolCallRequestFunction].
extension ToolCallRequestFunctionPatterns on ToolCallRequestFunction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolCallRequestFunction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolCallRequestFunction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolCallRequestFunction value)  $default,){
final _that = this;
switch (_that) {
case _ToolCallRequestFunction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolCallRequestFunction value)?  $default,){
final _that = this;
switch (_that) {
case _ToolCallRequestFunction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String arguments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolCallRequestFunction() when $default != null:
return $default(_that.name,_that.arguments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String arguments)  $default,) {final _that = this;
switch (_that) {
case _ToolCallRequestFunction():
return $default(_that.name,_that.arguments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String arguments)?  $default,) {final _that = this;
switch (_that) {
case _ToolCallRequestFunction() when $default != null:
return $default(_that.name,_that.arguments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolCallRequestFunction implements ToolCallRequestFunction {
  const _ToolCallRequestFunction({required this.name, required this.arguments});
  factory _ToolCallRequestFunction.fromJson(Map<String, dynamic> json) => _$ToolCallRequestFunctionFromJson(json);

@override final  String name;
@override final  String arguments;

/// Create a copy of ToolCallRequestFunction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolCallRequestFunctionCopyWith<_ToolCallRequestFunction> get copyWith => __$ToolCallRequestFunctionCopyWithImpl<_ToolCallRequestFunction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolCallRequestFunctionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolCallRequestFunction&&(identical(other.name, name) || other.name == name)&&(identical(other.arguments, arguments) || other.arguments == arguments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,arguments);
}

@override
String toString() {
    return 'ToolCallRequestFunction(name: $name, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class _$ToolCallRequestFunctionCopyWith<$Res> implements $ToolCallRequestFunctionCopyWith<$Res> {
  factory _$ToolCallRequestFunctionCopyWith(_ToolCallRequestFunction value, $Res Function(_ToolCallRequestFunction) _then) = __$ToolCallRequestFunctionCopyWithImpl;
@override @useResult
$Res call({
 String name, String arguments
});




}
/// @nodoc
class __$ToolCallRequestFunctionCopyWithImpl<$Res>
    implements _$ToolCallRequestFunctionCopyWith<$Res> {
  __$ToolCallRequestFunctionCopyWithImpl(this._self, this._then);

  final _ToolCallRequestFunction _self;
  final $Res Function(_ToolCallRequestFunction) _then;

/// Create a copy of ToolCallRequestFunction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? arguments = null,}) {
  return _then(_ToolCallRequestFunction(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
