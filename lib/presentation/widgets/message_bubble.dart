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

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              onCopy?.call();
            },
            child: const Text('复制'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              onRetryReply?.call();
            },
            child: const Text('重试回复'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isUser
        ? CupertinoColors.systemBlue
        : CupertinoColors.systemBackground; // AI 消息白色背景

    final textColor = isUser
        ? CupertinoColors.white
        : CupertinoColors.label;

    return GestureDetector(
      onLongPress: () => _showActionSheet(context),
      child: Container(
        width: isUser ? null : double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: MarkdownBody(
          data: content,
          selectable: true,
          styleSheet: MarkdownStyleSheet.fromCupertinoTheme(
            CupertinoTheme.of(context),
          ).copyWith(
            p: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}