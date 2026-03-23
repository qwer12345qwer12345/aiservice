import 'dart:convert';
import '../errors/exceptions.dart';

abstract class JsonUtils {
  static Map<String, dynamic> decode(String source) {
    try {
      return jsonDecode(source) as Map<String, dynamic>;
    } catch (e) {
      throw const ParseException('JSON 解析失败', code: 'INVALID_JSON');
    }
  }

  static String encode(Map<String, dynamic> data) {
    try {
      return jsonEncode(data);
    } catch (e) {
      throw const ParseException('JSON 编码失败', code: 'ENCODE_ERROR');
    }
  }
}