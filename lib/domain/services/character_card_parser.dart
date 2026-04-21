import 'dart:convert';
import 'dart:typed_data';
import 'package:png_chunks_extract/png_chunks_extract.dart' as pngExtract;

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
  /// 解析文件（支持 PNG 和 JSON）
  static Future<CharacterData> parseFile(Uint8List bytes, String fileName) async {
    final lowerName = fileName.toLowerCase();
    if (lowerName.endsWith('.png')) {
      return _parsePngCard(bytes);
    } else if (lowerName.endsWith('.json')) {
      return _parseJsonCard(bytes);
    } else {
      throw Exception('不支持的文件格式，请使用 PNG 或 JSON 文件');
    }
  }

  /// 解析 PNG 角色卡（V2/V3）
  static CharacterData _parsePngCard(Uint8List bytes) {
    final chunks = pngExtract.extractChunks(bytes);
    
    String? base64Data;
    for (final chunk in chunks) {
      final chunkName = chunk['name'] as String;
      if (chunkName == 'tEXt') {
        final dataBytes = chunk['data'] as List<int>;
        // 解析 tEXt 块：keyword + 0x00 + text
        final zeroIndex = dataBytes.indexOf(0);
        if (zeroIndex == -1) continue;
        final keyword = utf8.decode(dataBytes.sublist(0, zeroIndex));
        final textBytes = dataBytes.sublist(zeroIndex + 1);
        final text = utf8.decode(textBytes);
        
        if (keyword == 'ccv3') {
          base64Data = text;
          break;
        } else if (keyword == 'chara' && base64Data == null) {
          base64Data = text;
        }
      }
    }
    
    if (base64Data == null) {
      throw Exception('未找到角色数据块（ccv3/chara）');
    }
    
    final jsonString = utf8.decode(base64.decode(base64Data));
    return _parseJsonString(jsonString);
  }

  /// 解析 JSON 角色卡
  static CharacterData _parseJsonCard(Uint8List bytes) {
    final jsonString = utf8.decode(bytes);
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