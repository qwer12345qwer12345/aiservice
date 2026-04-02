// 导入库的模型和枚举
import 'package:flutter_client_sse/flutter_client_sse.dart';

// 保持你原有SseEvent的非空约定，避免修改下游Decoder
class SseEvent {
  final String? id;
  final String? event;
  final String data; // 保持非空，和你原有逻辑一致

  // 从库的SSEModel转换，自动处理空值
  factory SseEvent.fromSSEModel(SSEModel model) {
    return SseEvent(
      id: model.id,
      event: model.event,
      // 空值处理：保证data永远非空，不会给下游Decoder传null
      data: model.data?.trim() ?? '',
    );
  }

  const SseEvent({
    this.id,
    this.event,
    required this.data,
  });

  @override
  String toString() => 'SseEvent(id: $id, event: $event, data: $data)';
}