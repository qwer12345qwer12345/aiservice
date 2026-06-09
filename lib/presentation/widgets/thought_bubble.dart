import 'package:flutter/cupertino.dart';

class ThoughtBubble extends StatefulWidget {
  final String content;

  const ThoughtBubble({
    super.key,
    required this.content,
  });

  @override
  State<ThoughtBubble> createState() => _ThoughtBubbleState();
}

class _ThoughtBubbleState extends State<ThoughtBubble> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.content.trim();
    if (text.isEmpty) return const SizedBox.shrink();

    final textTheme = CupertinoTheme.of(context).textTheme;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            onPressed: () => setState(() => _isExpanded = !_isExpanded),
            child: Row(
              children: [
                Text(
                  '推理过程',
                  style: textTheme.textStyle.copyWith(
                    color: CupertinoDynamicColor.resolve(CupertinoColors.systemBlue, context),
                  ),
                ),
                const Spacer(),
                Icon(
                  _isExpanded ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                  size: 18,
                  color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey, context),
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                text,
                style: textTheme.textStyle.copyWith(
                  color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
                ),
              ),
            ),
        ],
      ),
    );
  }
}