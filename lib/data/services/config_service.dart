import '../../core/interfaces/config_service.dart';
import '../../core/models/app_config.dart';
import '../../core/interfaces/file_service.dart';
import '../../core/interfaces/api_service.dart';

class ConfigService implements IConfigService {
  final IFileService _fileService;
  final IApiService _apiService;

  AppConfig? _cachedConfig;

  ConfigService(this._fileService, this._apiService);

  @override
  Future<AppConfig> loadConfig() async {
    try {
      _cachedConfig = await _fileService.readConfig();
    } catch (_) {
      _cachedConfig = AppConfig.defaultConfig();
      await _fileService.writeConfig(_cachedConfig!);
    }
    return _cachedConfig!;
  }

  @override
  Future<void> saveConfig(AppConfig config) async {
    await _fileService.writeConfig(config);
    _cachedConfig = config;
  }

  @override
  Future<void> refreshModels() async {
    if (_cachedConfig == null) {
      await loadConfig();
    }

    final models = await _apiService.fetchModels(
      baseUrl: _cachedConfig!.baseUrl,
      apiKey: _cachedConfig!.apiKey,
      modelsPath: _cachedConfig!.modelsPath,
    );

    _cachedConfig = _cachedConfig!.copyWith(availableModels: models);
    await _fileService.writeConfig(_cachedConfig!);
  }
}