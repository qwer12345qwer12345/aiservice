import 'package:aiservice/data/repositories/config_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../data/data_sources/local_file_source.dart';
import '../data/data_sources/remote_chat_source.dart'; // 替换原 remote_api_source
import '../data/data_sources/chat_source_router.dart'; // 新增
import '../data/database/database.dart';
import '../data/services/config_service.dart';
import '../data/repositories/conversation_repository.dart';

final localFileSourceProvider = FutureProvider<LocalFileSource>((ref) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileSource = LocalFileSource(appDir.path);
  await fileSource.initDirectories();
  return fileSource;
});

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  ref.watch(localFileSourceProvider);
  return AppDatabase();
});

// --- 新增 Data Sources ---
final remoteChatSourceProvider = Provider<RemoteChatSource>((ref) => RemoteChatSource());

final chatSourceRouterProvider = Provider<ChatSourceRouter>((ref) {
  return ChatSourceRouter(
    ref.watch(remoteChatSourceProvider),
  );
});

final configRepositoryProvider = Provider<ConfigRepository>((ref) {
  return ConfigRepository(ref.watch(appDatabaseProvider));
});

final configServiceProvider = Provider<ConfigService>((ref) {
  return ConfigService(
    ref.watch(configRepositoryProvider),
    ref.watch(chatSourceRouterProvider),
  );
});

final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  return ConversationRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(localFileSourceProvider).requireValue,
  );
});