import 'api_request_builder.dart';
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class ResponsesApiBuilder implements ApiRequestBuilder {
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
      'input': _buildInput(ctx.context),
      'stream': true,
      'store': false,
      if (ctx.enableReasoning)
        'reasoning': {
          'effort': 'medium',
        },
    };
  }

  @override
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>? ?? [];
    return data.map((e) => _parseModelInfo(e as Map<String, dynamic>)).toList();
  }
  
  List<Map<String, dynamic>> _buildInput(List<ApiMessage> context) {
    final result = <Map<String, dynamic>>[];
    for (final message in context) {
      if (message.role == 'assistant') {
        result.addAll(_buildAssistantItems(message));
      } else {
        result.add(_buildUserLikeMessage(message));
      }
    }
    return result;
  }

  Map<String, dynamic> _buildUserLikeMessage(ApiMessage message) {
    if (message.parts.isEmpty) {
      return {'role': message.role, 'content': message.content ?? ''};
    }

    return {
      'role': message.role,
      'content': message.parts.map((part) => part.when(
            text: (type, text) => {'type': 'input_text', 'text': text},
            imageUrl: (type, imageUrl) => {
              'type': 'input_image',
              'image_url': imageUrl.url,
            },
          )).toList(),
    };
  }

  List<Map<String, dynamic>> _buildAssistantItems(ApiMessage message) {
    final items = <Map<String, dynamic>>[];
    if ((message.reasoning ?? '').trim().isNotEmpty) {
      items.add({
        'type': 'reasoning',
        'summary': [
          {'type': 'summary_text', 'text': message.reasoning}
        ],
      });
    }
    if ((message.content ?? '').trim().isNotEmpty) {
      items.add({'role': 'assistant', 'content': message.content});
    }
    return items;
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