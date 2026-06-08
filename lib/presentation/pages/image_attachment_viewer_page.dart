import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:aiservice/presentation/widgets/common/app_page_scaffold.dart';

class ImageAttachmentViewerPage extends StatelessWidget {
  final String title;
  final String filePath;

  const ImageAttachmentViewerPage({
    super.key,
    required this.title,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    final imageFile = File(filePath);
    
    return AppPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(title, overflow: TextOverflow.ellipsis)),
      body: InteractiveViewer(
        minScale: 0.5,
        maxScale: 4.0,
        child: Center(
          child: Image.file(
            imageFile,
            fit: BoxFit.contain,
            errorBuilder: (_, _, _) => const Center(child: Icon(CupertinoIcons.exclamationmark_triangle)),
          ),
        ),
      ),
    );
  }
}