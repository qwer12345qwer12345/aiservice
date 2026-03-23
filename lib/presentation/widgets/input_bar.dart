import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/utils/id_generator.dart';
import '../models/pending_attachment.dart';
import '../providers/input_draft_provider.dart';
import '../themes/app_tokens.dart';

class InputBar extends ConsumerStatefulWidget {
  final void Function(String text, List<PendingAttachment> attachments) onSend;
  final VoidCallback? onStop;
  final bool isStreaming;
  final bool enabled;
  final String hintText;

  const InputBar({
    super.key,
    required this.onSend,
    this.onStop,
    this.isStreaming = false,
    this.enabled = true,
    this.hintText = '输入消息...',
  });

  @override
  ConsumerState<InputBar> createState() => _InputBarState();
}

class _InputBarState extends ConsumerState<InputBar> {
  late final TextEditingController _controller;
  late final ProviderSubscription<String> _draftSubscription;
  final GlobalKey _addButtonKey = GlobalKey();
  final ImagePicker _imagePicker = ImagePicker();
  bool _isSyncingText = false;
  OverlayEntry? _attachmentMenuOverlay;

  @override
  void initState() {
    super.initState();
    final draft = ref.read(globalInputDraftProvider);
    _controller = TextEditingController(text: draft);
    _controller.addListener(_handleControllerChanged);
    _draftSubscription = ref.listenManual<String>(
      globalInputDraftProvider,
      (previous, next) {
        if (_controller.text == next) return;
        _syncControllerText(next);
      },
    );
  }

  @override
  void dispose() {
    _removeAttachmentMenu();
    _draftSubscription.close();
    _controller.removeListener(_handleControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  void _handleControllerChanged() {
    if (_isSyncingText) return;
    final text = _controller.text;
    final notifier = ref.read(globalInputDraftProvider.notifier);
    if (notifier.state != text) {
      notifier.state = text;
    }
    if (mounted) {
      setState(() {});
    }
  }

  void _syncControllerText(String text) {
    _isSyncingText = true;
    _controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
      composing: TextRange.empty,
    );
    _isSyncingText = false;
    if (mounted) {
      setState(() {});
    }
  }

  void _clearDraft() {
    ref.read(globalInputDraftProvider.notifier).state = '';
  }

  void _clearAttachmentDraft() {
    ref.read(globalAttachmentDraftProvider.notifier).state = [];
  }

  bool _isImageFile(String name) {
    final lower = name.toLowerCase();
    return lower.endsWith('.png') ||
        lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.gif') ||
        lower.endsWith('.webp') ||
        lower.endsWith('.bmp');
  }

  String? _guessMimeType(String name) {
    final lower = name.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) {
      return 'image/jpeg';
    }
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.bmp')) return 'image/bmp';
    if (lower.endsWith('.txt')) return 'text/plain';
    if (lower.endsWith('.md')) return 'text/markdown';
    if (lower.endsWith('.json')) return 'application/json';
    if (lower.endsWith('.pdf')) return 'application/pdf';
    if (lower.endsWith('.dart')) return 'text/plain';
    if (lower.endsWith('.yaml') || lower.endsWith('.yml')) {
      return 'text/yaml';
    }
    return null;
  }

  Future<void> _pickFileAttachment() async {
    if (!widget.enabled) return;

    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: false,
      type: FileType.any,
    );
    if (result == null || result.files.isEmpty) return;

    final file = result.files.single;
    final filePath = file.path;
    if (filePath == null || filePath.trim().isEmpty) return;

    final mimeType = _guessMimeType(file.name);
    final isImage = _isImageFile(file.name);
    final attachment = PendingAttachment(
      id: IdGenerator.generate(),
      name: file.name,
      path: filePath,
      isImage: isImage,
      mimeType: mimeType,
    );

