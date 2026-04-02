// presentation/providers/config_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../di/providers.dart';

/// 使用纯声明式 StreamProvider - 所有状态来自 Drift 数据库流
final configProvider = StreamProvider<AppConfig>((ref) {
  final repository = ref.watch(configRepositoryProvider);
  return repository.watchConfig();
});

final configProfilesProvider = StreamProvider<AppConfigStore>((ref) {
  final repository = ref.watch(configRepositoryProvider);
  return repository.watchConfigStore();
});

/// 直接使用 StreamProvider，不额外维护本地状态
/// 所有配置操作直接调用 Repository 方法，写入数据库后流自动更新
class ConfigNotifier extends StateNotifier<AsyncValue<AppConfig>> {
  final Ref ref;

  ConfigNotifier(this.ref) : super(const AsyncValue.loading()) {
    // 监听 StreamProvider，自动同步本地状态
    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      state = next;
    });
  }

  Future<void> updateBaseUrl(String baseUrl) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateBaseUrl(baseUrl);
    // 无需手动更新状态，流会自动推送
  }

  Future<void> updateApiKey(String apiKey) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateApiKey(apiKey);
  }

  Future<void> updateModelsPath(String modelsPath) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateModelsPath(modelsPath);
  }

  Future<void> updateChatPath(String chatPath) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateChatPath(chatPath);
  }

  Future<void> updateApiMode(String apiMode) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateApiMode(apiMode);
  }

  Future<void> updateSelectedModel(String? model) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateSelectedModel(model);
  }

  Future<void> saveFullConfig(AppConfig config) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.saveFullConfig(config);
  }

  Future<void> saveAndRefreshModels(AppConfig config) async {
    state = const AsyncValue.loading();
    final repository = ref.read(configRepositoryProvider);
    await repository.saveConfig(config.copyWith(availableModels: []));
    await repository.refreshModels();
  }

  Future<void> refreshModels() async {
    final repository = ref.read(configRepositoryProvider);
    await repository.refreshModels();
  }
}

final configNotifierProvider = Provider<ConfigNotifier>((ref) {
  return ConfigNotifier(ref);
});

class ConfigProfilesNotifier extends StateNotifier<AsyncValue<AppConfigStore>> {
  final Ref ref;

  ConfigProfilesNotifier(this.ref) : super(const AsyncValue.loading()) {
    ref.listen<AsyncValue<AppConfigStore>>(configProfilesProvider, (previous, next) {
      state = next;
    });
  }

  Future<void> load() async {
    // Stream 会自动同步，无需手动操作
  }

  Future<void> switchProfile(String profileId) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.switchProfile(profileId);
  }

  Future<void> createProfile(String name) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.createProfile(name);
  }

  Future<void> renameProfile(String profileId, String name) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.renameProfile(profileId, name);
  }

  Future<void> deleteProfile(String profileId) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.deleteProfile(profileId);
  }
}

final configProfilesNotifierProvider = Provider<ConfigProfilesNotifier>((ref) {
  return ConfigProfilesNotifier(ref);
});