import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/models/model_info.dart';
import '../providers/config_notifier.dart';
import '../themes/app_tokens.dart';
import '../widgets/common/app_badge.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_section.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  static const String _defaultModelsPath = 'v1/models';

  final _baseUrlController = TextEditingController();
  final _apiKeyController = TextEditingController();
  final _modelsPathController = TextEditingController();
  final _chatPathController = TextEditingController();

  bool _initialized = false;
  bool _isRefreshingModels = false;

  String? _selectedModel;
  String _apiMode = 'chat_completions';
  List<ModelInfo> _models = const [];

  @override
  void dispose() {
    _baseUrlController.dispose();
    _apiKeyController.dispose();
    _modelsPathController.dispose();
    _chatPathController.dispose();
    super.dispose();
  }

  String _defaultChatPathForApiMode(String apiMode) {
    switch (apiMode) {
      case 'responses':
        return 'v1/responses';
      case 'chat_completions':
      default:
        return 'v1/chat/completions';
    }
  }

  void _applyConfig(AppConfig config) {
    _baseUrlController.text = config.baseUrl;
    _apiKeyController.text = config.apiKey;
    _modelsPathController.text = config.modelsPath;
    _chatPathController.text = config.chatPath;
    _selectedModel = config.selectedModel;
    _apiMode = config.apiMode;
    _models = config.availableModels ?? const [];
    _initialized = true;
  }

  ModelInfo? _selectedModelInfo() {
    final selectedId = _selectedModel;
    if (selectedId == null || selectedId.trim().isEmpty) return null;
    for (final model in _models) {
      if (model.id == selectedId) return model;
    }
    return null;
  }

  String _getSelectedModelDisplayText(List<ModelInfo> models) {
    if (_selectedModel == null || _selectedModel!.trim().isEmpty) {
      return '请选择模型';
    }
    for (final model in models) {
      if (model.id == _selectedModel) {
        final name = (model.name ?? '').trim();
        return name.isNotEmpty ? name : model.id;
      }
    }
    return _selectedModel!;
  }

  List<Widget> _buildModelBadges(ModelInfo model) {
    final widgets = <Widget>[];
    if (model.supportsVision == true) {
      widgets.add(
        AppBadge.info(
          'Vision',
          icon: Icons.image_outlined,
        ),
      );
    }
    if (model.supportsReasoning == true) {
      widgets.add(
        AppBadge.warning(
          'Reasoning',
          icon: Icons.psychology_alt_outlined,
        ),
      );
    }
    return widgets;
  }

  Widget _buildSelectedModelSupportsCard() {
    final model = _selectedModelInfo();
    if (model == null) return const SizedBox.shrink();
    final badges = _buildModelBadges(model);
    if (badges.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppTokens.space12),
      padding: const EdgeInsets.all(AppTokens.space12),
      decoration: BoxDecoration(
        color: AppTokens.surfaceSoft,
        borderRadius: AppTokens.brMd,
        border: Border.all(color: AppTokens.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '模型能力',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTokens.textPrimary,
                ),
          ),
          const SizedBox(height: AppTokens.space8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: badges,
          ),
        ],
      ),
    );
  }

  void _updateSelectedModelOverride({
    bool? overrideVision,
    bool? overrideReasoning,
  }) {
    final selected = _selectedModelInfo();
    if (selected == null) return;

    final updated = selected.copyWith(
      overrideSupportsVision:
          overrideVision ?? selected.overrideSupportsVision,
      overrideSupportsReasoning:
          overrideReasoning ?? selected.overrideSupportsReasoning,
      supportsVision: overrideVision ?? selected.supportsVision,
      supportsReasoning: overrideReasoning ?? selected.supportsReasoning,
    );

    setState(() {
      _models = _models.map((m) {
        if (m.id == selected.id) return updated;
        return m;
      }).toList();
    });
  }

  Future<void> _saveSettings() async {
    final current = ref.read(configProvider).value;
    if (current == null) return;

    final updated = current.copyWith(
      baseUrl: _baseUrlController.text.trim(),
      apiKey: _apiKeyController.text.trim(),
      modelsPath: _modelsPathController.text.trim().isEmpty
          ? _defaultModelsPath
          : _modelsPathController.text.trim(),
      chatPath: _chatPathController.text.trim().isEmpty
          ? _defaultChatPathForApiMode(_apiMode)
          : _chatPathController.text.trim(),
      selectedModel: (_selectedModel?.trim().isEmpty ?? true)
          ? null
          : _selectedModel!.trim(),
      apiMode: _apiMode,
      availableModels: _models,
    );

    try {
      await ref.read(configProvider.notifier).saveFullConfig(updated);
      await ref.read(configProfilesProvider.notifier).load();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('设置已保存')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('保存失败：$e')),
      );
    }
  }

  Future<void> _refreshModels() async {
    final current = ref.read(configProvider).value;
    if (current == null) return;

    final previousOverrides = {
      for (final model in _models) model.id: model,
    };

    final draft = current.copyWith(
      baseUrl: _baseUrlController.text.trim(),
      apiKey: _apiKeyController.text.trim(),
      modelsPath: _modelsPathController.text.trim().isEmpty
          ? _defaultModelsPath
          : _modelsPathController.text.trim(),
      chatPath: _chatPathController.text.trim().isEmpty
          ? _defaultChatPathForApiMode(_apiMode)
          : _chatPathController.text.trim(),
      selectedModel: (_selectedModel?.trim().isEmpty ?? true)
          ? null
          : _selectedModel!.trim(),
      apiMode: _apiMode,
      availableModels: _models,
    );

    setState(() {
      _isRefreshingModels = true;
    });

    try {
      await ref.read(configProvider.notifier).saveAndRefreshModels(draft);

      final refreshed = ref.read(configProvider).value;
      if (refreshed != null) {
        final mergedModels = (refreshed.availableModels ?? const [])
            .map((model) {
          final old = previousOverrides[model.id];
          if (old == null) return model;
          return model.copyWith(
            overrideSupportsVision: old.overrideSupportsVision,
            overrideSupportsReasoning: old.overrideSupportsReasoning,
            supportsVision: old.overrideSupportsVision ?? model.supportsVision,
            supportsReasoning:
                old.overrideSupportsReasoning ?? model.supportsReasoning,
          );
        }).toList();

        setState(() {
          _models = mergedModels;
          final exists = _models.any((m) => m.id == _selectedModel);
          if (!exists) {
            _selectedModel = _models.isNotEmpty ? _models.first.id : null;
          }
        });
      }

      await ref.read(configProfilesProvider.notifier).load();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('模型列表已同步')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('同步模型失败：$e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isRefreshingModels = false;
        });
      }
    }
  }

  Widget _buildManualCapabilityEditor() {
    final model = _selectedModelInfo();
    if (model == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppTokens.space12),
      padding: const EdgeInsets.all(AppTokens.space12),
      decoration: BoxDecoration(
        color: AppTokens.surfaceSoft,
        borderRadius: AppTokens.brMd,
        border: Border.all(color: AppTokens.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '手动覆盖模型能力',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTokens.textPrimary,
                ),
          ),
          const SizedBox(height: AppTokens.space8),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('支持 Vision'),
            subtitle: const Text('用于图片输入能力声明'),
            value: model.supportsVision == true,
            activeColor: AppTokens.primary,
            onChanged: (value) {
              _updateSelectedModelOverride(overrideVision: value);
            },
          ),
          const Divider(),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('支持 Reasoning'),
            subtitle: const Text('用于推理过程能力声明'),
            value: model.supportsReasoning == true,
            activeColor: AppTokens.primary,
            onChanged: (value) {
              _updateSelectedModelOverride(overrideReasoning: value);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showCreateProfileDialog() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: AppTokens.brLg),
        title: const Text('新建配置存档'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '输入配置名称',
          ),
          onSubmitted: (value) => Navigator.of(ctx).pop(value.trim()),
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

    if (result == null) return;

    await ref.read(configProfilesProvider.notifier).createProfile(result);
    _initialized = false;

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('配置存档已创建')),
    );
  }

  Future<void> _showRenameProfileDialog(ConfigProfile profile) async {
    final controller = TextEditingController(text: profile.name);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: AppTokens.brLg),
        title: const Text('重命名配置存档'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '输入配置名称',
          ),
          onSubmitted: (value) => Navigator.of(ctx).pop(value.trim()),
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
        .read(configProfilesProvider.notifier)
        .renameProfile(profile.id, result);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('配置存档已重命名')),
    );
  }

  Future<void> _deleteProfile(ConfigProfile profile, int profileCount) async {
    if (profileCount <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('至少保留一个配置存档')),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: AppTokens.brLg),
            title: const Text('删除配置存档'),
            content: Text('确定删除“${profile.name}”吗？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTokens.danger,
                ),
                child: const Text('删除'),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed) return;

    await ref.read(configProfilesProvider.notifier).deleteProfile(profile.id);
    _initialized = false;

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('配置存档已删除')),
    );
  }

  Future<void> _confirmRestoreDefaults() async {
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: AppTokens.brLg,
            ),
            title: Text(
              '恢复默认设置',
              style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            content: Text(
              '确定要将当前配置存档恢复为默认设置吗？\n\n仅会影响当前选中的配置存档，不会影响其他配置存档。',
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTokens.danger,
                ),
                child: const Text('恢复默认'),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed) return;
    await _restoreCurrentProfileDefaults();
  }

  Future<void> _restoreCurrentProfileDefaults() async {
    try {
      final defaultConfig = AppConfig.defaultConfig();

      await ref.read(configProvider.notifier).saveFullConfig(defaultConfig);
      await ref.read(configProfilesProvider.notifier).load();

      setState(() {
        _applyConfig(defaultConfig);
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('当前配置存档已恢复默认设置')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('恢复默认失败：$e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final configState = ref.watch(configProvider);
    final profilesState = ref.watch(configProfilesProvider);

    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      next.whenData((config) {
        if (!_initialized) {
          setState(() {
            _applyConfig(config);
          });
        }
      });
    });

    final isBusy = configState.isLoading || _isRefreshingModels;

    return AppPageScaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '设置',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              '连接、模型与能力配置',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: profilesState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('加载配置存档失败：$e'),
          ),
        ),
        data: (store) {
          final activeProfile = store.profiles.firstWhere(
            (p) => p.id == store.activeProfileId,
          );

          return configState.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, _) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text('加载配置失败：$e'),
              ),
            ),
            data: (config) {
              if (!_initialized) {
                _applyConfig(config);
              }

              final models = _models;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    AppSection(
                      title: '配置存档',
                      subtitle: '可保存多套 API 与模型配置，并快速切换。',
                      children: [
                        DropdownButtonFormField<String>(
                          value: store.activeProfileId,
                          decoration: const InputDecoration(
                            labelText: '当前配置存档',
                          ),
                          items: store.profiles.map((profile) {
                            return DropdownMenuItem(
                              value: profile.id,
                              child: Text(profile.name),
                            );
                          }).toList(),
                          onChanged: isBusy
                              ? null
                              : (value) async {
                                  if (value == null) return;
                                  await ref
                                      .read(configProfilesProvider.notifier)
                                      .switchProfile(value);
                                  _initialized = false;
                                },
                        ),
                        const SizedBox(height: AppTokens.space12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed:
                                    isBusy ? null : _showCreateProfileDialog,
                                child: const Text('新建'),
                              ),
                            ),
                            const SizedBox(width: AppTokens.space12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: isBusy
                                    ? null
                                    : () =>
                                        _showRenameProfileDialog(activeProfile),
                                child: const Text('重命名'),
                              ),
                            ),
                            const SizedBox(width: AppTokens.space12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: isBusy
                                    ? null
                                    : () => _deleteProfile(
                                          activeProfile,
                                          store.profiles.length,
                                        ),
                                child: const Text('删除'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppSection(
                      title: '连接配置',
                      subtitle: '用于配置 API 服务地址与接口路径。',
                      children: [
                        TextField(
                          controller: _baseUrlController,
                          enabled: !isBusy,
                          decoration: const InputDecoration(
                            labelText: 'Base URL',
                            hintText: 'https://api.openai.com',
                          ),
                        ),
                        const SizedBox(height: AppTokens.space12),
                        TextField(
                          controller: _apiKeyController,
                          enabled: !isBusy,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'API Key',
                            hintText: '输入 API Key',
                          ),
                        ),
                        const SizedBox(height: AppTokens.space12),
                        TextField(
                          controller: _modelsPathController,
                          enabled: !isBusy,
                          decoration: const InputDecoration(
                            labelText: 'Models Path',
                            hintText: _defaultModelsPath,
                          ),
                        ),
                        const SizedBox(height: AppTokens.space12),
                        TextField(
                          controller: _chatPathController,
                          enabled: !isBusy,
                          decoration: InputDecoration(
                            labelText: 'Chat Path',
                            hintText: _defaultChatPathForApiMode(_apiMode),
                          ),
                        ),
                        const SizedBox(height: AppTokens.space12),
                        DropdownButtonFormField<String>(
                          value: _apiMode,
                          decoration: const InputDecoration(
                            labelText: 'API Mode',
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'chat_completions',
                              child: Text('chat_completions'),
                            ),
                            DropdownMenuItem(
                              value: 'responses',
                              child: Text('responses'),
                            ),
                          ],
                          onChanged: isBusy
                              ? null
                              : (value) {
                                  if (value == null) return;
                                  setState(() {
                                    _apiMode = value;
                                    if (_chatPathController.text.trim().isEmpty ||
                                        _chatPathController.text ==
                                            _defaultChatPathForApiMode(
                                                'chat_completions') ||
                                        _chatPathController.text ==
                                            _defaultChatPathForApiMode(
                                                'responses')) {
                                      _chatPathController.text =
                                          _defaultChatPathForApiMode(value);
                                    }
                                  });
                                },
                        ),
                      ],
                    ),
                    AppSection(
                      title: '模型配置',
                      subtitle: '选择当前模型，并同步远端模型列表。',
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SearchAnchor(
                                builder: (context, controller) {
                                  return GestureDetector(
                                    onTap: isBusy
                                        ? null
                                        : () {
                                            controller.openView();
                                          },
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        labelText: '当前模型',
                                        enabled: !isBusy,
                                        suffixIcon: const Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                      ),
                                      child: Text(
                                        _getSelectedModelDisplayText(models),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: isBusy
                                              ? AppTokens.textTertiary
                                              : AppTokens.textPrimary,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                suggestionsBuilder: (context, controller) {
                                  final query =
                                      controller.text.trim().toLowerCase();
                                  final filteredModels = models.where((model) {
                                    final id = model.id.toLowerCase();
                                    final name =
                                        (model.name ?? '').toLowerCase();
                                    return query.isEmpty ||
                                        id.contains(query) ||
                                        name.contains(query);
                                  }).toList();

                                  if (filteredModels.isEmpty) {
                                    return const [
                                      ListTile(
                                        title: Text('没有匹配的模型'),
                                      ),
                                    ];
                                  }

                                  return filteredModels.map((model) {
                                    final isSelected =
                                        model.id == _selectedModel;
                                    final title =
                                        (model.name ?? '').trim().isNotEmpty
                                            ? model.name!
                                            : model.id;
                                    final showSubtitle =
                                        (model.name ?? '').trim().isNotEmpty &&
                                            model.name != model.id;
                                    final badges = _buildModelBadges(model);

                                    return ListTile(
                                      title: Text(
                                        title,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (showSubtitle) Text(model.id),
                                          if (badges.isNotEmpty) ...[
                                            const SizedBox(height: 6),
                                            Wrap(
                                              spacing: 6,
                                              runSpacing: 6,
                                              children: badges,
                                            ),
                                          ],
                                        ],
                                      ),
                                      trailing: isSelected
                                          ? const Icon(
                                              Icons.check,
                                              color: AppTokens.primary,
                                            )
                                          : null,
                                      onTap: () {
                                        setState(() {
                                          _selectedModel = model.id;
                                        });
                                        controller.closeView(model.id);
                                      },
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                            const SizedBox(width: AppTokens.space12),
                            SizedBox(
                              height: 56,
                              child: FilledButton(
                                onPressed: isBusy ? null : _refreshModels,
                                child: _isRefreshingModels
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text('同步模型'),
                              ),
                            ),
                          ],
                        ),
                        _buildSelectedModelSupportsCard(),
                        _buildManualCapabilityEditor(),
                      ],
                    ),
                    AppSection(
                      title: '操作',
                      subtitle: '保存或重置当前配置存档。',
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed:
                                    isBusy ? null : _confirmRestoreDefaults,
                                child: const Text('恢复默认'),
                              ),
                            ),
                            const SizedBox(width: AppTokens.space12),
                            Expanded(
                              child: FilledButton(
                                onPressed: isBusy ? null : _saveSettings,
                                child: const Text('保存设置'),
                              ),
                            ),
                          ],
                        ),
                      ],
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
}