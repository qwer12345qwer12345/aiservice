import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/models/attachment.dart';
import '../../di/providers.dart';
import '../pages/image_attachment_viewer_page.dart';
import '../pages/text_attachment_viewer_page.dart';
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

class _ImageAttachmentThumb extends ConsumerWidget {
  final Attachment attachment;
  const _ImageAttachmentThumb({required this.attachment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.read(conversationRepositoryProvider).getAttachment(attachment.relativePath);

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (_) => ImageAttachmentViewerPage(
            title: attachment.name,
            filePath: file.path,
          ),
        ),
      ),
      onLongPress: () => Share.shareXFiles([XFile(file.path)], text: attachment.name),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 108,
          height: 108,
          child: Image.file(
            file,
            fit: BoxFit.cover,
            gaplessPlayback: true,
            errorBuilder: (_, _, _) => const Center(child: Icon(CupertinoIcons.photo)),
          ),
        ),
      ),
    );
  }
}

class _FileAttachmentChip extends ConsumerWidget {
  final Attachment attachment;
  final bool isText;
  const _FileAttachmentChip({required this.attachment, required this.isText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.read(conversationRepositoryProvider).getAttachment(attachment.relativePath);
    final leadingIcon = isText ? CupertinoIcons.doc_text : CupertinoIcons.doc;

    return GestureDetector(
      onTap: () {
        if (isText) {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (_) => TextAttachmentViewerPage(
                title: attachment.name,
                filePath: file.path,
              ),
            ),
          );
        } else {
          AppToast.show('该文件暂不支持直接预览，请长按进行分享');
        }
      },
      onLongPress: () => Share.shareXFiles([XFile(file.path)], text: attachment.name),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(leadingIcon, size: 16),
            const SizedBox(width: 6),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 180),
              child: Text(attachment.name, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}