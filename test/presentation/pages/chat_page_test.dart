import 'package:aiservice/core/models/app_config.dart';
import 'package:aiservice/di/providers.dart';
import 'package:aiservice/presentation/providers/config_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:aiservice/core/models/chat_round.dart';
import 'package:aiservice/core/models/attachment.dart';
import 'package:aiservice/presentation/pages/chat_page.dart';
import 'package:aiservice/presentation/providers/chat_notifier.dart';
import 'package:aiservice/presentation/providers/input_notifier.dart';
import 'package:aiservice/data/repositories/conversation_repository.dart';
import 'package:aiservice/presentation/models/pending_attachment.dart';

// ================= Mocks =================

class MockChatController extends Mock implements ChatController {}

class MockConversationRepository extends Mock
    implements ConversationRepository {}

// ================= Test Helpers =================

Widget _buildTestApp({
  required Widget home,
  required ProviderContainer container,
}) {
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(home: home),
  );
}

ProviderContainer _createContainer({
  MockChatController? mockController,
  MockConversationRepository? mockRepo,
  ChatRound? initialRound,
}) {
  final container = ProviderContainer(
    overrides: [
      // 覆盖 Repository
      configProvider.overrideWith((ref) => Stream.value(AppConfig.defaultConfig())),

      // 覆盖 ChatController (Family)
      conversationRepositoryProvider.overrideWith((ref) => mockRepo ?? MockConversationRepository()),

      // 覆盖 ChatController (Family)
      chatControllerProvider.overrideWith((ref, fileName) => mockController ?? MockChatController()),

      // inputStateProvider 使用真实实现，验证集成
      // 不需要 override，除非需要预设状态
    ],
  );

  // 预设 Round 详情流
  if (initialRound != null && mockRepo != null) {
    when(() => mockRepo.watchSingleRound(initialRound.id))
        .thenAnswer((_) => Stream.value(initialRound));
  }

  return container;
}

