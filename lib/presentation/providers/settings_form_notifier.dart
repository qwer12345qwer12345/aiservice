// lib/presentation/providers/settings_form_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/model_info.dart';
import '../../data/services/config_service.dart';
import '../../di/providers.dart';
import 'config_notifier.dart'; // 导入 configProvider
import 'package:file_picker/file_picker.dart';

/// 设置表单的状态
class SettingsFormState {
  final AppConfig config;
  final bool isSaving;
  final String? error;
  final bool isRefreshingModels;
  final String? modelsRefreshError;

  const SettingsFormState({
    required this.config,
    this.isSaving = false,
    this.error,
    this.isRefreshingModels = false,
    this.modelsRefreshError,
  });

  SettingsFormState copyWith({
    AppConfig? config,
    bool? isSaving,
    String? error,
    bool? isRefreshingModels,
    String? modelsRefreshError,
  }) {
    return SettingsFormState(
      config: config ?? this.config,
      isSaving: isSaving ?? this.isSaving,
      error: error,
      isRefreshingModels: isRefreshingModels ?? this.isRefreshingModels,
      modelsRefreshError: modelsRefreshError,
    );
  }
}

/// 设置表单 Notifier
class SettingsFormNotifier extends Notifier<SettingsFormState> {
  late final ConfigService _configService;
  AppConfig? _lastLoadedConfig;

  @override
  SettingsFormState build() {
    _configService = ref.read(configServiceProvider);

    // 1. 尝试获取初始值（如果已经加载）
    final initialConfig = ref.read(configProvider).valueOrNull;
    if (initialConfig != null) {
      _lastLoadedConfig = initialConfig;
      state = SettingsFormState(config: initialConfig);
    } else {
      state = SettingsFormState(config: AppConfig.defaultConfig());
    }

    // 2. 监听全局配置变化，自动同步
    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      next.whenData((config) {
        if (_lastLoadedConfig != config) {
          _lastLoadedConfig = config;
          _load(config);
        }
      });
    });

    return state;
  }

  void _load(AppConfig config) {
    state = state.copyWith(config: config, error: null);
  }

  void updateBaseUrl(String value) {
    state = state.copyWith(config: state.config.copyWith(baseUrl: value));
  }

  void updateApiKey(String value) {
    state = state.copyWith(config: state.config.copyWith(apiKey: value));
  }

  void updateModelsPath(String value) {
    state = state.copyWith(config: state.config.copyWith(modelsPath: value));
  }

  void updateChatPath(String value) {
    state = state.copyWith(config: state.config.copyWith(chatPath: value));
  }

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

  void updateSelectedModel(String value) {
    state = state.copyWith(
      config: state.config.copyWith(selectedModel: value.isEmpty ? null : value),
    );
  }

  void toggleReasoning(bool value) {
    _updateModelCapability(overrideSupportsReasoning: value);
  }

  void toggleVision(bool value) {
    _updateModelCapability(overrideSupportsVision: value);
  }

  void _updateModelCapability({bool? overrideSupportsReasoning, bool? overrideSupportsVision}) {
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

    state = state.copyWith(config: state.config.copyWith(availableModels: models));
  }

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

  void restoreDefaults() {
    state = state.copyWith(config: AppConfig.defaultConfig());
  }

  Future<void> refreshModels() async {
    if (state.isRefreshingModels) return;
    if (state.config.apiMode == 'local') {
      await addLocalModel();
      return;
    }

    state = state.copyWith(isRefreshingModels: true, modelsRefreshError: null);
    try {
      await _configService.refreshModels();
      state = state.copyWith(isRefreshingModels: false);
    } catch (e) {
      state = state.copyWith(
        isRefreshingModels: false,
        modelsRefreshError: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> addLocalModel() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['gguf'],
    );
    if (result == null || result.files.single.path == null) return;

    final path = result.files.single.path!;

    final newModel = ModelInfo(id: path);

    final currentModels = List<ModelInfo>.from(state.config.availableModels ?? []);
    if (currentModels.any((m) => m.id == path)) {
      // 已存在则直接选中
      state = state.copyWith(config: state.config.copyWith(selectedModel: path));
      return;
    }

    currentModels.add(newModel);
    state = state.copyWith(
      config: state.config.copyWith(
        availableModels: currentModels,
        selectedModel: path,
      ),
    );
  }

  Map<String, String> _defaultPathsForMode(String apiMode) {
    switch (apiMode) {
      case 'google':
        return {'models': 'v1beta/models', 'chat': 'v1beta/models/{model}:streamGenerateContent'};
      case 'responses':
        return {'models': 'v1/models', 'chat': 'v1/responses'};
      default:
        return {'models': 'v1/models', 'chat': 'v1/chat/completions'};
    }
  }
}

final settingsFormProvider = NotifierProvider<SettingsFormNotifier, SettingsFormState>(
  SettingsFormNotifier.new,
);