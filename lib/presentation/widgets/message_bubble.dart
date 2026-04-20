import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageBubble extends StatelessWidget {
  final String content;
  final bool isUser;
  final VoidCallback? onCopy;
  final VoidCallback? onRetryReply;
  final VoidCallback? onEdit;

  const MessageBubble({
    super.key,
    required this.content,
    required this.isUser,
    this.onCopy,
    this.onRetryReply,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {    
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.88,
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              color: isUser ? CupertinoColors.systemBlue : CupertinoColors.systemBackground,
              child: MarkdownBody(
                  data: content,
                  selectable: true,
                  styleSheet: MarkdownStyleSheet.fromCupertinoTheme(CupertinoTheme.of(context)),
                ),
            ),
            if (onCopy != null || onRetryReply != null || onEdit != null) ...[
              const SizedBox(height: 6),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (onCopy != null)
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: onCopy,
                      child: const Icon(CupertinoIcons.doc_on_doc),
                    ),
                  if (onEdit != null)
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: onEdit,
                      child: const Icon(CupertinoIcons.pencil),
                    ),
                  if (onRetryReply != null)
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: onRetryReply,
                      child: const Icon(CupertinoIcons.arrow_2_circlepath),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}