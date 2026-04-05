import '../../core/models/chat_chunk.dart';

class ChatStreamAccumulator {
  final StringBuffer _content = StringBuffer();
  final StringBuffer _reasoning = StringBuffer();

  String get content => _content.toString();
  String get reasoning => _reasoning.toString();

  void add(ChatChunk chunk) {
    if (chunk.content != null) {
      _content.write(chunk.content);
    }
    if (chunk.reasoningContent != null) {
      _reasoning.write(chunk.reasoningContent);
    }
  }
}