import 'package:flutter/cupertino.dart';
import 'markdown_widget.dart';

class MessageBubble extends StatelessWidget {
  final String content;
  final bool isUser;
  final VoidCallback onCopy;
  final VoidCallback onRetryReply;
  final VoidCallback? onEdit;

  const MessageBubble({
    super.key,
    required this.content,
    required this.isUser,
    required this.onCopy,
    required this.onRetryReply,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isUser
        ? CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context)
        : CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context);

    final textColor = isUser
        ? CupertinoDynamicColor.resolve(CupertinoColors.white, context)
        : CupertinoDynamicColor.resolve(CupertinoColors.label, context);

    final maxWidth = MediaQuery.of(context).size.width * 0.88;

    return Column(
      crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: MarkdownWidget(
              data: content,
              baseStyle: TextStyle(color: textColor),
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 8, left: 4, right: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                onPressed: onCopy,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.doc_on_doc, size: 14),
                  ],
                ),
              ),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                onPressed: onRetryReply,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.arrow_clockwise, size: 14),
                  ],
                ),
              ),
              if (onEdit != null)
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  onPressed: onEdit,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(CupertinoIcons.pencil, size: 14),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}