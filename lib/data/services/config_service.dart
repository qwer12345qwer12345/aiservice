import 'dart:async';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import '../../core/models/app_config.dart';
import '../data_sources/chat_source.dart';
import '../repositories/config_repository.dart';
import 'package:uuid/uuid.dart';

class ConfigService {
  final ConfigRepository _repository;
  final ChatSource _chatSource;

  ConfigService(this._repository, this._chatSource);

  Future<GlobalSettings> loadGlobalSettings() async {
    final profiles = await _repository.getProfiles();
    if (profiles.isEmpty) {
      final defaultSettings = GlobalSettings.defaultSettings();
      await _repository.insertDefaultSettings(defaultSettings);
      return defaultSettings;
    }
    final activeProfileId = await _repository.getActiveProfileId();
    return GlobalSettings(
      activeProfileId: activeProfileId,
      profiles: profiles,
    );
  }

  Future<ConfigProfile> loadActiveConfig() async {
    final settings = await loadGlobalSettings();
    return settings.profiles.firstWhere(
      (p) => p.id == settings.activeProfileId,
      orElse: () => settings.profiles.first,
    );
  }

  Future<void> saveConfig(ConfigProfile config) async {
    final settings = await loadGlobalSettings();
    await _repository.updateProfileConfig(settings.activeProfileId, config);
  }

  Future<void> refreshModels(
    ConfigProfile targetConfig, 
    {required http.Client client,}) async {
    final remoteModels = await _chatSource.fetchModels(targetConfig, client: client);
    final updatedModels = remoteModels.map((remote) {
      final old = targetConfig.availableModels.firstWhereOrNull((m) => m.id == remote.id);
      return remote.copyWith(
        overrideSupportsReasoning: old?.overrideSupportsReasoning,
        overrideSupportsVision: old?.overrideSupportsVision,
      );
    }).toList();
    final updatedConfig = targetConfig.copyWith(availableModels: updatedModels);
    await saveConfig(updatedConfig);
  }

  Future<List<ConfigProfile>> getProfiles() async {
    return await _repository.getProfiles();
  }

  Future<void> switchProfile(String profileId) async {
    await _repository.setActiveProfileId(profileId);
  }

  Future<void> createProfile(String name) async {
    final activeConfig = await loadActiveConfig();
    final newId = const Uuid().v4();
    final cleanName = name.trim().isEmpty ? '新配置' : name.trim();
    final newProfile = ConfigProfile(
      id: newId,
      name: cleanName,
      baseUrl: activeConfig.baseUrl,
      apiKey: activeConfig.apiKey,
      selectedModel: activeConfig.selectedModel,
      modelsPath: activeConfig.modelsPath,
      chatPath: activeConfig.chatPath,
      apiMode: activeConfig.apiMode,
      availableModels: activeConfig.availableModels,
    );
    await _repository.createProfile(newProfile);
    await switchProfile(newId);
  }

  Future<void> renameProfile(String profileId, String name) async {
    if (name.trim().isEmpty) return;
    await _repository.renameProfile(profileId, name.trim());
  }

  Future<void> deleteProfile(String profileId) async {
    final settings = await loadGlobalSettings();
    if (settings.profiles.length <= 1) return;
    if (settings.activeProfileId == profileId) {
      final remaining = settings.profiles.where((p) => p.id != profileId).toList();
      if (remaining.isNotEmpty) {
        await switchProfile(remaining.first.id);
      }
    }
    await _repository.deleteProfile(profileId);
  }

  Stream<GlobalSettings> watchGlobalSettings() {
  final profilesStream = _repository.watchProfiles();
  final activeIdStream = _repository.watchActiveProfileId();
  return Rx.combineLatest2(profilesStream, activeIdStream, (profiles, activeId) {
    if (profiles.isEmpty) {
      return GlobalSettings.defaultSettings();
    }
    final effectiveActiveId = activeId ?? profiles.first.id;
    return GlobalSettings(
      activeProfileId: effectiveActiveId,
      profiles: profiles,
    );
  });
}

  Stream<ConfigProfile> watchActiveConfig() {
    return watchGlobalSettings().map((settings) {
      return settings.profiles.firstWhere(
        (p) => p.id == settings.activeProfileId,
        orElse: () => settings.profiles.first,
      );
    });
  }
}