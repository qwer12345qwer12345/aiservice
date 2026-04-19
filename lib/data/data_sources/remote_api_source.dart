import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import '../../core/models/model_info.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/utils/sse_parser.dart';
import 'sse_event_decoder.dart';
import 'api_builders/api_request_builder.dart';
import 'api_builders/google_api_builder.dart';
import 'api_builders/chat_completions_api_builder.dart';
import 'api_builders/responses_api_builder.dart';

class RemoteApiSource {
  ApiRequestBuilder _getBuilder(String apiMode) {
    switch (apiMode) {
      case 'google':
        return GoogleApiBuilder();
      case 'responses':
        return ResponsesApiBuilder();
      case 'chat_completions':
      default:
        return ChatCompletionsApiBuilder();
    }
  }

  Future<List<ModelInfo>> fetchModels({
    required String baseUrl,
    required String apiKey,
    required String modelsPath,
    required String apiMode,
  }) async {
    final builder = _getBuilder(apiMode);
    final ctx = ApiBuildContext(
      model: '',
      context: [],
      enableReasoning: false,
      apiKey: apiKey,
      baseUrl: baseUrl,
      chatPath: '',
      modelsPath: modelsPath,
    );

    final url = builder.buildModelsUri(ctx);

    final response = await http.get(
      url,
      headers: builder.buildHeaders(ctx),
    );

    if (response.statusCode != 200) {
      throw Exception('获取模型列表失败：${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return builder.parseModelsResponse(json);
  }

  Stream<ChatChunk> chatStream({
    required Future<AppConfig> Function() loadConfig,
    required List<ApiMessage> context,
  }) async* {
    final client = http.Client();

    try {
      final config = await loadConfig();
      final selectedId = config.selectedModel;
      final selectedModel =
          config.availableModels?.firstWhereOrNull((m) => m.id == selectedId);
      final enableReasoning = selectedModel?.overrideSupportsReasoning == true;
      final model = config.selectedModel?.trim() ?? '';
      final apiMode = config.apiMode.trim();

      if (config.baseUrl.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'Base URL 为空');
        return;
      }
      if (config.apiKey.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'API Key 为空');
        return;
      }
      if (config.chatPath.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'Chat Path 为空');
        return;
      }
      if (model.isEmpty) {
        yield const ChatChunk(isDone: true, error: '未选择模型');
        return;
      }

      final builder = _getBuilder(apiMode);

      String resolvedChatPath = config.chatPath.trim();
      if (resolvedChatPath.contains('{model}')) {
        resolvedChatPath = resolvedChatPath.replaceAll('{model}', model);
      }

      final ctx = ApiBuildContext(
        model: model,
        context: context,
        enableReasoning: enableReasoning,
        apiKey: config.apiKey.trim(),
        baseUrl: config.baseUrl.trim(),
        chatPath: resolvedChatPath,
        modelsPath: config.modelsPath.trim(),
      );

      final uri = builder.buildUri(ctx);
      final requestBody = builder.buildRequestBody(ctx);

      final request = http.Request('POST', uri)
        ..headers.addAll(builder.buildHeaders(ctx))
        ..headers.addAll({
          'Accept': 'text/event-stream',
          'Cache-Control': 'no-cache',
        })
        ..body = jsonEncode(requestBody);

      final streamedResponse = await client.send(request);

      if (streamedResponse.statusCode < 200 || streamedResponse.statusCode >= 300) {
        final errorBody = await streamedResponse.stream.bytesToString();
        throw Exception('${streamedResponse.statusCode} $errorBody');
      }

      final parser = SseParser();
      final stream = streamedResponse.stream.transform(utf8.decoder);

      await for (final rawChunk in stream) {
        final events = parser.addChunk(rawChunk);
        for (final event in events) {
          try {
            final decoded = SseEventDecoder.decode(apiMode: apiMode, event: event);
            if (decoded == null) continue;
            
            yield decoded;
            
            if (decoded.isDone) return;
          } catch (_) {}
        }
      }

      final lastEvent = parser.close();
      if (lastEvent != null) {
        try {
          final decoded = SseEventDecoder.decode(apiMode: apiMode, event: lastEvent);
          if (decoded != null) {
            yield decoded;
            if (decoded.isDone) return;
          }
        } catch (_) {}
      }
      yield const ChatChunk(isDone: true);
    } catch (e) {
      yield ChatChunk(isDone: true, error: '$e');
    } finally {
      client.close();
    }
  }
}