import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../data/data_sources/local_file_source.dart';
import '../data/data_sources/remote_api_source.dart';
import '../data/database/database.dart';
import '../data/services/config_service.dart';
import '../data/repositories/conversation_repository.dart';
import '../core/interfaces/config_service.dart';

enum InitStatus { idle, loading, success, error }

class InitState {
  final InitStatus status;
  final String? errorMessage;
  final AppDatabase? appDatabase;
  final ILocalFileSource? fileSource;
  final IRemoteApiSource? remoteApiSource;
  final IConfigService? configService;
  final ConversationRepository? conversationRepository;

  InitState({
    this.status = InitStatus.idle,
    this.errorMessage,
    this.appDatabase,
    this.fileSource,
    this.remoteApiSource,
    this.configService,
    this.conversationRepository,
  });

  InitState copyWith({
    InitStatus? status,
    String? errorMessage,
    AppDatabase? appDatabase,
    ILocalFileSource? fileSource,
    IRemoteApiSource? remoteApiSource,
    IConfigService? configService,
    ConversationRepository? conversationRepository,
  }) {
    return InitState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      appDatabase: appDatabase ?? this.appDatabase,
      fileSource: fileSource ?? this.fileSource,
      remoteApiSource: remoteApiSource ?? this.remoteApiSource,
      configService: configService ?? this.configService,
      conversationRepository: conversationRepository ?? this.conversationRepository,
    );
  }
}

class InitNotifier extends StateNotifier<InitState> {
  InitNotifier() : super(InitState());

  Future<void> initialize() async {
    state = state.copyWith(status: InitStatus.loading);
    try {
      // 1. 初始化文件目录
      final appDir = await getApplicationDocumentsDirectory();
      final basePath = appDir.path;
      final fileSource = LocalFileSource(basePath);
      await fileSource.initDirectories();
      
      // 2. 初始化数据库
      final appDatabase = AppDatabase();

      // 3. 构建服务与 Repositories
      final remoteApiSource = RemoteApiSource();
      final configService = ConfigService(appDatabase, remoteApiSource);
      final conversationRepository = ConversationRepository(appDatabase, fileSource);

      state = state.copyWith(
        status: InitStatus.success,
        appDatabase: appDatabase,
        fileSource: fileSource,
        remoteApiSource: remoteApiSource,
        configService: configService,
        conversationRepository: conversationRepository,
      );
    } catch (e) {
      state = state.copyWith(
        status: InitStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}

final initProvider = StateNotifierProvider<InitNotifier, InitState>((ref) => InitNotifier());

final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.conversationRepository == null) throw StateError('应用未初始化');
  return initState.conversationRepository!;
});

final configServiceProvider = Provider<IConfigService>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.configService == null) throw StateError('应用未初始化');
  return initState.configService!;
});

final remoteApiSourceProvider = Provider<IRemoteApiSource>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.remoteApiSource == null) throw StateError('应用未初始化');
  return initState.remoteApiSource!;
});