import 'package:freezed_annotation/freezed_annotation.dart';
import 'model_info.dart';

part 'app_config.freezed.dart';

/// 配置档案（单个配置集）
@freezed
class ConfigProfile with _$ConfigProfile {
  const factory ConfigProfile({
    required String id,
    required String name,
    required String baseUrl,
    required String apiKey,
    String? selectedModel,
    @Default('v1/models') String modelsPath,
    @Default('v1/chat/completions') String chatPath,
    @Default('chat_completions') String apiMode,
    @Default([]) List<ModelInfo> availableModels,
  }) = _ConfigProfile;

  /// 默认配置档案（id = 'default'）
  factory ConfigProfile.defaultProfile() => const ConfigProfile(
        id: 'default',
        name: '默认配置',
        baseUrl: 'https://api.openai.com',
        apiKey: '',
        selectedModel: null,
        modelsPath: 'v1/models',
        chatPath: 'v1/chat/completions',
        apiMode: 'chat_completions',
        availableModels: [],
      );
}

/// 全局设置（多档案 + 当前激活的档案ID）
@freezed
class GlobalSettings with _$GlobalSettings {
  const factory GlobalSettings({
    required String activeProfileId,
    @Default([]) List<ConfigProfile> profiles,
  }) = _GlobalSettings;

  /// 默认全局设置（使用默认配置档案）
  factory GlobalSettings.defaultSettings() => GlobalSettings(
        activeProfileId: 'default',
        profiles: [ConfigProfile.defaultProfile()],
      );
}