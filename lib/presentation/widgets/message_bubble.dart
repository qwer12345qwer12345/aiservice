import 'package:flutter/material.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final bubbleColor =
        isUser ? colorScheme.secondaryContainer : colorScheme.surfaceContainerHigh;
    final textColor =
        isUser ? colorScheme.onSecondaryContainer : colorScheme.onSurface;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.88,
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Card(
              color: bubbleColor,
              elevation: 0,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: MarkdownBody(
                  data: content,
                  selectable: true,
                  styleSheet: MarkdownStyleSheet(
                    p: TextStyle(
                      fontSize: 14,
                      height: 1.7,
                      color: textColor,
                    ),
                    h1: TextStyle(
                      fontSize: 22,
                      height: 1.35,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    h2: TextStyle(
                      fontSize: 18,
                      height: 1.4,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    h3: TextStyle(
                      fontSize: 16,
                      height: 1.45,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    code: TextStyle(
                      fontSize: 13,
                      fontFamily: 'monospace',
                      color: textColor,
                    ),
                    codeblockPadding: const EdgeInsets.all(12),
                    codeblockDecoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    blockSpacing: 10,
                    listBullet: TextStyle(color: textColor),
                    strong: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    em: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: textColor,
                    ),
                    a: TextStyle(
                      color: colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                    blockquote: TextStyle(
                      color: textColor.withValues(alpha: 0.85),
                      height: 1.6,
                    ),
                    blockquoteDecoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border(
                        left: BorderSide(
                          color: colorScheme.outline,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (onCopy != null || onRetryReply != null || onEdit != null) ...[
              const SizedBox(height: 6),
              Wrap(
                spacing: 4,
                children: [
                  if (onCopy != null)
                    IconButton(
                      tooltip: '复制',
                      onPressed: onCopy,
                      icon: const Icon(Icons.content_copy_outlined),
                    ),
                  if (onEdit != null)
                    IconButton(
                      tooltip: '编辑后发送',
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit_outlined),
                    ),
                  if (onRetryReply != null)
                    IconButton(
                      tooltip: '重新生成',
                      onPressed: onRetryReply,
                      icon: const Icon(Icons.refresh_outlined),
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