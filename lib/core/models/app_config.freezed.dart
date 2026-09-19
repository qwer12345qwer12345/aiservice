// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConfigProfile {

 String get id; String get name; String get baseUrl; String get apiKey; String? get selectedModel; String get modelsPath; String get chatPath; String get apiMode; List<ModelInfo> get availableModels;
/// Create a copy of ConfigProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigProfileCopyWith<ConfigProfile> get copyWith => _$ConfigProfileCopyWithImpl<ConfigProfile>(this as ConfigProfile, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ConfigProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigProfile&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.baseUrl, _this.baseUrl) || other.baseUrl == _this.baseUrl)&&(identical(other.apiKey, _this.apiKey) || other.apiKey == _this.apiKey)&&(identical(other.selectedModel, _this.selectedModel) || other.selectedModel == _this.selectedModel)&&(identical(other.modelsPath, _this.modelsPath) || other.modelsPath == _this.modelsPath)&&(identical(other.chatPath, _this.chatPath) || other.chatPath == _this.chatPath)&&(identical(other.apiMode, _this.apiMode) || other.apiMode == _this.apiMode)&&const DeepCollectionEquality().equals(other.availableModels, _this.availableModels));
}


@override
int get hashCode {
  final _this = this as ConfigProfile;
  return Object.hash(runtimeType,_this.id,_this.name,_this.baseUrl,_this.apiKey,_this.selectedModel,_this.modelsPath,_this.chatPath,_this.apiMode,const DeepCollectionEquality().hash(_this.availableModels));
}

@override
String toString() {
  final _this = this as ConfigProfile;
  return 'ConfigProfile(id: ${_this.id}, name: ${_this.name}, baseUrl: ${_this.baseUrl}, apiKey: ${_this.apiKey}, selectedModel: ${_this.selectedModel}, modelsPath: ${_this.modelsPath}, chatPath: ${_this.chatPath}, apiMode: ${_this.apiMode}, availableModels: ${_this.availableModels})';
}


}

/// @nodoc
abstract mixin class $ConfigProfileCopyWith<$Res>  {
  factory $ConfigProfileCopyWith(ConfigProfile value, $Res Function(ConfigProfile) _then) = _$ConfigProfileCopyWithImpl;
@useResult
$Res call({
 String id, String name, String baseUrl, String apiKey, String? selectedModel, String modelsPath, String chatPath, String apiMode, List<ModelInfo> availableModels
});




}
/// @nodoc
class _$ConfigProfileCopyWithImpl<$Res>
    implements $ConfigProfileCopyWith<$Res> {
  _$ConfigProfileCopyWithImpl(this._self, this._then);

  final ConfigProfile _self;
  final $Res Function(ConfigProfile) _then;

/// Create a copy of ConfigProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? baseUrl = null,Object? apiKey = null,Object? selectedModel = freezed,Object? modelsPath = null,Object? chatPath = null,Object? apiMode = null,Object? availableModels = null,}) {
  return _then(ConfigProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,selectedModel: freezed == selectedModel ? _self.selectedModel : selectedModel // ignore: cast_nullable_to_non_nullable
as String?,modelsPath: null == modelsPath ? _self.modelsPath : modelsPath // ignore: cast_nullable_to_non_nullable
as String,chatPath: null == chatPath ? _self.chatPath : chatPath // ignore: cast_nullable_to_non_nullable
as String,apiMode: null == apiMode ? _self.apiMode : apiMode // ignore: cast_nullable_to_non_nullable
as String,availableModels: null == availableModels ? _self.availableModels : availableModels // ignore: cast_nullable_to_non_nullable
as List<ModelInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfigProfile].
extension ConfigProfilePatterns on ConfigProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfigProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfigProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfigProfile value)  $default,){
final _that = this;
switch (_that) {
case _ConfigProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfigProfile value)?  $default,){
final _that = this;
switch (_that) {
case _ConfigProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String baseUrl,  String apiKey,  String? selectedModel,  String modelsPath,  String chatPath,  String apiMode,  List<ModelInfo> availableModels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfigProfile() when $default != null:
return $default(_that.id,_that.name,_that.baseUrl,_that.apiKey,_that.selectedModel,_that.modelsPath,_that.chatPath,_that.apiMode,_that.availableModels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String baseUrl,  String apiKey,  String? selectedModel,  String modelsPath,  String chatPath,  String apiMode,  List<ModelInfo> availableModels)  $default,) {final _that = this;
switch (_that) {
case _ConfigProfile():
return $default(_that.id,_that.name,_that.baseUrl,_that.apiKey,_that.selectedModel,_that.modelsPath,_that.chatPath,_that.apiMode,_that.availableModels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String baseUrl,  String apiKey,  String? selectedModel,  String modelsPath,  String chatPath,  String apiMode,  List<ModelInfo> availableModels)?  $default,) {final _that = this;
switch (_that) {
case _ConfigProfile() when $default != null:
return $default(_that.id,_that.name,_that.baseUrl,_that.apiKey,_that.selectedModel,_that.modelsPath,_that.chatPath,_that.apiMode,_that.availableModels);case _:
  return null;

}
}

}

/// @nodoc


class _ConfigProfile implements ConfigProfile {
  const _ConfigProfile({required this.id, required this.name, required this.baseUrl, required this.apiKey, this.selectedModel, this.modelsPath = 'v1/models', this.chatPath = 'v1/chat/completions', this.apiMode = 'chat_completions',  List<ModelInfo> availableModels = const []}): _availableModels = availableModels;
  

@override final  String id;
@override final  String name;
@override final  String baseUrl;
@override final  String apiKey;
@override final  String? selectedModel;
@override@JsonKey() final  String modelsPath;
@override@JsonKey() final  String chatPath;
@override@JsonKey() final  String apiMode;
 final  List<ModelInfo> _availableModels;
@override@JsonKey() List<ModelInfo> get availableModels {
  if (_availableModels is EqualUnmodifiableListView) return _availableModels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableModels);
}


/// Create a copy of ConfigProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigProfileCopyWith<_ConfigProfile> get copyWith => __$ConfigProfileCopyWithImpl<_ConfigProfile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfigProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.selectedModel, selectedModel) || other.selectedModel == selectedModel)&&(identical(other.modelsPath, modelsPath) || other.modelsPath == modelsPath)&&(identical(other.chatPath, chatPath) || other.chatPath == chatPath)&&(identical(other.apiMode, apiMode) || other.apiMode == apiMode)&&const DeepCollectionEquality().equals(other.availableModels, _availableModels));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,baseUrl,apiKey,selectedModel,modelsPath,chatPath,apiMode,const DeepCollectionEquality().hash(_availableModels));
}

