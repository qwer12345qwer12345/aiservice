import 'package:flutter/material.dart';
import '../../themes/app_tokens.dart';

class AppBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final IconData? icon;

  const AppBadge({
    super.key,
    required this.text,
    required this.color,
    required this.backgroundColor,
    this.icon,
  });

  factory AppBadge.primary(String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: AppTokens.primary,
      backgroundColor: AppTokens.primarySoft,
      icon: icon,
    );
  }

  factory AppBadge.success(String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: AppTokens.success,
      backgroundColor: AppTokens.successSoft,
      icon: icon,
    );
  }

  factory AppBadge.warning(String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: AppTokens.warning,
      backgroundColor: AppTokens.warningSoft,
      icon: icon,
    );
  }

  factory AppBadge.info(String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: AppTokens.info,
      backgroundColor: AppTokens.infoSoft,
      icon: icon,
    );
  }

  factory AppBadge.danger(String text, {IconData? icon}) {
    return AppBadge(
      text: text,
      color: AppTokens.danger,
      backgroundColor: AppTokens.dangerSoft,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: color.withValues(alpha: 0.20),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              height: 1.1,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}