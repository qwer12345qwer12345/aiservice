import 'dart:async';
import 'package:aiservice/data/data_sources/chat_source_router.dart';
import 'package:rxdart/rxdart.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/models/model_info.dart';
import '../repositories/config_repository.dart';
import 'package:uuid/uuid.dart';

class ConfigService {
  final ConfigRepository _repository;
  final ChatSourceRouter _sourceRouter;

  ConfigService(this._repository, this._sourceRouter);

  Future<AppConfigStore> loadConfigStore() async {
    final profiles = await _repository.getProfiles();
    if (profiles.isEmpty) {
      final defaultStore = AppConfigStore.defaultStore();
      await _repository.insertDefaultStore(defaultStore);
      return defaultStore;
    }

    final activeProfileId = await _repository.getActiveProfileId();
    return AppConfigStore(
      activeProfileId: activeProfileId,
      profiles: profiles,
    );
  }

  Future<AppConfig> loadConfig() async {
    final store = await loadConfigStore();
    return store.profiles.firstWhere(
      (p) => p.id == store.activeProfileId,
      orElse: () => store.profiles.first,
    ).config;
  }

  Future<void> saveConfig(AppConfig config) async {
    final store = await loadConfigStore();
    await _repository.updateProfileConfig(store.activeProfileId, config);
  }

  Future<void> refreshModels(AppConfig targetConfig) async {
    final source = _sourceRouter.getSourceFromConfig(targetConfig);
    final remoteModels = await source.fetchModels(targetConfig);

    final oldModels = targetConfig.availableModels ?? const <ModelInfo>[];
    final oldById = {for (final model in oldModels) model.id: model};

    final updatedModels = remoteModels.map((remote) {
      final old = oldById[remote.id];
      return remote.copyWith(
        overrideSupportsReasoning: old?.overrideSupportsReasoning,
        overrideSupportsVision: old?.overrideSupportsVision,
      );
    }).toList();

    final updatedConfig = targetConfig.copyWith(
      availableModels: updatedModels,
    );

    await saveConfig(updatedConfig);
  }

  Future<List<ConfigProfile>> getProfiles() async {
    return await _repository.getProfiles();
  }

  Future<void> switchProfile(String profileId) async {
    await _repository.setActiveProfileId(profileId);
  }

  Future<void> createProfile(String name) async {
    final activeConfig = await loadConfig();
    final newId = const Uuid().v4();
    final cleanName = name.trim().isEmpty ? '新配置' : name.trim();

    await _repository.createProfile(newId, cleanName, activeConfig);
    await switchProfile(newId);
  }

  Future<void> renameProfile(String profileId, String name) async {
    if (name.trim().isEmpty) return;
    await _repository.renameProfile(profileId, name.trim());
  }

  Future<void> deleteProfile(String profileId) async {
    final store = await loadConfigStore();
    if (store.profiles.length <= 1) return;

    if (store.activeProfileId == profileId) {
      final remaining = store.profiles.where((p) => p.id != profileId).toList();
      if (remaining.isNotEmpty) {
        await switchProfile(remaining.first.id);
      }
    }

    await _repository.deleteProfile(profileId);
  }

  Stream<AppConfigStore> watchConfigStore() {
    final profilesStream = _repository.watchProfiles();
    final activeIdStream = _repository.watchActiveProfileId();

    return Rx.combineLatest2(profilesStream, activeIdStream, (profiles, activeId) {
      if (profiles.isEmpty) return null;
      final effectiveActiveId = activeId ?? profiles.first.id;
      return AppConfigStore(
        activeProfileId: effectiveActiveId,
        profiles: profiles,
      );
    }).where((store) => store != null).map((store) => store!);
  }

  Stream<AppConfig> watchConfig() {
    return watchConfigStore().map((store) {
      return store.profiles.firstWhere(
        (p) => p.id == store.activeProfileId,
        orElse: () => store.profiles.first,
      ).config;
    });
  }
}