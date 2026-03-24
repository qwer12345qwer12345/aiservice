import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/interfaces/config_service.dart';

class ConfigRepository {
  final IConfigService _configService;

  ConfigRepository(this._configService);

  Future<AppConfig> getConfig() async {
    return await _configService.loadConfig();
  }

  Future<AppConfigStore> getConfigStore() async {
    return await _configService.loadConfigStore();
  }

  Future<List<ConfigProfile>> getProfiles() async {
    return await _configService.getProfiles();
  }

  Future<String> getActiveProfileId() async {
    return await _configService.getActiveProfileId();
  }

  Future<void> switchProfile(String profileId) async {
    await _configService.switchProfile(profileId);
  }

  Future<void> createProfile(String name) async {
    await _configService.createProfile(name);
  }

  Future<void> renameProfile(String profileId, String name) async {
    await _configService.renameProfile(profileId, name);
  }

  Future<void> deleteProfile(String profileId) async {
    await _configService.deleteProfile(profileId);
  }

  Future<void> saveConfig(AppConfig config) async {
    await _configService.saveConfig(config);
  }

  Future<void> saveFullConfig(AppConfig config) async {
    await saveConfig(config);
  }

  Future<void> saveAndRefreshModels(AppConfig config) async {
    final clearedConfig = config.copyWith(
      availableModels: [],
    );
    await _configService.saveConfig(clearedConfig);
    await _configService.refreshModels();
  }

  Future<void> updateApiKey(String apiKey) async {
    final config = await getConfig();
    final updated = config.copyWith(apiKey: apiKey);
    await saveConfig(updated);
  }

  Future<void> updateBaseUrl(String baseUrl) async {
    final config = await getConfig();
    final updated = config.copyWith(baseUrl: baseUrl);
    await saveConfig(updated);
  }

  Future<void> updateModelsPath(String modelsPath) async {
    final config = await getConfig();
    final updated = config.copyWith(modelsPath: modelsPath);
    await saveConfig(updated);
  }

  Future<void> updateChatPath(String chatPath) async {
    final config = await getConfig();
    final updated = config.copyWith(chatPath: chatPath);
    await saveConfig(updated);
  }

  Future<void> updateApiMode(String apiMode) async {
    final config = await getConfig();
    final updated = config.copyWith(apiMode: apiMode);
    await saveConfig(updated);
  }

  Future<void> updateSelectedModel(String? model) async {
    final config = await getConfig();
    final updated = config.copyWith(selectedModel: model);
    await saveConfig(updated);
  }

  Future<void> refreshModels() async {
    await _configService.refreshModels();
  }

  Future<List<String>> getAvailableModelIds() async {
    final config = await getConfig();
    final models = config.availableModels ?? [];
    return models.map((m) => m.id).toList();
  }
}