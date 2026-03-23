import '../../core/models/chat_chunk.dart';

class ChatStreamAccumulator {
  String _content = '';
  String _reasoning = '';

  String get content => _content;
  String get reasoning => _reasoning;

  void add(ChatChunk chunk) {
    if (chunk.content != null) {
      _content += chunk.content!;
    }
    if (chunk.reasoningContent != null) {
      _reasoning += chunk.reasoningContent!;
    }
  }
}