import 'dart:typed_data';
import '../models/session.dart';
import '../models/app_config.dart';

abstract class IFileService {
  // 配置
  Future<AppConfig> readConfig();
  Future<void> writeConfig(AppConfig config);

  // 会话
  Future<List<String>> getConversationFileList(); // 获取文件名列表
  Future<Session> readSession(String fileName);   // 读取会话
  Future<void> writeSession(String fileName, Session session); // 保存会话
  Future<void> deleteSession(String fileName);    // 删除会话

  // 附件
  Future<String> saveAttachment(Uint8List data, String fileName); // 返回相对路径
  Future<Uint8List> readAttachment(String relativePath);
  Future<void> deleteAttachment(String relativePath);
}