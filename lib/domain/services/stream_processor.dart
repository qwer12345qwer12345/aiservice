import 'dart:async';
import '../../core/models/chat_chunk.dart';
import '../../core/models/generation_event.dart';

/// 流处理器
///
/// 职责：
/// - 累加 content 和 reasoning
/// - 节流输出 partial 事件
/// - 映射错误和完成状态
/// - 纯逻辑，无副作用，易于测试
class StreamProcessor {
  final Duration throttleInterval;

  StreamProcessor({this.throttleInterval = const Duration(seconds: 1)});

  /// 处理输入流并输出生成事件流
  Stream<GenerationEvent> process(Stream<ChatChunk> input) async* {
    final contentBuffer = StringBuffer();
    final reasoningBuffer = StringBuffer();
    String? error;
    DateTime? lastEmitTime;

    // 辅助函数：检查是否需要节流输出
    bool shouldEmit() {
      final now = DateTime.now();
      if (lastEmitTime == null) {
        lastEmitTime = now;
        return true;
      }
      if (now.difference(lastEmitTime!) >= throttleInterval) {
        lastEmitTime = now;
        return true;
      }
      return false;
    }

    try {
      await for (final chunk in input) {
        // 错误处理
        if (chunk.error != null) {
          error = chunk.error;
          break;
        }

        // 累加数据
        if (chunk.content != null) {
          contentBuffer.write(chunk.content);
        }
        if (chunk.reasoningContent != null) {
          reasoningBuffer.write(chunk.reasoningContent);
        }

        // 节流输出
        if (shouldEmit()) {
          yield GenerationEvent.partial(
            content: contentBuffer.toString(),
            reasoning: reasoningBuffer.toString(),
          );
        }

        // 完成处理
        if (chunk.isDone) {
          break;
        }
      }

      // 最终输出
      if (error != null) {
        yield GenerationEvent.failed(error: error);
      } else {
        yield GenerationEvent.completed(
          content: contentBuffer.toString(),
          reasoning: reasoningBuffer.toString(),
        );
      }
    } catch (e) {
      yield GenerationEvent.failed(error: e.toString());
    }
  }
}