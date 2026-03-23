import '../models/app_config.dart';

abstract class IConfigService {
  Future<AppConfig> loadConfig();
  Future<void> saveConfig(AppConfig config);
  Future<void> refreshModels(); // 触发模型列表刷新
}