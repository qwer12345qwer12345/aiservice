import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// ==========================================
// Core Models
// ==========================================
import 'package:aiservice/core/models/session.dart';
import 'package:aiservice/core/models/message.dart';
import 'package:aiservice/core/models/app_config.dart';
import 'package:aiservice/core/models/model_info.dart';
import 'package:aiservice/core/models/chat_chunk.dart';
import 'package:aiservice/core/errors/exceptions.dart';

// ==========================================
// Data Layer
// ==========================================
import 'package:aiservice/data/services/file_service.dart';
import 'package:aiservice/data/services/api_service.dart';
import 'package:aiservice/data/services/config_service.dart';
import 'package:aiservice/data/repositories/conversation_repository.dart';
import 'package:aiservice/data/repositories/config_repository.dart';
import 'package:aiservice/data/data_sources/local_file_source.dart';
import 'package:aiservice/data/data_sources/remote_api_source.dart';

// ==========================================
// Core Interfaces
// ==========================================
import 'package:aiservice/core/interfaces/file_service.dart';
import 'package:aiservice/core/interfaces/api_service.dart';
import 'package:aiservice/core/interfaces/config_service.dart';

// ==========================================
// DI Providers
// ==========================================
import 'package:aiservice/di/providers.dart';

// ==========================================
// Mocks
// ==========================================
@GenerateMocks([
  ILocalFileSource,
  IRemoteApiSource,
  IFileService,
  IApiService,
  IConfigService,
])
import 'data.mocks.dart';

