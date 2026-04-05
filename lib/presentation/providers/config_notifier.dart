// presentation/providers/config_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../di/providers.dart'; // 👈 确保导入

final configProvider = StreamProvider<AppConfig>((ref) {
  return ref.read(configServiceProvider).watchConfig();
});

final configProfilesProvider = StreamProvider<AppConfigStore>((ref) {
  return ref.read(configServiceProvider).watchConfigStore();
});

class ConfigController {
  final Ref ref;
  ConfigController(this.ref);

  // 内部辅助：获取当前配置
  Future<AppConfig> _getCurrentConfig() async =>
      ref.read(configServiceProvider).loadConfig();

  // ✅ 内联原 Repository 的 updateXxx 便捷方法
  Future<void> updateBaseUrl(String baseUrl) async {
    final config = await _getCurrentConfig();
    await ref.read(configServiceProvider).saveConfig(config.copyWith(baseUrl: baseUrl));
  }

  Future<void> updateApiKey(String apiKey) async {
    final config = await _getCurrentConfig();
    await ref.read(configServiceProvider).saveConfig(config.copyWith(apiKey: apiKey));
  }

  Future<void> updateModelsPath(String modelsPath) async {
    final config = await _getCurrentConfig();
    await ref.read(configServiceProvider).saveConfig(config.copyWith(modelsPath: modelsPath));
  }

  Future<void> updateChatPath(String chatPath) async {
    final config = await _getCurrentConfig();
    await ref.read(configServiceProvider).saveConfig(config.copyWith(chatPath: chatPath));
  }

  Future<void> updateApiMode(String apiMode) async {
    final config = await _getCurrentConfig();
    await ref.read(configServiceProvider).saveConfig(config.copyWith(apiMode: apiMode));
  }

  Future<void> updateSelectedModel(String? model) async {
    final config = await _getCurrentConfig();
    await ref.read(configServiceProvider).saveConfig(config.copyWith(selectedModel: model));
  }

  // ✅ 合并 saveFullConfig 逻辑（直接调用 saveConfig 即可）
  Future<void> saveFullConfig(AppConfig config) async {
    await ref.read(configServiceProvider).saveConfig(config);
  }

  // ✅ 合并 saveAndRefreshModels 逻辑
  Future<void> saveAndRefreshModels(AppConfig config) async {
    final service = ref.read(configServiceProvider);
    await service.saveConfig(config.copyWith(availableModels: []));
    await service.refreshModels();
  }

  // ✅ 合并 getAvailableModelIds 逻辑
  Future<List<String>> getAvailableModelIds() async {
    final config = await _getCurrentConfig();
    return config.availableModels?.map((m) => m.id).toList() ?? [];
  }

  Future<void> refreshModels() async {
    await ref.read(configServiceProvider).refreshModels();
  }
}

final configControllerProvider = Provider<ConfigController>((ref) {
  return ConfigController(ref);
});

// 👇 ConfigProfilesController 同样替换依赖源
class ConfigProfilesController {
  final Ref ref;
  ConfigProfilesController(this.ref);

  Future<void> switchProfile(String profileId) async {
    await ref.read(configServiceProvider).switchProfile(profileId);
  }
  Future<void> createProfile(String name) async {
    await ref.read(configServiceProvider).createProfile(name);
  }
  Future<void> renameProfile(String profileId, String name) async {
    await ref.read(configServiceProvider).renameProfile(profileId, name);
  }
  Future<void> deleteProfile(String profileId) async {
    await ref.read(configServiceProvider).deleteProfile(profileId);
  }
}

final configProfilesControllerProvider = Provider<ConfigProfilesController>((ref) {
  return ConfigProfilesController(ref);
});