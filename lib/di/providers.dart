import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../data/data_sources/chat_source.dart';
import '../data/data_sources/local_file_source.dart';
import '../data/data_sources/remote_chat_source.dart';
import '../data/database/database.dart';
import '../data/repositories/config_repository.dart';
import '../data/repositories/conversation_repository.dart';
import '../data/services/config_service.dart';
import '../domain/services/chat_service.dart';

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

final remoteChatSourceProvider = Provider<ChatSource>((ref) => RemoteChatSource());

final configRepositoryProvider = Provider<ConfigRepository>((ref) {
  return ConfigRepository(ref.watch(appDatabaseProvider));
});

final configServiceProvider = Provider<ConfigService>((ref) {
  return ConfigService(
    ref.watch(configRepositoryProvider),
    ref.watch(remoteChatSourceProvider),
  );
});

final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  return ConversationRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(localFileSourceProvider).requireValue,
  );
});

final chatServiceProvider = Provider<ChatService>((ref) {
  return ChatService(
    repository: ref.watch(conversationRepositoryProvider),
    configService: ref.watch(configServiceProvider),
    chatSource: ref.watch(remoteChatSourceProvider),
  );
});