import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/models/model_info.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/utils/sse_parser.dart';
import 'sse_event_decoder.dart';

class RemoteApiSource{
  final Map<String, http.Client> _activeClients = {};
  final Set<String> _cancelledTasks = {};

  Map<String, String> _buildHeaders(String apiKey, String apiMode) {
    if (apiMode == 'google') {
      // Google API Key 必须使用 x-goog-api-key 头部
      return {
        'x-goog-api-key': apiKey,
        'Content-Type': 'application/json',
      };
    }
    // 默认 OpenAI/Claude 等使用 Bearer
    return {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };
  }

  List<Map<String, dynamic>> _buildGoogleContents(List<ApiMessage> context) {
    return context.map((message) {
      // Google 使用 'model' 代表助手，'user' 代表用户
      // 内联处理，不引入额外映射层
      final role = message.role == 'assistant' ? 'model' : message.role;

      final parts = <Map<String, dynamic>>[];

      if (message.parts.isEmpty) {
        final text = message.content?.trim() ?? '';
        if (text.isNotEmpty) {
          parts.add({'text': text});
        }
      } else {
        for (final part in message.parts) {
          parts.addAll(part.when(
            text: (type, text) => [{'text': text}],
            imageUrl: (type, imageUrl) {
              final url = imageUrl.url;
              // 解析 data URL 转换为 Google 的 inlineData
              if (url.startsWith('data:')) {
                final commaIndex = url.indexOf(',');
                if (commaIndex != -1) {
                  final mime = url.substring(5, commaIndex);
                  final base64Data = url.substring(commaIndex + 1);
                  return [
                    {
                      'inlineData': {
                        'mimeType': mime,
                        'data': base64Data,
                      }
                    }
                  ];
                }
              }
              // 不支持非 data URL，降级为文本
              return [{'text': '[Image: $url]'}];
            },
          ));
        }
      }

      if (parts.isEmpty) return null;

      return {
        'role': role,
        'parts': parts,
      };
    }).whereType<Map<String, dynamic>>().toList();
  }

  String _buildUrl(String baseUrl, String path) {
    final normalizedBase = baseUrl.trim().replaceAll(RegExp(r'/+$'), '');
    final normalizedPath = path.trim().replaceAll(RegExp(r'^/+'), '');
    return '$normalizedBase/$normalizedPath';
  }

