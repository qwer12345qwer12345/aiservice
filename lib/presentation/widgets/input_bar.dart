import 'package:aiservice/presentation/models/input_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../models/pending_attachment.dart';
import '../providers/input_notifier.dart';

class InputBar extends ConsumerStatefulWidget {
  final Future<void> Function(String text, List<PendingAttachment> attachments) onSend;
  final VoidCallback? onStop;
  final bool isIncomplete;
  final String hintText;
  final bool allowImages;

  const InputBar({
    super.key,
    required this.onSend,
    this.onStop,
    this.isIncomplete = false,
    this.hintText = '输入消息...',
    this.allowImages = false,
  });

  @override
  ConsumerState<InputBar> createState() => _InputBarState();
}

class _InputBarState extends ConsumerState<InputBar> {
  late final TextEditingController _controller;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.bmp')) return 'image/bmp';
    if (lower.endsWith('.txt')) return 'text/plain';
    if (lower.endsWith('.md')) return 'text/markdown';
    if (lower.endsWith('.json')) return 'application/json';
    if (lower.endsWith('.pdf')) return 'application/pdf';
    if (lower.endsWith('.dart')) return 'text/plain';
    if (lower.endsWith('.yaml') || lower.endsWith('.yml')) return 'text/yaml';
    return null;
  }

  Future<void> _pickFileAttachment() async {
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
      id: const Uuid().v4(),
      name: file.name,
      path: filePath,
      isImage: isImage,
      mimeType: mimeType,
    );
    ref.read(inputStateProvider.notifier).addAttachment(attachment);
  }

  Future<void> _pickImageFromGallery() async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (file == null) return;
    final name = file.name;
    final attachment = PendingAttachment(
      id: const Uuid().v4(),
      name: name,
      path: file.path,
      isImage: true,
      mimeType: _guessMimeType(name) ?? 'image/*',
    );
    ref.read(inputStateProvider.notifier).addAttachment(attachment);
  }

  void _removeAttachment(String id) {
    ref.read(inputStateProvider.notifier).removeAttachment(id);
  }

  Future<void> _showAddAttachmentSheet() async {
    FocusScope.of(context).unfocus();
    
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop();
                _pickFileAttachment();
              },
              child: const Text('文件'),
            ),
            if (widget.allowImages)
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  _pickImageFromGallery();
                },
                child: const Text('相册'),
              ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
        );
      },
    );
  }

  Future<void> _handleSend() async {
    FocusScope.of(context).unfocus();

    final state = ref.read(inputStateProvider);
    if (!state.canSend) return;

    try {
      await widget.onSend(state.text, state.attachments);
      ref.read(inputStateProvider.notifier).clear();
    } catch (e) {
      // 发送失败，保持输入内容和附件不变
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String>(
      inputStateProvider.select((s) => s.text),
      (previous, next) {
        if (next != _controller.text) {
          _controller.value = TextEditingValue(
            text: next,
            selection: TextSelection.collapsed(offset: next.length),
            composing: TextRange.empty,
          );
        }
      },
    );

    final inputState = ref.watch(inputStateProvider);
    final attachments = inputState.attachments;
    final canSend = inputState.canSend;
    final showStopButton = widget.isIncomplete;

    return SafeArea(
      top: false,
      child: Container(
        color: CupertinoColors.systemBackground,
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
                      return CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              attachment.isImage
                                  ? CupertinoIcons.photo
                                  : CupertinoIcons.doc,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 180),
                              child: Text(
                                attachment.name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () => _removeAttachment(attachment.id),
                              child: const Icon(CupertinoIcons.xmark_circle_fill, size: 18),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: _showAddAttachmentSheet,
                  child: const Icon(CupertinoIcons.add),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CupertinoTextField(
                    controller: _controller,
                    minLines: 1,
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,
                    placeholder: widget.hintText,
                    onChanged: (value) {
                      ref.read(inputStateProvider.notifier).updateText(value);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                if (showStopButton)
                  CupertinoButton.filled(
                    onPressed: widget.onStop,
                    child: const Icon(CupertinoIcons.stop_fill),
                  )
                else
                  CupertinoButton.filled(
                    onPressed: canSend ? _handleSend : null,
                    child: const Icon(CupertinoIcons.arrow_up),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}