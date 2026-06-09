import 'dart:io';

import 'package:aiservice/presentation/models/input_state.dart';
import 'package:aiservice/presentation/widgets/common/app_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../models/pending_attachment.dart';
import '../pages/image_attachment_viewer_page.dart';
import '../pages/text_attachment_viewer_page.dart';
import '../providers/input_notifier.dart';

class InputBar extends ConsumerStatefulWidget {
  final Future<void> Function(String text, List<PendingAttachment> attachments) onSend;
  final VoidCallback? onStop;
  final bool isIncomplete;
  final String hintText;

  const InputBar({
    super.key,
    required this.onSend,
    this.onStop,
    this.isIncomplete = false,
    this.hintText = '输入消息...',
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

  void _addPendingAttachment({
    required String name,
    required String path,
    required bool isImage,
    required String mimeType,
  }) {
    final attachment = PendingAttachment(
      id: const Uuid().v4(),
      name: name,
      path: path,
      isImage: isImage,
      mimeType: mimeType,
    );
    ref.read(inputStateProvider.notifier).addAttachment(attachment);
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

  bool _isTextFile(String name) {
    final lower = name.toLowerCase();
    return lower.endsWith('.txt') ||
        lower.endsWith('.md') ||
        lower.endsWith('.json') ||
        lower.endsWith('.dart') ||
        lower.endsWith('.yaml') ||
        lower.endsWith('.yml') ||
        lower.endsWith('.log') ||
        lower.endsWith('.csv');
  }

  String _mimeForImage(String fileName) {
    final lower = fileName.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.bmp')) return 'image/bmp';
    return 'image/png';
  }

  String _mimeForText(String fileName) {
    return 'text/plain';
  }

  Future<void> _pickFileAttachment() async {
    final result = await FilePicker.pickFiles(
      allowMultiple: false,
      withData: false,
      type: FileType.any,
    );
    if (result == null || result.files.isEmpty) return;
    final file = result.files.single;
    final filePath = file.path;
    if (filePath == null || filePath.trim().isEmpty) return;

    final isImage = _isImageFile(file.name);
    final isText = _isTextFile(file.name);

    if (!isImage && !isText) {
      if (mounted) {
        AppToast.show('仅支持图片和文本文件（.txt, .md, .json, .dart, .yaml 等）');
      }
      return;
    }

    final mimeType = isImage ? _mimeForImage(file.name) : _mimeForText(file.name);

    _addPendingAttachment(
      name: file.name,
      path: filePath,
      isImage: isImage,
      mimeType: mimeType,
    );
  }

  Future<void> _pickImageFromGallery() async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (file == null) return;

    final mimeType = file.mimeType ?? _mimeForImage(file.name);

    _addPendingAttachment(
      name: file.name,
      path: file.path,
      isImage: true,
      mimeType: mimeType,
    );
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

  String _sanitizeInput(String input) {
    var result = input.replaceAll('\uFEFF', '');               // 移除 BOM
    result = result.replaceAll(RegExp(r'[\u200B\u200C\u200D]'), ''); // 移除零宽字符
    result = result.replaceAll('\r\n', '\n').replaceAll('\r', '\n');   // 统一换行符
    return result;
  }

  Future<void> _handleSend() async {
    FocusScope.of(context).unfocus();

    final state = ref.read(inputStateProvider);
    if (!state.canSend) return;

    final sanitizedText = _sanitizeInput(state.text);

    try {
      await widget.onSend(sanitizedText, state.attachments);
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
        color: CupertinoDynamicColor.resolve(CupertinoColors.systemGroupedBackground, context),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
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
                      final file = File(attachment.path);
                      if (attachment.isImage) {
                        return _PendingImageAttachment(
                          attachment: attachment,
                          file: file,
                          onRemove: () => _removeAttachment(attachment.id),
                        );
                      } else {
                        return _PendingFileAttachment(
                          attachment: attachment,
                          file: file,
                          onRemove: () => _removeAttachment(attachment.id),
                        );
                      }
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CupertinoTextField(
                      controller: _controller,
                      minLines: 1,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      placeholder: widget.hintText,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onChanged: (value) {
                        ref.read(inputStateProvider.notifier).updateText(value);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (showStopButton)
                  CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    borderRadius: BorderRadius.circular(8),
                    onPressed: widget.onStop,
                    child: const Icon(CupertinoIcons.stop_fill, size: 20),
                  )
                else
                  CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    borderRadius: BorderRadius.circular(8),
                    onPressed: canSend ? _handleSend : null,
                    child: const Icon(CupertinoIcons.arrow_up, size: 20),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ================= 新增的预览组件 =================

class _PendingImageAttachment extends StatelessWidget {
  final PendingAttachment attachment;
  final File file;
  final VoidCallback onRemove;

  const _PendingImageAttachment({
    required this.attachment,
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 点击图片进行全屏预览
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => ImageAttachmentViewerPage(
                  title: attachment.name,
                  filePath: file.path,
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              file,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 60,
                  color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
                  child: const Icon(CupertinoIcons.photo, color: CupertinoColors.systemGrey),
                );
              },
            ),
          ),
        ),
        // 右上角删除按钮
        Positioned(
          top: 2,
          right: 2,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(2),
              child: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: CupertinoColors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PendingFileAttachment extends StatelessWidget {
  final PendingAttachment attachment;
  final File file;
  final VoidCallback onRemove;

  const _PendingFileAttachment({
    required this.attachment,
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 点击文件名及图标区域进行文本预览
          Flexible(
            child: GestureDetector(
              onTap: () {
                // 上游已做拦截，走到这里的必然是文本文件，直接跳转预览
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_) => TextAttachmentViewerPage(
                      title: attachment.name,
                      filePath: file.path,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(CupertinoIcons.doc_text, size: 16),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      attachment.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          // 右侧独立的删除按钮
          GestureDetector(
            onTap: onRemove,
            child: const Icon(CupertinoIcons.xmark_circle_fill, size: 16),
          ),
        ],
      ),
    );
  }
}