import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../themes/app_tokens.dart';
import '../widgets/common/app_page_scaffold.dart';

class TextAttachmentViewerPage extends StatelessWidget {
  final String title;
  final String content;

  const TextAttachmentViewerPage({
    super.key,
    required this.title,
    required this.content,
  });

  Future<void> _copyAll(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: content));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('全文已复制')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      appBar: AppBar(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          IconButton(
            tooltip: '复制全文',
            onPressed: () => _copyAll(context),
            icon: const Icon(Icons.content_copy_outlined),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTokens.surface,
            borderRadius: AppTokens.brLg,
            border: Border.all(color: AppTokens.border),
            boxShadow: AppTokens.shadowSm,
          ),
          child: SelectableText(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.7,
                  color: AppTokens.textPrimary,
                  fontFamily: 'monospace',
                ),
          ),
        ),
      ),
    );
  }
}