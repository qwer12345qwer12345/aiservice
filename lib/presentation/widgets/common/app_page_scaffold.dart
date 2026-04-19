import 'package:flutter/cupertino.dart';

class AppPageScaffold extends StatelessWidget {
  final ObstructingPreferredSizeWidget? navigationBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool useSafeArea;

  const AppPageScaffold({
    super.key,
    this.navigationBar,
    required this.body,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = useSafeArea ? SafeArea(child: body) : body;

    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: navigationBar,

      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        
        child: Column(
          children: [
            Expanded(child: content),
          ],
        ),
      ),
    );
  }
}