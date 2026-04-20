// lib/data/data_sources/api_builders/model_info_parser.dart
import '../../../core/models/model_info.dart';

class ModelInfoParser {
  /// 从 /v1/models 或 /v1/responses 等标准 OpenAI 风格响应中解析模型列表
  static List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>? ?? [];
    return data.map((e) => _parseModelInfo(e as Map<String, dynamic>)).toList();
  }

  static ModelInfo _parseModelInfo(Map<String, dynamic> json) {
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
      overrideSupportsReasoning:
          readBool(json, ['overrideSupportsReasoning', 'override_supports_reasoning']),
      overrideSupportsVision:
          readBool(json, ['overrideSupportsVision', 'override_supports_vision']),
    );
  }
}