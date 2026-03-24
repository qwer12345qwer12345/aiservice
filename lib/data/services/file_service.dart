import 'dart:typed_data';
import '../../core/interfaces/file_service.dart';
import '../../core/models/session.dart';
import '../../core/models/app_config.dart';
import '../../core/models/app_config_store.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/json_utils.dart';
import '../data_sources/local_file_source.dart';

class FileService implements IFileService {
  final ILocalFileSource _fileSource;

  FileService(this._fileSource);

  @override
  Future<AppConfigStore> readConfigStore() async {
    final content = await _fileSource.readTextFile(AppConstants.fileConfig);
    final json = JsonUtils.decode(content);

    // 新格式：多配置存档
    if (json.containsKey('profiles')) {
      return AppConfigStore.fromJson(json);
    }

    // 兼容旧格式：单配置
    final oldConfig = AppConfig.fromJson(json);
    return AppConfigStore(
      activeProfileId: 'default',
      profiles: [
        ConfigProfile(
          id: 'default',
          name: '默认配置',
          config: oldConfig,
        ),
      ],
    );
  }

  @override
  Future<void> writeConfigStore(AppConfigStore store) async {
    final json = store.toJson();
    final content = JsonUtils.encode(json);
    await _fileSource.writeTextFile(AppConstants.fileConfig, content);
  }

  @override
  Future<List<String>> getConversationFileList() async {
    return await _fileSource.listFiles(AppConstants.dirConversations);
  }

  @override
  Future<Session> readSession(String fileName) async {
    final relativePath = '${AppConstants.dirConversations}/$fileName';
    final content = await _fileSource.readTextFile(relativePath);
    final json = JsonUtils.decode(content);
    return Session.fromJson(json);
  }

  @override
  Future<void> writeSession(String fileName, Session session) async {
    final relativePath = '${AppConstants.dirConversations}/$fileName';
    final json = session.toJson();
    final content = JsonUtils.encode(json);
    await _fileSource.writeTextFile(relativePath, content);
  }

  @override
  Future<void> deleteSession(String fileName) async {
    final relativePath = '${AppConstants.dirConversations}/$fileName';
    await _fileSource.deleteFile(relativePath);
  }

  @override
  Future<String> saveAttachment(Uint8List data, String fileName) async {
    return await _fileSource.saveAttachment(data, fileName);
  }

  @override
  Future<Uint8List> readAttachment(String relativePath) async {
    return await _fileSource.readAttachment(relativePath);
  }

  @override
  Future<void> deleteAttachment(String relativePath) async {
    await _fileSource.deleteFile(relativePath);
  }
}