@override
String toString() {
    return 'ConfigProfile(id: $id, name: $name, baseUrl: $baseUrl, apiKey: $apiKey, selectedModel: $selectedModel, modelsPath: $modelsPath, chatPath: $chatPath, apiMode: $apiMode, availableModels: $availableModels)';
}


}

/// @nodoc
abstract mixin class _$ConfigProfileCopyWith<$Res> implements $ConfigProfileCopyWith<$Res> {
  factory _$ConfigProfileCopyWith(_ConfigProfile value, $Res Function(_ConfigProfile) _then) = __$ConfigProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String baseUrl, String apiKey, String? selectedModel, String modelsPath, String chatPath, String apiMode, List<ModelInfo> availableModels
});




}
/// @nodoc
class __$ConfigProfileCopyWithImpl<$Res>
    implements _$ConfigProfileCopyWith<$Res> {
  __$ConfigProfileCopyWithImpl(this._self, this._then);

  final _ConfigProfile _self;
  final $Res Function(_ConfigProfile) _then;

/// Create a copy of ConfigProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? baseUrl = null,Object? apiKey = null,Object? selectedModel = freezed,Object? modelsPath = null,Object? chatPath = null,Object? apiMode = null,Object? availableModels = null,}) {
  return _then(_ConfigProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,selectedModel: freezed == selectedModel ? _self.selectedModel : selectedModel // ignore: cast_nullable_to_non_nullable
as String?,modelsPath: null == modelsPath ? _self.modelsPath : modelsPath // ignore: cast_nullable_to_non_nullable
as String,chatPath: null == chatPath ? _self.chatPath : chatPath // ignore: cast_nullable_to_non_nullable
as String,apiMode: null == apiMode ? _self.apiMode : apiMode // ignore: cast_nullable_to_non_nullable
as String,availableModels: null == availableModels ? _self._availableModels : availableModels // ignore: cast_nullable_to_non_nullable
as List<ModelInfo>,
  ));
}


}

/// @nodoc
mixin _$GlobalSettings {

 String get activeProfileId; List<ConfigProfile> get profiles;
/// Create a copy of GlobalSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GlobalSettingsCopyWith<GlobalSettings> get copyWith => _$GlobalSettingsCopyWithImpl<GlobalSettings>(this as GlobalSettings, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GlobalSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GlobalSettings&&(identical(other.activeProfileId, _this.activeProfileId) || other.activeProfileId == _this.activeProfileId)&&const DeepCollectionEquality().equals(other.profiles, _this.profiles));
}


