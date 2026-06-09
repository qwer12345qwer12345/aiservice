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

/// @nodoc
mixin _$ConfigProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get baseUrl => throw _privateConstructorUsedError;
  String get apiKey => throw _privateConstructorUsedError;
  String? get selectedModel => throw _privateConstructorUsedError;
  String get modelsPath => throw _privateConstructorUsedError;
  String get chatPath => throw _privateConstructorUsedError;
  String get apiMode => throw _privateConstructorUsedError;
  List<ModelInfo> get availableModels => throw _privateConstructorUsedError;

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
  $Res call({
    String id,
    String name,
    String baseUrl,
    String apiKey,
    String? selectedModel,
    String modelsPath,
    String chatPath,
    String apiMode,
    List<ModelInfo> availableModels,
  });
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
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseUrl = null,
    Object? apiKey = null,
    Object? selectedModel = freezed,
    Object? modelsPath = null,
    Object? chatPath = null,
    Object? apiMode = null,
    Object? availableModels = null,
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
            availableModels: null == availableModels
                ? _value.availableModels
                : availableModels // ignore: cast_nullable_to_non_nullable
                      as List<ModelInfo>,
          )
          as $Val,
    );
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
  $Res call({
    String id,
    String name,
    String baseUrl,
    String apiKey,
    String? selectedModel,
    String modelsPath,
    String chatPath,
    String apiMode,
    List<ModelInfo> availableModels,
  });
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
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseUrl = null,
    Object? apiKey = null,
    Object? selectedModel = freezed,
    Object? modelsPath = null,
    Object? chatPath = null,
    Object? apiMode = null,
    Object? availableModels = null,
  }) {
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
        availableModels: null == availableModels
            ? _value._availableModels
            : availableModels // ignore: cast_nullable_to_non_nullable
                  as List<ModelInfo>,
      ),
    );
  }
}

/// @nodoc

class _$ConfigProfileImpl implements _ConfigProfile {
  const _$ConfigProfileImpl({
    required this.id,
    required this.name,
    required this.baseUrl,
    required this.apiKey,
    this.selectedModel,
    this.modelsPath = 'v1/models',
    this.chatPath = 'v1/chat/completions',
    this.apiMode = 'chat_completions',
    final List<ModelInfo> availableModels = const [],
  }) : _availableModels = availableModels;

  @override
  final String id;
  @override
  final String name;
  @override
  final String baseUrl;
  @override
  final String apiKey;
  @override
  final String? selectedModel;
  @override
  @JsonKey()
  final String modelsPath;
  @override
  @JsonKey()
  final String chatPath;
  @override
  @JsonKey()
  final String apiMode;
  final List<ModelInfo> _availableModels;
  @override
  @JsonKey()
  List<ModelInfo> get availableModels {
    if (_availableModels is EqualUnmodifiableListView) return _availableModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableModels);
  }

  @override
  String toString() {
    return 'ConfigProfile(id: $id, name: $name, baseUrl: $baseUrl, apiKey: $apiKey, selectedModel: $selectedModel, modelsPath: $modelsPath, chatPath: $chatPath, apiMode: $apiMode, availableModels: $availableModels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.selectedModel, selectedModel) ||
                other.selectedModel == selectedModel) &&
            (identical(other.modelsPath, modelsPath) ||
                other.modelsPath == modelsPath) &&
            (identical(other.chatPath, chatPath) ||
                other.chatPath == chatPath) &&
            (identical(other.apiMode, apiMode) || other.apiMode == apiMode) &&
            const DeepCollectionEquality().equals(
              other._availableModels,
              _availableModels,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    baseUrl,
    apiKey,
    selectedModel,
    modelsPath,
    chatPath,
    apiMode,
    const DeepCollectionEquality().hash(_availableModels),
  );

  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigProfileImplCopyWith<_$ConfigProfileImpl> get copyWith =>
      __$$ConfigProfileImplCopyWithImpl<_$ConfigProfileImpl>(this, _$identity);
}

abstract class _ConfigProfile implements ConfigProfile {
  const factory _ConfigProfile({
    required final String id,
    required final String name,
    required final String baseUrl,
    required final String apiKey,
    final String? selectedModel,
    final String modelsPath,
    final String chatPath,
    final String apiMode,
    final List<ModelInfo> availableModels,
  }) = _$ConfigProfileImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get baseUrl;
  @override
  String get apiKey;
  @override
  String? get selectedModel;
  @override
  String get modelsPath;
  @override
  String get chatPath;
  @override
  String get apiMode;
  @override
  List<ModelInfo> get availableModels;

  /// Create a copy of ConfigProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigProfileImplCopyWith<_$ConfigProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GlobalSettings {
  String get activeProfileId => throw _privateConstructorUsedError;
  List<ConfigProfile> get profiles => throw _privateConstructorUsedError;

  /// Create a copy of GlobalSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalSettingsCopyWith<GlobalSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSettingsCopyWith<$Res> {
  factory $GlobalSettingsCopyWith(
    GlobalSettings value,
    $Res Function(GlobalSettings) then,
  ) = _$GlobalSettingsCopyWithImpl<$Res, GlobalSettings>;
  @useResult
  $Res call({String activeProfileId, List<ConfigProfile> profiles});
}

/// @nodoc
class _$GlobalSettingsCopyWithImpl<$Res, $Val extends GlobalSettings>
    implements $GlobalSettingsCopyWith<$Res> {
  _$GlobalSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalSettings
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
abstract class _$$GlobalSettingsImplCopyWith<$Res>
    implements $GlobalSettingsCopyWith<$Res> {
  factory _$$GlobalSettingsImplCopyWith(
    _$GlobalSettingsImpl value,
    $Res Function(_$GlobalSettingsImpl) then,
  ) = __$$GlobalSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String activeProfileId, List<ConfigProfile> profiles});
}

/// @nodoc
class __$$GlobalSettingsImplCopyWithImpl<$Res>
    extends _$GlobalSettingsCopyWithImpl<$Res, _$GlobalSettingsImpl>
    implements _$$GlobalSettingsImplCopyWith<$Res> {
  __$$GlobalSettingsImplCopyWithImpl(
    _$GlobalSettingsImpl _value,
    $Res Function(_$GlobalSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GlobalSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeProfileId = null, Object? profiles = null}) {
    return _then(
      _$GlobalSettingsImpl(
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

class _$GlobalSettingsImpl implements _GlobalSettings {
  const _$GlobalSettingsImpl({
    required this.activeProfileId,
    final List<ConfigProfile> profiles = const [],
  }) : _profiles = profiles;

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
    return 'GlobalSettings(activeProfileId: $activeProfileId, profiles: $profiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalSettingsImpl &&
            (identical(other.activeProfileId, activeProfileId) ||
                other.activeProfileId == activeProfileId) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activeProfileId,
    const DeepCollectionEquality().hash(_profiles),
  );

  /// Create a copy of GlobalSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalSettingsImplCopyWith<_$GlobalSettingsImpl> get copyWith =>
      __$$GlobalSettingsImplCopyWithImpl<_$GlobalSettingsImpl>(
        this,
        _$identity,
      );
}

abstract class _GlobalSettings implements GlobalSettings {
  const factory _GlobalSettings({
    required final String activeProfileId,
    final List<ConfigProfile> profiles,
  }) = _$GlobalSettingsImpl;

  @override
  String get activeProfileId;
  @override
  List<ConfigProfile> get profiles;

  /// Create a copy of GlobalSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalSettingsImplCopyWith<_$GlobalSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
