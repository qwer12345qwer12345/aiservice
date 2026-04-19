import 'api_request_builder.dart';
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class ChatCompletionsApiBuilder implements ApiRequestBuilder {
  @override
  Map<String, String> buildHeaders(ApiBuildContext ctx) {
    return {
      'Authorization': 'Bearer ${ctx.apiKey}',
      'Content-Type': 'application/json',
    };
  }

  @override
  Uri buildUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.chatPath);
  }

  @override
  Uri buildModelsUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath);
  }
  
  @override
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx) {
    return {
      'model': ctx.model,
      'messages': _buildMessages(ctx.context),
      'stream': true,
      if (ctx.enableReasoning) 'reasoning_effort': 'medium',
    };
  }

  @override
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>? ?? [];
    return data.map((e) => _parseModelInfo(e as Map<String, dynamic>)).toList();
  }

  List<Map<String, dynamic>> _buildMessages(List<ApiMessage> context) {
    return context.map(_buildMessage).toList();
  }

  Map<String, dynamic> _buildMessage(ApiMessage message) {
    if (message.role == 'assistant') {
      final result = <String, dynamic>{
        'role': 'assistant',
        'content': message.content ?? '',
      };
      if ((message.reasoning ?? '').trim().isNotEmpty) {
        result['reasoning_content'] = message.reasoning;
      }
      return result;
    }

    if (message.parts.isEmpty) {
      return {
        'role': message.role,
        'content': message.content ?? '',
      };
    }

    return {
      'role': message.role,
      'content': message.parts.map((part) => part.when(
            text: (type, text) => {'type': 'text', 'text': text},
            imageUrl: (type, imageUrl) => {
              'type': 'image_url',
              'image_url': {'url': imageUrl.url},
            },
          )).toList(),
    };
  }

  ModelInfo _parseModelInfo(Map<String, dynamic> json) {
    bool? readBool(Map<String, dynamic> json, List<String> keys) {
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

    return ModelInfo(
      id: (json['id'] ?? '').toString(),
      name: json['name']?.toString(),
      overrideSupportsReasoning:
          readBool(json, ['overrideSupportsReasoning', 'override_supports_reasoning']),
      overrideSupportsVision:
          readBool(json, ['overrideSupportsVision', 'override_supports_vision']),
    );
  }
}