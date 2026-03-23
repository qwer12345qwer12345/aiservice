import '../../core/interfaces/api_service.dart';
import '../../core/models/model_info.dart';
import '../../core/models/api_message.dart';
import '../../core/models/chat_chunk.dart';
import '../data_sources/remote_api_source.dart';

class ApiService implements IApiService {
  final IRemoteApiSource _apiSource;

  ApiService(this._apiSource);

  @override
  Future<List<ModelInfo>> fetchModels({
    required String baseUrl,
    required String apiKey,
    required String modelsPath,
  }) async {
    return await _apiSource.fetchModels(
      baseUrl: baseUrl,
      apiKey: apiKey,
      modelsPath: modelsPath,
    );
  }

  @override
  Stream<ChatChunk> chatStream({
    required String taskId,
    required String baseUrl,
    required String apiKey,
    required String chatPath,
    required String apiMode,
    required String model,
    required List<ApiMessage> context,
    bool enableReasoning = false,
  }) async* {
    yield* _apiSource.chatStream(
      taskId: taskId,
      baseUrl: baseUrl,
      apiKey: apiKey,
      chatPath: chatPath,
      apiMode: apiMode,
      model: model,
      context: context,
      enableReasoning: enableReasoning,
    );
  }

  @override
  void cancelRequest(String taskId) {
    _apiSource.cancelRequest(taskId);
  }
}