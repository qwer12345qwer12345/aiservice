import 'dart:io';
import 'package:aiservice/presentation/widgets/common/app_page_scaffold.dart';
import 'package:flutter/cupertino.dart';

class ImageAttachmentViewerPage extends StatelessWidget {
  final String title;
  final File imageFile;

  const ImageAttachmentViewerPage({
    super.key,
    required this.title,
    required this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(title, overflow: TextOverflow.ellipsis)),
      body: InteractiveViewer(
        minScale: 0.5,
        maxScale: 4.0,
        child: Center(
          child: Image.file(
            imageFile,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Center(child: Icon(CupertinoIcons.exclamationmark_triangle)),
          ),
        ),
      ),
    );
  }
}