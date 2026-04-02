// presentation/pages/settings_page.dart

import 'package:flutter/material.dart';
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

  final _baseUrlController = TextEditingController();
  final _apiKeyController = TextEditingController();
  final _modelsPathController = TextEditingController();
  final _chatPathController = TextEditingController();

  bool _isSyncing = false;

  @override
  void dispose() {
    _baseUrlController.dispose();
    _apiKeyController.dispose();
    _modelsPathController.dispose();
    _chatPathController.dispose();
    super.dispose();
  }

  /// 同步表单值到配置流，自动触发，无需手动保存
  void _syncControllersWithConfig(AppConfig config) {
    _isSyncing = true;
    setState(() {
      _baseUrlController.text = config.baseUrl;
      _apiKeyController.text = config.apiKey;
      _modelsPathController.text = config.modelsPath;
      _chatPathController.text = config.chatPath;
    });
    _isSyncing = false;
  }

  String _defaultChatPathForApiMode(String apiMode) {
    return apiMode == 'responses' ? 'v1/responses' : 'v1/chat/completions';
  }

  @override
  Widget build(BuildContext context) {
    final configAsync = ref.watch(configProvider);
    final profilesAsync = ref.watch(configProfilesProvider);

    // 监听配置变化，自动同步到表单
    ref.listen<AsyncValue<AppConfig>>(configProvider, (previous, next) {
      next.whenData((config) {
        _syncControllersWithConfig(config);
      });
    });

    final isBusy = configAsync.isLoading || profilesAsync.isLoading;

    return AppPageScaffold(
      appBar: AppBar(
        title: const Text('设置'),
        actions: [
          IconButton(
            onPressed: isBusy ? null : _confirmRestoreDefaults,
            icon: const Icon(Icons.restart_alt),
            tooltip: '恢复默认',
            style: IconButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
      ),
      body: profilesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载配置存档失败：$e')),
        data: (store) {
          return configAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('加载配置失败：$e')),
            data: (config) {
              // 首次加载时同步 Controller
              if (_baseUrlController.text.isEmpty) {
                _syncControllersWithConfig(config);
              }
              return _buildSettingsContent(context, store, config, isBusy);
            },
          );
        },
      ),
    );
  }

  Widget _buildSettingsContent(
    BuildContext context,
    AppConfigStore store,
    AppConfig config,
    bool isBusy,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // 配置存档
        AppSection(
          title: '配置存档',
          subtitle: '切换后自动同步到表单',
          children: [
            DropdownButtonFormField<String>(
              value: store.activeProfileId,
              decoration: const InputDecoration(labelText: '当前配置存档'),
              items: store.profiles
                  .map((p) => DropdownMenuItem(value: p.id, child: Text(p.name)))
                  .toList(),
              onChanged: isBusy
                  ? null
                  : (value) async {
                      if (value == null) return;
                      await ref.read(configProfilesNotifierProvider).switchProfile(value);
                    },
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: [
                OutlinedButton(
                  onPressed: isBusy ? null : _showCreateProfileDialog,
                  child: const Text('新建'),
                ),
                OutlinedButton(
                  onPressed: isBusy
                      ? null
                      : () => _showRenameProfileDialog(
                          store.profiles.firstWhere((p) => p.id == store.activeProfileId)),
                  child: const Text('重命名'),
                ),
                OutlinedButton(
                  onPressed: isBusy
                      ? null
                      : () => _deleteProfile(
                          store.profiles.firstWhere((p) => p.id == store.activeProfileId),
                          store.profiles.length),
                  child: const Text('删除'),
                ),
              ],
            ),
          ],
        ),

        // 连接配置
        AppSection(
          title: '连接配置',
          subtitle: '修改后自动保存到当前配置',
          children: [
            TextField(
              controller: _baseUrlController,
              enabled: !isBusy,
              decoration: const InputDecoration(labelText: 'Base URL', hintText: 'https://api.openai.com'),
              onChanged: (v) {
                if (_isSyncing) return;
                ref.read(configNotifierProvider).updateBaseUrl(v);
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _apiKeyController,
              enabled: !isBusy,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'API Key'),
              onChanged: (v) {
                if (_isSyncing) return;
                ref.read(configNotifierProvider).updateApiKey(v);
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _modelsPathController,
              enabled: !isBusy,
              decoration: const InputDecoration(labelText: 'Models Path', hintText: _defaultModelsPath),
              onChanged: (v) {
                if (_isSyncing) return;
                ref.read(configNotifierProvider).updateModelsPath(v.isEmpty ? _defaultModelsPath : v);
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _chatPathController,
              enabled: !isBusy,
              decoration: InputDecoration(labelText: 'Chat Path', hintText: _defaultChatPathForApiMode(config.apiMode)),
              onChanged: (v) {
                if (_isSyncing) return;
                ref.read(configNotifierProvider).updateChatPath(v.isEmpty ? _defaultChatPathForApiMode(config.apiMode) : v);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: config.apiMode,
              decoration: const InputDecoration(labelText: 'API Mode'),
              items: const [
                DropdownMenuItem(value: 'chat_completions', child: Text('chat_completions')),
                DropdownMenuItem(value: 'responses', child: Text('responses')),
              ],
              onChanged: isBusy
                  ? null
                  : (value) {
                      if (value == null || _isSyncing) return;
                      ref.read(configNotifierProvider).updateApiMode(value);
                      if (_chatPathController.text.isEmpty) {
                        _chatPathController.text = _defaultChatPathForApiMode(value);
                        ref.read(configNotifierProvider).updateChatPath(_chatPathController.text);
                      }
                    },
            ),
          ],
        ),

        // 模型配置
        AppSection(
          title: '模型配置',
          subtitle: '选择后自动保存到当前配置',
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildModelSelector(context, config, isBusy)),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: isBusy ? null : _refreshModels,
                  child: const Text('同步模型'),
                ),
              ],
            ),
            _buildModelChips(config),
          ],
        ),
      ],
    );
  }

  Widget _buildModelSelector(BuildContext context, AppConfig config, bool isBusy) {
    final models = config.availableModels ?? const [];
    final selectedId = config.selectedModel;

    return SearchAnchor(
      builder: (context, controller) {
        return GestureDetector(
          onTap: isBusy ? null : () => controller.openView(),
          child: InputDecorator(
            decoration: const InputDecoration(labelText: '当前模型', suffixIcon: Icon(Icons.arrow_drop_down)),
            child: Text(_getSelectedModelDisplayText(models, selectedId), overflow: TextOverflow.ellipsis),
          ),
        );
      },
      suggestionsBuilder: (context, controller) {
        final query = controller.text.trim().toLowerCase();
        final filtered = models.where((m) {
          final id = m.id.toLowerCase();
          final name = (m.name ?? '').toLowerCase();
          return query.isEmpty || id.contains(query) || name.contains(query);
        }).toList();

        if (filtered.isEmpty) return const [ListTile(title: Text('没有匹配的模型'))];

        return [
          ...filtered.map((model) => ListTile(
                title: Text((model.name ?? '').trim().isNotEmpty ? model.name! : model.id),
                trailing: model.id == selectedId ? const Icon(Icons.check) : null,
                onTap: () {
                  if (_isSyncing) return;
                  ref.read(configNotifierProvider).updateSelectedModel(model.id);
                  controller.closeView(model.id);
                },
              )),
          ListTile(
            title: const Text('自定义模型 ID'),
            onTap: () {
              final text = controller.text;
              controller.closeView(null);
              if (text.isNotEmpty && !_isSyncing) {
                ref.read(configNotifierProvider).updateSelectedModel(text);
              }
            },
          ),
        ];
      },
    );
  }

  Widget _buildModelChips(AppConfig config) {
    final selectedId = config.selectedModel;
    if (selectedId == null || selectedId.trim().isEmpty) return const SizedBox.shrink();

    final model = (config.availableModels ?? const []).where((m) => m.id == selectedId).firstOrNull;
    if (model == null) return const SizedBox.shrink();

    final chips = <Widget>[];
    if (model.supportsVision == true) {
      chips.add(const Chip(avatar: Icon(Icons.image_outlined, size: 16), label: Text('Vision'), visualDensity: VisualDensity.compact));
    }
    if (model.supportsReasoning == true) {
      chips.add(const Chip(avatar: Icon(Icons.psychology_alt_outlined, size: 16), label: Text('Reasoning'), visualDensity: VisualDensity.compact));
    }
    if (chips.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Wrap(spacing: 8, runSpacing: 8, children: chips),
    );
  }

  String _getSelectedModelDisplayText(List<ModelInfo> models, String? selectedId) {
    if (selectedId == null || selectedId.trim().isEmpty) return '请选择模型';
    for (final m in models) {
      if (m.id == selectedId) return (m.name ?? '').trim().isNotEmpty ? m.name! : m.id;
    }
    return selectedId;
  }

  Future<void> _refreshModels() async {
    final configAsync = ref.read(configProvider);
    final config = configAsync.valueOrNull;
    if (config == null) return;

    try {
      await ref.read(configNotifierProvider).saveAndRefreshModels(config);
      await AppToast.show('模型列表已同步');
    } catch (e) {
      await AppToast.show('同步模型失败：$e');
    }
  }

  Future<void> _confirmRestoreDefaults() async {
    final colorScheme = Theme.of(context).colorScheme;
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('恢复默认设置'),
            content: const Text('确定要将当前配置存档恢复为默认设置吗？'),
            actions: [
              TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: FilledButton.styleFrom(backgroundColor: colorScheme.error, foregroundColor: colorScheme.onError),
                child: const Text('恢复默认'),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed) return;

    try {
      await ref.read(configNotifierProvider).saveFullConfig(AppConfig.defaultConfig());
    } catch (e) {
      await AppToast.show('恢复默认失败：$e');
    }
  }

  Future<void> _showCreateProfileDialog() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('新建配置存档'),
        content: TextField(controller: controller, autofocus: true, decoration: const InputDecoration(hintText: '输入配置名称')),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('取消')),
          FilledButton(onPressed: () => Navigator.of(ctx).pop(controller.text.trim()), child: const Text('创建')),
        ],
      ),
    );

    if (result == null || result.isEmpty) return;
    await ref.read(configProfilesNotifierProvider).createProfile(result);
  }

  Future<void> _showRenameProfileDialog(ConfigProfile profile) async {
    final controller = TextEditingController(text: profile.name);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('重命名配置存档'),
        content: TextField(controller: controller, autofocus: true, decoration: const InputDecoration(hintText: '输入配置名称')),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('取消')),
          FilledButton(onPressed: () => Navigator.of(ctx).pop(controller.text.trim()), child: const Text('保存')),
        ],
      ),
    );

    if (result == null || result.isEmpty) return;
    await ref.read(configProfilesNotifierProvider).renameProfile(profile.id, result);
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
              TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
              FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('删除')),
            ],
          ),
        ) ??
        false;

    if (!confirmed) return;
    await ref.read(configProfilesNotifierProvider).deleteProfile(profile.id);
  }
}