import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

// ==========================================
// Data Sources
// ==========================================
import '../data/data_sources/local_file_source.dart';
import '../data/data_sources/remote_api_source.dart';

// ==========================================
// Services
// ==========================================
import '../data/services/file_service.dart';
import '../data/services/api_service.dart';
import '../data/services/config_service.dart';

// ==========================================
// Repositories
// ==========================================
import '../data/repositories/conversation_repository.dart';
import '../data/repositories/config_repository.dart';

// ==========================================
// Core Interfaces
// ==========================================
import '../core/interfaces/file_service.dart';
import '../core/interfaces/api_service.dart';
import '../core/interfaces/config_service.dart';

/// 应用初始化状态
enum InitStatus {
  idle,
  loading,
  success,
  error,
}

/// 初始化数据模型
class InitState {
  final InitStatus status;
  final String? errorMessage;
  final ILocalFileSource? fileSource;
  final IFileService? fileService;
  final IApiService? apiService;
  final IConfigService? configService;
  final ConversationRepository? conversationRepository;
  final ConfigRepository? configRepository;

  InitState({
    this.status = InitStatus.idle,
    this.errorMessage,
    this.fileSource,
    this.fileService,
    this.apiService,
    this.configService,
    this.conversationRepository,
    this.configRepository,
  });

  InitState copyWith({
    InitStatus? status,
    String? errorMessage,
    ILocalFileSource? fileSource,
    IFileService? fileService,
    IApiService? apiService,
    IConfigService? configService,
    ConversationRepository? conversationRepository,
    ConfigRepository? configRepository,
  }) {
    return InitState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      fileSource: fileSource ?? this.fileSource,
      fileService: fileService ?? this.fileService,
      apiService: apiService ?? this.apiService,
      configService: configService ?? this.configService,
      conversationRepository: conversationRepository ?? this.conversationRepository,
      configRepository: configRepository ?? this.configRepository,
    );
  }
}

/// 初始化 Notifier
class InitNotifier extends StateNotifier<InitState> {
  InitNotifier() : super(InitState());

  Future<void> initialize() async {
    state = state.copyWith(status: InitStatus.loading);

    try {
      final appDir = await getApplicationDocumentsDirectory();
      final basePath = appDir.path;

      final fileSource = LocalFileSource(basePath);
      await fileSource.initDirectories();

      final fileService = FileService(fileSource);
      final apiService = ApiService(RemoteApiSource());
      final configService = ConfigService(fileService, apiService);

      final conversationRepository = ConversationRepository(fileService);
      final configRepository = ConfigRepository(configService);

      state = state.copyWith(
        status: InitStatus.success,
        fileSource: fileSource,
        fileService: fileService,
        apiService: apiService,
        configService: configService,
        conversationRepository: conversationRepository,
        configRepository: configRepository,
      );
    } catch (e) {
      state = state.copyWith(
        status: InitStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}

// ==========================================
// Providers
// ==========================================

final initProvider = StateNotifierProvider<InitNotifier, InitState>((ref) {
  return InitNotifier();
});

final localFileSourceProvider = Provider<ILocalFileSource>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.fileSource == null) {
    throw StateError('应用未初始化');
  }
  return initState.fileSource!;
});

final fileServiceProvider = Provider<IFileService>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.fileService == null) {
    throw StateError('应用未初始化');
  }
  return initState.fileService!;
});

final apiServiceProvider = Provider<IApiService>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.apiService == null) {
    throw StateError('应用未初始化');
  }
  return initState.apiService!;
});

final configServiceProvider = Provider<IConfigService>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.configService == null) {
    throw StateError('应用未初始化');
  }
  return initState.configService!;
});

final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.conversationRepository == null) {
    throw StateError('应用未初始化');
  }
  return initState.conversationRepository!;
});

final configRepositoryProvider = Provider<ConfigRepository>((ref) {
  final initState = ref.watch(initProvider);
  if (initState.configRepository == null) {
    throw StateError('应用未初始化');
  }
  return initState.configRepository!;
});