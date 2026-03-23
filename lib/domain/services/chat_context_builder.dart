import 'dart:convert';
import '../../core/models/api_message.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';

class ChatContextBuilder {
  static Future<List<ApiMessage>> buildFromRounds(
    List<ChatRound> rounds,
    ConversationRepository repository,
  ) async {
    final result = <ApiMessage>[];

    for (final round in rounds) {
      final userMessage = await _buildUserMessage(round, repository);
      result.add(userMessage);

      final assistantMessage = _buildAssistantMessage(round);
      if (assistantMessage != null) {
        result.add(assistantMessage);
      }
    }

    return result;
  }

  static ApiMessage? _buildAssistantMessage(ChatRound round) {
    final thinking = round.assistantThinking?.trim() ?? '';
    final content = round.assistantContent?.trim() ?? '';

    if (thinking.isEmpty && content.isEmpty) {
      return null;
    }

    return ApiMessage(
      role: 'assistant',
      content: content.isEmpty ? null : content,
      reasoning: thinking.isEmpty ? null : thinking,
    );
  }

  static Future<ApiMessage> _buildUserMessage(
    ChatRound round,
    ConversationRepository repository,
  ) async {
    final parts = <ApiMessageContentPart>[];

    if (round.userContent.trim().isNotEmpty) {
      parts.add(
        ApiMessageContentPart.text(
          text: round.userContent.trim(),
        ),
      );
    }

    for (final attachment in round.userAttachments) {
      final attachmentParts =
          await _buildAttachmentParts(attachment, repository);
      parts.addAll(attachmentParts);
    }

    if (parts.isEmpty) {
      return const ApiMessage(
        role: 'user',
        content: '',
      );
    }

    if (_isOnlySingleTextPart(parts)) {
      final text = parts.first.maybeWhen(
        text: (_, text) => text,
        orElse: () => '',
      );
      return ApiMessage(
        role: 'user',
        content: text,
      );
    }

    return ApiMessage(
      role: 'user',
      parts: parts,
    );
  }

  static bool _isOnlySingleTextPart(List<ApiMessageContentPart> parts) {
    if (parts.length != 1) return false;
    return parts.first.maybeWhen(
      text: (_, text) => true,
      orElse: () => false,
    );
  }

  static Future<List<ApiMessageContentPart>> _buildAttachmentParts(
    dynamic attachment,
    ConversationRepository repository,
  ) async {
    final lowerName = attachment.name.toLowerCase();
    final mime = (attachment.mimeType ?? '').toLowerCase();

    final isTextFile = mime.startsWith('text/') ||
        mime == 'application/json' ||
        lowerName.endsWith('.md') ||
        lowerName.endsWith('.txt') ||
        lowerName.endsWith('.json') ||
        lowerName.endsWith('.dart') ||
        lowerName.endsWith('.yaml') ||
        lowerName.endsWith('.yml');

    if (attachment.isImage) {
      final bytes = await repository.getAttachment(attachment.relativePath);
      final mimeType = attachment.mimeType ?? 'image/png';
      final base64Data = base64Encode(bytes);
      final dataUrl = 'data:$mimeType;base64,$base64Data';
      return [
        ApiMessageContentPart.imageUrl(
          imageUrl: ApiImageUrl(url: dataUrl),
        ),
      ];
    }

    if (isTextFile) {
      final bytes = await repository.getAttachment(attachment.relativePath);
      final text = utf8.decode(bytes, allowMalformed: true);
      return [
        ApiMessageContentPart.text(
          text: text,
        ),
      ];
    }

    return [
      ApiMessageContentPart.text(
        text: '[附件: ${attachment.name}]',
      ),
    ];
  }
}