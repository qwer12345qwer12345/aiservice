import 'package:aiservice/presentation/models/input_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../models/pending_attachment.dart';
import '../providers/input_notifier.dart'; // ✅ 导入新的 Provider

class InputBar extends ConsumerStatefulWidget {
  final Future<void> Function(String text, List<PendingAttachment> attachments)
      onSend;
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
    // ✅ 仅初始化 Controller，不读取旧 Draft
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ✅ 辅助方法：判断是否为图片文件
  bool _isImageFile(String name) {
    final lower = name.toLowerCase();
    return lower.endsWith('.png') ||
        lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.gif') ||
        lower.endsWith('.webp') ||
        lower.endsWith('.bmp');
  }

  // ✅ 辅助方法：猜测 MIME 类型
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

  // ✅ 添加文件附件
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
    // ✅ 调用 Notifier 添加附件
    ref.read(inputStateProvider.notifier).addAttachment(attachment);
  }

  // ✅ 添加图片附件
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
    // ✅ 调用 Notifier 添加附件
    ref.read(inputStateProvider.notifier).addAttachment(attachment);
  }

  // ✅ 移除附件
  void _removeAttachment(String id) {
    ref.read(inputStateProvider.notifier).removeAttachment(id);
  }

  // ✅ 显示附件选择菜单
  Future<void> _showAddAttachmentSheet() async {
    FocusScope.of(context).unfocus();
    
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
              if (widget.allowImages)
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
    // ✅ 监听文本变化，单向同步到 Controller
    ref.listen<String>(
      inputStateProvider.select((s) => s.text),
      (previous, next) {
        // 避免不必要的更新和光标跳动
        if (next != _controller.text) {
          _controller.value = TextEditingValue(
            text: next,
            selection: TextSelection.collapsed(offset: next.length),
            composing: TextRange.empty,
          );
        }
      },
    );

    // ✅ 读取状态
    final inputState = ref.watch(inputStateProvider);
    final attachments = inputState.attachments;
    final canSend = inputState.canSend;
    final showStopButton = widget.isIncomplete;

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
                    onPressed: _showAddAttachmentSheet, // ✅ 始终可点击
                    icon: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      minLines: 1,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        isDense: true,
                      ),
                      // ✅ 用户输入时更新 Provider
                      onChanged: (value) {
                        ref
                            .read(inputStateProvider.notifier)
                            .updateText(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (showStopButton)
                    IconButton.filledTonal(
                      tooltip: '停止生成',
                      onPressed: widget.onStop, // ✅ 停止按钮
                      icon: const Icon(Icons.stop_rounded),
                    )
                  else
                    IconButton.filled(
                      tooltip: '发送',
                      onPressed: canSend ? _handleSend : null, // ✅ 发送按钮
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