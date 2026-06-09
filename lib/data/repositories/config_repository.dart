import 'package:drift/drift.dart';
import '../database/database.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';

class ConfigRepository {
  final AppDatabase _db;

  ConfigRepository(this._db);

  /// 获取所有配置档案列表
  Future<List<ConfigProfile>> getProfiles() async {
    final rows = await _db.select(_db.dbConfigProfiles).get();
    return rows.map((p) => ConfigProfile(
      id: p.id,
      name: p.name,
      config: p.config,
    )).toList();
  }

  /// 获取当前激活的配置档案 ID
  Future<String> getActiveProfileId() async {
    final row = await _db.select(_db.dbConfigStore).getSingle();
    return row.activeProfileId;
  }

  /// 设置激活的配置档案 ID
  Future<void> setActiveProfileId(String profileId) async {
    await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
      DbConfigStoreCompanion(
        id: const Value(1),
        activeProfileId: Value(profileId),
      ),
    );
  }

  /// 插入默认配置存档（初始化时使用）
  Future<void> insertDefaultStore(AppConfigStore defaultStore) async {
    await _db.transaction(() async {
      for (final profile in defaultStore.profiles) {
        await _db.into(_db.dbConfigProfiles).insert(
          DbConfigProfilesCompanion.insert(
            id: profile.id,
            name: profile.name,
            config: profile.config,
          ),
        );
      }
      await _db.into(_db.dbConfigStore).insert(
        DbConfigStoreCompanion.insert(
          id: const Value(1),
          activeProfileId: defaultStore.activeProfileId,
        ),
      );
    });
  }

  /// 更新指定配置档案的配置内容
  Future<void> updateProfileConfig(String profileId, AppConfig config) async {
    await (_db.update(_db.dbConfigProfiles)
          ..where((t) => t.id.equals(profileId)))
        .write(DbConfigProfilesCompanion(config: Value(config)));
  }

  /// 创建新的配置档案
  Future<void> createProfile(String id, String name, AppConfig config) async {
    await _db.into(_db.dbConfigProfiles).insert(
      DbConfigProfilesCompanion.insert(
        id: id,
        name: name,
        config: config,
      ),
    );
  }

  /// 重命名配置档案
  Future<void> renameProfile(String profileId, String newName) async {
    await (_db.update(_db.dbConfigProfiles)
          ..where((t) => t.id.equals(profileId)))
        .write(DbConfigProfilesCompanion(name: Value(newName)));
  }

  /// 删除配置档案
  Future<void> deleteProfile(String profileId) async {
    await (_db.delete(_db.dbConfigProfiles)
          ..where((t) => t.id.equals(profileId)))
        .go();
  }

  /// 监听配置档案列表的变化（用于响应式）
  Stream<List<ConfigProfile>> watchProfiles() {
    return _db.select(_db.dbConfigProfiles).watch().map((rows) => rows.map((p) => ConfigProfile(
      id: p.id,
      name: p.name,
      config: p.config,
    )).toList());
  }

  /// 监听激活的配置档案 ID 的变化
  Stream<String?> watchActiveProfileId() {
    return _db.select(_db.dbConfigStore).watchSingleOrNull().map((row) => row?.activeProfileId);
  }
}