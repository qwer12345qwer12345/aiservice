import 'package:flutter/cupertino.dart';

class AppPageScaffold extends StatelessWidget {
  final ObstructingPreferredSizeWidget? navigationBar;
  final Widget body;
  final bool useSafeArea;

  const AppPageScaffold({
    super.key,
    this.navigationBar,
    required this.body,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoDynamicColor.resolve(CupertinoColors.systemGroupedBackground, context),
      navigationBar: navigationBar,

      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        
        child: SafeArea(child: body),
      ),
    );
  }
}