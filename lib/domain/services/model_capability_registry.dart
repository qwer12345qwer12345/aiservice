import '../../core/models/model_info.dart';

class ModelCapabilityRegistry {
  static final List<_ModelRule> _rules = [
    _ModelRule(
      patterns: ['gpt', '4', 'o'],
      supportsVision: true,
      supportsReasoning: false,
      priority: 100,
    ),
    _ModelRule(
      patterns: ['gpt', '4', '1'],
      supportsVision: true,
      supportsReasoning: false,
      priority: 100,
    ),
    _ModelRule(
      patterns: ['o'],
      numberAfter: true,
      supportsVision: true,
      supportsReasoning: true,
      priority: 200,
    ),
    _ModelRule(
      patterns: ['gpt', '5'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['gemini', '2', '5'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['gemini', '3'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['gemini', 'flash', 'latest'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 140,
    ),
    _ModelRule(
      patterns: ['gemini', 'pro', 'latest'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 140,
    ),
    _ModelRule(
      patterns: ['claude'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 120,
    ),
    _ModelRule(
      patterns: ['deepseek', 'r', '1'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 160,
    ),
    _ModelRule(
      patterns: ['deepseek', 'reasoner'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 160,
    ),
    _ModelRule(
      patterns: ['deepseek', 'v', '3'],
      supportsVision: false,
      supportsReasoning: false,
      priority: 120,
    ),
    _ModelRule(
      patterns: ['deepseek', 'chat'],
      supportsVision: false,
      supportsReasoning: false,
      priority: 120,
    ),
    _ModelRule(
      patterns: ['qwen', '3', '5'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['qwen', '3'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 120,
    ),
    _ModelRule(
      patterns: ['kimi', 'k', '2', '5'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['kimi', 'k', '2'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 120,
    ),
    _ModelRule(
      patterns: ['glm', '4', '5'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['glm', '4', '6'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['glm', '4', '7'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['glm', '5'],
      supportsVision: false,
      supportsReasoning: true,
      priority: 150,
    ),
    _ModelRule(
      patterns: ['grok', '4'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 140,
    ),
    _ModelRule(
      patterns: ['doubao', '1', '6'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 130,
    ),
    _ModelRule(
      patterns: ['doubao', '1', '8'],
      supportsVision: true,
      supportsReasoning: true,
      priority: 130,
    ),
  ];

  static ModelInfo enhance(ModelInfo model) {
    final tokens = _tokenize(model.id);
    _ModelRule? best;

    for (final rule in _rules) {
      if (rule.matches(tokens)) {
        if (best == null || rule.priority > best.priority) {
          best = rule;
        }
      }
    }

    final detectedVision = best?.supportsVision;
    final detectedReasoning = best?.supportsReasoning;

    return model.copyWith(
      supportsVision: model.overrideSupportsVision ?? detectedVision ?? model.supportsVision,
      supportsReasoning: model.overrideSupportsReasoning ??
          detectedReasoning ??
          model.supportsReasoning,
    );
  }

  static List<String> _tokenize(String input) {
    final lower = input.toLowerCase();
    final tokens = <String>[];
    final buffer = StringBuffer();

    bool? lastIsDigit;

    void flush() {
      if (buffer.isNotEmpty) {
        tokens.add(buffer.toString());
        buffer.clear();
      }
    }

    for (final rune in lower.runes) {
      final ch = String.fromCharCode(rune);
      final isLetter = RegExp(r'[a-z]').hasMatch(ch);
      final isDigit = RegExp(r'[0-9]').hasMatch(ch);

      if (isLetter || isDigit) {
        final currentIsDigit = isDigit;
        if (lastIsDigit != null && lastIsDigit != currentIsDigit) {
          flush();
        }
        buffer.write(ch);
        lastIsDigit = currentIsDigit;
      } else {
        flush();
        lastIsDigit = null;
      }
    }

    flush();
    return tokens;
  }
}

class _ModelRule {
  final List<String> patterns;
  final bool supportsVision;
  final bool supportsReasoning;
  final int priority;
  final bool numberAfter;

  const _ModelRule({
    required this.patterns,
    required this.supportsVision,
    required this.supportsReasoning,
    required this.priority,
    this.numberAfter = false,
  });

  bool matches(List<String> tokens) {
    if (numberAfter && patterns.length == 1 && patterns.first == 'o') {
      for (int i = 0; i < tokens.length - 1; i++) {
        if (tokens[i] == 'o' && RegExp(r'^\d+$').hasMatch(tokens[i + 1])) {
          return true;
        }
      }
      return false;
    }

    int index = 0;
    for (final token in tokens) {
      if (token == patterns[index]) {
        index++;
        if (index == patterns.length) return true;
      }
    }
    return false;
  }
}