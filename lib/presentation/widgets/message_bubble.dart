import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../themes/app_tokens.dart';

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
    final bubbleColor = isUser ? AppTokens.userBubble : AppTokens.aiBubble;
    final borderColor =
        isUser ? const Color(0xFFC9E0FF) : AppTokens.border;
    final textColor =
        isUser ? AppTokens.userBubbleText : AppTokens.textPrimary;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.88,
        ),
        margin: const EdgeInsets.symmetric(vertical: AppTokens.space4),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTokens.space14,
                vertical: AppTokens.space12,
              ),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(AppTokens.radiusLg),
                  topRight: const Radius.circular(AppTokens.radiusLg),
                  bottomLeft: Radius.circular(
                    isUser ? AppTokens.radiusLg : AppTokens.radiusSm,
                  ),
                  bottomRight: Radius.circular(
                    isUser ? AppTokens.radiusSm : AppTokens.radiusLg,
                  ),
                ),
                border: Border.all(color: borderColor),
                boxShadow: isUser ? [] : AppTokens.shadowSm,
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
                    backgroundColor: isUser
                        ? const Color(0xFFDCEEFF)
                        : AppTokens.surfaceMuted,
                  ),
                  codeblockPadding: const EdgeInsets.all(12),
                  codeblockDecoration: BoxDecoration(
                    color: isUser
                        ? const Color(0xFFDCEEFF)
                        : AppTokens.surfaceSoft,
                    borderRadius: AppTokens.brSm,
                    border: Border.all(
                      color: isUser
                          ? const Color(0xFFC9E0FF)
                          : AppTokens.border,
                    ),
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
                    color: isUser ? AppTokens.info : AppTokens.primary,
                    decoration: TextDecoration.underline,
                  ),
                  blockquote: TextStyle(
                    color: isUser
                        ? AppTokens.userBubbleText
                        : AppTokens.textSecondary,
                    height: 1.6,
                  ),
                  blockquoteDecoration: BoxDecoration(
                    color: isUser
                        ? const Color(0xFFDCEEFF)
                        : AppTokens.surfaceMuted,
                    borderRadius: AppTokens.brSm,
                    border: Border(
                      left: BorderSide(
                        color: isUser
                            ? const Color(0xFF9FCBFF)
                            : AppTokens.borderStrong,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (onCopy != null || onRetryReply != null || onEdit != null) ...[
              const SizedBox(height: AppTokens.space6),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (onCopy != null)
                    _ActionIconButton(
                      icon: Icons.content_copy_outlined,
                      tooltip: '复制',
                      onTap: onCopy!,
                    ),
                  if (onEdit != null) ...[
                    const SizedBox(width: AppTokens.space4),
                    _ActionIconButton(
                      icon: Icons.edit_outlined,
                      tooltip: '编辑后发送',
                      onTap: onEdit!,
                    ),
                  ],
                  if (onRetryReply != null) ...[
                    const SizedBox(width: AppTokens.space4),
                    _ActionIconButton(
                      icon: Icons.refresh_outlined,
                      tooltip: '重新生成',
                      onTap: onRetryReply!,
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ActionIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _ActionIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppTokens.brSm,
          child: Container(
            padding: const EdgeInsets.all(8),
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
        ),
      ),
    );
  }
}