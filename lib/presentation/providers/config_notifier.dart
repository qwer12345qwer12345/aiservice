// presentation/providers/config_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../di/providers.dart';

final configProvider = StreamProvider<AppConfig>((ref) {
  final repository = ref.watch(configRepositoryProvider);
  return repository.watchConfig();
});

final configProfilesProvider = StreamProvider<AppConfigStore>((ref) {
  final repository = ref.watch(configRepositoryProvider);
  return repository.watchConfigStore();
});

class ConfigController {
  final Ref ref;

  ConfigController(this.ref);

  Future<void> updateBaseUrl(String baseUrl) async {
    final repository = ref.read(configRepositoryProvider);
    await repository.updateBaseUrl(baseUrl);
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
    final repository = ref.read(configRepositoryProvider);
    await repository.saveConfig(config.copyWith(availableModels: []));
    await repository.refreshModels();
  }

  Future<void> refreshModels() async {
    final repository = ref.read(configRepositoryProvider);
    await repository.refreshModels();
  }
}

final configControllerProvider = Provider<ConfigController>((ref) {
  return ConfigController(ref);
});

class ConfigProfilesController {
  final Ref ref;

  ConfigProfilesController(this.ref);

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

final configProfilesControllerProvider =
    Provider<ConfigProfilesController>((ref) {
  return ConfigProfilesController(ref);
});