import 'dart:io';
import '../../core/models/attachment.dart';
import '../../data/repositories/conversation_repository.dart';
import '../../presentation/models/pending_attachment.dart';

class AttachmentPreparer {
  static Future<List<Attachment>> savePendingAttachments(
    ConversationRepository repository,
    List<PendingAttachment> pending,
  ) async {
    final result = <Attachment>[];

    for (final item in pending) {
      final bytes = await File(item.path).readAsBytes();
      final relativePath = await repository.saveAttachment(bytes, item.name);

      result.add(
        Attachment(
          id: item.id,
          name: item.name,
          relativePath: relativePath,
          isImage: item.isImage,
          mimeType: item.mimeType,
        ),
      );
    }

    return result;
  }
}