This file is a merged representation of a subset of the codebase, containing specifically included files, combined into a single document by Repomix.

# File Summary

## Purpose
This file contains a packed representation of a subset of the repository's contents that is considered the most important context.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Only files matching these patterns are included: lib/data/data_sources/api_builders
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
lib/data/data_sources/api_builders/api_request_builder.dart
lib/data/data_sources/api_builders/chat_completions_api_builder.dart
lib/data/data_sources/api_builders/google_api_builder.dart
lib/data/data_sources/api_builders/responses_api_builder.dart
```

# Files

## File: lib/data/data_sources/api_builders/api_request_builder.dart
```dart
import '../../../core/models/api_message.dart';
import '../../../core/models/model_info.dart';

class ApiUriUtils {
  /// 构建规范化的 URI，处理斜杠和空格
  static Uri buildNormalizedUri(String base, String path) {
    final normalizedBase = base.trim().replaceAll(RegExp(r'/+$'), '');
    final normalizedPath = path.trim().replaceAll(RegExp(r'^/+'), '');
    return Uri.parse('$normalizedBase/$normalizedPath');
  }
}

/// 构建请求所需的上下文
class ApiBuildContext {
  final String model;
  final List<ApiMessage> context;
  final bool enableReasoning;
  final String apiKey;
  final String baseUrl;
  final String chatPath;
  final String modelsPath;

  ApiBuildContext({
    required this.model,
    required this.context,
    required this.enableReasoning,
    required this.apiKey,
    required this.baseUrl,
    required this.chatPath,
    required this.modelsPath,
  });
}

/// API 请求构建器接口
abstract class ApiRequestBuilder {
  /// 构建请求 Headers
  Map<String, String> buildHeaders(ApiBuildContext ctx);

  /// 构建请求 URI
  Uri buildUri(ApiBuildContext ctx);
  Uri buildModelsUri(ApiBuildContext ctx);
  
  /// 构建请求 Body
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx);

  /// 解析模型列表响应
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json);
}
```

## File: lib/data/data_sources/api_builders/chat_completions_api_builder.dart
```dart
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
```

## File: lib/data/data_sources/api_builders/google_api_builder.dart
```dart
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
```

## File: lib/data/data_sources/api_builders/responses_api_builder.dart
```dart
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
```
