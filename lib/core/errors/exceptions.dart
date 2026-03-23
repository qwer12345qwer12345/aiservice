/// 基础应用异常
class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, {this.code});

  @override
  String toString() => 'AppException: $message (Code: $code)';
}

/// 文件操作异常
class FileException extends AppException {
  const FileException(super.message, {super.code});
}

/// 网络/API 异常
class ApiException extends AppException {
  const ApiException(super.message, {super.code});
}

/// 配置异常
class ConfigException extends AppException {
  const ConfigException(super.message, {super.code});
}

/// 数据解析异常
class ParseException extends AppException {
  const ParseException(super.message, {super.code});
}