import 'dart:async';
import 'package:flutter_llama/flutter_llama.dart';
import '../../core/models/api_message.dart';
import '../../core/models/app_config.dart';
import '../../core/models/chat_chunk.dart';
import '../../core/models/model_info.dart';
import 'chat_source.dart';

class LocalChatSource implements ChatSource {
  static final FlutterLlama _llama = FlutterLlama.instance;
  static String? _loadedModelPath;
  static bool _isLoaded = false;

  @override
  Future<List<ModelInfo>> fetchModels(ConfigProfile config) async {
    return []; 
  }

  @override
  Stream<ChatChunk> chatStream({
    required ConfigProfile config,
    required List<ApiMessage> context,
  }) async* {
    final modelPath = config.selectedModel?.trim() ?? '';
    if (modelPath.isEmpty) {
      yield const ChatChunk(isDone: true, error: '未选择本地模型');
      return;
    }

    final prompt = _buildPromptFromContext(context);

    if (!_isLoaded || _loadedModelPath != modelPath) {
      if (_isLoaded) await _llama.unloadModel();
      try {
        final loadConfig = LlamaConfig(
          modelPath: modelPath,
          nThreads: 4,
          nGpuLayers: -1,
          contextSize: 16384,
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

  String _buildPromptFromContext(List<ApiMessage> context) {
    final buffer = StringBuffer();
    int round = 0;
    for (final msg in context) {
      if (msg.role == 'user') {
        round++;
        String text = msg.content ?? '';
        if (text.isEmpty && msg.parts.isNotEmpty) {
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
    buffer.write('Assistant $round: ');
    return buffer.toString();
  }
}