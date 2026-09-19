/// Markdown 块级节点类型
enum MarkdownBlockType {
  heading,
  paragraph,
  code,
  table,
}

/// 内联元素类型
enum InlineType { text, bold }

/// 内联片段
class InlineSpan {
  final InlineType type;
  final String text;

  const InlineSpan(this.type, this.text);
}

/// 表格行
class TableRowData {
  final List<String> cells;
  TableRowData(this.cells);
}

/// 块级节点
class MarkdownBlock {
  final MarkdownBlockType type;
  final int? level; // 标题级别 1-6
  final String? text; // 段落/标题/代码的文本内容
  final String? codeLanguage;
  final List<TableRowData>? tableRows; // 表格数据，第一行为表头

  MarkdownBlock.heading(this.level, this.text)
      : type = MarkdownBlockType.heading,
        codeLanguage = null,
        tableRows = null;

  MarkdownBlock.paragraph(this.text)
      : type = MarkdownBlockType.paragraph,
        level = null,
        codeLanguage = null,
        tableRows = null;

  MarkdownBlock.code(this.text, {this.codeLanguage})
      : type = MarkdownBlockType.code,
        level = null,
        tableRows = null;

  MarkdownBlock.table(this.tableRows)
      : type = MarkdownBlockType.table,
        level = null,
        text = null,
        codeLanguage = null;
}

/// Markdown 解析器（仅支持标题、粗体、代码块、表格）
class MarkdownParser {
  static final RegExp _headingRegex = RegExp(r'^(#{1,6})\s+(.*)$');
  static final RegExp _tableSeparatorRegex = RegExp(r'^\|[\s\-:|]+\|$');

  /// 解析完整文本
  static List<MarkdownBlock> parse(String data) {
    final lines = data.split('\n');
    final blocks = <MarkdownBlock>[];
    int i = 0;
    final n = lines.length;

    while (i < n) {
      final line = lines[i];
      // 空行跳过
      if (line.trim().isEmpty) {
        i++;
        continue;
      }

      // 标题
      final headingMatch = _headingRegex.firstMatch(line);
      if (headingMatch != null) {
        final level = headingMatch.group(1)!.length;
        final text = headingMatch.group(2)!;
        blocks.add(MarkdownBlock.heading(level, text));
        i++;
        continue;
      }

      // 代码块
      if (line.trim().startsWith('```')) {
        final lang = line.trim().substring(3).trim();
        final codeLines = <String>[];
        i++;
        while (i < n && !lines[i].trim().startsWith('```')) {
          codeLines.add(lines[i]);
          i++;
        }
        i++; // 跳过结束 ```
        final codeText = codeLines.join('\n');
        blocks.add(MarkdownBlock.code(codeText, codeLanguage: lang.isEmpty ? null : lang));
        continue;
      }

      // 表格：以 | 开头和结尾的行，且下一行是分隔行（|---|...）或者连续收集
      if (line.trim().startsWith('|') && line.trim().endsWith('|')) {
        final tableLines = <String>[];
        // 收集所有表格行直到遇到空行或非表格行
        while (i < n && lines[i].trim().startsWith('|') && lines[i].trim().endsWith('|')) {
          tableLines.add(lines[i].trim());
          i++;
        }
        final rows = _parseTable(tableLines);
        if (rows != null && rows.isNotEmpty) {
          blocks.add(MarkdownBlock.table(rows));
        }
        continue;
      }

      // 普通段落
      blocks.add(MarkdownBlock.paragraph(line));
      i++;
    }

    return blocks;
  }

  /// 解析表格，返回行列表（第一行为表头）
  static List<TableRowData>? _parseTable(List<String> lines) {
    if (lines.length < 2) return null;

    // 分隔行校验
    final separatorLine = lines[1];
    if (!_isTableSeparator(separatorLine)) return null;

    final rows = <TableRowData>[];
    // 表头
    rows.add(TableRowData(_splitTableRow(lines[0])));
    // 数据行
    for (int i = 2; i < lines.length; i++) {
      rows.add(TableRowData(_splitTableRow(lines[i])));
    }
    return rows;
  }

  static bool _isTableSeparator(String line) {
    return _tableSeparatorRegex.hasMatch(line);
  }

  static List<String> _splitTableRow(String line) {
    // 去掉首尾的 |，然后按 | 分割
    final trimmed = line.substring(1, line.length - 1);
    return trimmed.split('|').map((s) => s.trim()).toList();
  }

  /// 解析内联格式（粗体、斜体），返回 InlineSpan 列表
  static List<InlineSpan> parseInline(String text) {
    final spans = <InlineSpan>[];
    final buffer = StringBuffer();
    bool inBold = false;
    int i = 0;
    final len = text.length;

    while (i < len) {
      // 粗体 **
      if (i + 1 < len && text[i] == '*' && text[i + 1] == '*') {
        _flushBuffer(buffer, spans, inBold);
        inBold = !inBold;
        i += 2;
        continue;
      }
      buffer.write(text[i]);
      i++;
    }
    _flushBuffer(buffer, spans, inBold);
    return spans;
  }

  static void _flushBuffer(StringBuffer buffer, List<InlineSpan> spans, bool inBold) {
    if (buffer.isEmpty) return;
    final text = buffer.toString();
    buffer.clear();
    if (inBold) {
      spans.add(InlineSpan(InlineType.bold, text));
    } 
    else {
      spans.add(InlineSpan(InlineType.text, text));
    }
  }
}