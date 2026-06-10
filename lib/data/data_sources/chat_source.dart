import '../../core/models/app_config.dart';
import '../../core/models/api_message.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/models/model_info.dart';
import 'package:http/http.dart' as http;   // 新增导入

abstract class ChatSource {
  Future<List<ModelInfo>> fetchModels(
    ConfigProfile config, {
    required http.Client client,
  });
  Stream<ChatChunk> chatStream({
    required ConfigProfile config,
    required List<ApiMessage> context,
  });
}