// data/services/config_service.dart

import 'dart:async';
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

  /// 确保数据库有默认数据，返回合法的配置存储
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
        const DbConfigStoreCompanion(id: Value(1), activeProfileId: Value('default')),
      );

      activeId = 'default';
      return AppConfigStore(activeProfileId: activeId, profiles: [defaultProfile]);
    }

    final profiles = profileRows
        .map((p) => ConfigProfile(id: p.id, name: p.name, config: p.config))
        .toList();

    // 校验 activeId 有效性，不合法则切换到第一个
    if (!profiles.any((p) => p.id == activeId)) {
      activeId = profiles.first.id;
      await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
        DbConfigStoreCompanion(id: const Value(1), activeProfileId: Value(activeId)),
      );
    }

    return AppConfigStore(activeProfileId: activeId, profiles: profiles);
  }

  @override
  Future<AppConfigStore> loadConfigStore() async {
    return await _ensureInitialized();
  }

  @override
  Future<AppConfig> loadConfig() async {
    final store = await loadConfigStore();
    // 使用 firstWhere 带 orElse，避免抛异常
    return store.profiles.firstWhere(
      (p) => p.id == store.activeProfileId,
      orElse: () => store.profiles.first,
    ).config;
  }

  @override
  Future<void> saveConfig(AppConfig config) async {
    final activeId = await getActiveProfileId();
    await (_db.update(_db.dbConfigProfiles)
          ..where((t) => t.id.equals(activeId)))
        .write(DbConfigProfilesCompanion(config: Value(config)));
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
    var activeId = storeRow?.activeProfileId ?? 'default';

    // 校验有效性
    final profiles = await _db.select(_db.dbConfigProfiles).get();
    if (!profiles.any((p) => p.id == activeId) && profiles.isNotEmpty) {
      activeId = profiles.first.id;
      await _db.into(_db.dbConfigStore).insertOnConflictUpdate(
        DbConfigStoreCompanion(id: const Value(1), activeProfileId: Value(activeId)),
      );
    }

    return activeId;
  }

  @override
  Future<void> switchProfile(String profileId) async {
    // 直接写入数据库，依赖 Drift 触发流更新
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
        id: newId,
        name: cleanName,
        config: activeConfig,
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

    // 只有一个配置文件时不允许删除
    if (store.profiles.length <= 1) return;

    // 如果要删除的是当前激活的配置，先切换到其他配置
    if (store.activeProfileId == profileId) {
      final remaining = store.profiles.where((p) => p.id != profileId).toList();
      if (remaining.isNotEmpty) {
        await switchProfile(remaining.first.id);
      }
    }

    await (_db.delete(_db.dbConfigProfiles)..where((t) => t.id.equals(profileId))).go();
  }

  /// 同时监听两个表的变更，用原生Dart的Stream实现组合
  @override
  Stream<AppConfigStore> watchConfigStore() {
    // 首次执行初始化
    _ensureInitialized();

    // 监听配置存储表（activeProfileId）
    final storeStream = _db.select(_db.dbConfigStore).watchSingleOrNull();

    // 监听配置存档列表
    final profilesStream = _db.select(_db.dbConfigProfiles).watch();

    // 用StreamController手动合并两个流
    // 各自维护最新的值，任意一个流更新时用两个最新值计算结果
    final outputController = StreamController<AppConfigStore>();

    // 存储各自最新的值
    DbConfigStoreData? latestStoreRow;
    List<DbConfigProfile> latestProfileRows = [];

    // 计算并输出最新的AppConfigStore
    void computeAndOutput() {
      final storeRow = latestStoreRow;
      final profileRows = latestProfileRows;

      // 如果两个值都还没有，不输出
      if (storeRow == null && profileRows.isEmpty) return;

      // 兜底：如果配置列表为空，重新初始化
      if (profileRows.isEmpty) {
        return;
      }

      var activeId = storeRow?.activeProfileId ?? 'default';

      final profiles = profileRows
          .map((p) => ConfigProfile(id: p.id, name: p.name, config: p.config))
          .toList();

      // 确保 activeId 合法
      if (!profiles.any((p) => p.id == activeId)) {
        activeId = profiles.first.id;
        // 自动修正
        _db.into(_db.dbConfigStore).insertOnConflictUpdate(
          DbConfigStoreCompanion(id: const Value(1), activeProfileId: Value(activeId)),
        );
      }

      outputController.add(AppConfigStore(activeProfileId: activeId, profiles: profiles));
    }

    // 订阅 storeStream
    final storeSubscription = storeStream.listen(
      (row) {
        latestStoreRow = row;
        computeAndOutput();
      },
      onError: (e) {
        outputController.addError(e);
      },
    );

    // 订阅 profilesStream
    final profilesSubscription = profilesStream.listen(
      (rows) {
        latestProfileRows = rows;
        computeAndOutput();
      },
      onError: (e) {
        outputController.addError(e);
      },
    );

    // 清理资源
    outputController.onCancel = () {
      storeSubscription.cancel();
      profilesSubscription.cancel();
    };

    return outputController.stream;
  }

  /// 监听当前激活的配置
  @override
  Stream<AppConfig> watchConfig() {
    return watchConfigStore().map((store) {
      return store.profiles.firstWhere(
        (p) => p.id == store.activeProfileId,
        orElse: () => store.profiles.first,
      ).config;
    });
  }
}