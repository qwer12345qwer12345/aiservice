import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aiservice/presentation/widgets/input_bar.dart';
import 'package:aiservice/presentation/providers/input_notifier.dart';
import 'package:aiservice/presentation/models/pending_attachment.dart';
import 'package:aiservice/presentation/models/input_state.dart';

void main() {
  group('InputBar Phase 2 声明式改造测试', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
      expect(container.read(inputStateProvider), const InputState());
    });

    tearDown(() {
      container.dispose();
    });

    Future<void> pumpInputBar(
      WidgetTester tester, {
      required Future<void> Function(String, List<PendingAttachment>) onSend,
      VoidCallback? onStop,
      bool isIncomplete = false,
    }) async {
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: Scaffold(
              body: InputBar(
                onSend: onSend,
                onStop: onStop,
                isIncomplete: isIncomplete,
                hintText: '输入消息...',
                allowImages: true,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    group('文本输入与同步', () {
      testWidgets('用户输入文本应同步到 Provider', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {});

        await tester.enterText(find.byType(TextField), 'Hello World');
        await tester.pump();

        expect(container.read(inputStateProvider).text, 'Hello World');
        expect(container.read(inputStateProvider).canSend, true);
      });

      testWidgets('Provider 文本变化应同步到 TextField', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {});

        container.read(inputStateProvider.notifier).updateText('External Text');
        await tester.pump();

        final textField = tester.widget<TextField>(find.byType(TextField));
        expect(textField.controller!.text, 'External Text');
      });

      testWidgets('Provider 清空应同步到 TextField', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {});

        await tester.enterText(find.byType(TextField), 'To be cleared');
        await tester.pump();

        container.read(inputStateProvider.notifier).clear();
        await tester.pump();

        final textField = tester.widget<TextField>(find.byType(TextField));
        expect(textField.controller!.text, '');
        expect(container.read(inputStateProvider).text, '');
      });
    });

    group('附件管理', () {
      final testAttachment = PendingAttachment(
        id: 'test-id',
        name: 'test.txt',
        path: '/tmp/test.txt',
        isImage: false,
        mimeType: 'text/plain',
      );

      testWidgets('Provider 添加附件应显示 Chip', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {});

        container.read(inputStateProvider.notifier).addAttachment(testAttachment);
        await tester.pump();

        expect(find.text('test.txt'), findsOneWidget);
        expect(container.read(inputStateProvider).attachments.length, 1);
      });

      testWidgets('点击删除按钮应移除附件', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {});

        container.read(inputStateProvider.notifier).addAttachment(testAttachment);
        await tester.pump();

        // ✅ 修复：使用 tooltip 查找删除按钮
        await tester.tap(find.byTooltip('Delete'));
        await tester.pump();

        expect(find.text('test.txt'), findsNothing);
        expect(container.read(inputStateProvider).attachments, isEmpty);
      });

      testWidgets('有附件时 canSend 为 true', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {});

        expect(container.read(inputStateProvider).canSend, false);

        container.read(inputStateProvider.notifier).addAttachment(testAttachment);
        await tester.pump();

        expect(container.read(inputStateProvider).canSend, true);
      });
    });

    group('发送逻辑', () {
      testWidgets('点击发送按钮应调用 onSend 并清空状态', (tester) async {
        bool sendCalled = false;
        String? sentText;
        List<PendingAttachment>? sentAttachments;

        await pumpInputBar(
          tester,
          onSend: (text, attachments) async {
            sendCalled = true;
            sentText = text;
            sentAttachments = attachments;
          },
        );

        await tester.enterText(find.byType(TextField), 'Send me');
        await tester.pump();

        await tester.tap(find.byIcon(Icons.arrow_upward_rounded));
        await tester.pump();

        expect(sendCalled, true);
        expect(sentText, 'Send me');
        expect(sentAttachments, isEmpty);
        expect(container.read(inputStateProvider).text, '');
        expect(container.read(inputStateProvider).attachments, isEmpty);
      });

      testWidgets('发送失败时应保留输入状态', (tester) async {
        await pumpInputBar(
          tester,
          onSend: (_, __) async => throw Exception('Send failed'),
        );

        await tester.enterText(find.byType(TextField), 'Failed send');
        await tester.pump();

        await tester.tap(find.byIcon(Icons.arrow_upward_rounded));
        await tester.pump();

        expect(container.read(inputStateProvider).text, 'Failed send');
        expect(find.text('Failed send'), findsOneWidget);
      });

      testWidgets('无内容时发送按钮应禁用', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {});

        // ✅ 修复：正确获取 IconButton
        final sendButtonFinder = find.descendant(
          of: find.byType(Row).last,
          matching: find.byType(IconButton),
        ).last;
        
        final sendButton = tester.widget<IconButton>(sendButtonFinder);
        expect(sendButton.onPressed, null);
      });
    });

    group('按钮状态与交互', () {
      testWidgets('输入框始终启用，不受 isIncomplete 影响', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {}, isIncomplete: true);

        final textField = tester.widget<TextField>(find.byType(TextField));
        // ✅ 修复：null 表示启用
        expect(textField.enabled, isNot(false));

        await tester.enterText(find.byType(TextField), 'Typing during generation');
        await tester.pump();

        expect(container.read(inputStateProvider).text, 'Typing during generation');
      });

      testWidgets('isIncomplete 为 true 时显示停止按钮', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {}, isIncomplete: false);
        expect(find.byIcon(Icons.stop_rounded), findsNothing);
        expect(find.byIcon(Icons.arrow_upward_rounded), findsOneWidget);

        await pumpInputBar(tester, onSend: (_, __) async {}, isIncomplete: true);
        expect(find.byIcon(Icons.stop_rounded), findsOneWidget);
        expect(find.byIcon(Icons.arrow_upward_rounded), findsNothing);
      });

      testWidgets('点击停止按钮应调用 onStop', (tester) async {
        bool stopCalled = false;
        await pumpInputBar(
          tester,
          onSend: (_, __) async {},
          onStop: () => stopCalled = true,
          isIncomplete: true,
        );

        await tester.tap(find.byIcon(Icons.stop_rounded));
        await tester.pump();

        expect(stopCalled, true);
      });
    });

    group('全局状态共享', () {
      testWidgets('多个 InputBar 实例共享同一状态', (tester) async {
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              home: Column(
                children: [
                  InputBar(
                    key: const Key('input1'),
                    onSend: (_, __) async {},
                    isIncomplete: false,
                  ),
                  InputBar(
                    key: const Key('input2'),
                    onSend: (_, __) async {},
                    isIncomplete: false,
                  ),
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.enterText(
          find.descendant(
            of: find.byKey(const Key('input1')),
            matching: find.byType(TextField),
          ),
          'Shared text',
        );
        await tester.pump();

        final textField2 = tester.widget<TextField>(
          find.descendant(
            of: find.byKey(const Key('input2')),
            matching: find.byType(TextField),
          ),
        );
        expect(textField2.controller!.text, 'Shared text');
        expect(container.read(inputStateProvider).text, 'Shared text');
      });
    });

    group('边界条件', () {
      testWidgets('仅空白文本时 canSend 为 false', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {});

        await tester.enterText(find.byType(TextField), '   ');
        await tester.pump();

        expect(container.read(inputStateProvider).canSend, false);
        
        // ✅ 修复：正确获取 IconButton
        final sendButtonFinder = find.descendant(
          of: find.byType(Row).last,
          matching: find.byType(IconButton),
        ).last;
        
        final sendButton = tester.widget<IconButton>(sendButtonFinder);
        expect(sendButton.onPressed, null);
      });

      testWidgets('文本 trim 后非空时 canSend 为 true', (tester) async {
        await pumpInputBar(tester, onSend: (_, __) async {});

        await tester.enterText(find.byType(TextField), '  Hello  ');
        await tester.pump();

        expect(container.read(inputStateProvider).canSend, true);
      });
    });
  });
}