import '../models/model_info.dart';
import '../models/api_message.dart';
import '../models/chat_chunk.dart';

abstract class IApiService {
  Future<List<ModelInfo>> fetchModels({
    required String baseUrl,
    required String apiKey,
    required String modelsPath,
  });

  Stream<ChatChunk> chatStream({
    required String taskId, // 新增 taskId 标识请求
    required String baseUrl,
    required String apiKey,
    required String chatPath,
    required String apiMode,
    required String model,
    required List<ApiMessage> context,
    bool enableReasoning = false,
  });

  void cancelRequest(String taskId); // 支持取消指定的任务
}