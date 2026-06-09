import '../../../core/models/api_message.dart';
import '../../../core/models/app_config.dart';  // 引入 ConfigProfile
import '../../../core/models/model_info.dart';

class ApiUriUtils {
  static Uri buildNormalizedUri(String base, String path) {
    final normalizedBase = base.trim().replaceAll(RegExp(r'/+$'), '');
    final normalizedPath = path.trim().replaceAll(RegExp(r'^/+'), '');
    return Uri.parse('$normalizedBase/$normalizedPath');
  }
}

/// 构建请求所需的上下文
class ApiBuildContext {
  final ConfigProfile config;   // 整体配置档案
  final String model;
  final List<ApiMessage> context;
  final bool enableReasoning;

  ApiBuildContext({
    required this.config,
    required this.model,
    required this.context,
    required this.enableReasoning,
  });
}

abstract class ApiRequestBuilder {
  Map<String, String> buildHeaders(ApiBuildContext ctx);
  Uri buildUri(ApiBuildContext ctx);
  Uri buildModelsUri(ApiBuildContext ctx);
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx);
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json);
}