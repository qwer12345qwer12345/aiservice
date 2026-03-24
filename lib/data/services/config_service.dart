import '../../core/interfaces/config_service.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/interfaces/file_service.dart';
import '../../core/interfaces/api_service.dart';
import '../../core/utils/id_generator.dart';

class ConfigService implements IConfigService {
  final IFileService _fileService;
  final IApiService _apiService;

  AppConfigStore? _cachedStore;

  ConfigService(this._fileService, this._apiService);

  ConfigProfile _getActiveProfile(AppConfigStore store) {
    for (final profile in store.profiles) {
      if (profile.id == store.activeProfileId) {
        return profile;
      }
    }
    return store.profiles.first;
  }

  AppConfigStore _ensureNonEmptyStore(AppConfigStore store) {
    if (store.profiles.isNotEmpty) return store;
    return AppConfigStore.defaultStore();
  }

  @override
  Future<AppConfigStore> loadConfigStore() async {
    try {
      _cachedStore = await _fileService.readConfigStore();
      _cachedStore = _ensureNonEmptyStore(_cachedStore!);
    } catch (_) {
      _cachedStore = AppConfigStore.defaultStore();
      await _fileService.writeConfigStore(_cachedStore!);
    }
    return _cachedStore!;
  }

  @override
  Future<AppConfig> loadConfig() async {
    if (_cachedStore == null) {
      await loadConfigStore();
    }
    return _getActiveProfile(_cachedStore!).config;
  }

  @override
  Future<void> saveConfig(AppConfig config) async {
    if (_cachedStore == null) {
      await loadConfigStore();
    }

    final store = _cachedStore!;
    final updatedProfiles = store.profiles.map((profile) {
      if (profile.id == store.activeProfileId) {
        return profile.copyWith(config: config);
      }
      return profile;
    }).toList();

    _cachedStore = store.copyWith(profiles: updatedProfiles);
    await _fileService.writeConfigStore(_cachedStore!);
  }

  @override
  Future<void> refreshModels() async {
    if (_cachedStore == null) {
      await loadConfigStore();
    }

    final activeConfig = await loadConfig();
    final models = await _apiService.fetchModels(
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
    final store = await loadConfigStore();
    return store.activeProfileId;
  }

  @override
  Future<void> switchProfile(String profileId) async {
    final store = await loadConfigStore();
    final exists = store.profiles.any((p) => p.id == profileId);
    if (!exists) return;

    _cachedStore = store.copyWith(activeProfileId: profileId);
    await _fileService.writeConfigStore(_cachedStore!);
  }

  @override
  Future<void> createProfile(String name) async {
    final store = await loadConfigStore();
    final activeConfig = _getActiveProfile(store).config;
    final newId = IdGenerator.generate();
    final cleanName = name.trim().isEmpty ? '新配置' : name.trim();

    final newProfile = ConfigProfile(
      id: newId,
      name: cleanName,
      config: activeConfig,
    );

    _cachedStore = store.copyWith(
      activeProfileId: newId,
      profiles: [...store.profiles, newProfile],
    );

    await _fileService.writeConfigStore(_cachedStore!);
  }

  @override
  Future<void> renameProfile(String profileId, String name) async {
    final store = await loadConfigStore();
    final cleanName = name.trim();
    if (cleanName.isEmpty) return;

    final updatedProfiles = store.profiles.map((profile) {
      if (profile.id == profileId) {
        return profile.copyWith(name: cleanName);
      }
      return profile;
    }).toList();

    _cachedStore = store.copyWith(profiles: updatedProfiles);
    await _fileService.writeConfigStore(_cachedStore!);
  }

  @override
  Future<void> deleteProfile(String profileId) async {
    final store = await loadConfigStore();

    if (store.profiles.length <= 1) {
      return;
    }

    final updatedProfiles =
        store.profiles.where((p) => p.id != profileId).toList();

    if (updatedProfiles.isEmpty) return;

    final newActiveId = store.activeProfileId == profileId
        ? updatedProfiles.first.id
        : store.activeProfileId;

    _cachedStore = store.copyWith(
      activeProfileId: newActiveId,
      profiles: updatedProfiles,
    );

    await _fileService.writeConfigStore(_cachedStore!);
  }
}