import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';

final attachmentBytesProvider =
    FutureProvider.family<Uint8List, String>((ref, relativePath) async {
  final repository = ref.read(conversationRepositoryProvider);
  return repository.getAttachment(relativePath);
});