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
import '../themes/app_tokens.dart';

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
        spacing: AppTokens.space8,
        runSpacing: AppTokens.space8,
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
    BuildContext context,
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
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('共享文件失败：$e')),
      );
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
          insetPadding: const EdgeInsets.all(16),
          backgroundColor: Colors.black,
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
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
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
      loading: () => Container(
        width: 108,
        height: 108,
        decoration: BoxDecoration(
          color: AppTokens.surfaceSoft,
          borderRadius: AppTokens.brMd,
          border: Border.all(color: AppTokens.border),
        ),
        child: const Center(
          child: SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
      error: (e, st) => Container(
        width: 108,
        height: 108,
        decoration: BoxDecoration(
          color: AppTokens.surfaceSoft,
          borderRadius: AppTokens.brMd,
          border: Border.all(color: AppTokens.border),
        ),
        child: const Center(
          child: Icon(
            Icons.broken_image_outlined,
            color: AppTokens.textTertiary,
          ),
        ),
      ),
      data: (bytes) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _AttachmentActionHelper.previewImage(context, bytes),
            onLongPress: () => _AttachmentActionHelper.shareAttachmentFromBytes(
              context,
              attachment,
              bytes,
            ),
            borderRadius: AppTokens.brMd,
            child: Container(
              width: 108,
              height: 108,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: AppTokens.brMd,
                border: Border.all(color: AppTokens.border),
                boxShadow: AppTokens.shadowSm,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.memory(
                    bytes,
                    fit: BoxFit.cover,
                    gaplessPlayback: true,
                  ),
                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Icon(
                        Icons.open_in_full_outlined,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
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
    final trailingIcon =
        isText ? Icons.open_in_new_outlined : Icons.more_horiz;

    return bytesAsync.when(
      loading: () => Container(
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
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppTokens.surface,
                borderRadius: AppTokens.brSm,
                border: Border.all(color: AppTokens.border),
              ),
              child: Icon(
                leadingIcon,
                size: 16,
                color: AppTokens.textSecondary,
              ),
            ),
            const SizedBox(width: AppTokens.space8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 180),
              child: Text(
                attachment.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 13,
                      color: AppTokens.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            const SizedBox(width: AppTokens.space8),
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ],
        ),
      ),
      error: (e, st) => Material(
        color: Colors.transparent,
        child: InkWell(
          onLongPress: null,
          borderRadius: AppTokens.brMd,
          child: Container(
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
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppTokens.surface,
                    borderRadius: AppTokens.brSm,
                    border: Border.all(color: AppTokens.border),
                  ),
                  child: const Icon(
                    Icons.error_outline,
                    size: 16,
                    color: AppTokens.danger,
                  ),
                ),
                const SizedBox(width: AppTokens.space8),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 180),
                  child: Text(
                    attachment.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 13,
                          color: AppTokens.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      data: (bytes) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              if (isText) {
                await _AttachmentActionHelper.openTextViewer(
                  context,
                  attachment.name,
                  bytes,
                );
                return;
              }
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('该文件暂不支持直接预览，请长按进行分享'),
                ),
              );
            },
            onLongPress: () => _AttachmentActionHelper.shareAttachmentFromBytes(
              context,
              attachment,
              bytes,
            ),
            borderRadius: AppTokens.brMd,
            child: Container(
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
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppTokens.surface,
                      borderRadius: AppTokens.brSm,
                      border: Border.all(color: AppTokens.border),
                    ),
                    child: Icon(
                      leadingIcon,
                      size: 16,
                      color: AppTokens.textSecondary,
                    ),
                  ),
                  const SizedBox(width: AppTokens.space8),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 180),
                    child: Text(
                      attachment.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 13,
                            color: AppTokens.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  const SizedBox(width: AppTokens.space6),
                  Icon(
                    trailingIcon,
                    size: 15,
                    color: AppTokens.textTertiary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}