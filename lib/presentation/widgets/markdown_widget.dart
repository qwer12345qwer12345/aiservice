import 'package:flutter/cupertino.dart';
import 'markdown_parser.dart';

class MarkdownWidget extends StatelessWidget {
  final String data;
  final TextStyle? baseStyle;

  const MarkdownWidget({super.key, required this.data, this.baseStyle});

  @override
  Widget build(BuildContext context) {
    final blocks = MarkdownParser.parse(data);
    final theme = CupertinoTheme.of(context);
    final defaultStyle = baseStyle ?? theme.textTheme.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: blocks.map((block) => _buildBlock(block, defaultStyle, theme, context)).toList(),
    );
  }

  Widget _buildBlock(
    MarkdownBlock block, 
    TextStyle defaultStyle, 
    CupertinoThemeData theme, 
    BuildContext context) {
    switch (block.type) {
      case MarkdownBlockType.heading:
        final level = block.level ?? 1;
        double fontSizeFactor;
        switch (level) {
          case 1:
            fontSizeFactor = 1.8;
            break;
          case 2:
            fontSizeFactor = 1.6;
            break;
          case 3:
            fontSizeFactor = 1.4;
            break;
          default:
            fontSizeFactor = 1.2;
        }
        final style = defaultStyle.copyWith(
          fontSize: theme.textTheme.textStyle.fontSize! * fontSizeFactor,
        );
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: _buildRichText(block.text ?? '', style),
        );

      case MarkdownBlockType.paragraph:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: _buildRichText(block.text ?? '', defaultStyle),
        );

      case MarkdownBlockType.code:
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              block.text ?? '',
              style: defaultStyle.copyWith(
                fontFamily: 'monospace',
                fontSize: 13,
              ),
            ),
          ),
        );

      case MarkdownBlockType.table:
        final rows = block.tableRows;
        if (rows == null || rows.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Table(
            border: TableBorder.all(color: CupertinoDynamicColor.resolve(CupertinoColors.separator, context)),
            children: rows.map((row) {
              final isHeader = rows.indexOf(row) == 0;
              return TableRow(
                decoration: BoxDecoration(
                  color: isHeader ? CupertinoDynamicColor.resolve(CupertinoColors.systemGrey5, context) : null, // 修改这里
                ),
                children: row.cells.map((cell) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: isHeader
                        ? _buildRichText(cell, defaultStyle)
                        : _buildRichText(cell, defaultStyle),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        );
    }
  }

  Widget _buildRichText(String text, TextStyle baseStyle) {
    final spans = MarkdownParser.parseInline(text);
    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: spans.map((span) {
          TextStyle style = baseStyle;
          if (span.type == InlineType.bold) {
            style = baseStyle.copyWith(fontWeight: FontWeight.bold);
          }
          return TextSpan(text: span.text, style: style);
        }).toList(),
      ),
    );
  }
}