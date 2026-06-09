import 'api_request_builder.dart';
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';
import 'model_info_parser.dart';

class ResponsesApiBuilder implements ApiRequestBuilder {
  @override
  Map<String, String> buildHeaders(ApiBuildContext ctx) {
    return {
      'Authorization': 'Bearer ${ctx.config.apiKey}',
      'Content-Type': 'application/json',
    };
  }

  @override
  Uri buildUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.config.baseUrl, ctx.config.chatPath);
  }

  @override
  Uri buildModelsUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.config.baseUrl, ctx.config.modelsPath);
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
    return ModelInfoParser.parseModelsResponse(json);
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
}