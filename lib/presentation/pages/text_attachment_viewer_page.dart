import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

class TextAttachmentViewerPage extends StatelessWidget {
  final String title;
  final String content;

  const TextAttachmentViewerPage({
    super.key,
    required this.title,
    required this.content,
  });

  Future<void> _copyAll() async {
    await Clipboard.setData(ClipboardData(text: content));
    await AppToast.show('全文已复制');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppPageScaffold(
      appBar: AppBar(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            tooltip: '复制全文',
            onPressed: _copyAll,
            icon: const Icon(Icons.content_copy_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SelectableText(
              content,
              style: textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
        ),
      ),
    );
  }
}