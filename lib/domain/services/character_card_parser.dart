import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:uuid/uuid.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';

extension CharacterDataPersistenceX on CharacterData {
  Future<String> appendGreeting({
    required ConversationRepository repository,
    required String sessionId,
  }) async {
    final newRound = ChatRound(
      id: const Uuid().v4(),
      parentId: null, 
      createdAt: DateTime.now().millisecondsSinceEpoch,
      userContent: '',
      userAttachments: const [],
      assistantContent: firstMes,
      isIncomplete: false,
      hasUnseenUpdate: true,
    );
    await repository.appendRound(sessionId, newRound);
    return newRound.id;
  }
}

/// 解析后的角色数据结构（支持 V2/V3）
class CharacterData {
  final String name;
  final String description;
  final String personality;
  final String scenario;
  final String firstMes;
  final String mesExample;
  final String systemPrompt;
  final String postHistoryInstructions;
  final List<String> alternateGreetings;
  final Map<String, dynamic>? characterBook;
  final Map<String, dynamic>? extensions;

  CharacterData({
    required this.name,
    required this.description,
    required this.personality,
    required this.scenario,
    required this.firstMes,
    required this.mesExample,
    required this.systemPrompt,
    required this.postHistoryInstructions,
    required this.alternateGreetings,
    this.characterBook,
    this.extensions,
  });

  /// 生成系统提示词（供模型使用）
  String buildSystemPrompt() {
    final buffer = StringBuffer();
    buffer.writeln('# 角色设定');
    buffer.writeln('你是 $name。\n');

    if (description.isNotEmpty) {
      buffer.writeln('## 外貌与背景');
      buffer.writeln(description);
      buffer.writeln();
    }

    if (personality.isNotEmpty) {
      buffer.writeln('## 性格特点');
      buffer.writeln(personality);
      buffer.writeln();
    }

    if (scenario.isNotEmpty) {
      buffer.writeln('## 当前场景');
      buffer.writeln(scenario);
      buffer.writeln();
    }

    if (systemPrompt.isNotEmpty) {
      buffer.writeln('## 核心指令');
      buffer.writeln(systemPrompt);
      buffer.writeln();
    }

    buffer.writeln('## 对话要求');
    buffer.writeln('- 请严格按照以上设定进行角色扮演');
    buffer.writeln('- 保持角色性格和语气的一致性');
    buffer.writeln('- 根据对话历史适当推进情节');

    if (mesExample.isNotEmpty) {
      buffer.writeln('\n## 对话范例参考');
      buffer.writeln(mesExample);
    }

    return buffer.toString();
  }
}

/// 角色卡解析器
class CharacterCardParser {
  /// 解析文件（支持 PNG 和 JSON），仅传入文件路径
  static Future<CharacterData> parseFile(String filePath, String fileName) async {
    final lowerName = fileName.toLowerCase();
    final file = File(filePath);
    
    if (!await file.exists()) {
      throw Exception('文件不存在');
    }

    if (lowerName.endsWith('.png')) {
      return _parsePngCardStream(file);
    } else if (lowerName.endsWith('.json')) {
      return _parseJsonCardStream(file);
    } else {
      throw Exception('不支持的文件格式，请使用 PNG 或 JSON 文件');
    }
  }

  /// 核心优化：流式解析 PNG，跳过巨大的像素块，杜绝 OOM
  static Future<CharacterData> _parsePngCardStream(File file) async {
    // PNG 标准签名
    final signature = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];
    final raf = await file.open();
    
    try {
      final header = await raf.read(8);
      if (header.length < 8) throw Exception('文件太小，不是有效的 PNG');
      for (int i = 0; i < 8; i++) {
        if (header[i] != signature[i]) throw Exception('不是有效的 PNG 文件');
      }

      String? base64Data;
      
      // 遍历 PNG Chunks
      while (true) {
        // 1. 读取 Length (4 bytes)
        final lengthBytes = await raf.read(4);
        if (lengthBytes.length < 4) break;
        final length = ByteData.sublistView(lengthBytes).getUint32(0, Endian.big);
        
        // 2. 读取 Chunk Type (4 bytes)
        final typeBytes = await raf.read(4);
        if (typeBytes.length < 4) break;
        final chunkType = String.fromCharCodes(typeBytes);
        
        if (chunkType == 'IEND') break; // 结束块

        // 3. 我们只关心 tEXt 块
        if (chunkType == 'tEXt') {
          final dataBytes = await raf.read(length);
          if (dataBytes.length == length) {
            final zeroIndex = dataBytes.indexOf(0);
            if (zeroIndex != -1) {
              final keyword = utf8.decode(dataBytes.sublist(0, zeroIndex));
              final textBytes = dataBytes.sublist(zeroIndex + 1);
              final text = utf8.decode(textBytes, allowMalformed: true);
              
              if (keyword == 'ccv3' || keyword == 'chara') {
                base64Data = text;
                break; // 找到目标数据后直接跳出，不读取后面的像素数据
              }
            }
          }
        } else {
          // 跳过不关心的 Chunk 数据 (例如几MB到几十MB的 IDAT 像素块)
          final currentPos = await raf.position();
          await raf.setPosition(currentPos + length);
        }
        
        // 4. 跳过 CRC 校验和 (4 bytes)
        final posAfterData = await raf.position();
        await raf.setPosition(posAfterData + 4);
      }
      
      if (base64Data == null) {
        throw Exception('未找到角色数据块（ccv3/chara）');
      }
      
      // 清理可能存在的换行符等空白字符
      final cleanBase64 = base64Data.replaceAll(RegExp(r'\s+'), '');
      final jsonString = utf8.decode(base64.decode(cleanBase64));
      return _parseJsonString(jsonString);
      
    } finally {
      await raf.close();
    }
  }

  /// 解析 JSON 角色卡
  static Future<CharacterData> _parseJsonCardStream(File file) async {
    final jsonString = await file.readAsString();
    return _parseJsonString(jsonString);
  }

  static CharacterData _parseJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    final spec = json['spec'] as String?;
    
    if (spec == 'chara_card_v3') {
      return _parseV3(json);
    } else if (spec == 'chara_card_v2') {
      return _parseV2(json);
    } else {
      // 兼容旧格式
      return _parseV2({'data': json});
    }
  }

  static CharacterData _parseV3(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return CharacterData(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      personality: data['personality'] ?? '',
      scenario: data['scenario'] ?? '',
      firstMes: data['first_mes'] ?? '',
      mesExample: data['mes_example'] ?? '',
      systemPrompt: data['system_prompt'] ?? '',
      postHistoryInstructions: data['post_history_instructions'] ?? '',
      alternateGreetings: (data['alternate_greetings'] as List?)?.cast<String>() ?? [],
      characterBook: data['character_book'],
      extensions: data['extensions'],
    );
  }

  static CharacterData _parseV2(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? json;
    return CharacterData(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      personality: data['personality'] ?? '',
      scenario: data['scenario'] ?? '',
      firstMes: data['first_mes'] ?? '',
      mesExample: data['mes_example'] ?? '',
      systemPrompt: data['system_prompt'] ?? '',
      postHistoryInstructions: data['post_history_instructions'] ?? '',
      alternateGreetings: (data['alternate_greetings'] as List?)?.cast<String>() ?? [],
      characterBook: data['character_book'],
      extensions: data['extensions'],
    );
  }
}