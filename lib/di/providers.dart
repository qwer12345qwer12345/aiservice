import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../data/data_sources/local_file_source.dart';
import '../data/data_sources/remote_api_source.dart';
import '../data/database/database.dart';
import '../data/services/config_service.dart';
import '../data/repositories/conversation_repository.dart';

/// 1. 环境初始化 Provider
final localFileSourceProvider = FutureProvider<LocalFileSource>((ref) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileSource = LocalFileSource(appDir.path);
  await fileSource.initDirectories();
  return fileSource;
});

/// 2. 数据库 Provider
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  ref.watch(localFileSourceProvider); // 触发依赖追踪
  return AppDatabase();
});

/// 3. 远程 API 数据源
final remoteApiSourceProvider = Provider<RemoteApiSource>((ref) {
  return RemoteApiSource();
});

/// 4. 配置服务
final configServiceProvider = Provider<ConfigService>((ref) {
  return ConfigService(
    ref.watch(appDatabaseProvider),
    ref.watch(remoteApiSourceProvider),
  );
});

/// 5. 会话仓库
final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  return ConversationRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(localFileSourceProvider).requireValue, // main() 已阻塞等待，此处必定就绪
  );
});