@override
int get hashCode {
  final _this = this as GlobalSettings;
  return Object.hash(runtimeType,_this.activeProfileId,const DeepCollectionEquality().hash(_this.profiles));
}

@override
String toString() {
  final _this = this as GlobalSettings;
  return 'GlobalSettings(activeProfileId: ${_this.activeProfileId}, profiles: ${_this.profiles})';
}


}

/// @nodoc
abstract mixin class $GlobalSettingsCopyWith<$Res>  {
  factory $GlobalSettingsCopyWith(GlobalSettings value, $Res Function(GlobalSettings) _then) = _$GlobalSettingsCopyWithImpl;
@useResult
$Res call({
 String activeProfileId, List<ConfigProfile> profiles
});




}
/// @nodoc
class _$GlobalSettingsCopyWithImpl<$Res>
    implements $GlobalSettingsCopyWith<$Res> {
  _$GlobalSettingsCopyWithImpl(this._self, this._then);

  final GlobalSettings _self;
  final $Res Function(GlobalSettings) _then;

/// Create a copy of GlobalSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeProfileId = null,Object? profiles = null,}) {
  return _then(GlobalSettings(
activeProfileId: null == activeProfileId ? _self.activeProfileId : activeProfileId // ignore: cast_nullable_to_non_nullable
as String,profiles: null == profiles ? _self.profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<ConfigProfile>,
  ));
}

}


/// Adds pattern-matching-related methods to [GlobalSettings].
extension GlobalSettingsPatterns on GlobalSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GlobalSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GlobalSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GlobalSettings value)  $default,){
final _that = this;
switch (_that) {
case _GlobalSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GlobalSettings value)?  $default,){
final _that = this;
switch (_that) {
case _GlobalSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String activeProfileId,  List<ConfigProfile> profiles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GlobalSettings() when $default != null:
return $default(_that.activeProfileId,_that.profiles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String activeProfileId,  List<ConfigProfile> profiles)  $default,) {final _that = this;
switch (_that) {
case _GlobalSettings():
return $default(_that.activeProfileId,_that.profiles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String activeProfileId,  List<ConfigProfile> profiles)?  $default,) {final _that = this;
switch (_that) {
case _GlobalSettings() when $default != null:
return $default(_that.activeProfileId,_that.profiles);case _:
  return null;

}
}

}

/// @nodoc


class _GlobalSettings implements GlobalSettings {
  const _GlobalSettings({required this.activeProfileId,  List<ConfigProfile> profiles = const []}): _profiles = profiles;
  

@override final  String activeProfileId;
 final  List<ConfigProfile> _profiles;
@override@JsonKey() List<ConfigProfile> get profiles {
  if (_profiles is EqualUnmodifiableListView) return _profiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profiles);
}


/// Create a copy of GlobalSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GlobalSettingsCopyWith<_GlobalSettings> get copyWith => __$GlobalSettingsCopyWithImpl<_GlobalSettings>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GlobalSettings&&(identical(other.activeProfileId, activeProfileId) || other.activeProfileId == activeProfileId)&&const DeepCollectionEquality().equals(other.profiles, _profiles));
}


@override
int get hashCode {
    return Object.hash(runtimeType,activeProfileId,const DeepCollectionEquality().hash(_profiles));
}

@override
String toString() {
    return 'GlobalSettings(activeProfileId: $activeProfileId, profiles: $profiles)';
}


}

/// @nodoc
abstract mixin class _$GlobalSettingsCopyWith<$Res> implements $GlobalSettingsCopyWith<$Res> {
  factory _$GlobalSettingsCopyWith(_GlobalSettings value, $Res Function(_GlobalSettings) _then) = __$GlobalSettingsCopyWithImpl;
@override @useResult
$Res call({
 String activeProfileId, List<ConfigProfile> profiles
});




}
/// @nodoc
class __$GlobalSettingsCopyWithImpl<$Res>
    implements _$GlobalSettingsCopyWith<$Res> {
  __$GlobalSettingsCopyWithImpl(this._self, this._then);

  final _GlobalSettings _self;
  final $Res Function(_GlobalSettings) _then;

/// Create a copy of GlobalSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeProfileId = null,Object? profiles = null,}) {
  return _then(_GlobalSettings(
activeProfileId: null == activeProfileId ? _self.activeProfileId : activeProfileId // ignore: cast_nullable_to_non_nullable
as String,profiles: null == profiles ? _self._profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<ConfigProfile>,
  ));
}


}

// dart format on
