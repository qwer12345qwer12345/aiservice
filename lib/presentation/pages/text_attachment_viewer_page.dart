import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../widgets/common/app_page_scaffold.dart';
import '../widgets/common/app_toast.dart';

class TextAttachmentViewerPage extends StatelessWidget {
  final String title;
  final File textFile;

  const TextAttachmentViewerPage({
    super.key,
    required this.title,
    required this.textFile,
  });

  Future<String> _readContent() async {
    final bytes = await textFile.readAsBytes();
    return utf8.decode(bytes, allowMalformed: true);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CupertinoTheme.of(context).textTheme;

    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title, overflow: TextOverflow.ellipsis),
        trailing: FutureBuilder<String>(
          future: _readContent(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const SizedBox.shrink();
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: snapshot.data!));
                if (context.mounted) AppToast.show('全文已复制');
              },
              child: const Icon(CupertinoIcons.doc_on_doc),
            );
          },
        ),
      ),
      body: FutureBuilder<String>(
        future: _readContent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return Center(child: Text('加载失败: ${snapshot.error}'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                snapshot.data!,
                style: textTheme.textStyle.copyWith(fontFamily: 'monospace'),
              ),
            ),
          );
        },
      ),
    );
  }
}