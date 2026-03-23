import 'package:flutter/material.dart';
import '../../themes/app_tokens.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Border? border;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppTokens.space16),
    this.margin,
    this.color,
    this.borderRadius,
    this.boxShadow,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? AppTokens.surface,
        borderRadius: borderRadius ?? AppTokens.brLg,
        border: border ?? Border.all(color: AppTokens.border),
        boxShadow: boxShadow ?? AppTokens.shadowMd,
      ),
      child: child,
    );
  }
}