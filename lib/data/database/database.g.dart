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
  static const VerificationMeta _baseUrlMeta = const VerificationMeta(
    'baseUrl',
  );
  @override
  late final GeneratedColumn<String> baseUrl = GeneratedColumn<String>(
    'base_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _apiKeyMeta = const VerificationMeta('apiKey');
  @override
  late final GeneratedColumn<String> apiKey = GeneratedColumn<String>(
    'api_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedModelMeta = const VerificationMeta(
    'selectedModel',
  );
  @override
  late final GeneratedColumn<String> selectedModel = GeneratedColumn<String>(
    'selected_model',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modelsPathMeta = const VerificationMeta(
    'modelsPath',
  );
  @override
  late final GeneratedColumn<String> modelsPath = GeneratedColumn<String>(
    'models_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chatPathMeta = const VerificationMeta(
    'chatPath',
  );
  @override
  late final GeneratedColumn<String> chatPath = GeneratedColumn<String>(
    'chat_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _apiModeMeta = const VerificationMeta(
    'apiMode',
  );
  @override
  late final GeneratedColumn<String> apiMode = GeneratedColumn<String>(
    'api_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    baseUrl,
    apiKey,
    selectedModel,
    modelsPath,
    chatPath,
    apiMode,
  ];
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
    if (data.containsKey('base_url')) {
      context.handle(
        _baseUrlMeta,
        baseUrl.isAcceptableOrUnknown(data['base_url']!, _baseUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_baseUrlMeta);
    }
    if (data.containsKey('api_key')) {
      context.handle(
        _apiKeyMeta,
        apiKey.isAcceptableOrUnknown(data['api_key']!, _apiKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_apiKeyMeta);
    }
    if (data.containsKey('selected_model')) {
      context.handle(
        _selectedModelMeta,
        selectedModel.isAcceptableOrUnknown(
          data['selected_model']!,
          _selectedModelMeta,
        ),
      );
    }
    if (data.containsKey('models_path')) {
      context.handle(
        _modelsPathMeta,
        modelsPath.isAcceptableOrUnknown(data['models_path']!, _modelsPathMeta),
      );
    } else if (isInserting) {
      context.missing(_modelsPathMeta);
    }
    if (data.containsKey('chat_path')) {
      context.handle(
        _chatPathMeta,
        chatPath.isAcceptableOrUnknown(data['chat_path']!, _chatPathMeta),
      );
    } else if (isInserting) {
      context.missing(_chatPathMeta);
    }
    if (data.containsKey('api_mode')) {
      context.handle(
        _apiModeMeta,
        apiMode.isAcceptableOrUnknown(data['api_mode']!, _apiModeMeta),
      );
    } else if (isInserting) {
      context.missing(_apiModeMeta);
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
      baseUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_url'],
      )!,
      apiKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_key'],
      )!,
      selectedModel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_model'],
      ),
      modelsPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}models_path'],
      )!,
      chatPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chat_path'],
      )!,
      apiMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_mode'],
      )!,
    );
  }

  @override
  $DbConfigProfilesTable createAlias(String alias) {
    return $DbConfigProfilesTable(attachedDatabase, alias);
  }
}

