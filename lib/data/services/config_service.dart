import 'dart:async';
import 'package:drift/drift.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/models/model_info.dart';
import '../../data/data_sources/remote_api_source.dart';
import '../database/database.dart';
import 'package:uuid/uuid.dart';

class ConfigService{
  final AppDatabase _db;
  final RemoteApiSource _apiSource;

  ConfigService(this._db, this._apiSource);

  Future<AppConfigStore> _ensureInitialized() async {
    final storeRow = await _db.select(_db.dbConfigStore).getSingleOrNull();
    var activeId = storeRow?.activeProfileId ?? 'default';

    final profileRows = await _db.select(_db.dbConfigProfiles).get();

    if (profileRows.isEmpty) {
      final defaultProfile = ConfigProfile(
        id: 'default',
        name: '默认配置',
        config: AppConfig.defaultConfig(),
      );

      await _db.into(_db.dbConfigProfiles).insert(
        DbConfigProfilesCompanion.insert(
          id: defaultProfile.id,
          name: defaultProfile.name,
          config: defaultProfile.config,
        ),
      );
      await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
        const DbConfigStoreCompanion(
          id: Value(1),
          activeProfileId: Value('default'),
        ),
      );

      activeId = 'default';
      return AppConfigStore(
        activeProfileId: activeId,
        profiles: [defaultProfile],
      );
    }

    final profiles = profileRows
        .map((p) => ConfigProfile(id: p.id, name: p.name, config: p.config))
        .toList();

    if (!profiles.any((p) => p.id == activeId)) {
      activeId = profiles.first.id;
      await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
        DbConfigStoreCompanion(
          id: const Value(1),
          activeProfileId: Value(activeId),
        ),
      );
    }

    return AppConfigStore(activeProfileId: activeId, profiles: profiles);
  }

  Future<AppConfigStore> loadConfigStore() async {
    return await _ensureInitialized();
  }

  Future<AppConfig> loadConfig() async {
    final store = await loadConfigStore();
    return store.profiles.firstWhere(
      (p) => p.id == store.activeProfileId,
      orElse: () => store.profiles.first,
    ).config;
  }

  Future<void> saveConfig(AppConfig config) async {
    final activeId = await getActiveProfileId();
    await (_db.update(_db.dbConfigProfiles)..where((t) => t.id.equals(activeId)))
        .write(DbConfigProfilesCompanion(config: Value(config)));
  }

  Future<void> refreshModels() async {
    final activeConfig = await loadConfig();

    final remoteModels = await _apiSource.fetchModels(
      baseUrl: activeConfig.baseUrl,
      apiKey: activeConfig.apiKey,
      modelsPath: activeConfig.modelsPath,
    );

    final oldModels = activeConfig.availableModels ?? const <ModelInfo>[];
    final oldById = {for (final model in oldModels) model.id: model};

    final updatedModels = remoteModels.map((remote) {
      final old = oldById[remote.id];
      final merged = remote.copyWith(
        overrideSupportsReasoning: old?.overrideSupportsReasoning,
        overrideSupportsVision: old?.overrideSupportsVision,
      );
      return merged.copyWith(
        supportsVision: merged.overrideSupportsVision ?? merged.supportsVision,
        supportsReasoning: merged.overrideSupportsReasoning ?? merged.supportsReasoning,
      );
    }).toList();

    final updatedConfig = activeConfig.copyWith(
      availableModels: updatedModels,
    );

    await saveConfig(updatedConfig);
  }

  Future<List<ConfigProfile>> getProfiles() async {
    final store = await loadConfigStore();
    return store.profiles;
  }

  Future<String> getActiveProfileId() async {
    final storeRow = await _db.select(_db.dbConfigStore).getSingleOrNull();
    var activeId = storeRow?.activeProfileId ?? 'default';

    final profiles = await _db.select(_db.dbConfigProfiles).get();
    if (!profiles.any((p) => p.id == activeId) && profiles.isNotEmpty) {
      activeId = profiles.first.id;
      await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
        DbConfigStoreCompanion(
          id: const Value(1),
          activeProfileId: Value(activeId),
        ),
      );
    }

    return activeId;
  }

  Future<void> switchProfile(String profileId) async {
    await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
      DbConfigStoreCompanion(
        id: const Value(1),
        activeProfileId: Value(profileId),
      ),
    );
  }

  Future<void> createProfile(String name) async {
    final activeConfig = await loadConfig();
    final newId = const Uuid().v4();
    final cleanName = name.trim().isEmpty ? '新配置' : name.trim();

    await _db.into(_db.dbConfigProfiles).insert(
      DbConfigProfilesCompanion.insert(
        id: newId,
        name: cleanName,
        config: activeConfig,
      ),
    );
    await switchProfile(newId);
  }

  Future<void> renameProfile(String profileId, String name) async {
    if (name.trim().isEmpty) return;
    await (_db.update(_db.dbConfigProfiles)
          ..where((t) => t.id.equals(profileId)))
        .write(DbConfigProfilesCompanion(name: Value(name.trim())));
  }

  Future<void> deleteProfile(String profileId) async {
    final store = await loadConfigStore();

    if (store.profiles.length <= 1) return;

    if (store.activeProfileId == profileId) {
      final remaining = store.profiles.where((p) => p.id != profileId).toList();
      if (remaining.isNotEmpty) {
        await switchProfile(remaining.first.id);
      }
    }

    await (_db.delete(_db.dbConfigProfiles)
          ..where((t) => t.id.equals(profileId)))
        .go();
  }

  Stream<AppConfigStore> watchConfigStore() {
    _ensureInitialized();

    final storeStream = _db.select(_db.dbConfigStore).watchSingleOrNull();
    final profilesStream = _db.select(_db.dbConfigProfiles).watch();

    final outputController = StreamController<AppConfigStore>();

    DbConfigStoreData? latestStoreRow;
    List<DbConfigProfile> latestProfileRows = [];

    void computeAndOutput() {
      final storeRow = latestStoreRow;
      final profileRows = latestProfileRows;

      if (storeRow == null && profileRows.isEmpty) return;
      if (profileRows.isEmpty) return;

      var activeId = storeRow?.activeProfileId ?? 'default';

      final profiles = profileRows
          .map((p) => ConfigProfile(id: p.id, name: p.name, config: p.config))
          .toList();

      if (!profiles.any((p) => p.id == activeId)) {
        activeId = profiles.first.id;
        _db.into(_db.dbConfigStore).insertOnConflictUpdate(
          DbConfigStoreCompanion(
            id: const Value(1),
            activeProfileId: Value(activeId),
          ),
        );
      }

      outputController.add(
        AppConfigStore(activeProfileId: activeId, profiles: profiles),
      );
    }

    final storeSubscription = storeStream.listen(
      (row) {
        latestStoreRow = row;
        computeAndOutput();
      },
      onError: (e) {
        outputController.addError(e);
      },
    );

    final profilesSubscription = profilesStream.listen(
      (rows) {
        latestProfileRows = rows;
        computeAndOutput();
      },
      onError: (e) {
        outputController.addError(e);
      },
    );

    outputController.onCancel = () {
      storeSubscription.cancel();
      profilesSubscription.cancel();
    };

    return outputController.stream;
  }

  Stream<AppConfig> watchConfig() {
    return watchConfigStore().map((store) {
      return store.profiles.firstWhere(
        (p) => p.id == store.activeProfileId,
        orElse: () => store.profiles.first,
      ).config;
    });
  }
}