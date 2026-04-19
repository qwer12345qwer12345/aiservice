import '../../../core/models/api_message.dart';
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