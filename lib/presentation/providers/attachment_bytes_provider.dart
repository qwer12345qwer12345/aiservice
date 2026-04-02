// presentation/providers/attachment_bytes_provider.dart

import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';

// 使用 autoDispose，组件销毁时自动释放内存
final attachmentBytesProvider =
    FutureProvider.autoDispose.family<Uint8List, String>(
  (ref, relativePath) async {
    final repository = ref.read(conversationRepositoryProvider);
    return repository.getAttachment(relativePath);
  },
);