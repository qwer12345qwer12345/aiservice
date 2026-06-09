// lib/presentation/pages/settings_page.dart
import 'package:aiservice/core/models/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/model_info.dart';
import '../../data/services/config_service.dart';
import '../../di/providers.dart';
import '../providers/config_notifier.dart';
import '../providers/settings_form_notifier.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';
import '../widgets/common/declarative_text_field.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(settingsFormProvider);
    final formNotifier = ref.read(settingsFormProvider.notifier);
    final profilesAsync = ref.watch(globalSettingsProvider);
    final configService = ref.read(configServiceProvider);

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('设置'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _confirmRestoreDefaults(context, formNotifier),
          child: const Icon(CupertinoIcons.arrow_counterclockwise),
        ),
      ),
      body: profilesAsync.when(
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (e, _) => Center(child: Text('加载配置存档失败：$e')),
        data: (store) {
          return ListView(
            children: [
              _buildProfileSection(context, store, configService),
              _buildConnectionSection(formState, formNotifier),
              _buildModelSection(formState, formNotifier),
              _buildActionSection(formState, formNotifier),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileSection(
    BuildContext context,
    GlobalSettings store,
    ConfigService configService,
  ) {
    final activeProfile = store.profiles.firstWhere((p) => p.id == store.activeProfileId);
    return CupertinoFormSection.insetGrouped(
      header: const Text('配置存档'),
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
      children: [
        CupertinoFormRow(
          prefix: const Text('当前配置'),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showProfileManagementSheet(context, store, configService),
            child: Text(activeProfile.name),
          ),
        ),
      ],
    );
  }

  Widget _buildConnectionSection(SettingsFormState formState, SettingsFormNotifier notifier) {
    return CupertinoFormSection.insetGrouped(
      header: const Text('连接配置'),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      children: [
        CupertinoFormRow(
          prefix: const Text('Base URL'),
          child: _buildStyledTextField(
            value: formState.config.baseUrl,
            onChanged: notifier.updateBaseUrl,
            placeholder: 'https://api.openai.com',
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('API Key'),
          child: _buildStyledTextField(
            value: formState.config.apiKey,
            onChanged: notifier.updateApiKey,
            placeholder: 'API Key',
            obscureText: true,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('Models Path'),
          child: _buildStyledTextField(
            value: formState.config.modelsPath,
            onChanged: notifier.updateModelsPath,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('Chat Path'),
          child: _buildStyledTextField(
            value: formState.config.chatPath,
            onChanged: notifier.updateChatPath,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('API Mode'),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showApiModePicker(context, notifier),
            child: Text(formState.config.apiMode),
          ),
        ),
      ],
    );
  }

  Widget _buildModelSection(SettingsFormState formState, SettingsFormNotifier notifier) {
    final models = formState.config.availableModels;
    final currentModelId = formState.config.selectedModel;
    final currentModel = currentModelId != null
        ? models.where((m) => m.id == currentModelId).firstOrNull
        : null;
    final supportsReasoning = currentModel?.overrideSupportsReasoning ?? false;
    final supportsVision = currentModel?.overrideSupportsVision ?? false;

    return CupertinoFormSection.insetGrouped(
      header: const Text('模型设置'),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      children: [
        CupertinoFormRow(
          prefix: const Text('模型 ID'),
          child: Row(
            children: [
              Expanded(
                child: _buildStyledTextField(
                  value: currentModelId ?? '',
                  onChanged: notifier.updateSelectedModel,
                  placeholder: '输入模型 ID',
                ),
              ),
              const SizedBox(width: 8),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                borderRadius: BorderRadius.circular(12),
                onPressed: models.isNotEmpty
                    ? () => _showModelPicker(context, models, notifier)
                    : null,
                child: const Text('从列表选择'),
              ),
              const SizedBox(width: 8),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                borderRadius: BorderRadius.circular(12),
                onPressed: () async {
                  try {
                    await notifier.refreshModels();
                    if (mounted) AppToast.show('模型列表已同步');
                  } catch (e) {
                    if (mounted) AppToast.show('同步模型失败：$e');
                  }
                },
                child: formState.isRefreshingModels
                    ? const SizedBox(width: 20, height: 20, child: CupertinoActivityIndicator())
                    : const Text('立即同步'),
              ),
            ],
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('启用思考'),
          child: CupertinoSwitch(
            value: supportsReasoning,
            onChanged: notifier.toggleReasoning,
          ),
        ),
        CupertinoFormRow(
          prefix: const Text('允许图片输入'),
          child: CupertinoSwitch(
            value: supportsVision,
            onChanged: notifier.toggleVision,
          ),
        ),
      ],
    );
  }

  Widget _buildActionSection(SettingsFormState formState, SettingsFormNotifier notifier) {
    return CupertinoFormSection.insetGrouped(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
      children: [
        CupertinoFormRow(
          child: CupertinoButton.filled(
            borderRadius: BorderRadius.circular(12),
            onPressed: formState.isSaving
                ? null
                : () async {
                    try {
                      await notifier.save();
                      if (mounted) AppToast.show('设置已保存');
                    } catch (e) {
                      if (mounted) AppToast.show('保存失败：$e');
                    }
                  },
            child: formState.isSaving
                ? const CupertinoActivityIndicator()
                : const Text('保存设置'),
          ),
        ),
      ],
    );
  }

  Widget _buildStyledTextField({
    required String value,
    required ValueChanged<String> onChanged,
    String? placeholder,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DeclarativeCupertinoTextField(
        value: value,
        onChanged: onChanged,
        placeholder: placeholder,
        obscureText: obscureText,
      ),
    );
  }

  // ------------------ 弹窗方法 ------------------
  void _showApiModePicker(BuildContext context, SettingsFormNotifier notifier) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('chat_completions'); Navigator.pop(context); },
            child: const Text('chat_completions'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('responses'); Navigator.pop(context); },
            child: const Text('responses'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('google'); Navigator.pop(context); },
            child: const Text('google'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { notifier.updateApiMode('local'); Navigator.pop(context); },
            child: const Text('local'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  void _showModelPicker(BuildContext context, List<ModelInfo> models, SettingsFormNotifier notifier) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('选择模型'),
        actions: models.map((model) {
          final label = model.id;
          return CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              notifier.updateSelectedModel(model.id);
            },
            child: Text(label),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  void _showProfileManagementSheet(
    BuildContext context,
    GlobalSettings store,
    ConfigService configService,
  ) {
    final activeProfile = store.profiles.firstWhere((p) => p.id == store.activeProfileId);
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('配置存档管理'),
        actions: [
          ...store.profiles.map((p) => CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              if (p.id != store.activeProfileId) configService.switchProfile(p.id);
            },
            isDefaultAction: p.id == store.activeProfileId,
            child: Row(
              children: [
                Expanded(child: Text(p.name)),
                if (p.id == store.activeProfileId)
                  const Icon(CupertinoIcons.check_mark, size: 18, color: CupertinoColors.systemBlue),
              ],
            ),
          )),
          const SizedBox(height: 8),
          CupertinoActionSheetAction(
            onPressed: () { Navigator.pop(context); _showCreateProfileDialog(context, configService); },
            child: const Text('新建配置'),
          ),
          CupertinoActionSheetAction(
            onPressed: () { Navigator.pop(context); _showRenameProfileDialog(context, activeProfile, configService); },
            child: const Text('重命名当前配置'),
          ),
          if (store.profiles.length > 1)
            CupertinoActionSheetAction(
              onPressed: () { Navigator.pop(context); _deleteProfile(context, activeProfile, store.profiles.length, configService); },
              isDestructiveAction: true,
              child: const Text('删除当前配置'),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  Future<void> _showCreateProfileDialog(BuildContext context, ConfigService configService) async {
    final controller = TextEditingController();
    final result = await showCupertinoDialog<String>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('新建配置存档'),
        content: CupertinoTextField(controller: controller, autofocus: true, placeholder: '输入配置名称'),
        actions: [
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(), child: const Text('取消')),
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(controller.text.trim()), child: const Text('创建')),
        ],
      ),
    );
    if (result != null && result.isNotEmpty) await configService.createProfile(result);
  }

  Future<void> _showRenameProfileDialog(BuildContext context, ConfigProfile profile, ConfigService configService) async {
    final controller = TextEditingController(text: profile.name);
    final result = await showCupertinoDialog<String>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('重命名配置存档'),
        content: CupertinoTextField(controller: controller, autofocus: true, placeholder: '输入配置名称'),
        actions: [
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(), child: const Text('取消')),
          CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(controller.text.trim()), child: const Text('保存')),
        ],
      ),
    );
    if (result != null && result.isNotEmpty) await configService.renameProfile(profile.id, result);
  }

  Future<void> _deleteProfile(BuildContext context, ConfigProfile profile, int profileCount, ConfigService configService) async {
    if (profileCount <= 1) {
      AppToast.show('至少保留一个配置存档');
      return;
    }
    final confirmed = await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('删除配置存档'),
            content: Text('确定删除 "${profile.name}" 吗？'),
            actions: [
              CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
              CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(true), isDestructiveAction: true, child: const Text('删除')),
            ],
          ),
        ) ??
        false;
    if (confirmed) await configService.deleteProfile(profile.id);
  }

  Future<void> _confirmRestoreDefaults(BuildContext context, SettingsFormNotifier notifier) async {
    final confirmed = await showCupertinoDialog<bool>(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('恢复默认设置'),
            content: const Text('确定要将当前配置存档恢复为默认设置吗？'),
            actions: [
              CupertinoDialogAction(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('取消')),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(true), 
                isDestructiveAction: true,
                child: const Text('恢复默认'),
              ),
            ],
          ),
        ) ??
        false;
    if (confirmed) {
      notifier.restoreDefaults();
      await notifier.save();
      if (mounted) AppToast.show('已恢复默认设置');
    }
  }
}