class DbConfigProfile extends DataClass implements Insertable<DbConfigProfile> {
  final String id;
  final String name;
  final String baseUrl;
  final String apiKey;
  final String? selectedModel;
  final String modelsPath;
  final String chatPath;
  final String apiMode;
  const DbConfigProfile({
    required this.id,
    required this.name,
    required this.baseUrl,
    required this.apiKey,
    this.selectedModel,
    required this.modelsPath,
    required this.chatPath,
    required this.apiMode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['base_url'] = Variable<String>(baseUrl);
    map['api_key'] = Variable<String>(apiKey);
    if (!nullToAbsent || selectedModel != null) {
      map['selected_model'] = Variable<String>(selectedModel);
    }
    map['models_path'] = Variable<String>(modelsPath);
    map['chat_path'] = Variable<String>(chatPath);
    map['api_mode'] = Variable<String>(apiMode);
    return map;
  }

  DbConfigProfilesCompanion toCompanion(bool nullToAbsent) {
    return DbConfigProfilesCompanion(
      id: Value(id),
      name: Value(name),
      baseUrl: Value(baseUrl),
      apiKey: Value(apiKey),
      selectedModel: selectedModel == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedModel),
      modelsPath: Value(modelsPath),
      chatPath: Value(chatPath),
      apiMode: Value(apiMode),
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
      baseUrl: serializer.fromJson<String>(json['baseUrl']),
      apiKey: serializer.fromJson<String>(json['apiKey']),
      selectedModel: serializer.fromJson<String?>(json['selectedModel']),
      modelsPath: serializer.fromJson<String>(json['modelsPath']),
      chatPath: serializer.fromJson<String>(json['chatPath']),
      apiMode: serializer.fromJson<String>(json['apiMode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'baseUrl': serializer.toJson<String>(baseUrl),
      'apiKey': serializer.toJson<String>(apiKey),
      'selectedModel': serializer.toJson<String?>(selectedModel),
      'modelsPath': serializer.toJson<String>(modelsPath),
      'chatPath': serializer.toJson<String>(chatPath),
      'apiMode': serializer.toJson<String>(apiMode),
    };
  }

  DbConfigProfile copyWith({
    String? id,
    String? name,
    String? baseUrl,
    String? apiKey,
    Value<String?> selectedModel = const Value.absent(),
    String? modelsPath,
    String? chatPath,
    String? apiMode,
  }) => DbConfigProfile(
    id: id ?? this.id,
    name: name ?? this.name,
    baseUrl: baseUrl ?? this.baseUrl,
    apiKey: apiKey ?? this.apiKey,
    selectedModel: selectedModel.present
        ? selectedModel.value
        : this.selectedModel,
    modelsPath: modelsPath ?? this.modelsPath,
    chatPath: chatPath ?? this.chatPath,
    apiMode: apiMode ?? this.apiMode,
  );
  DbConfigProfile copyWithCompanion(DbConfigProfilesCompanion data) {
    return DbConfigProfile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      baseUrl: data.baseUrl.present ? data.baseUrl.value : this.baseUrl,
      apiKey: data.apiKey.present ? data.apiKey.value : this.apiKey,
      selectedModel: data.selectedModel.present
          ? data.selectedModel.value
          : this.selectedModel,
      modelsPath: data.modelsPath.present
          ? data.modelsPath.value
          : this.modelsPath,
      chatPath: data.chatPath.present ? data.chatPath.value : this.chatPath,
      apiMode: data.apiMode.present ? data.apiMode.value : this.apiMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbConfigProfile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('apiKey: $apiKey, ')
          ..write('selectedModel: $selectedModel, ')
          ..write('modelsPath: $modelsPath, ')
          ..write('chatPath: $chatPath, ')
          ..write('apiMode: $apiMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    baseUrl,
    apiKey,
    selectedModel,
    modelsPath,
    chatPath,
    apiMode,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbConfigProfile &&
          other.id == this.id &&
          other.name == this.name &&
          other.baseUrl == this.baseUrl &&
          other.apiKey == this.apiKey &&
          other.selectedModel == this.selectedModel &&
          other.modelsPath == this.modelsPath &&
          other.chatPath == this.chatPath &&
          other.apiMode == this.apiMode);
}

class DbConfigProfilesCompanion extends UpdateCompanion<DbConfigProfile> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> baseUrl;
  final Value<String> apiKey;
  final Value<String?> selectedModel;
  final Value<String> modelsPath;
  final Value<String> chatPath;
  final Value<String> apiMode;
  final Value<int> rowid;
  const DbConfigProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.apiKey = const Value.absent(),
    this.selectedModel = const Value.absent(),
    this.modelsPath = const Value.absent(),
    this.chatPath = const Value.absent(),
    this.apiMode = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbConfigProfilesCompanion.insert({
    required String id,
    required String name,
    required String baseUrl,
    required String apiKey,
    this.selectedModel = const Value.absent(),
    required String modelsPath,
    required String chatPath,
    required String apiMode,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       baseUrl = Value(baseUrl),
       apiKey = Value(apiKey),
       modelsPath = Value(modelsPath),
       chatPath = Value(chatPath),
       apiMode = Value(apiMode);
  static Insertable<DbConfigProfile> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? baseUrl,
    Expression<String>? apiKey,
    Expression<String>? selectedModel,
    Expression<String>? modelsPath,
    Expression<String>? chatPath,
    Expression<String>? apiMode,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (baseUrl != null) 'base_url': baseUrl,
      if (apiKey != null) 'api_key': apiKey,
      if (selectedModel != null) 'selected_model': selectedModel,
      if (modelsPath != null) 'models_path': modelsPath,
      if (chatPath != null) 'chat_path': chatPath,
      if (apiMode != null) 'api_mode': apiMode,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbConfigProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? baseUrl,
    Value<String>? apiKey,
    Value<String?>? selectedModel,
    Value<String>? modelsPath,
    Value<String>? chatPath,
    Value<String>? apiMode,
    Value<int>? rowid,
  }) {
    return DbConfigProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      baseUrl: baseUrl ?? this.baseUrl,
      apiKey: apiKey ?? this.apiKey,
      selectedModel: selectedModel ?? this.selectedModel,
      modelsPath: modelsPath ?? this.modelsPath,
      chatPath: chatPath ?? this.chatPath,
      apiMode: apiMode ?? this.apiMode,
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
    if (baseUrl.present) {
      map['base_url'] = Variable<String>(baseUrl.value);
    }
    if (apiKey.present) {
      map['api_key'] = Variable<String>(apiKey.value);
    }
    if (selectedModel.present) {
      map['selected_model'] = Variable<String>(selectedModel.value);
    }
    if (modelsPath.present) {
      map['models_path'] = Variable<String>(modelsPath.value);
    }
    if (chatPath.present) {
      map['chat_path'] = Variable<String>(chatPath.value);
    }
    if (apiMode.present) {
      map['api_mode'] = Variable<String>(apiMode.value);
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
          ..write('baseUrl: $baseUrl, ')
          ..write('apiKey: $apiKey, ')
          ..write('selectedModel: $selectedModel, ')
          ..write('modelsPath: $modelsPath, ')
          ..write('chatPath: $chatPath, ')
          ..write('apiMode: $apiMode, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbAvailableModelsTable extends DbAvailableModels
    with TableInfo<$DbAvailableModelsTable, DbAvailableModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbAvailableModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_config_profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _modelIdMeta = const VerificationMeta(
    'modelId',
  );
  @override
  late final GeneratedColumn<String> modelId = GeneratedColumn<String>(
    'model_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _overrideSupportsReasoningMeta =
      const VerificationMeta('overrideSupportsReasoning');
  @override
  late final GeneratedColumn<bool> overrideSupportsReasoning =
      GeneratedColumn<bool>(
        'override_supports_reasoning',
        aliasedName,
        true,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("override_supports_reasoning" IN (0, 1))',
        ),
      );
  static const VerificationMeta _overrideSupportsVisionMeta =
      const VerificationMeta('overrideSupportsVision');
  @override
  late final GeneratedColumn<bool> overrideSupportsVision =
      GeneratedColumn<bool>(
        'override_supports_vision',
        aliasedName,
        true,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("override_supports_vision" IN (0, 1))',
        ),
      );
  @override
  List<GeneratedColumn> get $columns => [
    profileId,
    modelId,
    overrideSupportsReasoning,
    overrideSupportsVision,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_available_models';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbAvailableModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('model_id')) {
      context.handle(
        _modelIdMeta,
        modelId.isAcceptableOrUnknown(data['model_id']!, _modelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_modelIdMeta);
    }
    if (data.containsKey('override_supports_reasoning')) {
      context.handle(
        _overrideSupportsReasoningMeta,
        overrideSupportsReasoning.isAcceptableOrUnknown(
          data['override_supports_reasoning']!,
          _overrideSupportsReasoningMeta,
        ),
      );
    }
    if (data.containsKey('override_supports_vision')) {
      context.handle(
        _overrideSupportsVisionMeta,
        overrideSupportsVision.isAcceptableOrUnknown(
          data['override_supports_vision']!,
          _overrideSupportsVisionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {profileId, modelId};
  @override
  DbAvailableModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbAvailableModel(
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      modelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_id'],
      )!,
      overrideSupportsReasoning: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}override_supports_reasoning'],
      ),
      overrideSupportsVision: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}override_supports_vision'],
      ),
    );
  }

  @override
  $DbAvailableModelsTable createAlias(String alias) {
    return $DbAvailableModelsTable(attachedDatabase, alias);
  }
}

class DbAvailableModel extends DataClass
    implements Insertable<DbAvailableModel> {
  final String profileId;
  final String modelId;
  final bool? overrideSupportsReasoning;
  final bool? overrideSupportsVision;
  const DbAvailableModel({
    required this.profileId,
    required this.modelId,
    this.overrideSupportsReasoning,
    this.overrideSupportsVision,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['profile_id'] = Variable<String>(profileId);
    map['model_id'] = Variable<String>(modelId);
    if (!nullToAbsent || overrideSupportsReasoning != null) {
      map['override_supports_reasoning'] = Variable<bool>(
        overrideSupportsReasoning,
      );
    }
    if (!nullToAbsent || overrideSupportsVision != null) {
      map['override_supports_vision'] = Variable<bool>(overrideSupportsVision);
    }
    return map;
  }

  DbAvailableModelsCompanion toCompanion(bool nullToAbsent) {
    return DbAvailableModelsCompanion(
      profileId: Value(profileId),
      modelId: Value(modelId),
      overrideSupportsReasoning:
          overrideSupportsReasoning == null && nullToAbsent
          ? const Value.absent()
          : Value(overrideSupportsReasoning),
      overrideSupportsVision: overrideSupportsVision == null && nullToAbsent
          ? const Value.absent()
          : Value(overrideSupportsVision),
    );
  }

  factory DbAvailableModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbAvailableModel(
      profileId: serializer.fromJson<String>(json['profileId']),
      modelId: serializer.fromJson<String>(json['modelId']),
      overrideSupportsReasoning: serializer.fromJson<bool?>(
        json['overrideSupportsReasoning'],
      ),
      overrideSupportsVision: serializer.fromJson<bool?>(
        json['overrideSupportsVision'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'profileId': serializer.toJson<String>(profileId),
      'modelId': serializer.toJson<String>(modelId),
      'overrideSupportsReasoning': serializer.toJson<bool?>(
        overrideSupportsReasoning,
      ),
      'overrideSupportsVision': serializer.toJson<bool?>(
        overrideSupportsVision,
      ),
    };
  }

  DbAvailableModel copyWith({
    String? profileId,
    String? modelId,
    Value<bool?> overrideSupportsReasoning = const Value.absent(),
    Value<bool?> overrideSupportsVision = const Value.absent(),
  }) => DbAvailableModel(
    profileId: profileId ?? this.profileId,
    modelId: modelId ?? this.modelId,
    overrideSupportsReasoning: overrideSupportsReasoning.present
        ? overrideSupportsReasoning.value
        : this.overrideSupportsReasoning,
    overrideSupportsVision: overrideSupportsVision.present
        ? overrideSupportsVision.value
        : this.overrideSupportsVision,
  );
  DbAvailableModel copyWithCompanion(DbAvailableModelsCompanion data) {
    return DbAvailableModel(
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      modelId: data.modelId.present ? data.modelId.value : this.modelId,
      overrideSupportsReasoning: data.overrideSupportsReasoning.present
          ? data.overrideSupportsReasoning.value
          : this.overrideSupportsReasoning,
      overrideSupportsVision: data.overrideSupportsVision.present
          ? data.overrideSupportsVision.value
          : this.overrideSupportsVision,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbAvailableModel(')
          ..write('profileId: $profileId, ')
          ..write('modelId: $modelId, ')
          ..write('overrideSupportsReasoning: $overrideSupportsReasoning, ')
          ..write('overrideSupportsVision: $overrideSupportsVision')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    profileId,
    modelId,
    overrideSupportsReasoning,
    overrideSupportsVision,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAvailableModel &&
          other.profileId == this.profileId &&
          other.modelId == this.modelId &&
          other.overrideSupportsReasoning == this.overrideSupportsReasoning &&
          other.overrideSupportsVision == this.overrideSupportsVision);
}

class DbAvailableModelsCompanion extends UpdateCompanion<DbAvailableModel> {
  final Value<String> profileId;
  final Value<String> modelId;
  final Value<bool?> overrideSupportsReasoning;
  final Value<bool?> overrideSupportsVision;
  final Value<int> rowid;
  const DbAvailableModelsCompanion({
    this.profileId = const Value.absent(),
    this.modelId = const Value.absent(),
    this.overrideSupportsReasoning = const Value.absent(),
    this.overrideSupportsVision = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbAvailableModelsCompanion.insert({
    required String profileId,
    required String modelId,
    this.overrideSupportsReasoning = const Value.absent(),
    this.overrideSupportsVision = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : profileId = Value(profileId),
       modelId = Value(modelId);
  static Insertable<DbAvailableModel> custom({
    Expression<String>? profileId,
    Expression<String>? modelId,
    Expression<bool>? overrideSupportsReasoning,
    Expression<bool>? overrideSupportsVision,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (profileId != null) 'profile_id': profileId,
      if (modelId != null) 'model_id': modelId,
      if (overrideSupportsReasoning != null)
        'override_supports_reasoning': overrideSupportsReasoning,
      if (overrideSupportsVision != null)
        'override_supports_vision': overrideSupportsVision,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbAvailableModelsCompanion copyWith({
    Value<String>? profileId,
    Value<String>? modelId,
    Value<bool?>? overrideSupportsReasoning,
    Value<bool?>? overrideSupportsVision,
    Value<int>? rowid,
  }) {
    return DbAvailableModelsCompanion(
      profileId: profileId ?? this.profileId,
      modelId: modelId ?? this.modelId,
      overrideSupportsReasoning:
          overrideSupportsReasoning ?? this.overrideSupportsReasoning,
      overrideSupportsVision:
          overrideSupportsVision ?? this.overrideSupportsVision,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (modelId.present) {
      map['model_id'] = Variable<String>(modelId.value);
    }
    if (overrideSupportsReasoning.present) {
      map['override_supports_reasoning'] = Variable<bool>(
        overrideSupportsReasoning.value,
      );
    }
    if (overrideSupportsVision.present) {
      map['override_supports_vision'] = Variable<bool>(
        overrideSupportsVision.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbAvailableModelsCompanion(')
          ..write('profileId: $profileId, ')
          ..write('modelId: $modelId, ')
          ..write('overrideSupportsReasoning: $overrideSupportsReasoning, ')
          ..write('overrideSupportsVision: $overrideSupportsVision, ')
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
  List<GeneratedColumn> get $columns => [id, title, updatedAt];
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
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
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
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DbSessionsTable createAlias(String alias) {
    return $DbSessionsTable(attachedDatabase, alias);
  }
}

class DbSession extends DataClass implements Insertable<DbSession> {
  final String id;
  final String title;
  final int updatedAt;
  const DbSession({
    required this.id,
    required this.title,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  DbSessionsCompanion toCompanion(bool nullToAbsent) {
    return DbSessionsCompanion(
      id: Value(id),
      title: Value(title),
      updatedAt: Value(updatedAt),
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
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  DbSession copyWith({String? id, String? title, int? updatedAt}) => DbSession(
    id: id ?? this.id,
    title: title ?? this.title,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DbSession copyWithCompanion(DbSessionsCompanion data) {
    return DbSession(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSession(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSession &&
          other.id == this.id &&
          other.title == this.title &&
          other.updatedAt == this.updatedAt);
}

class DbSessionsCompanion extends UpdateCompanion<DbSession> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const DbSessionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbSessionsCompanion.insert({
    required String id,
    required String title,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       updatedAt = Value(updatedAt);
  static Insertable<DbSession> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbSessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return DbSessionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
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
          ..write('updatedAt: $updatedAt, ')
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
  late final $DbAvailableModelsTable dbAvailableModels =
      $DbAvailableModelsTable(this);
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
    dbAvailableModels,
    dbSessions,
    dbChatRounds,
    dbAttachments,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'db_config_profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('db_available_models', kind: UpdateKind.delete)],
    ),
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
      required String baseUrl,
      required String apiKey,
      Value<String?> selectedModel,
      required String modelsPath,
      required String chatPath,
      required String apiMode,
      Value<int> rowid,
    });
typedef $$DbConfigProfilesTableUpdateCompanionBuilder =
    DbConfigProfilesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> baseUrl,
      Value<String> apiKey,
      Value<String?> selectedModel,
      Value<String> modelsPath,
      Value<String> chatPath,
      Value<String> apiMode,
      Value<int> rowid,
    });

final class $$DbConfigProfilesTableReferences
    extends
        BaseReferences<_$AppDatabase, $DbConfigProfilesTable, DbConfigProfile> {
  $$DbConfigProfilesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$DbAvailableModelsTable, List<DbAvailableModel>>
  _dbAvailableModelsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dbAvailableModels,
        aliasName: $_aliasNameGenerator(
          db.dbConfigProfiles.id,
          db.dbAvailableModels.profileId,
        ),
      );

  $$DbAvailableModelsTableProcessedTableManager get dbAvailableModelsRefs {
    final manager = $$DbAvailableModelsTableTableManager(
      $_db,
      $_db.dbAvailableModels,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dbAvailableModelsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<String> get baseUrl => $composableBuilder(
    column: $table.baseUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiKey => $composableBuilder(
    column: $table.apiKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedModel => $composableBuilder(
    column: $table.selectedModel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelsPath => $composableBuilder(
    column: $table.modelsPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chatPath => $composableBuilder(
    column: $table.chatPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiMode => $composableBuilder(
    column: $table.apiMode,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dbAvailableModelsRefs(
    Expression<bool> Function($$DbAvailableModelsTableFilterComposer f) f,
  ) {
    final $$DbAvailableModelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dbAvailableModels,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbAvailableModelsTableFilterComposer(
            $db: $db,
            $table: $db.dbAvailableModels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  ColumnOrderings<String> get baseUrl => $composableBuilder(
    column: $table.baseUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiKey => $composableBuilder(
    column: $table.apiKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedModel => $composableBuilder(
    column: $table.selectedModel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelsPath => $composableBuilder(
    column: $table.modelsPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chatPath => $composableBuilder(
    column: $table.chatPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiMode => $composableBuilder(
    column: $table.apiMode,
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

  GeneratedColumn<String> get baseUrl =>
      $composableBuilder(column: $table.baseUrl, builder: (column) => column);

  GeneratedColumn<String> get apiKey =>
      $composableBuilder(column: $table.apiKey, builder: (column) => column);

  GeneratedColumn<String> get selectedModel => $composableBuilder(
    column: $table.selectedModel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get modelsPath => $composableBuilder(
    column: $table.modelsPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get chatPath =>
      $composableBuilder(column: $table.chatPath, builder: (column) => column);

  GeneratedColumn<String> get apiMode =>
      $composableBuilder(column: $table.apiMode, builder: (column) => column);

  Expression<T> dbAvailableModelsRefs<T extends Object>(
    Expression<T> Function($$DbAvailableModelsTableAnnotationComposer a) f,
  ) {
    final $$DbAvailableModelsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dbAvailableModels,
          getReferencedColumn: (t) => t.profileId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DbAvailableModelsTableAnnotationComposer(
                $db: $db,
                $table: $db.dbAvailableModels,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
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
          (DbConfigProfile, $$DbConfigProfilesTableReferences),
          DbConfigProfile,
          PrefetchHooks Function({bool dbAvailableModelsRefs})
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
                Value<String> baseUrl = const Value.absent(),
                Value<String> apiKey = const Value.absent(),
                Value<String?> selectedModel = const Value.absent(),
                Value<String> modelsPath = const Value.absent(),
                Value<String> chatPath = const Value.absent(),
                Value<String> apiMode = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbConfigProfilesCompanion(
                id: id,
                name: name,
                baseUrl: baseUrl,
                apiKey: apiKey,
                selectedModel: selectedModel,
                modelsPath: modelsPath,
                chatPath: chatPath,
                apiMode: apiMode,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String baseUrl,
                required String apiKey,
                Value<String?> selectedModel = const Value.absent(),
                required String modelsPath,
                required String chatPath,
                required String apiMode,
                Value<int> rowid = const Value.absent(),
              }) => DbConfigProfilesCompanion.insert(
                id: id,
                name: name,
                baseUrl: baseUrl,
                apiKey: apiKey,
                selectedModel: selectedModel,
                modelsPath: modelsPath,
                chatPath: chatPath,
                apiMode: apiMode,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbConfigProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dbAvailableModelsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dbAvailableModelsRefs) db.dbAvailableModels,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dbAvailableModelsRefs)
                    await $_getPrefetchedData<
                      DbConfigProfile,
                      $DbConfigProfilesTable,
                      DbAvailableModel
                    >(
                      currentTable: table,
                      referencedTable: $$DbConfigProfilesTableReferences
                          ._dbAvailableModelsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DbConfigProfilesTableReferences(
                            db,
                            table,
                            p0,
                          ).dbAvailableModelsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.profileId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (DbConfigProfile, $$DbConfigProfilesTableReferences),
      DbConfigProfile,
      PrefetchHooks Function({bool dbAvailableModelsRefs})
    >;
typedef $$DbAvailableModelsTableCreateCompanionBuilder =
    DbAvailableModelsCompanion Function({
      required String profileId,
      required String modelId,
      Value<bool?> overrideSupportsReasoning,
      Value<bool?> overrideSupportsVision,
      Value<int> rowid,
    });
typedef $$DbAvailableModelsTableUpdateCompanionBuilder =
    DbAvailableModelsCompanion Function({
      Value<String> profileId,
      Value<String> modelId,
      Value<bool?> overrideSupportsReasoning,
      Value<bool?> overrideSupportsVision,
      Value<int> rowid,
    });

final class $$DbAvailableModelsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DbAvailableModelsTable,
          DbAvailableModel
        > {
  $$DbAvailableModelsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbConfigProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.dbConfigProfiles.createAlias(
        $_aliasNameGenerator(
          db.dbAvailableModels.profileId,
          db.dbConfigProfiles.id,
        ),
      );

  $$DbConfigProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<String>('profile_id')!;

    final manager = $$DbConfigProfilesTableTableManager(
      $_db,
      $_db.dbConfigProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbAvailableModelsTableFilterComposer
    extends Composer<_$AppDatabase, $DbAvailableModelsTable> {
  $$DbAvailableModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get modelId => $composableBuilder(
    column: $table.modelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get overrideSupportsReasoning => $composableBuilder(
    column: $table.overrideSupportsReasoning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get overrideSupportsVision => $composableBuilder(
    column: $table.overrideSupportsVision,
    builder: (column) => ColumnFilters(column),
  );

  $$DbConfigProfilesTableFilterComposer get profileId {
    final $$DbConfigProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.dbConfigProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbConfigProfilesTableFilterComposer(
            $db: $db,
            $table: $db.dbConfigProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbAvailableModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbAvailableModelsTable> {
  $$DbAvailableModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get modelId => $composableBuilder(
    column: $table.modelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get overrideSupportsReasoning => $composableBuilder(
    column: $table.overrideSupportsReasoning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get overrideSupportsVision => $composableBuilder(
    column: $table.overrideSupportsVision,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbConfigProfilesTableOrderingComposer get profileId {
    final $$DbConfigProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.dbConfigProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbConfigProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.dbConfigProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbAvailableModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbAvailableModelsTable> {
  $$DbAvailableModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get modelId =>
      $composableBuilder(column: $table.modelId, builder: (column) => column);

  GeneratedColumn<bool> get overrideSupportsReasoning => $composableBuilder(
    column: $table.overrideSupportsReasoning,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get overrideSupportsVision => $composableBuilder(
    column: $table.overrideSupportsVision,
    builder: (column) => column,
  );

  $$DbConfigProfilesTableAnnotationComposer get profileId {
    final $$DbConfigProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.dbConfigProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbConfigProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.dbConfigProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbAvailableModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbAvailableModelsTable,
          DbAvailableModel,
          $$DbAvailableModelsTableFilterComposer,
          $$DbAvailableModelsTableOrderingComposer,
          $$DbAvailableModelsTableAnnotationComposer,
          $$DbAvailableModelsTableCreateCompanionBuilder,
          $$DbAvailableModelsTableUpdateCompanionBuilder,
          (DbAvailableModel, $$DbAvailableModelsTableReferences),
          DbAvailableModel,
          PrefetchHooks Function({bool profileId})
        > {
  $$DbAvailableModelsTableTableManager(
    _$AppDatabase db,
    $DbAvailableModelsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbAvailableModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbAvailableModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbAvailableModelsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> profileId = const Value.absent(),
                Value<String> modelId = const Value.absent(),
                Value<bool?> overrideSupportsReasoning = const Value.absent(),
                Value<bool?> overrideSupportsVision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbAvailableModelsCompanion(
                profileId: profileId,
                modelId: modelId,
                overrideSupportsReasoning: overrideSupportsReasoning,
                overrideSupportsVision: overrideSupportsVision,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String profileId,
                required String modelId,
                Value<bool?> overrideSupportsReasoning = const Value.absent(),
                Value<bool?> overrideSupportsVision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbAvailableModelsCompanion.insert(
                profileId: profileId,
                modelId: modelId,
                overrideSupportsReasoning: overrideSupportsReasoning,
                overrideSupportsVision: overrideSupportsVision,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DbAvailableModelsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
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
                    if (profileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.profileId,
                                referencedTable:
                                    $$DbAvailableModelsTableReferences
                                        ._profileIdTable(db),
                                referencedColumn:
                                    $$DbAvailableModelsTableReferences
                                        ._profileIdTable(db)
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

typedef $$DbAvailableModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbAvailableModelsTable,
      DbAvailableModel,
      $$DbAvailableModelsTableFilterComposer,
      $$DbAvailableModelsTableOrderingComposer,
      $$DbAvailableModelsTableAnnotationComposer,
      $$DbAvailableModelsTableCreateCompanionBuilder,
      $$DbAvailableModelsTableUpdateCompanionBuilder,
      (DbAvailableModel, $$DbAvailableModelsTableReferences),
      DbAvailableModel,
      PrefetchHooks Function({bool profileId})
    >;
typedef $$DbSessionsTableCreateCompanionBuilder =
    DbSessionsCompanion Function({
      required String id,
      required String title,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$DbSessionsTableUpdateCompanionBuilder =
    DbSessionsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int> updatedAt,
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

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
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

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
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

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

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
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbSessionsCompanion(
                id: id,
                title: title,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => DbSessionsCompanion.insert(
                id: id,
                title: title,
                updatedAt: updatedAt,
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
  $$DbAvailableModelsTableTableManager get dbAvailableModels =>
      $$DbAvailableModelsTableTableManager(_db, _db.dbAvailableModels);
  $$DbSessionsTableTableManager get dbSessions =>
      $$DbSessionsTableTableManager(_db, _db.dbSessions);
  $$DbChatRoundsTableTableManager get dbChatRounds =>
      $$DbChatRoundsTableTableManager(_db, _db.dbChatRounds);
  $$DbAttachmentsTableTableManager get dbAttachments =>
      $$DbAttachmentsTableTableManager(_db, _db.dbAttachments);
}
