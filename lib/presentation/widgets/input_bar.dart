import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/utils/id_generator.dart';
import '../models/pending_attachment.dart';
import '../providers/input_draft_provider.dart';

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
  final ImagePicker _imagePicker = ImagePicker();
  bool _isSyncingText = false;

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

  void _removeAttachment(String id) {
    final notifier = ref.read(globalAttachmentDraftProvider.notifier);
    notifier.state = notifier.state.where((item) => item.id != id).toList();
  }

  Future<void> _showAddAttachmentSheet() async {
    if (!widget.enabled) return;

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.attach_file_outlined),
                title: const Text('文件'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickFileAttachment();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('相册'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickImageFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleSend() {
    if (!widget.enabled) return;
    final content = _controller.text.trim();
    final attachments = ref.read(globalAttachmentDraftProvider);
    if (content.isEmpty && attachments.isEmpty) return;

    widget.onSend(content, attachments);
    ref.invalidate(globalInputDraftProvider);
    ref.invalidate(globalAttachmentDraftProvider);
  }

  @override
  Widget build(BuildContext context) {
    final attachments = ref.watch(globalAttachmentDraftProvider);
    final hasText = _controller.text.trim().isNotEmpty;
    final hasAttachments = attachments.isNotEmpty;
    final canSend = (hasText || hasAttachments) && widget.enabled;
    final showStopButton = widget.isStreaming && widget.onStop != null;

    return SafeArea(
      top: false,
      child: Material(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (attachments.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: attachments.map((attachment) {
                        return InputChip(
                          avatar: Icon(
                            attachment.isImage
                                ? Icons.image_outlined
                                : Icons.attach_file_outlined,
                            size: 18,
                          ),
                          label: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 180),
                            child: Text(
                              attachment.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          onDeleted: () => _removeAttachment(attachment.id),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: '添加附件',
                    onPressed: widget.enabled ? _showAddAttachmentSheet : null,
                    icon: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      minLines: 1,
                      maxLines: 6,
                      enabled: widget.enabled,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (showStopButton)
                    IconButton.filledTonal(
                      tooltip: '停止生成',
                      onPressed: widget.enabled ? widget.onStop : null,
                      icon: const Icon(Icons.stop_rounded),
                    )
                  else
                    IconButton.filled(
                      tooltip: '发送',
                      onPressed: canSend ? _handleSend : null,
                      icon: const Icon(Icons.arrow_upward_rounded),
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