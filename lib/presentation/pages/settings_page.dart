import 'package:aiservice/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/models/model_info.dart';
import '../providers/config_notifier.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_section.dart';
import '../widgets/common/app_toast.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  static const String _defaultModelsPath = 'v1/models';

  final _formKey = GlobalKey<FormBuilderState>();
  bool _isPatching = false;
  bool _isModelListExpanded = false;

  String _defaultModelsPathForApiMode(String apiMode) {
    switch (apiMode) {
      case 'google':
        return 'v1beta/models';
      case 'responses':
      case 'chat_completions':
      default:
        return 'v1/models';
    }
  }

  String _defaultChatPathForApiMode(String apiMode) {
    switch (apiMode) {
      case 'google':
        return 'v1beta/models/{model}:streamGenerateContent';
      case 'responses':
        return 'v1/responses';
      case 'chat_completions':
      default:
        return 'v1/chat/completions';
    }
  }

  ModelInfo? _findModel(AppConfig config, String? modelId) {
    final id = modelId?.trim() ?? '';
    if (id.isEmpty) return null;
    return config.availableModels?.where((m) => m.id == id).firstOrNull;
  }

  bool _effectiveReasoningSwitch(ModelInfo? model) => model?.overrideSupportsReasoning ?? false;
  bool _effectiveVisionSwitch(ModelInfo? model) => model?.overrideSupportsVision ?? false;

  void _patchForm(AppConfig config) {
    final form = _formKey.currentState;
    if (form == null) return;

    final selectedModelId = config.selectedModel ?? '';
    final model = _findModel(config, selectedModelId);

    _isPatching = true;
    form.patchValue({
      'baseUrl': config.baseUrl,
      'apiKey': config.apiKey,
      'modelsPath': config.modelsPath,
      'chatPath': config.chatPath,
      'apiMode': config.apiMode,
      'selectedModel': selectedModelId,
      'overrideSupportsReasoning': _effectiveReasoningSwitch(model),
      'overrideSupportsVision': _effectiveVisionSwitch(model),
    });
    _isPatching = false;
  }

  void _patchModelCapabilityFields(AppConfig config, String? modelId) {
    final form = _formKey.currentState;
    if (form == null) return;

    final model = _findModel(config, modelId);

    _isPatching = true;
    form.patchValue({
      'overrideSupportsReasoning': _effectiveReasoningSwitch(model),
      'overrideSupportsVision': _effectiveVisionSwitch(model),
    });
    _isPatching = false;
  }

  Future<void> _save(AppConfig currentConfig) async {
    final form = _formKey.currentState;
    if (form == null) return;
    if (!form.saveAndValidate()) return;

    final values = form.value;

    final selectedModelId = (values['selectedModel'] as String? ?? '').trim();
    final overrideSupportsReasoning =
        values['overrideSupportsReasoning'] as bool? ?? false;
    final overrideSupportsVision =
        values['overrideSupportsVision'] as bool? ?? false;

    final models = [...(currentConfig.availableModels ?? const <ModelInfo>[])];

    if (selectedModelId.isNotEmpty) {
      final index = models.indexWhere((m) => m.id == selectedModelId);
      final baseModel =
          index >= 0 ? models[index] : ModelInfo(id: selectedModelId);

      final updatedModel = baseModel.copyWith(
        overrideSupportsReasoning: overrideSupportsReasoning,
        overrideSupportsVision: overrideSupportsVision,
      );

      if (index >= 0) {
        models[index] = updatedModel;
      } else {
        models.add(updatedModel);
      }
    }

    final nextApiMode = values['apiMode'] as String? ?? currentConfig.apiMode;
    final rawModelsPath = (values['modelsPath'] as String? ?? '').trim();
    final rawChatPath = (values['chatPath'] as String? ?? '').trim();

    final updatedConfig = currentConfig.copyWith(
      baseUrl: (values['baseUrl'] as String? ?? '').trim(),
      apiKey: (values['apiKey'] as String? ?? '').trim(),
      modelsPath: rawModelsPath.isEmpty ? _defaultModelsPath : rawModelsPath,
      chatPath: rawChatPath.isEmpty
          ? _defaultChatPathForApiMode(nextApiMode)
          : rawChatPath,
      apiMode: nextApiMode,
      selectedModel: selectedModelId.isEmpty ? null : selectedModelId,
      availableModels: models,
    );

    await ref.read(configServiceProvider).saveConfig(updatedConfig);
  }

  @override
  Widget build(BuildContext context) {
    final configAsync = ref.watch(configProvider);
    final profilesAsync = ref.watch(configProfilesProvider);

    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      next.whenData((config) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _patchForm(config);
        });
      });
    });

    return AppPageScaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: profilesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载配置存档失败：$e')),
        data: (store) {
          return configAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('加载配置失败：$e')),
            data: (config) {
              return FormBuilder(
                key: _formKey,
                initialValue: {
                  'baseUrl': config.baseUrl,
                  'apiKey': config.apiKey,
                  'modelsPath': config.modelsPath,
                  'chatPath': config.chatPath,
                  'apiMode': config.apiMode,
                  'selectedModel': config.selectedModel ?? '',
                  'overrideSupportsReasoning': _effectiveReasoningSwitch(
                    _findModel(config, config.selectedModel),
                  ),
                  'overrideSupportsVision': _effectiveVisionSwitch(
                    _findModel(config, config.selectedModel),
                  ),
                },
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildProfileSection(store),
                    _buildConnectionSection(config),
                    _buildModelSection(config),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _patchForm(config),
                            child: const Text('重置'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton(
                            onPressed: () async {
                              final config = configAsync.valueOrNull;
                              if (config == null) return;
                              
                              await _save(config);
                              if (mounted) await AppToast.show('设置已保存');
                            },
                            child: const Text('保存'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: _confirmRestoreDefaults,
                      child: const Text('恢复默认'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProfileSection(AppConfigStore store) {
    return AppSection(
      title: '配置存档',
      subtitle: '切换后表单会刷新为该存档内容',
      children: [
        DropdownButtonFormField<String>(
          value: store.activeProfileId,
          decoration: const InputDecoration(labelText: '当前配置存档'),
          items: store.profiles
              .map((p) => DropdownMenuItem(value: p.id, child: Text(p.name)))
              .toList(),
          onChanged: (value) async {
            if (value == null) return;
            await ref.read(configServiceProvider).switchProfile(value);
          },
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          children: [
            OutlinedButton(
              onPressed: _showCreateProfileDialog,
              child: const Text('新建'),
            ),
            OutlinedButton(
              onPressed: () {
                final profile = store.profiles.firstWhere(
                  (p) => p.id == store.activeProfileId,
                );
                _showRenameProfileDialog(profile);
              },
              child: const Text('重命名'),
            ),
            OutlinedButton(
              onPressed: () {
                final profile = store.profiles.firstWhere(
                  (p) => p.id == store.activeProfileId,
                );
                _deleteProfile(profile, store.profiles.length);
              },
              child: const Text('删除'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildConnectionSection(AppConfig config) {
    return AppSection(
      title: '连接配置',
      children: [
        FormBuilderTextField(
          name: 'baseUrl',
          decoration: const InputDecoration(
            labelText: 'Base URL',
            hintText: 'https://api.openai.com',
          ),
        ),
        const SizedBox(height: 12),
        FormBuilderTextField(
          name: 'apiKey',
          decoration: const InputDecoration(labelText: 'API Key'),
        ),
        const SizedBox(height: 12),
        FormBuilderTextField(
          name: 'modelsPath',
          decoration: const InputDecoration(
            labelText: 'Models Path',
            hintText: _defaultModelsPath,
          ),
        ),
        const SizedBox(height: 12),
        FormBuilderTextField(
          name: 'chatPath',
          decoration: InputDecoration(
            labelText: 'Chat Path',
            hintText: _defaultChatPathForApiMode(config.apiMode),
          ),
        ),
        const SizedBox(height: 12),
        FormBuilderDropdown<String>(
          name: 'apiMode',
          decoration: const InputDecoration(labelText: 'API Mode'),
          items: const [
            DropdownMenuItem(
              value: 'chat_completions',
              child: Text('chat_completions'),
            ),
            DropdownMenuItem(
              value: 'responses',
              child: Text('responses'),
            ),
            DropdownMenuItem(
              value: 'google',
              child: Text('google'),
            ),
          ],
          onChanged: (value) {
            if (_isPatching || value == null) return;
            _isPatching = true;
            _formKey.currentState?.patchValue({
              'modelsPath': _defaultModelsPathForApiMode(value),
              'chatPath': _defaultChatPathForApiMode(value),
            });
            _isPatching = false;
          },
        ),
      ],
    );
  }

  Widget _buildModelSection(AppConfig config) {
    final models = config.availableModels ?? const <ModelInfo>[];

    return AppSection(
      title: '当前模型',
      subtitle: '可直接输入自定义模型 ID，下方能力开关将保存到该模型',
      children: [
        FormBuilderTextField(
          name: 'selectedModel',
          decoration: const InputDecoration(
            labelText: '模型 ID',
            hintText: '输入模型 ID',
          ),
          onChanged: (value) {
            if (_isPatching) return;
            _patchModelCapabilityFields(config, value);
          },
        ),
        const SizedBox(height: 12),
        if (models.isNotEmpty) ...[
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              setState(() {
                _isModelListExpanded = !_isModelListExpanded;
              });
            },
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: '已同步模型快捷选择',
                border: OutlineInputBorder(),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _isModelListExpanded ? '点击收起模型列表' : '点击展开模型列表',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Icon(
                    _isModelListExpanded
                        ? Icons.expand_less
                        : Icons.expand_more,
                  ),
                ],
              ),
            ),
          ),
          if (_isModelListExpanded) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: models.map((model) {
                final label = (model.name ?? '').trim().isNotEmpty
                    ? '${model.name} (${model.id})'
                    : model.id;
                return ActionChip(
                  label: Text(label),
                  onPressed: () {
                    _isPatching = true;
                    _formKey.currentState?.patchValue({
                      'selectedModel': model.id,
                    });
                    _isPatching = false;
                    _patchModelCapabilityFields(config, model.id);
                    setState(() {
                      _isModelListExpanded = false;
                    });
                  },
                );
              }).toList(),
            ),
          ],
          const SizedBox(height: 12),
        ],
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton(
            onPressed: _refreshModels,
            child: const Text('同步模型'),
          ),
        ),
        const SizedBox(height: 16),
        FormBuilderSwitch(
          name: 'overrideSupportsReasoning',
          title: const Text('该模型启用思考'),
        ),
        FormBuilderSwitch(
          name: 'overrideSupportsVision',
          title: const Text('该模型允许图片输入'),
        ),
      ],
    );
  }

  Future<void> _refreshModels() async {
    final currentConfig = ref.read(configProvider).valueOrNull;
    if (currentConfig == null) return;
    await _save(currentConfig);
    try {
      await ref.read(configServiceProvider).refreshModels();
      await AppToast.show('模型列表已同步');
    } catch (e) {
      await AppToast.show('同步模型失败：$e');
    }
  }

  Future<void> _confirmRestoreDefaults() async {
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('恢复默认设置'),
            content: const Text('确定要将当前配置存档恢复为默认设置吗？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: const Text('恢复默认'),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed) return;

    await ref.read(configServiceProvider).saveConfig(AppConfig.defaultConfig());
  }

  Future<void> _showCreateProfileDialog() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('新建配置存档'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: '输入配置名称'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
            child: const Text('创建'),
          ),
        ],
      ),
    );

    if (result == null || result.isEmpty) return;
    await ref.read(configServiceProvider).createProfile(result);
  }

  Future<void> _showRenameProfileDialog(ConfigProfile profile) async {
    final controller = TextEditingController(text: profile.name);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('重命名配置存档'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: '输入配置名称'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );

    if (result == null || result.isEmpty) return;
    await ref
        .read(configServiceProvider)
        .renameProfile(profile.id, result);
  }

  Future<void> _deleteProfile(ConfigProfile profile, int profileCount) async {
    if (profileCount <= 1) {
      await AppToast.show('至少保留一个配置存档');
      return;
    }

    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('删除配置存档'),
            content: Text('确定删除 "${profile.name}" 吗？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed) return;
    await ref.read(configServiceProvider).deleteProfile(profile.id);
  }
}