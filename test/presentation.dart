import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// ==========================================
// Core Models
// ==========================================
import 'package:aiservice/core/models/message.dart';
import 'package:aiservice/core/models/session.dart';
import 'package:aiservice/core/models/app_config.dart';
import 'package:aiservice/core/models/model_info.dart';
import 'package:aiservice/core/interfaces/api_service.dart';
import 'package:aiservice/core/interfaces/file_service.dart';

// ==========================================
// Domain Models & States
// ==========================================
import 'package:aiservice/domain/models/chat_page.dart' as domain;
import 'package:aiservice/domain/models/tree_node.dart';
import 'package:aiservice/domain/states/chat_state.dart';
import 'package:aiservice/domain/states/branch_state.dart';

// ==========================================
// DI Providers
// ==========================================
import 'package:aiservice/di/providers.dart';

// ==========================================
// Presentation Providers
// ==========================================
import 'package:aiservice/presentation/providers/chat_notifier.dart';
import 'package:aiservice/presentation/providers/branch_notifier.dart';
import 'package:aiservice/presentation/providers/session_list_notifier.dart';
import 'package:aiservice/presentation/providers/config_notifier.dart';

// ==========================================
// Presentation Widgets
// ==========================================
import 'package:aiservice/presentation/widgets/message_bubble.dart';
import 'package:aiservice/presentation/widgets/input_bar.dart';
import 'package:aiservice/presentation/widgets/page_indicator.dart';

// ==========================================
// Data Repositories (for mocking)
// ==========================================
import 'package:aiservice/data/repositories/conversation_repository.dart';
import 'package:aiservice/data/repositories/config_repository.dart';

// ==========================================
// Mocks - ✅ 只包含可 mock 的类
// ==========================================
@GenerateMocks([
  IApiService,
  IFileService,
  ConversationRepository,
  ConfigRepository,
])
import 'presentation.mocks.dart';

