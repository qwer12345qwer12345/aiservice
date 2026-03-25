import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/models/attachment.dart';
import '../pages/text_attachment_viewer_page.dart';
import '../providers/attachment_bytes_provider.dart';
import 'common/app_toast.dart';

class AttachmentList extends ConsumerWidget {
  final List<Attachment> attachments;
  final bool rightAligned;

  const AttachmentList({
    super.key,
    required this.attachments,
    this.rightAligned = true,
  });

  bool _isTextAttachment(Attachment attachment) {
    final lowerName = attachment.name.toLowerCase();
    final mime = (attachment.mimeType ?? '').toLowerCase();
    return mime.startsWith('text/') ||
        mime == 'application/json' ||
        lowerName.endsWith('.md') ||
        lowerName.endsWith('.txt') ||
        lowerName.endsWith('.json') ||
        lowerName.endsWith('.dart') ||
        lowerName.endsWith('.yaml') ||
        lowerName.endsWith('.yml') ||
        lowerName.endsWith('.log') ||
        lowerName.endsWith('.csv');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (attachments.isEmpty) return const SizedBox.shrink();

    return Align(
      alignment: rightAligned ? Alignment.centerRight : Alignment.centerLeft,
      child: Wrap(
        alignment: rightAligned ? WrapAlignment.end : WrapAlignment.start,
        spacing: 8,
        runSpacing: 8,
        children: attachments.map((attachment) {
          if (attachment.isImage) {
            return _ImageAttachmentThumb(attachment: attachment);
          }
          return _FileAttachmentChip(
            attachment: attachment,
            isText: _isTextAttachment(attachment),
          );
        }).toList(),
      ),
    );
  }
}

class _AttachmentActionHelper {
  static Future<void> shareAttachmentFromBytes(
    Attachment attachment,
    Uint8List bytes,
  ) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/${attachment.name}');
      await file.writeAsBytes(bytes, flush: true);
      await Share.shareXFiles(
        [XFile(file.path)],
        text: attachment.name,
      );
    } catch (e) {
      await AppToast.show('共享文件失败：$e');
    }
  }

  static Future<void> previewImage(
    BuildContext context,
    Uint8List bytes,
  ) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: Stack(
            children: [
              InteractiveViewer(
                minScale: 0.5,
                maxScale: 4,
                child: Center(
                  child: Image.memory(
                    bytes,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> openTextViewer(
    BuildContext context,
    String title,
    Uint8List bytes,
  ) async {
    final text = utf8.decode(bytes, allowMalformed: true);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TextAttachmentViewerPage(
          title: title,
          content: text,
        ),
      ),
    );
  }
}

class _ImageAttachmentThumb extends ConsumerWidget {
  final Attachment attachment;

  const _ImageAttachmentThumb({
    required this.attachment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bytesAsync = ref.watch(
      attachmentBytesProvider(attachment.relativePath),
    );

    return bytesAsync.when(
      loading: () => const SizedBox(
        width: 108,
        height: 108,
        child: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (e, st) => const SizedBox(
        width: 108,
        height: 108,
        child: Center(
          child: Icon(Icons.broken_image_outlined),
        ),
      ),
      data: (bytes) {
        return InkWell(
          onTap: () => _AttachmentActionHelper.previewImage(context, bytes),
          onLongPress: () =>
              _AttachmentActionHelper.shareAttachmentFromBytes(
            attachment,
            bytes,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 108,
              height: 108,
              child: Image.memory(
                bytes,
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FileAttachmentChip extends ConsumerWidget {
  final Attachment attachment;
  final bool isText;

  const _FileAttachmentChip({
    required this.attachment,
    required this.isText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bytesAsync = ref.watch(
      attachmentBytesProvider(attachment.relativePath),
    );

    final leadingIcon =
        isText ? Icons.description_outlined : Icons.attach_file_outlined;

    return bytesAsync.when(
      loading: () => Chip(
        avatar: Icon(leadingIcon, size: 18),
        label: Text(
          attachment.name,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      error: (e, st) => Chip(
        avatar: const Icon(Icons.error_outline, size: 18),
        label: Text(
          attachment.name,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      data: (bytes) {
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () async {
            if (isText) {
              await _AttachmentActionHelper.openTextViewer(
                context,
                attachment.name,
                bytes,
              );
              return;
            }
            await AppToast.show('该文件暂不支持直接预览，请长按进行分享');
          },
          onLongPress: () =>
              _AttachmentActionHelper.shareAttachmentFromBytes(
            attachment,
            bytes,
          ),
          child: Chip(
            avatar: Icon(leadingIcon, size: 18),
            label: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 180),
              child: Text(
                attachment.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}