  bool? _readBool(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      if (!json.containsKey(key)) continue;
      final value = json[key];
      if (value is bool) return value;
      if (value is num) return value != 0;
      if (value is String) {
        final lower = value.toLowerCase();
        if (lower == 'true' || lower == '1' || lower == 'yes') return true;
        if (lower == 'false' || lower == '0' || lower == 'no') return false;
      }
    }
    return null;
  }

  ModelInfo _parseModelInfo(Map<String, dynamic> json) {
    return ModelInfo(
      id: (json['id'] ?? '').toString(),
      name: json['name']?.toString(),
      overrideSupportsReasoning: _readBool(json, ['overrideSupportsReasoning', 'override_supports_reasoning']),
      overrideSupportsVision: _readBool(json, ['overrideSupportsVision', 'override_supports_vision']),
    );
    // 说明：初始拉取阶段仅保留 API 原始返回值与本地覆盖值，最终生效值由 UI/配置层按需计算
  }

  bool _isOnlySingleTextPart(ApiMessage message) {
    if (message.parts.length != 1) return false;
    return message.parts.first.maybeWhen(
      text: (_, text) => true,
      orElse: () => false,
    );
  }

  Map<String, dynamic> _buildChatCompletionAssistantMessage(ApiMessage message) {
    final result = <String, dynamic>{
      'role': 'assistant',
      'content': message.content ?? '',
    };
    if ((message.reasoning ?? '').trim().isNotEmpty) {
      result['reasoning_content'] = message.reasoning;
    }
    return result;
  }

  Map<String, dynamic> _buildChatCompletionMessage(ApiMessage message) {
    if (message.role == 'assistant') {
      return _buildChatCompletionAssistantMessage(message);
    }

    if (message.parts.isEmpty) {
      return {
        'role': message.role,
        'content': message.content ?? '',
      };
    }

    if (_isOnlySingleTextPart(message)) {
      final text = message.parts.first.maybeWhen(
        text: (_, text) => text,
        orElse: () => message.content ?? '',
      );
      return {
        'role': message.role,
        'content': text,
      };
    }

    return {
      'role': message.role,
      'content': message.parts.map((part) {
        return part.when(
          text: (type, text) => {
            'type': 'text',
            'text': text,
          },
          imageUrl: (type, imageUrl) => {
            'type': 'image_url',
            'image_url': {
              'url': imageUrl.url,
            },
          },
        );
      }).toList(),
    };
  }

  List<Map<String, dynamic>> _buildChatCompletionMessages(
    List<ApiMessage> context,
  ) {
    return context.map(_buildChatCompletionMessage).toList();
  }

  Map<String, dynamic> _buildResponsesUserLikeMessage(ApiMessage message) {
    if (message.parts.isEmpty) {
      return {
        'role': message.role,
        'content': message.content ?? '',
       };
    }

    if (_isOnlySingleTextPart(message)) {
      final text = message.parts.first.maybeWhen(
        text: (_, text) => text,
        orElse: () => message.content ?? '',
      );
      return {
        'role': message.role,
        'content': text,
      };
    }

    return {
      'role': message.role,
      'content': message.parts.map((part) {
        return part.when(
          text: (type, text) => {
            'type': 'input_text',
            'text': text,
          },
          imageUrl: (type, imageUrl) => {
            'type': 'input_image',
            'image_url': imageUrl.url,
          },
        );
      }).toList(),
    };
  }

  List<Map<String, dynamic>> _buildResponsesAssistantItems(ApiMessage message) {
    final items = <Map<String, dynamic>>[];

    if ((message.reasoning ?? '').trim().isNotEmpty) {
      items.add({
        'type': 'reasoning',
        'summary': [
          {
            'type': 'summary_text',
             'text': message.reasoning,
          }
        ],
      });
    }

    if ((message.content ?? '').trim().isNotEmpty) {
      items.add({
        'role': 'assistant',
         'content': message.content,
      });
    }

    return items;
  }

  List<Map<String, dynamic>> _buildResponsesInput(
    List<ApiMessage> context,
  ) {
    final result = <Map<String, dynamic>>[];
    for (final message in context) {
      if (message.role == 'assistant') {
        result.addAll(_buildResponsesAssistantItems(message));
      } else {
        result.add(_buildResponsesUserLikeMessage(message));
      }
    }
    return result;
  }

  Map<String, dynamic> _buildRequestBody({
    required String apiMode,
    required String model,
    required List<ApiMessage> context,
    required bool enableReasoning,
  }) {
    if (apiMode == 'google') {
      return {
        'contents': _buildGoogleContents(context),
        'generationConfig': {
          // 可在此添加 temperature 等参数
        },
        // 参考代码中的 SafetySettings，设置为 OFF 以避免默认拦截
        'safetySettings': [
          {'category': 'HARM_CATEGORY_HARASSMENT', 'threshold': 'BLOCK_NONE'},
          {'category': 'HARM_CATEGORY_HATE_SPEECH', 'threshold': 'BLOCK_NONE'},
          {'category': 'HARM_CATEGORY_SEXUALLY_EXPLICIT', 'threshold': 'BLOCK_NONE'},
          {'category': 'HARM_CATEGORY_DANGEROUS_CONTENT', 'threshold': 'BLOCK_NONE'},
        ],
      };
    }

    if (apiMode == 'responses') {
      return {
        'model': model,
        'input': _buildResponsesInput(context),
         'stream': true,
        'store': false,
        if (enableReasoning)
          'reasoning': {
            'effort': 'medium',
          },
      };
    }

    return {
      'model': model,
      'messages': _buildChatCompletionMessages(context),
      'stream': true,
      if (enableReasoning) 'reasoning_effort': 'medium',
    };
  }

  Future<List<ModelInfo>> fetchModels({
    required String baseUrl,
    required String apiKey,
    required String modelsPath,
    required String apiMode, // 需要传入 apiMode 以区分解析逻辑
  }) async {
    try {
      final url = Uri.parse(_buildUrl(baseUrl, modelsPath));
      final response = await http.get(
        url,
        headers: _buildHeaders(apiKey, apiMode),
      );

      if (response.statusCode != 200) {
        throw Exception('获取模型列表失败：${response.statusCode}');
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      // ✅ Google 模式解析
      if (apiMode == 'google') {
        final models = json['models'] as List<dynamic>?;
        if (models == null) return [];

        return models.map((e) {
          final m = e as Map<String, dynamic>;
          final name = (m['name'] ?? '').toString();
          // Google 返回的 name 格式为 "models/gemini-...", 需去除前缀
          final id = name.startsWith('models/') ? name.substring(7) : name;
          
          // 参考代码检查 supportedGenerationMethods
          final methods = m['supportedGenerationMethods'] as List<dynamic>?;
          if (methods != null && !methods.contains('generateContent')) {
            return null; // 过滤掉不支持生成的模型
          }

          return ModelInfo(
            id: id,
            name: m['displayName']?.toString(),
          );
        }).whereType<ModelInfo>().toList();
      }

      // 默认 OpenAI 格式解析
      final data = json['data'] as List<dynamic>;
      return data.map((e) => _parseModelInfo(e as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('获取模型列表失败：$e');
    }
  }

  Stream<ChatChunk> chatStream({
    required String taskId,
    required Future<AppConfig> Function() loadConfig,
    required List<ApiMessage> context,
    bool enableReasoning = false,
  }) async* {
    final client = http.Client();
    _activeClients[taskId] = client;

    try {
      final config = await loadConfig();

      final baseUrl = config.baseUrl.trim();
      final apiKey = config.apiKey.trim();
      final chatPath = config.chatPath.trim();
      final apiMode = config.apiMode.trim();
      final model = config.selectedModel?.trim() ?? '';

      if (baseUrl.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'Base URL 为空');
        return;
      }
 
      if (apiKey.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'API Key 为空');
        return;
      }

      if (chatPath.isEmpty) {
        yield const ChatChunk(isDone: true, error: 'Chat Path 为空');
        return;
      }

      if (model.isEmpty) {
        yield const ChatChunk(isDone: true, error: '未选择模型');
        return;
      }

      String resolvedChatPath = chatPath;
      if (resolvedChatPath.contains('{model}')) {
        resolvedChatPath = resolvedChatPath.replaceAll('{model}', model);
      }

      final baseUri = Uri.parse(_buildUrl(baseUrl, resolvedChatPath));
      final url = apiMode == 'google'
        ? baseUri.replace(queryParameters: {...baseUri.queryParameters, 'alt': 'sse'})
        : baseUri;

      final requestBody = _buildRequestBody(
        apiMode: apiMode,
        model: model,
        context: context,
         enableReasoning: enableReasoning,
      );

      final request = http.Request('POST', url)
        ..headers.addAll(_buildHeaders(apiKey, apiMode))
        ..headers.addAll({
          'Accept': 'text/event-stream',
          'Cache-Control': 'no-cache',
        })
        ..body = jsonEncode(requestBody);

      final streamedResponse = await client.send(request);

      if (streamedResponse.statusCode  < 200 ||
          streamedResponse.statusCode  >= 300) {
        final errorBody = await streamedResponse.stream.bytesToString();
        throw Exception('流式请求失败：${streamedResponse.statusCode} $errorBody');
      }

      final parser = SseParser();
      final stream = streamedResponse.stream.transform(utf8.decoder);

      await for (final rawChunk in stream) {
        if (_cancelledTasks.contains(taskId)) {
          yield const ChatChunk(isDone: true);
          return;
        }

        final events = parser.addChunk(rawChunk);

        for (final event in events) {
          if (_cancelledTasks.contains(taskId)) {
            yield const ChatChunk(isDone: true);
            return;
           }

          try {
            final decoded = SseEventDecoder.decode(
              apiMode: apiMode,
              event: event,
            );

            if (decoded == null) continue;

            yield decoded;

            if (decoded.isDone) {
              return;
            }
          } catch (_) {
            // 单条 SSE 解析失败不让整个流中断
          } 
        }
      }

      final lastEvent = parser.close();
      if (lastEvent != null) {
        try {
          final decoded = SseEventDecoder.decode(
            apiMode: apiMode,
            event: lastEvent,
          );
          if (decoded != null) {
            yield decoded;
            if (decoded.isDone) return;
          }
        } catch (_) {
          // 忽略最后一次 flush 解码错误
        }
      }

      yield const ChatChunk(isDone: true);
    } catch (e) {
      if (_cancelledTasks.contains(taskId)) {
        yield const ChatChunk(isDone: true);
      } else {
        yield ChatChunk(isDone: true, error: '流式请求失败：$e');
      }
    } finally {
      _activeClients[taskId]?.close();
      _activeClients.remove(taskId);
      _cancelledTasks.remove(taskId);
    }
  }

  void cancelRequest(String taskId) {
    _cancelledTasks.add(taskId);
     _activeClients[taskId]?.close();
    _activeClients.remove(taskId);
  }
}