Future<void> _pumpChatPage(
  WidgetTester tester,
  ProviderContainer container, {
  String fileName = 'test.json',
  String? initialRoundId,
}) async {
  await tester.pumpWidget(
    _buildTestApp(
      container: container,
      home: ChatPage(
        fileName: fileName,
        initialRoundId: initialRoundId,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

// ================= Tests =================

void main() {
  setUpAll(() {
    registerFallbackValue(const PendingAttachment(
      id: 'fallback',
      name: 'fallback',
      path: '/fallback',
      isImage: false,
    ));
  });

  group('ChatPage Phase 3 Integration', () {
    late MockChatController mockController;
    late MockConversationRepository mockRepo;

    setUp(() {
      mockController = MockChatController();
      mockRepo = MockConversationRepository();
      
      // 默认模拟空拓扑和空标题
      when(() => mockRepo.watchSessionTopology(any()))
          .thenAnswer((_) => Stream.value([]));
      when(() => mockRepo.watchSessionTitle(any()))
          .thenAnswer((_) => Stream.value('Test Session'));
    });

    testWidgets('输入框始终启用，即使 isIncomplete 为 true', (tester) async {
      final round = ChatRound(
        id: 'r1',
        parentId: null,
        createdAt: 0,
        userContent: 'User',
        isIncomplete: true, // AI 生成中
      );

      final container = _createContainer(
        mockController: mockController,
        mockRepo: mockRepo,
        initialRound: round,
      );

      await _pumpChatPage(tester, container, initialRoundId: 'r1');

      // 验证输入框 enabled 为 true
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isTrue);

      // 验证显示停止按钮
      expect(find.byIcon(Icons.stop_rounded), findsOneWidget);
      expect(find.byIcon(Icons.arrow_upward_rounded), findsNothing);
    });

    testWidgets('发送消息后自动清空输入状态', (tester) async {
      final round = ChatRound(
        id: 'r1',
        parentId: null,
        createdAt: 0,
        userContent: 'User',
        isIncomplete: false,
      );

      final container = _createContainer(
        mockController: mockController,
        mockRepo: mockRepo,
        initialRound: round,
      );

      // 模拟发送成功
      when(() => mockController.sendMessage(
            content: any(named: 'content'),
            parentRoundId: any(named: 'parentRoundId'),
            attachments: any(named: 'attachments'),
          )).thenAnswer((_) async => 'new-round-id');

      await _pumpChatPage(tester, container, initialRoundId: 'r1');

      // 输入文本
      await tester.enterText(find.byType(TextField), 'Hello World');
      await tester.pump();

      // 验证 Provider 状态已更新
      expect(container.read(inputStateProvider).text, 'Hello World');

      // 添加附件
      final attachment = PendingAttachment(
        id: 'a1',
        name: 'test.txt',
        path: '/test.txt',
        isImage: false,
      );
      container.read(inputStateProvider.notifier).addAttachment(attachment);
      await tester.pump();

      expect(container.read(inputStateProvider).attachments, hasLength(1));

      // 点击发送
      await tester.tap(find.byIcon(Icons.arrow_upward_rounded));
      await tester.pumpAndSettle();

      // 验证调用 sendMessage
      verify(() => mockController.sendMessage(
            content: 'Hello World',
            parentRoundId: 'r1',
            attachments: any(named: 'attachments'),
          )).called(1);

      // 验证输入状态被清空
      final state = container.read(inputStateProvider);
      expect(state.text, '');
      expect(state.attachments, isEmpty);
    });

    testWidgets('重试直接调用 retryFromRound，不填充输入框', (tester) async {
      final round = ChatRound(
        id: 'r1',
        parentId: null,
        createdAt: 0,
        userContent: 'Original Message',
        isIncomplete: false,
      );

      final container = _createContainer(
        mockController: mockController,
        mockRepo: mockRepo,
        initialRound: round,
      );

      when(() => mockController.retryFromRound('r1'))
          .thenAnswer((_) async => 'retry-round-id');

      await _pumpChatPage(tester, container, initialRoundId: 'r1');

      // 预先输入一些内容
      await tester.enterText(find.byType(TextField), 'Draft text');
      await tester.pump();

      // 点击重试按钮（在 MessageBubble 中）
      await tester.tap(find.byIcon(Icons.refresh_outlined));
      await tester.pumpAndSettle();

      // 验证调用 retryFromRound
      verify(() => mockController.retryFromRound('r1')).called(1);

      // 验证输入框内容保持不变（未被填充 Original Message）
      expect(container.read(inputStateProvider).text, 'Draft text');
      expect(find.text('Original Message'), findsNothing);
    });

    testWidgets('编辑模式相关 UI 已移除', (tester) async {
      final round = ChatRound(
        id: 'r1',
        parentId: null,
        createdAt: 0,
        userContent: 'User',
        isIncomplete: false,
      );

      final container = _createContainer(
        mockController: mockController,
        mockRepo: mockRepo,
        initialRound: round,
      );

      await _pumpChatPage(tester, container, initialRoundId: 'r1');

      // 验证无编辑 Banner
      expect(find.text('正在编辑'), findsNothing);
      expect(find.text('编辑并重试'), findsNothing);

      // 验证无编辑按钮（MessageBubble 的 onEdit 为 null）
      expect(find.byIcon(Icons.edit_outlined), findsNothing);

      // 验证分页栏无 isEditMode 禁用逻辑（始终可交互）
      // 由于只有一个 round，分页按钮可能不可见或禁用，这里主要验证无编辑状态影响
      // 如果有多轮，可以验证分页按钮 enabled
    });

    testWidgets('输入状态全局共享', (tester) async {
      final container = _createContainer(
        mockController: mockController,
        mockRepo: mockRepo,
      );

      // 直接操作 Provider
      container.read(inputStateProvider.notifier).updateText('Global Draft');
      container.read(inputStateProvider.notifier).addAttachment(
        PendingAttachment(id: 'a1', name: 'f1', path: '/f1', isImage: false),
      );

      await _pumpChatPage(tester, container);

      // 验证 UI 反映全局状态
      expect(find.text('Global Draft'), findsOneWidget);
      expect(find.text('f1'), findsOneWidget);

      // 验证 Provider 是单例（无 family）
      // 通过检查 state 一致性验证
      final state = container.read(inputStateProvider);
      expect(state.text, 'Global Draft');
      expect(state.attachments, hasLength(1));
    });

    testWidgets('停止生成调用 stopGeneration', (tester) async {
      final round = ChatRound(
        id: 'r1',
        parentId: null,
        createdAt: 0,
        userContent: 'User',
        isIncomplete: true,
      );

      final container = _createContainer(
        mockController: mockController,
        mockRepo: mockRepo,
        initialRound: round,
      );

      when(() => mockController.stopGeneration('r1')).thenAnswer((_) {});

      await _pumpChatPage(tester, container, initialRoundId: 'r1');

      // 点击停止按钮
      await tester.tap(find.byIcon(Icons.stop_rounded));
      await tester.pump();

      verify(() => mockController.stopGeneration('r1')).called(1);
    });

    testWidgets('发送失败时保留输入内容', (tester) async {
      final round = ChatRound(
        id: 'r1',
        parentId: null,
        createdAt: 0,
        userContent: 'User',
        isIncomplete: false,
      );

      final container = _createContainer(
        mockController: mockController,
        mockRepo: mockRepo,
        initialRound: round,
      );

      // 模拟发送失败
      when(() => mockController.sendMessage(
            content: any(named: 'content'),
            parentRoundId: any(named: 'parentRoundId'),
            attachments: any(named: 'attachments'),
          )).thenThrow(Exception('Network Error'));

      await _pumpChatPage(tester, container, initialRoundId: 'r1');

      await tester.enterText(find.byType(TextField), 'Important Message');
      await tester.pump();

      await tester.tap(find.byIcon(Icons.arrow_upward_rounded));
      await tester.pumpAndSettle();

      // 验证输入内容保留
      expect(container.read(inputStateProvider).text, 'Important Message');
      expect(find.text('Important Message'), findsOneWidget);
    });
  });
}