import 'dart:async';
import '../../../core/models/api_message.dart';
import 'package:flutter_llama/flutter_llama.dart';
import 'api_request_builder.dart';
import '../../../core/models/chat_chunk.dart';
import '../../../core/models/model_info.dart';

class LocalApiBuilder implements ApiRequestBuilder {
  static final FlutterLlama _llama = FlutterLlama.instance;
  static String? _loadedModelPath;
  static bool _isLoaded = false;

  @override
  Map<String, String> buildHeaders(ApiBuildContext ctx) => {};

  @override
  Uri buildUri(ApiBuildContext ctx) => Uri();

  @override
  Uri buildModelsUri(ApiBuildContext ctx) => Uri();

  @override
  Map<String, dynamic> buildRequestBody(ApiBuildContext ctx) => {};

  @override
  List<ModelInfo> parseModelsResponse(Map<String, dynamic> json) => [];

  /// 将历史消息列表格式化为带轮次编号的 prompt
  String _buildPromptFromContext(List<ApiMessage> context) {
    final buffer = StringBuffer();
    int round = 0;
    for (final msg in context) {
      if (msg.role == 'user') {
        round++;
        // 提取用户消息文本
        String text = msg.content ?? '';
        if (text.isEmpty && msg.parts.isNotEmpty) {
          // 从 parts 中提取所有文本部分
          final textParts = msg.parts.whereType<ApiMessageTextPart>();
          text = textParts.map((p) => p.text).join('\n');
        }
        if (text.isNotEmpty) {
          buffer.writeln('User $round: $text');
        }
      } else if (msg.role == 'assistant') {
        String text = msg.content ?? '';
        if (text.isNotEmpty) {
          buffer.writeln('Assistant $round: $text');
        }
      }
    }
    // 添加下一轮的引导标记
    buffer.write('Assistant $round: ');
    return buffer.toString();
  }

  Stream<ChatChunk> generateStream(ApiBuildContext ctx) async* {
    final modelPath = ctx.model;
    if (modelPath.isEmpty) {
      yield const ChatChunk(isDone: true, error: '未选择本地模型');
      return;
    }

    // 构建包含完整历史且带轮次编号的 prompt
    final prompt = _buildPromptFromContext(ctx.context);

    // 加载模型（如果已加载且路径相同则跳过）
    if (!_isLoaded || _loadedModelPath != modelPath) {
      if (_isLoaded) await _llama.unloadModel();
      try {
        final loadConfig = LlamaConfig(
          modelPath: modelPath,
          nThreads: 4,
          nGpuLayers: -1,
          contextSize: 262144,
          batchSize: 512,
          useGpu: true,
          verbose: false,
        );
        final success = await _llama.loadModel(loadConfig);
        if (!success) {
          yield const ChatChunk(isDone: true, error: '模型加载失败');
          return;
        }
        _isLoaded = true;
        _loadedModelPath = modelPath;
      } catch (e) {
        yield ChatChunk(isDone: true, error: '加载模型异常：$e');
        return;
      }
    }

    final params = GenerationParams(prompt: prompt);

    try {
      await for (final token in _llama.generateStream(params)) {
        yield ChatChunk(content: token, isDone: false);
      }
      yield const ChatChunk(isDone: true);
    } catch (e) {
      yield ChatChunk(isDone: true, error: '生成失败：$e');
    }
  }
}