import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import '../../core/models/model_info.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/utils/sse_parser.dart';
import 'chat_source.dart';
import 'sse_event_decoder.dart';
import 'api_builders/api_request_builder.dart';
import 'api_builders/google_api_builder.dart';
import 'api_builders/chat_completions_api_builder.dart';
import 'api_builders/responses_api_builder.dart';

class RemoteChatSource implements ChatSource {
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

  @override
  Future<List<ModelInfo>> fetchModels(ConfigProfile config) async {
    final builder = _getBuilder(config.apiMode);
    final ctx = ApiBuildContext(
      config: config,
      model: '',
      context: [],
      enableReasoning: false,
    );

    final url = builder.buildModelsUri(ctx);
    final response = await http.get(url, headers: builder.buildHeaders(ctx));

    if (response.statusCode != 200) {
      throw Exception('获取模型列表失败：${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return builder.parseModelsResponse(json);
  }

  @override
  Stream<ChatChunk> chatStream({
    required ConfigProfile config,
    required List<ApiMessage> context,
  }) async* {
    final client = http.Client();
    try {
      final apiMode = config.apiMode.trim();
      final selectedId = config.selectedModel;
      final selectedModel = config.availableModels.firstWhereOrNull((m) => m.id == selectedId);
      final enableReasoning = selectedModel?.overrideSupportsReasoning == true;
      final model = config.selectedModel?.trim() ?? '';

      final builder = _getBuilder(apiMode);
      String resolvedChatPath = config.chatPath.trim();
      if (resolvedChatPath.contains('{model}')) {
        resolvedChatPath = resolvedChatPath.replaceAll('{model}', model);
      }

      final ctx = ApiBuildContext(
        config: config,                // 传入整个配置档案
        model: model,
        context: context,
        enableReasoning: enableReasoning,
      );

      final uri = builder.buildUri(ctx);
      final requestBody = builder.buildRequestBody(ctx);

      final request = http.Request('POST', uri)
        ..headers.addAll(builder.buildHeaders(ctx))
        ..headers.addAll({'Accept': 'text/event-stream', 'Cache-Control': 'no-cache'})
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