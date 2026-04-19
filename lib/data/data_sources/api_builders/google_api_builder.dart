import 'api_request_builder.dart';
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class GoogleApiBuilder implements ApiRequestBuilder {
  @override
  Map<String, String> buildHeaders(ApiBuildContext ctx) {
    return {
      'x-goog-api-key': ctx.apiKey,
      'Content-Type': 'application/json',
    };
  }

  @override
  Uri buildUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath).replace(
      queryParameters: {'alt': 'sse'},
    );
  }

  @override
  Uri buildModelsUri(ApiBuildContext ctx) {
    return ApiUriUtils.buildNormalizedUri(ctx.baseUrl, ctx.modelsPath);
  }

  @override
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx) {
    return {
      'contents': _buildGoogleContents(ctx.context),
      'generationConfig': {},
      'safetySettings': [
        {'category': 'HARM_CATEGORY_HARASSMENT', 'threshold': 'BLOCK_NONE'},
        {'category': 'HARM_CATEGORY_HATE_SPEECH', 'threshold': 'BLOCK_NONE'},
        {'category': 'HARM_CATEGORY_SEXUALLY_EXPLICIT', 'threshold': 'BLOCK_NONE'},
        {'category': 'HARM_CATEGORY_DANGEROUS_CONTENT', 'threshold': 'BLOCK_NONE'},
      ],
    };
  }

  @override
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    final models = json['models'] as List<dynamic>?;
    if (models == null) return [];

    return models.map((e) {
      final m = e as Map<String, dynamic>;
      final name = (m['name'] ?? '').toString();
      final id = name.startsWith('models/') ? name.substring(7) : name;

      final methods = m['supportedGenerationMethods'] as List<dynamic>?;
      if (methods != null && !methods.contains('generateContent')) {
        return null;
      }

      return ModelInfo(
        id: id,
        name: m['displayName']?.toString(),
      );
    }).whereType<ModelInfo>().toList();
  }

  List<Map<String, dynamic>> _buildGoogleContents(List<ApiMessage> context) {
    return context.map((message) {
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
              return [{'text': '[Image: $url]'}];
            },
          ));
        }
      }

      if (parts.isEmpty) return null;
      return {'role': role, 'parts': parts};
    }).whereType<Map<String, dynamic>>().toList();
  }
}