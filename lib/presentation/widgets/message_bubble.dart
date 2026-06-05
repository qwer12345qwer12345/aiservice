import 'package:flutter/cupertino.dart';
import 'markdown_widget.dart';

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
    final bubbleColor = isUser
        ? CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context)
        : CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context);

    final textColor = isUser
        ? CupertinoDynamicColor.resolve(CupertinoColors.white, context)
        : CupertinoDynamicColor.resolve(CupertinoColors.label, context);

    final actions = <Widget>[
      CupertinoContextMenuAction(
        child: const Text('复制'),
        onPressed: () {
          Navigator.of(context).pop();
          onCopy?.call();
        },
      ),
      if (onRetryReply != null)
        CupertinoContextMenuAction(
          child: const Text('重试回复'),
          onPressed: () {
            Navigator.of(context).pop();
            onRetryReply!();
          },
        ),
    ];

    // 获取屏幕可用宽度（减去左右边距，与原气泡逻辑一致）
    final maxWidth = MediaQuery.of(context).size.width * 0.88;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: CupertinoContextMenu(
        actions: actions,
        child: Container(
          // 移除 width 属性，让 Container 由父级 ConstrainedBox 约束
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
    );
  }
}