void main() {
  group('Data Layer Tests', () {
    
    // ==========================================
    // 1. FileService 测试
    // ==========================================
    group('FileService', () {
      late MockILocalFileSource mockFileSource;
      late FileService fileService;

      setUp(() {
        mockFileSource = MockILocalFileSource();
        fileService = FileService(mockFileSource);
      });

      test('readConfig 成功', () async {
        final config = AppConfig.defaultConfig();
        when(mockFileSource.readTextFile('config.json'))
            .thenAnswer((_) async => jsonEncode(config.toJson()));
        
        final result = await fileService.readConfig();
        expect(result.baseUrl, config.baseUrl);
        expect(result.apiKey, config.apiKey);
      });

      test('writeConfig 成功', () async {
        final config = AppConfig.defaultConfig();
        when(mockFileSource.writeTextFile(any, any))
            .thenAnswer((_) async => {});
        
        await fileService.writeConfig(config);
        verify(mockFileSource.writeTextFile('config.json', any)).called(1);
      });

      test('readSession 成功', () async {
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: [],
        );
        when(mockFileSource.readTextFile(any))
            .thenAnswer((_) async => jsonEncode(session.toJson()));
        
        final result = await fileService.readSession('test.json');
        expect(result.title, '测试');
      });

      test('getConversationFileList 成功', () async {
        when(mockFileSource.listFiles('conversations'))
            .thenAnswer((_) async => ['a.json', 'b.json']);
        
        final result = await fileService.getConversationFileList();
        expect(result.length, 2);
        expect(result, contains('a.json'));
      });
    });

    // ==========================================
    // 2. ApiService 测试
    // ==========================================
    group('ApiService', () {
      late MockIRemoteApiSource mockApiSource;
      late ApiService apiService;

      setUp(() {
        mockApiSource = MockIRemoteApiSource();
        apiService = ApiService(mockApiSource);
      });

      test('fetchModels 成功', () async {
        final models = [
          ModelInfo(id: 'gpt-4', name: 'GPT-4', supportsReasoning: true),
        ];
        when(mockApiSource.fetchModels(baseUrl: anyNamed('baseUrl'), apiKey: anyNamed('apiKey')))
            .thenAnswer((_) async => models);
        
        final result = await apiService.fetchModels(baseUrl: 'test', apiKey: 'key');
        expect(result.length, 1);
        expect(result.first.id, 'gpt-4');
      });

      test('chatStream 成功', () async {
        final stream = Stream.fromIterable([
          ChatChunk(content: 'Hello', reasoningContent: null, isDone: false),
          ChatChunk(content: ' World', reasoningContent: null, isDone: true),
        ]);
        when(mockApiSource.chatStream(
          baseUrl: anyNamed('baseUrl'),
          apiKey: anyNamed('apiKey'),
          model: anyNamed('model'),
          context: anyNamed('context'),
          enableReasoning: anyNamed('enableReasoning'),
        )).thenAnswer((_) => stream);

        final chunks = await apiService.chatStream(
          baseUrl: 'test',
          apiKey: 'key',
          model: 'gpt-4',
          context: [],
        ).toList();

        expect(chunks.length, 2);
        expect(chunks.first.content, 'Hello');
        expect(chunks.last.isDone, true);
      });

      test('cancelRequest 调用成功', () async {
        when(mockApiSource.cancelRequest()).thenAnswer((_) => {});
        apiService.cancelRequest();
        verify(mockApiSource.cancelRequest()).called(1);
      });
    });

    // ==========================================
    // 3. ConfigService 测试
    // ==========================================
    group('ConfigService', () {
      late MockIFileService mockFileService;
      late MockIApiService mockApiService;
      late ConfigService configService;

      setUp(() {
        mockFileService = MockIFileService();
        mockApiService = MockIApiService();
        configService = ConfigService(mockFileService, mockApiService);
      });

      test('loadConfig 成功', () async {
        final config = AppConfig.defaultConfig();
        when(mockFileService.readConfig()).thenAnswer((_) async => config);
        
        final result = await configService.loadConfig();
        expect(result.apiKey, '');
      });

      test('loadConfig 失败返回默认配置', () async {
        when(mockFileService.readConfig()).thenThrow(const FileException('error'));
        when(mockFileService.writeConfig(any)).thenAnswer((_) async => {});
        
        final result = await configService.loadConfig();
        expect(result, isA<AppConfig>());
        verify(mockFileService.writeConfig(any)).called(1);
      });

      test('saveConfig 成功', () async {
        final config = AppConfig.defaultConfig();
        when(mockFileService.writeConfig(any)).thenAnswer((_) async => {});
        
        await configService.saveConfig(config);
        verify(mockFileService.writeConfig(config)).called(1);
      });

      test('refreshModels 成功', () async {
        final config = AppConfig.defaultConfig();
        final models = [ModelInfo(id: 'gpt-4', name: 'GPT-4')];
        
        when(mockFileService.readConfig()).thenAnswer((_) async => config);
        // ✅ 修复：使用 anyNamed 指定命名参数
        when(mockApiService.fetchModels(
          baseUrl: anyNamed('baseUrl'),
          apiKey: anyNamed('apiKey'),
        )).thenAnswer((_) async => models);
        when(mockFileService.writeConfig(any)).thenAnswer((_) async => {});
        
        await configService.loadConfig();
        await configService.refreshModels();
        
        verify(mockApiService.fetchModels(
          baseUrl: anyNamed('baseUrl'),
          apiKey: anyNamed('apiKey'),
        )).called(1);
      });
    });

    // ==========================================
    // 4. ConversationRepository 测试
    // ==========================================
    group('ConversationRepository', () {
      late MockIFileService mockFileService;
      late ConversationRepository repository;

      setUp(() {
        mockFileService = MockIFileService();
        repository = ConversationRepository(mockFileService);
      });

      test('getAllSessionFileNames 成功', () async {
        when(mockFileService.getConversationFileList())
            .thenAnswer((_) async => ['a.json', 'b.json']);
        
        final result = await repository.getAllSessionFileNames();
        expect(result.length, 2);
      });

      test('createSession 成功', () async {
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: [],
        );
        when(mockFileService.writeSession(any, any)).thenAnswer((_) async => {});
        when(mockFileService.readSession(any)).thenAnswer((_) async => session);
        
        final result = await repository.createSession(fileName: 'test.json', title: '测试');
        expect(result.title, '测试');
        verify(mockFileService.writeSession('test.json', any)).called(1);
      });

      test('appendMessage 成功', () async {
        final oldSession = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: [],
        );
        final message = Message(
          id: 'msg1',
          parentId: 'null',
          role: 'user',
          content: 'hello',
          timestamp: 0,
        );
        
        when(mockFileService.readSession(any)).thenAnswer((_) async => oldSession);
        when(mockFileService.writeSession(any, any)).thenAnswer((_) async => {});
        
        await repository.appendMessage('test.json', message);
        verify(mockFileService.writeSession(any, argThat(isA<Session>()))).called(1);
      });

      test('deleteSession 成功', () async {
        when(mockFileService.deleteSession(any)).thenAnswer((_) async => {});
        await repository.deleteSession('test.json');
        verify(mockFileService.deleteSession('test.json')).called(1);
      });
    });

    // ==========================================
    // 5. ConfigRepository 测试
    // ==========================================
    group('ConfigRepository', () {
      late MockIConfigService mockConfigService;
      late ConfigRepository repository;

      setUp(() {
        mockConfigService = MockIConfigService();
        repository = ConfigRepository(mockConfigService);
      });

      test('getConfig 成功', () async {
        final config = AppConfig.defaultConfig();
        when(mockConfigService.loadConfig()).thenAnswer((_) async => config);
        
        final result = await repository.getConfig();
        expect(result.theme, 'system');
      });

      test('updateApiKey 成功', () async {
        final config = AppConfig.defaultConfig();
        when(mockConfigService.loadConfig()).thenAnswer((_) async => config);
        when(mockConfigService.saveConfig(any)).thenAnswer((_) async => {});
        
        await repository.updateApiKey('sk-new');
        verify(mockConfigService.saveConfig(argThat(
          predicate<AppConfig>((c) => c.apiKey == 'sk-new'),
        ))).called(1);
      });

      test('updateEnableReasoning 成功', () async {
        final config = AppConfig.defaultConfig();
        when(mockConfigService.loadConfig()).thenAnswer((_) async => config);
        when(mockConfigService.saveConfig(any)).thenAnswer((_) async => {});
        
        await repository.updateEnableReasoning(true);
        verify(mockConfigService.saveConfig(argThat(
          predicate<AppConfig>((c) => c.enableReasoning == true),
        ))).called(1);
      });

      test('getAvailableModelIds 成功', () async {
        final config = AppConfig(
          baseUrl: '',
          apiKey: '',
          availableModels: [
            ModelInfo(id: 'gpt-4', name: 'GPT-4'),
            ModelInfo(id: 'gpt-3.5', name: 'GPT-3.5'),
          ],
        );
        when(mockConfigService.loadConfig()).thenAnswer((_) async => config);
        
        final result = await repository.getAvailableModelIds();
        expect(result.length, 2);
        expect(result, contains('gpt-4'));
      });
    });

    // ==========================================
    // 6. Riverpod Provider 测试
    // ==========================================
    group('Riverpod Providers', () {
      late ProviderContainer container;
      late MockILocalFileSource mockFileSource;
      late MockIApiService mockApiService;
      late MockIFileService mockFileService;
      late MockIConfigService mockConfigService;
      late ConversationRepository mockConvRepo;
      late ConfigRepository mockConfigRepo;

      setUp(() {
        mockFileSource = MockILocalFileSource();
        mockApiService = MockIApiService();
        mockFileService = MockIFileService();
        mockConfigService = MockIConfigService();
        mockConvRepo = ConversationRepository(mockFileService);
        mockConfigRepo = ConfigRepository(mockConfigService);

        // ✅ 修复：直接返回预初始化的状态
        container = ProviderContainer(
          overrides: [
            initProvider.overrideWith((ref) {
              final notifier = InitNotifier();
              notifier.state = InitState(
                status: InitStatus.success,
                fileSource: mockFileSource,
                fileService: mockFileService,
                apiService: mockApiService,
                configService: mockConfigService,
                conversationRepository: mockConvRepo,
                configRepository: mockConfigRepo,
              );
              return notifier;
            }),
          ],
        );
      });

      tearDown(() {
        container.dispose();
      });

      test('fileServiceProvider 创建成功', () {
        final fileService = container.read(fileServiceProvider);
        expect(fileService, isA<IFileService>());
      });

      test('apiServiceProvider 创建成功', () {
        final apiService = container.read(apiServiceProvider);
        expect(apiService, isA<IApiService>());
      });

      test('conversationRepositoryProvider 创建成功', () {
        final repository = container.read(conversationRepositoryProvider);
        expect(repository, isA<ConversationRepository>());
      });

      test('configRepositoryProvider 创建成功', () {
        final repository = container.read(configRepositoryProvider);
        expect(repository, isA<ConfigRepository>());
      });
    });

    // ==========================================
    // 7. 集成测试
    // ==========================================
    group('Integration Tests', () {
      late MockIFileService mockFileService;
      late MockIApiService mockApiService;
      late MockIConfigService mockConfigService;
      late ConversationRepository convRepo;
      late ConfigRepository configRepo;

      setUp(() {
        mockFileService = MockIFileService();
        mockApiService = MockIApiService();
        mockConfigService = MockIConfigService();
        convRepo = ConversationRepository(mockFileService);
        configRepo = ConfigRepository(mockConfigService);
      });

      test('完整会话创建流程', () async {
        when(mockFileService.writeSession(any, any)).thenAnswer((_) async => {});
        final session = await convRepo.createSession(fileName: 'test.json', title: '测试');
        expect(session.title, '测试');

        final message = Message(
          id: 'msg1',
          parentId: 'null',
          role: 'user',
          content: 'hello',
          timestamp: 0,
        );
        when(mockFileService.readSession(any)).thenAnswer((_) async => session);
        when(mockFileService.writeSession(any, any)).thenAnswer((_) async => {});
        await convRepo.appendMessage('test.json', message);

        verify(mockFileService.writeSession(any, any)).called(2);
      });

      test('配置更新流程', () async {
        final config = AppConfig.defaultConfig();
        when(mockConfigService.loadConfig()).thenAnswer((_) async => config);
        when(mockConfigService.saveConfig(any)).thenAnswer((_) async => {});

        await configRepo.updateApiKey('sk-test');
        await configRepo.updateEnableReasoning(true);

        verify(mockConfigService.saveConfig(any)).called(2);
      });
    });
  });
}