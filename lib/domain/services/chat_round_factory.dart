import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import 'package:uuid/uuid.dart';

class ChatRoundFactory {
  static ChatRound createUserRound({
    required String content,
    required String? parentId,
    required List<Attachment> attachments,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return ChatRound(
      id: const Uuid().v4(),
      parentId: parentId,
      createdAt: now,
      userContent: content,
      userAttachments: attachments,
      isIncomplete: true,
    );
  }

  static ChatRound createRetryRound({
    required ChatRound sourceRound,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return ChatRound(
      id: const Uuid().v4(),
      parentId: sourceRound.parentId,
      createdAt: now,
      userContent: sourceRound.userContent,
      userAttachments: sourceRound.userAttachments,
      isIncomplete: true,
    );
  }

  static ChatRound createEditedRetryRound({
    required ChatRound sourceRound,
    required String newContent,
    required List<Attachment> attachments,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return ChatRound(
      id: const Uuid().v4(),
      parentId: sourceRound.parentId,
      createdAt: now,
      userContent: newContent,
      userAttachments: attachments,
      isIncomplete: true,
    );
  }
}