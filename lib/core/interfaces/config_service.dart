import '../models/app_config.dart';
import '../models/app_config_store.dart';

abstract class IConfigService {
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
}