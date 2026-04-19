import 'package:aiservice/data/services/config_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/model_info.dart';
import '../../di/providers.dart';

/// 设置表单的状态
class SettingsFormState {
  final AppConfig config;
  final bool isSaving;
  final String? error;

  const SettingsFormState({
    required this.config,
    this.isSaving = false,
    this.error,
  });

  SettingsFormState copyWith({
    AppConfig? config,
    bool? isSaving,
    String? error,
  }) {
    return SettingsFormState(
      config: config ?? this.config,
      isSaving: isSaving ?? this.isSaving,
      error: error,
    );
  }
}

/// 设置表单 Notifier
///
/// 职责：
/// - 管理表单草稿状态
/// - 提供字段更新方法
/// - 处理保存逻辑
class SettingsFormNotifier extends Notifier<SettingsFormState> {
  late final ConfigService _configService;

  @override
  SettingsFormState build() {
    _configService = ref.read(configServiceProvider);
    // 初始状态为空配置，等待加载
    return SettingsFormState(config: AppConfig.defaultConfig());
  }

  /// 从实际配置加载到草稿
  void load(AppConfig config) {
    state = state.copyWith(config: config, error: null);
  }

  /// 更新 Base URL
  void updateBaseUrl(String value) {
    state = state.copyWith(
      config: state.config.copyWith(baseUrl: value),
    );
  }

  /// 更新 API Key
  void updateApiKey(String value) {
    state = state.copyWith(
      config: state.config.copyWith(apiKey: value),
    );
  }

  /// 更新 Models Path
  void updateModelsPath(String value) {
    state = state.copyWith(
      config: state.config.copyWith(modelsPath: value),
    );
  }

  /// 更新 Chat Path
  void updateChatPath(String value) {
    state = state.copyWith(
      config: state.config.copyWith(chatPath: value),
    );
  }

  /// 更新 API Mode
  void updateApiMode(String value) {
    final defaults = _defaultPathsForMode(value);
    state = state.copyWith(
      config: state.config.copyWith(
        apiMode: value,
        modelsPath: defaults['models']!,
        chatPath: defaults['chat']!,
      ),
    );
  }

  /// 更新选中的模型
  void updateSelectedModel(String value) {
    state = state.copyWith(
      config: state.config.copyWith(selectedModel: value.isEmpty ? null : value),
    );
  }

  /// 切换推理能力
  void toggleReasoning(bool value) {
    _updateModelCapability(
      overrideSupportsReasoning: value,
    );
  }

  /// 切换视觉能力
  void toggleVision(bool value) {
    _updateModelCapability(
      overrideSupportsVision: value,
    );
  }

  /// 内部方法：更新当前模型的能力覆盖
  void _updateModelCapability({
    bool? overrideSupportsReasoning,
    bool? overrideSupportsVision,
  }) {
    final modelId = state.config.selectedModel;
    if (modelId == null || modelId.isEmpty) return;

    final models = [...(state.config.availableModels ?? const <ModelInfo>[])];
    final index = models.indexWhere((m) => m.id == modelId);
    final baseModel = index >= 0 ? models[index] : ModelInfo(id: modelId);

    final updatedModel = baseModel.copyWith(
      overrideSupportsReasoning: overrideSupportsReasoning ?? baseModel.overrideSupportsReasoning,
      overrideSupportsVision: overrideSupportsVision ?? baseModel.overrideSupportsVision,
    );

    if (index >= 0) {
      models[index] = updatedModel;
    } else {
      models.add(updatedModel);
    }

    state = state.copyWith(
      config: state.config.copyWith(availableModels: models),
    );
  }

  /// 保存配置
  Future<void> save() async {
    state = state.copyWith(isSaving: true, error: null);
    try {
      await _configService.saveConfig(state.config);
      state = state.copyWith(isSaving: false);
    } catch (e) {
      state = state.copyWith(isSaving: false, error: e.toString());
      rethrow;
    }
  }

  /// 恢复默认配置
  void restoreDefaults() {
    state = state.copyWith(config: AppConfig.defaultConfig());
  }

  /// 辅助方法：根据 API Mode 获取默认路径
  Map<String, String> _defaultPathsForMode(String apiMode) {
    switch (apiMode) {
      case 'google':
        return {
          'models': 'v1beta/models',
          'chat': 'v1beta/models/{model}:streamGenerateContent',
        };
      case 'responses':
        return {
          'models': 'v1/models',
          'chat': 'v1/responses',
        };
      case 'chat_completions':
      default:
        return {
          'models': 'v1/models',
          'chat': 'v1/chat/completions',
        };
    }
  }
}

/// Provider
final settingsFormProvider = NotifierProvider<SettingsFormNotifier, SettingsFormState>(
  SettingsFormNotifier.new,
);