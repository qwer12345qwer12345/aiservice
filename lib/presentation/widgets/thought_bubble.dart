import 'package:flutter/material.dart';
import '../themes/app_tokens.dart';

class ThoughtBubble extends StatelessWidget {
  final String content;

  const ThoughtBubble({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final text = content.trim();
    if (text.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppTokens.space12),
      padding: const EdgeInsets.all(AppTokens.space12),
      decoration: BoxDecoration(
        color: AppTokens.thoughtBubble,
        borderRadius: AppTokens.brMd,
        border: Border.all(
          color: AppTokens.warning.withOpacity(0.18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.psychology_alt_outlined,
                size: 16,
                color: AppTokens.warning,
              ),
              const SizedBox(width: AppTokens.space6),
              Text(
                '推理过程',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTokens.warning,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppTokens.space8),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  height: 1.65,
                  color: AppTokens.textSecondary,
                ),
          ),
        ],
      ),
    );
  }
}