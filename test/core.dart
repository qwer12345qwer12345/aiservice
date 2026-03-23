import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:aiservice/core/errors/exceptions.dart';
import 'package:aiservice/core/constants/app_constants.dart';
import 'package:aiservice/core/models/message.dart';
import 'package:aiservice/core/models/session.dart';
import 'package:aiservice/core/models/app_config.dart';
import 'package:aiservice/core/models/model_info.dart';
import 'package:aiservice/core/models/chat_chunk.dart';
import 'package:aiservice/core/utils/id_generator.dart';
import 'package:aiservice/core/utils/file_name_utils.dart';
import 'package:aiservice/core/utils/json_utils.dart';

void main() {
  group('Core Layer Tests', () {
    
    // ==========================================
    // 1. 异常定义测试
    // ==========================================
    group('Exceptions', () {
      test('AppException 创建成功', () {
        const exception = AppException('测试错误', code: 'TEST_001');
        expect(exception.message, '测试错误');
        expect(exception.code, 'TEST_001');
        expect(exception.toString(), contains('测试错误'));
      });

      test('FileException 继承 AppException', () {
        const exception = FileException('文件不存在', code: 'FILE_NOT_FOUND');
        expect(exception, isA<AppException>());
        expect(exception.message, '文件不存在');
      });

      test('ApiException 继承 AppException', () {
        const exception = ApiException('网络错误', code: 'NETWORK_ERROR');
        expect(exception, isA<AppException>());
      });

      test('ConfigException 继承 AppException', () {
        const exception = ConfigException('配置无效', code: 'CONFIG_INVALID');
        expect(exception, isA<AppException>());
      });

      test('ParseException 继承 AppException', () {
        const exception = ParseException('JSON 解析失败', code: 'INVALID_JSON');
        expect(exception, isA<AppException>());
      });
    });

    // ==========================================
    // 2. 常量定义测试
    // ==========================================
    group('AppConstants', () {
      test('文件夹名称常量正确', () {
        expect(AppConstants.dirConversations, 'conversations');
        expect(AppConstants.dirAttachments, 'attachments');
      });

      test('文件名常量正确', () {
        expect(AppConstants.fileConfig, 'config.json');
      });

      test('配置键常量正确', () {
        expect(AppConstants.keyBaseUrl, 'baseUrl');
        expect(AppConstants.keyApiKey, 'apiKey');
        expect(AppConstants.keyTheme, 'theme');
        expect(AppConstants.keyModel, 'selectedModel');
        expect(AppConstants.keyEnableReasoning, 'enableReasoning');
      });

      test('默认值常量正确', () {
        expect(AppConstants.defaultBaseUrl, 'https://api.openai.com/v1');
        expect(AppConstants.defaultTheme, 'system');
      });

      test('扩展名常量正确', () {
        expect(AppConstants.extJson, '.json');
      });
    });

    // ==========================================
    // 3. 数据模型测试
    // ==========================================
    group('Models', () {
      
      // --- Message 模型 ---
      group('Message', () {
        test('Message 创建成功', () {
          final message = Message(
            id: 'msg_001',
            parentId: 'msg_000',
            role: 'user',
            content: '你好',
            timestamp: 1234567890,
            attachments: ['./attachments/img.png'],
            isIncomplete: false,
          );
          expect(message.id, 'msg_001');
          expect(message.parentId, 'msg_000');
          expect(message.role, 'user');
          expect(message.content, '你好');
          expect(message.attachments?.length, 1);
        });

        test('Message 支持深度思考字段', () {
          final message = Message(
            id: 'msg_002',
            parentId: 'msg_001',
            role: 'assistant',
            content: '这是回答',
            reasoningContent: '这是思考过程...',
            timestamp: 1234567891,
          );
          expect(message.reasoningContent, '这是思考过程...');
        });

        test('Message JSON 序列化', () {
          final message = Message(
            id: 'msg_003',
            parentId: 'msg_002',
            role: 'assistant',
            content: '测试内容',
            timestamp: 1234567892,
            reasoningContent: '思考中',
            isIncomplete: true,
          );
          final json = message.toJson();
          expect(json['id'], 'msg_003');
          expect(json['content'], '测试内容');
          expect(json['reasoningContent'], '思考中');
          expect(json['isIncomplete'], true);
        });

        test('Message JSON 反序列化', () {
          final json = {
            'id': 'msg_004',
            'parentId': 'msg_003',
            'role': 'user',
            'content': '反序列化测试',
            'timestamp': 1234567893,
            'reasoningContent': null,
            'isIncomplete': false,
          };
          final message = Message.fromJson(json);
          expect(message.id, 'msg_004');
          expect(message.content, '反序列化测试');
          expect(message.reasoningContent, isNull);
        });
      });

      // --- Session 模型 ---
      group('Session', () {
        test('Session 创建成功', () {
          final session = Session(
            id: 'session_001',
            title: '测试会话',
            createdAt: 1234567890,
            updatedAt: 1234567891,
            messages: [],
          );
          expect(session.id, 'session_001');
          expect(session.title, '测试会话');
          expect(session.messages, isEmpty);
        });

        test('Session 包含消息列表', () {
          final messages = [
            Message(
              id: 'msg_001',
              parentId: 'null',
              role: 'user',
              content: '第一条',
              timestamp: 1234567890,
            ),
            Message(
              id: 'msg_002',
              parentId: 'msg_001',
              role: 'assistant',
              content: '回复',
              timestamp: 1234567891,
            ),
          ];
          final session = Session(
            id: 'session_002',
            title: '多消息会话',
            createdAt: 1234567890,
            updatedAt: 1234567891,
            messages: messages,
          );
          expect(session.messages.length, 2);
          expect(session.messages.first.role, 'user');
          expect(session.messages.last.role, 'assistant');
        });

        test('Session JSON 序列化', () {
          final session = Session(
            id: 'session_003',
            title: '序列化测试',
            createdAt: 1234567890,
            updatedAt: 1234567891,
            messages: [],
            config: const SessionConfig(
              model: 'gpt-4',
              temperature: 0.7,
              enableReasoning: true,
            ),
          );
          final json = session.toJson();
          expect(json['title'], '序列化测试');
          expect((json['config'] as SessionConfig).model, 'gpt-4');
          expect((json['config'] as SessionConfig).enableReasoning, true);
        });

        test('Session JSON 反序列化', () {
          final json = {
            'id': 'session_004',
            'title': '反序列化测试',
            'createdAt': 1234567890,
            'updatedAt': 1234567891,
            'messages': [],
            'config': {
              'model': 'gpt-3.5-turbo',
              'temperature': 0.5,
              'enableReasoning': false,
            },
          };
          final session = Session.fromJson(json);
          expect(session.title, '反序列化测试');
          expect(session.config?.model, 'gpt-3.5-turbo');
        });
      });

      // --- AppConfig 模型 ---
      group('AppConfig', () {
        test('AppConfig 默认配置正确', () {
          final config = AppConfig.defaultConfig();
          expect(config.baseUrl, 'https://api.openai.com/v1');
          expect(config.apiKey, '');
          expect(config.enableReasoning, false);
          expect(config.theme, 'system');
        });

        test('AppConfig 自定义配置', () {
          final config = AppConfig(
            baseUrl: 'https://custom.api.com/v1',
            apiKey: 'sk-test123',
            selectedModel: 'gpt-4',
            enableReasoning: true,
            theme: 'dark',
          );
          expect(config.baseUrl, 'https://custom.api.com/v1');
          expect(config.apiKey, 'sk-test123');
          expect(config.selectedModel, 'gpt-4');
          expect(config.enableReasoning, true);
          expect(config.theme, 'dark');
        });

        test('AppConfig JSON 序列化', () {
          final config = AppConfig(
            baseUrl: 'https://test.api.com',
            apiKey: 'sk-xxx',
            selectedModel: 'gpt-4',
            enableReasoning: true,
            theme: 'light',
          );
          final json = config.toJson();
          expect(json['baseUrl'], 'https://test.api.com');
          expect(json['apiKey'], 'sk-xxx');
          expect(json['enableReasoning'], true);
        });

        test('AppConfig JSON 反序列化', () {
          final json = {
            'baseUrl': 'https://api.test.com',
            'apiKey': 'sk-yyy',
            'selectedModel': 'gpt-3.5',
            'enableReasoning': false,
            'theme': 'system',
          };
          final config = AppConfig.fromJson(json);
          expect(config.baseUrl, 'https://api.test.com');
          expect(config.theme, 'system');
        });
      });

      // --- ModelInfo 模型 ---
      group('ModelInfo', () {
        test('ModelInfo 创建成功', () {
          final model = ModelInfo(
            id: 'gpt-4',
            name: 'GPT-4',
            supportsReasoning: true,
          );
          expect(model.id, 'gpt-4');
          expect(model.name, 'GPT-4');
          expect(model.supportsReasoning, true);
        });

        test('ModelInfo JSON 序列化', () {
          final model = ModelInfo(
            id: 'o1-preview',
            name: 'O1 Preview',
            supportsReasoning: true,
          );
          final json = model.toJson();
          expect(json['id'], 'o1-preview');
          expect(json['supportsReasoning'], true);
        });

        test('ModelInfo JSON 反序列化', () {
          final json = {
            'id': 'gpt-3.5-turbo',
            'name': 'GPT-3.5 Turbo',
            'supportsReasoning': false,
          };
          final model = ModelInfo.fromJson(json);
          expect(model.id, 'gpt-3.5-turbo');
          expect(model.supportsReasoning, false);
        });
      });

      // --- ChatChunk 模型 ---
      group('ChatChunk', () {
        test('ChatChunk 创建成功', () {
          final chunk = ChatChunk(
            content: '片段内容',
            reasoningContent: '思考片段',
            isDone: false,
          );
          expect(chunk.content, '片段内容');
          expect(chunk.reasoningContent, '思考片段');
          expect(chunk.isDone, false);
        });

        test('ChatChunk 结束标志', () {
          final chunk = ChatChunk(
            content: null,
            reasoningContent: null,
            isDone: true,
          );
          expect(chunk.isDone, true);
        });

        test('ChatChunk 错误信息', () {
          final chunk = ChatChunk(
            content: null,
            reasoningContent: null,
            isDone: true,
            error: '网络超时',
          );
          expect(chunk.error, '网络超时');
        });
      });
    });

    // ==========================================
    // 4. 工具类测试
    // ==========================================
    group('Utils', () {
      
      // --- ID 生成器 ---
      group('IdGenerator', () {
        test('生成 ID 不为空', () {
          final id = IdGenerator.generate();
          expect(id, isNotEmpty);
        });

        test('生成 ID 格式正确 (UUID v4)', () {
          final id = IdGenerator.generate();
          // UUID v4 格式：8-4-4-4-12
          final uuidRegex = RegExp(
            r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
            caseSensitive: false,
          );
          expect(id, matches(uuidRegex));
        });

        test('生成 ID 唯一性', () {
          final ids = List.generate(100, (_) => IdGenerator.generate());
          final uniqueIds = ids.toSet();
          expect(uniqueIds.length, 100); // 100 个 ID 应该全部唯一
        });
      });

      // --- 文件名工具 ---
      group('FileNameUtils', () {
        test('清理非法字符', () {
          expect(FileNameUtils.sanitize('测试<文件>'), '测试_文件_');
          expect(FileNameUtils.sanitize('path/to/file'), 'path_to_file');
          expect(FileNameUtils.sanitize('file:name'), 'file_name');
          expect(FileNameUtils.sanitize('file?*'), 'file__');
        });

        test('清理后去除首尾空格', () {
          expect(FileNameUtils.sanitize('  测试  '), '测试');
        });

        test('生成唯一文件名 (无冲突)', () {
          final existing = ['a.json', 'b.json'];
          final result = FileNameUtils.makeUnique('c', existing);
          expect(result, 'c.json');
        });

        test('生成唯一文件名 (有冲突，自动加数字)', () {
          final existing = ['测试.json', '测试1.json', '测试2.json'];
          final result = FileNameUtils.makeUnique('测试', existing);
          expect(result, '测试3.json');
        });

        test('生成唯一文件名 (连续冲突)', () {
          final existing = [
            '文件.json',
            '文件1.json',
            '文件2.json',
            '文件3.json',
            '文件4.json',
          ];
          final result = FileNameUtils.makeUnique('文件', existing);
          expect(result, '文件5.json');
        });

        test('从文件名提取标题', () {
          expect(FileNameUtils.extractTitle('测试.json'), '测试');
          expect(FileNameUtils.extractTitle('会话 2024.json'), '会话 2024');
          expect(FileNameUtils.extractTitle('无扩展名'), '无扩展名');
        });

        test('清理和提取组合', () {
          final dirty = '测试<非法>:字符';
          final clean = FileNameUtils.sanitize(dirty);
          expect(clean, '测试_非法__字符');
        });
      });

      // --- JSON 工具 ---
      group('JsonUtils', () {
        test('JSON 编码成功', () {
          final data = {'key': 'value', 'number': 123};
          final result = JsonUtils.encode(data);
          expect(result, isA<String>());
          expect(result, contains('"key"'));
          expect(result, contains('"value"'));
        });

        test('JSON 解码成功', () {
          final source = '{"name": "测试", "age": 25}';
          final result = JsonUtils.decode(source);
          expect(result['name'], '测试');
          expect(result['age'], 25);
        });

        test('JSON 解码失败抛出 ParseException', () {
          final invalidSource = '{invalid json}';
          expect(
            () => JsonUtils.decode(invalidSource),
            throwsA(isA<ParseException>()),
          );
        });

        test('JSON 解码失败异常信息正确', () {
          try {
            JsonUtils.decode('{invalid}');
          } on ParseException catch (e) {
            expect(e.code, 'INVALID_JSON');
            expect(e.message, 'JSON 解析失败');
          }
        });

        test('空对象编码', () {
          final result = JsonUtils.encode({});
          expect(result, '{}');
        });

        test('嵌套对象编码', () {
          final data = {
            'user': {'name': '张三', 'age': 30},
            'items': [1, 2, 3],
          };
          final result = JsonUtils.encode(data);
          expect(result, contains('"user"'));
          expect(result, contains('"items"'));
        });
      });
    });

    // ==========================================
    // 5. 集成测试 (模型 + 工具组合)
    // ==========================================
    group('Integration Tests', () {
      test('完整会话序列化循环', () {
        // 创建消息
        final messages = [
          Message(
            id: IdGenerator.generate(),
            parentId: 'null',
            role: 'user',
            content: '你好，请介绍自己',
            timestamp: DateTime.now().millisecondsSinceEpoch,
          ),
          Message(
            id: IdGenerator.generate(),
            parentId: 'msg_001',
            role: 'assistant',
            content: '我是 AI 助手',
            reasoningContent: '用户想了解我的基本信息...',
            timestamp: DateTime.now().millisecondsSinceEpoch,
          ),
        ];

        // 创建会话
        final session = Session(
          id: IdGenerator.generate(),
          title: '集成测试会话',
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch,
          messages: messages,
          config: const SessionConfig(
            model: 'gpt-4',
            enableReasoning: true,
          ),
        );

        // 序列化
        final json = session.toJson();
        final jsonString = JsonUtils.encode(json);

        // 反序列化
        final decodedJson = JsonUtils.decode(jsonString);
        final restoredSession = Session.fromJson(decodedJson);

        // 验证
        expect(restoredSession.title, session.title);
        expect(restoredSession.messages.length, session.messages.length);
        expect(restoredSession.messages.first.content, '你好，请介绍自己');
        expect(restoredSession.messages.last.reasoningContent, '用户想了解我的基本信息...');
        expect(restoredSession.config?.model, 'gpt-4');
      });

      test('配置模型循环', () {
        final config = AppConfig(
          baseUrl: 'https://api.test.com/v1',
          apiKey: 'sk-test123456',
          selectedModel: 'gpt-4',
          availableModels: [
            ModelInfo(id: 'gpt-4', name: 'GPT-4', supportsReasoning: true),
            ModelInfo(id: 'gpt-3.5', name: 'GPT-3.5', supportsReasoning: false),
          ],
          enableReasoning: true,
          theme: 'dark',
        );

        final json = config.toJson();
        final restored = AppConfig.fromJson(json);

        expect(restored.baseUrl, config.baseUrl);
        expect(restored.apiKey, config.apiKey);
        expect(restored.availableModels?.length, 2);
        expect(restored.availableModels?.first.supportsReasoning, true);
      });

      test('文件名工具与会话创建', () {
        final baseTitle = '新对话<测试>';
        final cleanTitle = FileNameUtils.sanitize(baseTitle);
        expect(cleanTitle, '新对话_测试_');
        
        final fileName = FileNameUtils.makeUnique(cleanTitle, []);
        expect(fileName, endsWith('.json'));
        
        final extractedTitle = FileNameUtils.extractTitle(fileName);
        expect(extractedTitle, cleanTitle);
      });
    });

    // ==========================================
    // 6. 边界条件测试
    // ==========================================
    group('Edge Cases', () {
      test('空消息列表的会话', () {
        final session = Session(
          id: 'empty_session',
          title: '空会话',
          createdAt: 0,
          updatedAt: 0,
          messages: [],
        );
        expect(session.messages, isEmpty);
        final json = session.toJson();
        expect(json['messages'], isEmpty);
      });

      test('消息内容为空字符串', () {
        final message = Message(
          id: 'msg_empty',
          parentId: 'null',
          role: 'user',
          content: '',
          timestamp: 0,
        );
        expect(message.content, '');
      });

      test('深度思考内容为 null', () {
        final message = Message(
          id: 'msg_no_reasoning',
          parentId: 'null',
          role: 'assistant',
          content: '正常回复',
          reasoningContent: null,
          timestamp: 0,
        );
        expect(message.reasoningContent, isNull);
      });

      test('文件名包含特殊 Unicode 字符', () {
        final title = '测试🎉表情_中文_English_123';
        final clean = FileNameUtils.sanitize(title);
        expect(clean, contains('🎉')); // Emoji 应该保留
        expect(clean, contains('中文'));
      });

      test('API Key 为空字符串', () {
        final config = AppConfig(
          baseUrl: 'https://api.openai.com/v1',
          apiKey: '',
          enableReasoning: false,
          theme: 'system',
        );
        expect(config.apiKey, '');
      });

      test('ChatChunk 全空内容', () {
        final chunk = ChatChunk(
          content: null,
          reasoningContent: null,
          isDone: false,
        );
        expect(chunk.content, isNull);
        expect(chunk.reasoningContent, isNull);
      });
    });
  });
}