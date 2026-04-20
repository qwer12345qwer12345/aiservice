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

    return CupertinoFormSection.insetGrouped(
      children: [
        CupertinoButton(
          padding: const EdgeInsets.all(12),
          onPressed: () => setState(() => _isExpanded = !_isExpanded),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.lightbulb,
                size: 16,
                color: CupertinoTheme.of(context).primaryColor,
              ),
              const SizedBox(width: 6),
              Text(
                '推理过程',
                style: textTheme.textStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  color: CupertinoTheme.of(context).primaryColor,
                ),
              ),
              const Spacer(),
              Icon(
                _isExpanded ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                size: 18,
                color: CupertinoColors.systemGrey,
              ),
            ],
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              text,
              style: textTheme.textStyle.copyWith(
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
      ],
    );
  }
}