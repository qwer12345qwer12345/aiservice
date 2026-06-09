import 'package:drift/drift.dart';
import '../database/database.dart';
import '../../core/models/app_config.dart';
import '../../core/models/model_info.dart';

class ConfigRepository {
  final AppDatabase _db;

  ConfigRepository(this._db);

  // 获取所有档案（填充 availableModels）
  Future<List<ConfigProfile>> getProfiles() async {
    final profilesRows = await _db.select(_db.dbConfigProfiles).get();
    final profiles = <ConfigProfile>[];
    for (final row in profilesRows) {
      final models = await _getModelsForProfile(row.id);
      profiles.add(ConfigProfile(
        id: row.id,
        name: row.name,
        baseUrl: row.baseUrl,
        apiKey: row.apiKey,
        selectedModel: row.selectedModel,
        modelsPath: row.modelsPath,
        chatPath: row.chatPath,
        apiMode: row.apiMode,
        availableModels: models,
      ));
    }
    return profiles;
  }

  Future<String> getActiveProfileId() async {
    final row = await _db.select(_db.dbConfigStore).getSingle();
    return row.activeProfileId;
  }

  Future<void> setActiveProfileId(String profileId) async {
    await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
      DbConfigStoreCompanion(
        id: const Value(1),
        activeProfileId: Value(profileId),
      ),
    );
  }

  Future<void> insertDefaultSettings(GlobalSettings defaultSettings) async {
    await _db.transaction(() async {
      for (final profile in defaultSettings.profiles) {
        await _insertProfile(profile);
      }
      await _db.into(_db.dbConfigStore).insert(
        DbConfigStoreCompanion.insert(
          activeProfileId: defaultSettings.activeProfileId,
        ),
      );
    });
  }

  Future<void> updateProfileConfig(String profileId, ConfigProfile config) async {
    await _db.transaction(() async {
      // 更新档案主表
      await (_db.update(_db.dbConfigProfiles)..where((t) => t.id.equals(profileId)))
          .write(DbConfigProfilesCompanion(
            name: Value(config.name),
            baseUrl: Value(config.baseUrl),
            apiKey: Value(config.apiKey),
            selectedModel: Value(config.selectedModel),
            modelsPath: Value(config.modelsPath),
            chatPath: Value(config.chatPath),
            apiMode: Value(config.apiMode),
          ));
      // 替换 availableModels：先删除旧记录，再插入新记录
      await (_db.delete(_db.dbAvailableModels)..where((t) => t.profileId.equals(profileId))).go();
      for (final model in config.availableModels) {
        await _db.into(_db.dbAvailableModels).insert(
          DbAvailableModelsCompanion(
            profileId: Value(profileId),
            modelId: Value(model.id),
            overrideSupportsReasoning: Value(model.overrideSupportsReasoning),
            overrideSupportsVision: Value(model.overrideSupportsVision),
          ),
        );
      }
    });
  }

  Future<void> createProfile(ConfigProfile profile) async {
    await _db.transaction(() async {
      await _insertProfile(profile);
    });
  }

  Future<void> renameProfile(String profileId, String newName) async {
    await (_db.update(_db.dbConfigProfiles)..where((t) => t.id.equals(profileId)))
        .write(DbConfigProfilesCompanion(name: Value(newName)));
  }

  Future<void> deleteProfile(String profileId) async {
    // 由于 DbAvailableModels 设置了级联删除，删除档案时会自动删除其模型记录
    await (_db.delete(_db.dbConfigProfiles)..where((t) => t.id.equals(profileId))).go();
  }

  Stream<List<ConfigProfile>> watchProfiles() {
    return _db.select(_db.dbConfigProfiles).watch().asyncMap((rows) async {
      final profiles = <ConfigProfile>[];
      for (final row in rows) {
        final models = await _getModelsForProfile(row.id);
        profiles.add(ConfigProfile(
          id: row.id,
          name: row.name,
          baseUrl: row.baseUrl,
          apiKey: row.apiKey,
          selectedModel: row.selectedModel,
          modelsPath: row.modelsPath,
          chatPath: row.chatPath,
          apiMode: row.apiMode,
          availableModels: models,
        ));
      }
      return profiles;
    });
  }

  Stream<String?> watchActiveProfileId() {
    return _db.select(_db.dbConfigStore).watchSingleOrNull().map((row) => row?.activeProfileId);
  }

  // 内部辅助方法
  Future<List<ModelInfo>> _getModelsForProfile(String profileId) async {
    final rows = await (_db.select(_db.dbAvailableModels)
          ..where((t) => t.profileId.equals(profileId)))
        .get();
    return rows.map((row) => ModelInfo(
      id: row.modelId,
      overrideSupportsReasoning: row.overrideSupportsReasoning,
      overrideSupportsVision: row.overrideSupportsVision,
    )).toList();
  }

  Future<void> _insertProfile(ConfigProfile profile) async {
    await _db.into(_db.dbConfigProfiles).insert(
      DbConfigProfilesCompanion(
        id: Value(profile.id),
        name: Value(profile.name),
        baseUrl: Value(profile.baseUrl),
        apiKey: Value(profile.apiKey),
        selectedModel: Value(profile.selectedModel),
        modelsPath: Value(profile.modelsPath),
        chatPath: Value(profile.chatPath),
        apiMode: Value(profile.apiMode),
      ),
    );
    for (final model in profile.availableModels) {
      await _db.into(_db.dbAvailableModels).insert(
        DbAvailableModelsCompanion(
          profileId: Value(profile.id),
          modelId: Value(model.id),
          overrideSupportsReasoning: Value(model.overrideSupportsReasoning),
          overrideSupportsVision: Value(model.overrideSupportsVision),
        ),
      );
    }
  }
}