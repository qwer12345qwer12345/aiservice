import 'package:flutter/material.dart';
import '../../themes/app_tokens.dart';

class AppPageScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool useSafeArea;

  const AppPageScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = useSafeArea ? SafeArea(child: body) : body;

    return Scaffold(
      backgroundColor: backgroundColor ?? AppTokens.bg,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: content,
    );
  }
}