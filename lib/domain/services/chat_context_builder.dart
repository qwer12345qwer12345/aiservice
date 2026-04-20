import 'dart:convert';
import 'package:aiservice/core/models/attachment.dart';

import '../../core/models/api_message.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';

Future<List<ApiMessage>> buildApiContextFromRounds(
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

ApiMessage? _buildAssistantMessage(ChatRound round) {
  final thinking = round.assistantThinking?.trim() ?? '';
  final content = round.assistantContent?.trim() ?? '';

  if (thinking.isEmpty && content.isEmpty) return null;

  return ApiMessage(
    role: 'assistant',
    content: content.isEmpty ? null : content,
    reasoning: thinking.isEmpty ? null : thinking,
  );
}

Future<ApiMessage> _buildUserMessage(
  ChatRound round,
  ConversationRepository repository,
) async {
  final parts = <ApiMessageContentPart>[];

  if (round.userContent.trim().isNotEmpty) {
    parts.add(ApiMessageContentPart.text(text: round.userContent.trim()));
  }

  for (final attachment in round.userAttachments) {
    final attachmentParts = await _buildAttachmentParts(attachment, repository);
    parts.addAll(attachmentParts);
  }

  if (parts.isEmpty) {
    return const ApiMessage(role: 'user', content: '');
  }

  if (_isOnlySingleTextPart(parts)) {
    final text = parts.first.maybeWhen(
      text: (_, text) => text,
      orElse: () => '',
    );
    return ApiMessage(role: 'user', content: text);
  }

  return ApiMessage(role: 'user', parts: parts);
}

bool _isOnlySingleTextPart(List<ApiMessageContentPart> parts) {
  if (parts.length != 1) return false;
  return parts.first.maybeWhen(
    text: (_, text) => true,
    orElse: () => false,
  );
}

Future<List<ApiMessageContentPart>> _buildAttachmentParts(
  Attachment attachment,
  ConversationRepository repository,
) async {
  if (attachment.isImage) {
    final bytes = await repository.getAttachment(attachment.relativePath);
    final mimeType = attachment.mimeType;
    final base64Data = base64Encode(bytes);
    return [ApiMessageContentPart.imageUrl(imageUrl: ApiImageUrl(url: 'data:$mimeType;base64,$base64Data'))];
  } else {
    // 上层保证非图片一定是可读文本文件
    final bytes = await repository.getAttachment(attachment.relativePath);
    final text = utf8.decode(bytes, allowMalformed: true);
    return [ApiMessageContentPart.text(text: text)];
  }
}