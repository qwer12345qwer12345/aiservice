import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show SelectionArea;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

final textFileContentProvider = FutureProvider.family<String, String>((ref, filePath) async {
  final file = File(filePath);
  if (!await file.exists()) {
    throw Exception('文件不存在');
  }
  final bytes = await file.readAsBytes();
  return utf8.decode(bytes, allowMalformed: true);
});

class TextAttachmentViewerPage extends ConsumerWidget {
  final String title;
  final String filePath;

  const TextAttachmentViewerPage({
    super.key,
    required this.title,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentAsync = ref.watch(textFileContentProvider(filePath));

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title, overflow: TextOverflow.ellipsis),
        trailing: contentAsync.when(
          data: (text) => CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: text));
              if (context.mounted) AppToast.show('全文已复制');
            },
            child: const Icon(CupertinoIcons.doc_on_doc),
          ),
          loading: () => const SizedBox.shrink(),
          error: (_, _) => const SizedBox.shrink(),
        ),
      ),
      body: contentAsync.when(
        data: (text) {
          final lines = text.split('\n');

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: SelectionArea(
                child: ListView.builder(
                  itemCount: lines.length,
                  itemBuilder: (context, index) => Text(lines[index]),
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
      ),
    );
  }
}