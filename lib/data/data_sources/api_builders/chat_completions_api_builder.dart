import 'package:aiservice/data/data_sources/api_builders/model_info_parser.dart';

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
    return ModelInfoParser.parseModelsResponse(json);
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
}