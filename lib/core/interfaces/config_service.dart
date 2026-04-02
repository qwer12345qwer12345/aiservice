// core/interfaces/config_service.dart

import '../models/app_config.dart';
import '../models/app_config_store.dart';

abstract class IConfigService {
  // 现有的同步方法
  Future<AppConfigStore> loadConfigStore();
  Future<AppConfig> loadConfig();
  Future<void> saveConfig(AppConfig config);

  Future<void> refreshModels();

  Future<List<ConfigProfile>> getProfiles();
  Future<String> getActiveProfileId();
  Future<void> switchProfile(String profileId);
  Future<void> createProfile(String name);
  Future<void> renameProfile(String profileId, String name);
  Future<void> deleteProfile(String profileId);

  // ========== 新增：watch 方法 ==========
  
  /// 监听配置Store的变更
  Stream<AppConfigStore> watchConfigStore();
  
  /// 监听当前配置
  Stream<AppConfig> watchConfig();
}