import 'dart:typed_data';
import '../models/session.dart';
import '../models/app_config_store.dart';

abstract class IFileService {
  // 配置
  Future<AppConfigStore> readConfigStore();
  Future<void> writeConfigStore(AppConfigStore store);

  // 会话
  Future<List<String>> getConversationFileList();
  Future<Session> readSession(String fileName);
  Future<void> writeSession(String fileName, Session session);
  Future<void> deleteSession(String fileName);

  // 附件
  Future<String> saveAttachment(Uint8List data, String fileName);
  Future<Uint8List> readAttachment(String relativePath);
  Future<void> deleteAttachment(String relativePath);
}