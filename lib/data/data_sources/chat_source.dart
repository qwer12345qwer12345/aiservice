import '../../core/models/app_config.dart';
import '../../core/models/api_message.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/models/model_info.dart';

abstract class ChatSource {
  Future<List<ModelInfo>> fetchModels(AppConfig config);
  Stream<ChatChunk> chatStream({
    required AppConfig config,
    required List<ApiMessage> context,
  });
}