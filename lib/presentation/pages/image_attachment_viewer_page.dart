import 'dart:typed_data';
import 'package:aiservice/presentation/widgets/common/app_page_scaffold.dart';
import 'package:flutter/cupertino.dart';

class ImageAttachmentViewerPage extends StatelessWidget {
  final Uint8List imageBytes;

  const ImageAttachmentViewerPage({super.key, required this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('图片预览')),      
      body: InteractiveViewer(
        minScale: 0.5,
        maxScale: 4.0,
        child: Center(
          child: Image.memory(
            imageBytes,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}