    final notifier = ref.read(globalAttachmentDraftProvider.notifier);
    notifier.state = [...notifier.state, attachment];
  }

  Future<void> _pickImageFromGallery() async {
    if (!widget.enabled) return;

    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (file == null) return;

    final name = file.name;
    final attachment = PendingAttachment(
      id: IdGenerator.generate(),
      name: name,
      path: file.path,
      isImage: true,
      mimeType: _guessMimeType(name) ?? 'image/*',
    );

    final notifier = ref.read(globalAttachmentDraftProvider.notifier);
    notifier.state = [...notifier.state, attachment];
  }

  void _removeAttachmentMenu() {
    _attachmentMenuOverlay?.remove();
    _attachmentMenuOverlay = null;
  }

  void _toggleAttachmentMenu() {
    if (!widget.enabled) return;

    if (_attachmentMenuOverlay != null) {
      _removeAttachmentMenu();
      return;
    }

    final buttonContext = _addButtonKey.currentContext;
    if (buttonContext == null) return;

    final buttonRenderBox = buttonContext.findRenderObject() as RenderBox;
    final overlayRenderBox =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final buttonOffset = buttonRenderBox.localToGlobal(
      Offset.zero,
      ancestor: overlayRenderBox,
    );
    final buttonSize = buttonRenderBox.size;

    const menuWidth = 148.0;
    const menuItemHeight = 48.0;
    const menuPadding = 8.0;
    final menuHeight = menuPadding * 2 + menuItemHeight * 2;

    final left = buttonOffset.dx;
    final top = buttonOffset.dy - menuHeight - 10;

    _attachmentMenuOverlay = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _removeAttachmentMenu,
                child: const SizedBox.expand(),
              ),
            ),
            Positioned(
              left: left,
              top: top < 0 ? buttonOffset.dy + buttonSize.height + 10 : top,
              child: Material(
                color: Colors.transparent,
                child: _AttachmentPopupMenu(
                  width: menuWidth,
                  onFileTap: () async {
                    _removeAttachmentMenu();
                    await _pickFileAttachment();
                  },
                  onGalleryTap: () async {
                    _removeAttachmentMenu();
                    await _pickImageFromGallery();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_attachmentMenuOverlay!);
  }

  void _removeAttachment(String id) {
    final notifier = ref.read(globalAttachmentDraftProvider.notifier);
    notifier.state = notifier.state.where((item) => item.id != id).toList();
  }

  void _handleSend() {
    if (!widget.enabled) return;
    final content = _controller.text.trim();
    final attachments = ref.read(globalAttachmentDraftProvider);
    if (content.isEmpty && attachments.isEmpty) return;
    _removeAttachmentMenu();
    widget.onSend(content, attachments);
    _clearDraft();
    _clearAttachmentDraft();
  }

  @override
  Widget build(BuildContext context) {
    final attachments = ref.watch(globalAttachmentDraftProvider);
    final hasText = _controller.text.trim().isNotEmpty;
    final hasAttachments = attachments.isNotEmpty;
    final canSend = (hasText || hasAttachments) && widget.enabled;
    final showStopButton = widget.isStreaming && widget.onStop != null;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: bottomInset > 0 ? bottomInset : 0),
      child: SafeArea(
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            color: AppTokens.surface,
            border: Border(
              top: BorderSide(color: AppTokens.border),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(
            AppTokens.space12,
            AppTokens.space10,
            AppTokens.space12,
            AppTokens.space12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (attachments.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppTokens.space10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: AppTokens.space8,
                      runSpacing: AppTokens.space8,
                      children: attachments.map((attachment) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTokens.space10,
                            vertical: AppTokens.space8,
                          ),
                          decoration: BoxDecoration(
                            color: AppTokens.surfaceSoft,
                            borderRadius: AppTokens.brMd,
                            border: Border.all(color: AppTokens.border),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                attachment.isImage
                                    ? Icons.image_outlined
                                    : Icons.attach_file_outlined,
                                size: 16,
                                color: AppTokens.textSecondary,
                              ),
                              const SizedBox(width: AppTokens.space6),
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 180),
                                child: Text(
                                  attachment.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 13,
                                        color: AppTokens.textPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              const SizedBox(width: AppTokens.space6),
                              GestureDetector(
                                onTap: () => _removeAttachment(attachment.id),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: AppTokens.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _SideActionButton(
                    key: _addButtonKey,
                    icon: Icons.add,
                    tooltip: '添加附件',
                    onTap: widget.enabled ? _toggleAttachmentMenu : null,
                  ),
                  const SizedBox(width: AppTokens.space8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTokens.surfaceSoft,
                        borderRadius: AppTokens.brLg,
                        border: Border.all(color: AppTokens.border),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTokens.space12,
                        vertical: AppTokens.space12,
                      ),
                      child: TextField(
                        controller: _controller,
                        minLines: 1,
                        maxLines: 6,
                        enabled: widget.enabled,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTokens.textPrimary,
                            ),
                        decoration: InputDecoration(
                          hintText: widget.hintText,
                          isCollapsed: true,
                          filled: false,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          hintStyle: const TextStyle(
                            color: AppTokens.textTertiary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTokens.space8),
                  if (showStopButton)
                    _PrimaryActionButton(
                      icon: Icons.stop_rounded,
                      tooltip: '停止生成',
                      onTap: widget.enabled
                          ? () {
                              _removeAttachmentMenu();
                              widget.onStop?.call();
                            }
                          : null,
                      isDanger: true,
                    )
                  else
                    _PrimaryActionButton(
                      icon: Icons.arrow_upward_rounded,
                      tooltip: '发送',
                      onTap: canSend ? _handleSend : null,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AttachmentPopupMenu extends StatelessWidget {
  final double width;
  final VoidCallback onFileTap;
  final VoidCallback onGalleryTap;

  const _AttachmentPopupMenu({
    required this.width,
    required this.onFileTap,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTokens.surface,
        borderRadius: AppTokens.brLg,
        border: Border.all(color: AppTokens.border),
        boxShadow: AppTokens.shadowLg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _AttachmentMenuItem(
            icon: Icons.attach_file_outlined,
            label: '文件',
            onTap: onFileTap,
          ),
          const SizedBox(height: 6),
          _AttachmentMenuItem(
            icon: Icons.photo_library_outlined,
            label: '相册',
            onTap: onGalleryTap,
          ),
        ],
      ),
    );
  }
}

class _AttachmentMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _AttachmentMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppTokens.brMd,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: AppTokens.surfaceSoft,
          borderRadius: AppTokens.brMd,
          border: Border.all(color: AppTokens.border),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: AppTokens.textPrimary,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTokens.textPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SideActionButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback? onTap;

  const _SideActionButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppTokens.brMd,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppTokens.surfaceSoft,
            borderRadius: AppTokens.brMd,
            border: Border.all(color: AppTokens.border),
          ),
          child: Icon(
            icon,
            size: 20,
            color: onTap == null
                ? AppTokens.textTertiary
                : AppTokens.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _PrimaryActionButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback? onTap;
  final bool isDanger;

  const _PrimaryActionButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isDanger ? AppTokens.danger : AppTokens.primary;
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppTokens.brMd,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: onTap == null ? AppTokens.border : bg,
            borderRadius: AppTokens.brMd,
            boxShadow: onTap == null ? [] : AppTokens.shadowSm,
          ),
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}