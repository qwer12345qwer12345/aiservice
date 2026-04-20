import 'package:flutter/cupertino.dart';

class AppSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;

  const AppSection({
    super.key,
    required this.title,
    this.subtitle,
    required this.children,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CupertinoTheme.of(context).textTheme;

    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      child: CupertinoFormSection.insetGrouped(
        header: Text(title, style: textTheme.navTitleTextStyle),
        footer: subtitle != null ? Text(subtitle!, style: textTheme.tabLabelTextStyle) : null,
        children: children,
      ),
    );
  }
}