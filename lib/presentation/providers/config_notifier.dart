import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../di/providers.dart';

class ConfigNotifier extends StateNotifier<AsyncValue<AppConfig>> {
  final Ref ref;

  ConfigNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadInitialConfig();
  }

  Future<void> _loadInitialConfig() async {
    try {
      final repository = ref.read(configRepositoryProvider);
      final config = await repository.getConfig();
      state = AsyncValue.data(config);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<AppConfig> _fetchLatestConfig() async {
    final repository = ref.read(configRepositoryProvider);
    return await repository.getConfig();
  }

  Future<void> _reloadConfigWithoutLoading() async {
    final config = await _fetchLatestConfig();
    state = AsyncValue.data(config);
  }

  Future<void> updateApiKey(String apiKey) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateApiKey(apiKey);
    await _reloadConfigWithoutLoading();
  }

  Future<void> updateBaseUrl(String baseUrl) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateBaseUrl(baseUrl);
    await _reloadConfigWithoutLoading();
  }

  Future<void> updateModelsPath(String modelsPath) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateModelsPath(modelsPath);
    await _reloadConfigWithoutLoading();
  }

  Future<void> updateChatPath(String chatPath) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateChatPath(chatPath);
    await _reloadConfigWithoutLoading();
  }

  Future<void> updateApiMode(String apiMode) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateApiMode(apiMode);
    await _reloadConfigWithoutLoading();
  }

  Future<void> updateSelectedModel(String? model) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateSelectedModel(model);
    await _reloadConfigWithoutLoading();
  }

  Future<void> saveFullConfig(AppConfig config) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.saveFullConfig(config);
    state = AsyncValue.data(config);
  }

  Future<void> saveAndRefreshModels(AppConfig config) async {
    final repository = ref.read(configRepositoryProvider);
    state = AsyncValue.data(
      config.copyWith(
        availableModels: [],
      ),
    );
    await repository.saveAndRefreshModels(config);
    await _reloadConfigWithoutLoading();
  }

  Future<void> refreshModels() async {
    final repository = ref.read(configRepositoryProvider);
    await repository.refreshModels();
    await _reloadConfigWithoutLoading();
  }
}

final configProvider =
    StateNotifierProvider<ConfigNotifier, AsyncValue<AppConfig>>((ref) {
  return ConfigNotifier(ref);
});