import 'package:flutter/material.dart';
import '../../core/models/attachment.dart';
import '../themes/app_tokens.dart';

class AttachmentList extends StatelessWidget {
  final List<Attachment> attachments;

  const AttachmentList({
    super.key,
    required this.attachments,
  });

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: AppTokens.space8,
      runSpacing: AppTokens.space8,
      children: attachments.map((attachment) {
        return _AttachmentChip(attachment: attachment);
      }).toList(),
    );
  }
}

class _AttachmentChip extends StatelessWidget {
  final Attachment attachment;

  const _AttachmentChip({
    required this.attachment,
  });

  @override
  Widget build(BuildContext context) {
    final icon =
        attachment.isImage ? Icons.image_outlined : Icons.attach_file_outlined;

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
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppTokens.surface,
              borderRadius: AppTokens.brSm,
              border: Border.all(color: AppTokens.border),
            ),
            child: Icon(
              icon,
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
        ],
      ),
    );
  }
}