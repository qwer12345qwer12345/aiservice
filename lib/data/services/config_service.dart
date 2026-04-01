import 'package:drift/drift.dart';
import '../../core/interfaces/config_service.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/utils/id_generator.dart';
import '../../data/data_sources/remote_api_source.dart';
import '../database/database.dart';

class ConfigService implements IConfigService {
  final AppDatabase _db;
  final IRemoteApiSource _apiSource;

  ConfigService(this._db, this._apiSource);

  @override
  Future<AppConfigStore> loadConfigStore() async {
    final storeRow = await _db.select(_db.dbConfigStore).getSingleOrNull();
    final activeId = storeRow?.activeProfileId ?? 'default';

    final profileRows = await _db.select(_db.dbConfigProfiles).get();
    
    // 初始化默认数据
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
        const DbConfigStoreCompanion(id: Value(1), activeProfileId: Value('default')),
      );
      
      return AppConfigStore(activeProfileId: 'default', profiles: [defaultProfile]);
    }

    final profiles = profileRows.map((p) => ConfigProfile(
      id: p.id, name: p.name, config: p.config,
    )).toList();

    return AppConfigStore(activeProfileId: activeId, profiles: profiles);
  }

  @override
  Future<AppConfig> loadConfig() async {
    final store = await loadConfigStore();
    return store.profiles.firstWhere((p) => p.id == store.activeProfileId).config;
  }

  @override
  Future<void> saveConfig(AppConfig config) async {
    final activeId = await getActiveProfileId();
    await _db.update(_db.dbConfigProfiles)
      ..where((t) => t.id.equals(activeId))
      ..write(DbConfigProfilesCompanion(config: Value(config)));
  }

  @override
  Future<void> refreshModels() async {
    final activeConfig = await loadConfig();
    final models = await _apiSource.fetchModels(
      baseUrl: activeConfig.baseUrl,
      apiKey: activeConfig.apiKey,
      modelsPath: activeConfig.modelsPath,
    );
    final updatedConfig = activeConfig.copyWith(availableModels: models);
    await saveConfig(updatedConfig);
  }

  @override
  Future<List<ConfigProfile>> getProfiles() async {
    final store = await loadConfigStore();
    return store.profiles;
  }

  @override
  Future<String> getActiveProfileId() async {
    final storeRow = await _db.select(_db.dbConfigStore).getSingleOrNull();
    return storeRow?.activeProfileId ?? 'default';
  }

  @override
  Future<void> switchProfile(String profileId) async {
    await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
      DbConfigStoreCompanion(id: const Value(1), activeProfileId: Value(profileId)),
    );
  }

  @override
  Future<void> createProfile(String name) async {
    final activeConfig = await loadConfig();
    final newId = IdGenerator.generate();
    final cleanName = name.trim().isEmpty ? '新配置' : name.trim();
    
    await _db.into(_db.dbConfigProfiles).insert(
      DbConfigProfilesCompanion.insert(
        id: newId, name: cleanName, config: activeConfig,
      ),
    );
    await switchProfile(newId);
  }

  @override
  Future<void> renameProfile(String profileId, String name) async {
    if (name.trim().isEmpty) return;
    await (_db.update(_db.dbConfigProfiles)..where((t) => t.id.equals(profileId)))
        .write(DbConfigProfilesCompanion(name: Value(name.trim())));
  }

  @override
  Future<void> deleteProfile(String profileId) async {
    final store = await loadConfigStore();
    if (store.profiles.length <= 1) return;

    await (_db.delete(_db.dbConfigProfiles)..where((t) => t.id.equals(profileId))).go();
    
    if (store.activeProfileId == profileId) {
      final remaining = await _db.select(_db.dbConfigProfiles).get();
      await switchProfile(remaining.first.id);
    }
  }
}