void main() {
  group('Presentation Layer Tests', () {
    
    // ==========================================
    // 1. ChatNotifier 测试
    // ==========================================
    group('ChatNotifier', () {
      late ProviderContainer container;
      late MockConversationRepository mockRepo;
      late MockIApiService mockApiService;
      late MockConfigRepository mockConfigRepo;

      setUp(() {
        mockRepo = MockConversationRepository();
        mockApiService = MockIApiService();
        mockConfigRepo = MockConfigRepository();

        container = ProviderContainer(
          overrides: [
            initProvider.overrideWith((ref) {
              final notifier = InitNotifier();
              notifier.state = InitState(
                status: InitStatus.success,
                conversationRepository: mockRepo,
                apiService: mockApiService,
                configRepository: mockConfigRepo,
                fileService: MockIFileService(),
              );
              return notifier;
            }),
            conversationRepositoryProvider.overrideWithValue(mockRepo),
            apiServiceProvider.overrideWithValue(mockApiService),
            configRepositoryProvider.overrideWithValue(mockConfigRepo),
          ],
        );
      });

      tearDown(() {
        container.dispose();
      });

      test('初始状态正确', () {
        final state = container.read(chatProvider);
        expect(state.isStreaming, false);
        expect(state.error, isNull);
        expect(state.isLoading, false);
      });

      test('changePage 更新页码', () {
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: [],
        );
        
        container.read(chatProvider.notifier).state = ChatState.initial().copyWith(
          session: session,
          pageList: domain.ChatPageList.fromPages([], 0),
        );

        container.read(chatProvider.notifier).changePage(5);
        final state = container.read(chatProvider);
        expect(state.pageList?.currentPageIndex, 0);
      });

      test('stopGeneration 调用 API 取消', () {
        when(mockApiService.cancelRequest()).thenAnswer((_) => {});
        container.read(chatProvider.notifier).stopGeneration();
        verify(mockApiService.cancelRequest()).called(1);
      });
    });

    // ==========================================
    // 2. BranchNotifier 测试
    // ==========================================
    group('BranchNotifier', () {
      late ProviderContainer container;

      setUp(() {
        container = ProviderContainer(
          overrides: [
            initProvider.overrideWith((ref) {
              final notifier = InitNotifier();
              notifier.state = InitState(status: InitStatus.success);
              return notifier;
            }),
          ],
        );
      });

      tearDown(() {
        container.dispose();
      });

      test('初始状态正确', () {
        final state = container.read(branchProvider);
        expect(state.roots, isEmpty);
        expect(state.selectedNodeId, isNull);
        expect(state.isVisible, false);
      });

      test('loadBranchTree 加载树', () {
        final messages = [
          Message(
            id: 'msg1',
            parentId: 'null',
            role: 'user',
            content: 'Hello',
            timestamp: 0,
          ),
        ];
        container.read(branchProvider.notifier).loadBranchTree(messages);
        final state = container.read(branchProvider);
        expect(state.roots, isNotEmpty);
      });

      test('selectNode 选择节点', () {
        final messages = [
          Message(
            id: 'msg1',
            parentId: 'null',
            role: 'user',
            content: 'Hello',
            timestamp: 0,
          ),
        ];
        container.read(branchProvider.notifier).loadBranchTree(messages);
        container.read(branchProvider.notifier).selectNode('msg1');
        final state = container.read(branchProvider);
        expect(state.selectedNodeId, 'msg1');
        expect(state.highlightedPath, isNotEmpty);
      });

      test('clearSelection 清除选择', () {
        final messages = [
          Message(
            id: 'msg1',
            parentId: 'null',
            role: 'user',
            content: 'Hello',
            timestamp: 0,
          ),
        ];
        container.read(branchProvider.notifier).loadBranchTree(messages);
        container.read(branchProvider.notifier).selectNode('msg1');
        container.read(branchProvider.notifier).clearSelection();
        final state = container.read(branchProvider);
        expect(state.selectedNodeId, isNull);
        expect(state.highlightedPath, isNull);
      });

      test('toggleVisible 切换可见性', () {
        container.read(branchProvider.notifier).toggleVisible(true);
        expect(container.read(branchProvider).isVisible, true);
        
        container.read(branchProvider.notifier).toggleVisible(false);
        expect(container.read(branchProvider).isVisible, false);
      });

      test('canNavigate 判断正确', () {
        expect(container.read(branchProvider.notifier).canNavigate, false);
        
        final messages = [
          Message(
            id: 'msg1',
            parentId: 'null',
            role: 'user',
            content: 'Hello',
            timestamp: 0,
          ),
        ];
        container.read(branchProvider.notifier).loadBranchTree(messages);
        container.read(branchProvider.notifier).selectNode('msg1');
        expect(container.read(branchProvider.notifier).canNavigate, true);
      });

      test('getSelectedNode 获取选中节点', () {
        final messages = [
          Message(
            id: 'msg1',
            parentId: 'null',
            role: 'user',
            content: 'Hello',
            timestamp: 0,
          ),
        ];
        container.read(branchProvider.notifier).loadBranchTree(messages);
        container.read(branchProvider.notifier).selectNode('msg1');
        final node = container.read(branchProvider.notifier).getSelectedNode();
        expect(node, isNotNull);
        expect(node?.id, 'msg1');
      });
    });

    // ==========================================
    // 3. SessionListNotifier 测试
    // ==========================================
    group('SessionListNotifier', () {
      late ProviderContainer container;
      late MockConversationRepository mockRepo;

      setUp(() {
        mockRepo = MockConversationRepository();
        
        container = ProviderContainer(
          overrides: [
            initProvider.overrideWith((ref) {
              final notifier = InitNotifier();
              notifier.state = InitState(
                status: InitStatus.success,
                conversationRepository: mockRepo,
              );
              return notifier;
            }),
            conversationRepositoryProvider.overrideWithValue(mockRepo),
          ],
        );
      });

      tearDown(() {
        container.dispose();
      });

      test('refresh 刷新列表', () async {
        when(mockRepo.getAllSessionFileNames())
            .thenAnswer((_) async => ['a.json', 'b.json']);
        
        await container.read(sessionListProvider.notifier).refresh();
        final state = container.read(sessionListProvider);
        expect(state.value, isNotNull);
        expect(state.value?.length, 2);
      });

      test('deleteSession 删除会话', () async {
        when(mockRepo.getAllSessionFileNames())
            .thenAnswer((_) async => ['a.json']);
        when(mockRepo.deleteSession(any)).thenAnswer((_) async => {});
        when(mockRepo.getAllSessionFileNames())
            .thenAnswer((_) async => []);
        
        await container.read(sessionListProvider.notifier).deleteSession('a.json');
        verify(mockRepo.deleteSession('a.json')).called(1);
      });

      test('createSession 创建会话', () async {
        when(mockRepo.getAllSessionFileNames())
            .thenAnswer((_) async => []);
        when(mockRepo.createSession(fileName: anyNamed('fileName'), title: anyNamed('title')))
            .thenAnswer((_) async => Session(
              id: 'test',
              title: '测试',
              createdAt: 0,
              updatedAt: 0,
              messages: [],
            ));
        
        final fileName = await container.read(sessionListProvider.notifier).createSession('测试');
        expect(fileName, contains('测试'));
      });
    });

    // ==========================================
    // 4. ConfigNotifier 测试
    // ==========================================
    group('ConfigNotifier', () {
      late ProviderContainer container;
      late MockConfigRepository mockRepo;

      setUp(() {
        mockRepo = MockConfigRepository();
        
        container = ProviderContainer(
          overrides: [
            initProvider.overrideWith((ref) {
              final notifier = InitNotifier();
              notifier.state = InitState(
                status: InitStatus.success,
                configRepository: mockRepo,
              );
              return notifier;
            }),
            configRepositoryProvider.overrideWithValue(mockRepo),
          ],
        );
      });

      tearDown(() {
        container.dispose();
      });

      test('updateApiKey 更新 API 密钥', () async {
        when(mockRepo.getConfig()).thenAnswer((_) async => AppConfig.defaultConfig());
        when(mockRepo.updateApiKey(any)).thenAnswer((_) async => {});
        when(mockRepo.getConfig()).thenAnswer((_) async => AppConfig.defaultConfig().copyWith(apiKey: 'sk-new'));
        
        await container.read(configProvider.notifier).updateApiKey('sk-new');
        verify(mockRepo.updateApiKey('sk-new')).called(1);
      });

      test('updateBaseUrl 更新 Base URL', () async {
        when(mockRepo.getConfig()).thenAnswer((_) async => AppConfig.defaultConfig());
        when(mockRepo.updateBaseUrl(any)).thenAnswer((_) async => {});
        
        await container.read(configProvider.notifier).updateBaseUrl('https://test.com');
        verify(mockRepo.updateBaseUrl('https://test.com')).called(1);
      });

      test('updateEnableReasoning 更新深度思考开关', () async {
        when(mockRepo.getConfig()).thenAnswer((_) async => AppConfig.defaultConfig());
        when(mockRepo.updateEnableReasoning(any)).thenAnswer((_) async => {});
        
        await container.read(configProvider.notifier).updateEnableReasoning(true);
        verify(mockRepo.updateEnableReasoning(true)).called(1);
      });

      test('refreshModels 刷新模型列表', () async {
        when(mockRepo.getConfig()).thenAnswer((_) async => AppConfig.defaultConfig());
        when(mockRepo.refreshModels()).thenAnswer((_) async => {});
        
        await container.read(configProvider.notifier).refreshModels();
        verify(mockRepo.refreshModels()).called(1);
      });
    });

    // ==========================================
    // 5. Widget 测试
    // ==========================================
    group('Widgets', () {
      
      group('MessageBubble', () {
        testWidgets('用户消息渲染正确', (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: MessageBubble(
                  message: Message(
                    id: 'msg1',
                    parentId: 'null',
                    role: 'user',
                    content: 'Hello World',
                    timestamp: 0,
                  ),
                  isUser: true,
                ),
              ),
            ),
          );

          expect(find.text('Hello World'), findsOneWidget);
        });

        testWidgets('AI 消息渲染正确', (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: MessageBubble(
                  message: Message(
                    id: 'msg1',
                    parentId: 'null',
                    role: 'assistant',
                    content: 'I am AI',
                    timestamp: 0,
                  ),
                  isUser: false,
                ),
              ),
            ),
          );

          expect(find.text('I am AI'), findsOneWidget);
        });

        testWidgets('深度思考内容渲染', (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: MessageBubble(
                  message: const Message(
                    id: 'msg1',
                    parentId: 'null',
                    role: 'assistant',
                    content: '回答内容',
                    timestamp: 0,
                  ),
                  isUser: false,
                  reasoningContent: '这是思考过程...',
                ),
              ),
            ),
          );

          expect(find.text('回答内容'), findsOneWidget);
          expect(find.text('💭 思考过程'), findsOneWidget);
        });
      });

      group('InputBar', () {
        testWidgets('输入框初始为空', (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                bottomNavigationBar: InputBar(
                  onSend: _onSend,
                ),
              ),
            ),
          );

          final textField = find.byType(TextField);
          expect(textField, findsOneWidget);
        });

        testWidgets('发送按钮在非流式状态下显示发送图标', (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                bottomNavigationBar: InputBar(
                  onSend: _onSend,
                  isStreaming: false,
                ),
              ),
            ),
          );

          expect(find.byIcon(Icons.send), findsOneWidget);
          expect(find.byIcon(Icons.stop), findsNothing);
        });

        testWidgets('发送按钮在流式状态下显示停止图标', (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                bottomNavigationBar: InputBar(
                  onSend: _onSend,
                  onStop: () {},
                  isStreaming: true,
                ),
              ),
            ),
          );

          expect(find.byIcon(Icons.send), findsNothing);
          expect(find.byIcon(Icons.stop), findsOneWidget);
        });

        testWidgets('输入内容后发送', (WidgetTester tester) async {
          bool sent = false;
          String sentContent = '';

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                bottomNavigationBar: InputBar(
                  onSend: (content) {
                    sent = true;
                    sentContent = content;
                  },
                ),
              ),
            ),
          );

          await tester.enterText(find.byType(TextField), '测试消息');
          await tester.tap(find.byIcon(Icons.send));
          await tester.pump();

          expect(sent, true);
          expect(sentContent, '测试消息');
        });
      });

      group('PageIndicator', () {
        testWidgets('页码显示正确', (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: PageIndicator(
                  currentPage: 2,
                  totalPages: 10,
                ),
              ),
            ),
          );

          expect(find.text('3 / 10'), findsOneWidget);
        });

        testWidgets('第一页显示正确', (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: PageIndicator(
                  currentPage: 0,
                  totalPages: 5,
                ),
              ),
            ),
          );

          expect(find.text('1 / 5'), findsOneWidget);
        });
      });
    });

    // ==========================================
    // 6. 集成测试
    // ==========================================
    group('Integration Tests', () {
      test('ChatNotifier 完整流程', () async {
        final mockRepo = MockConversationRepository();
        final mockApi = MockIApiService();
        
        final container = ProviderContainer(
          overrides: [
            initProvider.overrideWith((ref) {
              final notifier = InitNotifier();
              notifier.state = InitState(
                status: InitStatus.success,
                conversationRepository: mockRepo,
                apiService: mockApi,
                configRepository: MockConfigRepository(),
              );
              return notifier;
            }),
          ],
        );

        expect(container.read(chatProvider).isStreaming, false);

        when(mockApi.cancelRequest()).thenAnswer((_) => {});
        container.read(chatProvider.notifier).stopGeneration();
        verify(mockApi.cancelRequest()).called(1);

        container.dispose();
      });

      test('BranchNotifier 完整流程', () async {
        final container = ProviderContainer(
          overrides: [
            initProvider.overrideWith((ref) {
              final notifier = InitNotifier();
              notifier.state = InitState(status: InitStatus.success);
              return notifier;
            }),
          ],
        );

        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A', timestamp: 1),
        ];
        container.read(branchProvider.notifier).loadBranchTree(messages);
        container.read(branchProvider.notifier).selectNode('msg1');
        expect(container.read(branchProvider).selectedNodeId, 'msg1');
        expect(container.read(branchProvider.notifier).canNavigate, true);
        
        final node = container.read(branchProvider.notifier).getSelectedNode();
        expect(node, isNotNull);
        
        container.read(branchProvider.notifier).clearSelection();
        expect(container.read(branchProvider).selectedNodeId, isNull);

        container.dispose();
      });
    });
  });
}

// ==========================================
// 辅助函数
// ==========================================
void _onSend(String content) {}