import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/input_state.dart';
import '../../core/models/pending_attachment.dart';

/// 输入状态 Notifier
///
/// 职责：
/// - 管理输入框文本和附件列表
/// - 提供状态变更方法
/// - 不包含发送逻辑、不包含编辑模式、不包含 isSending 状态
class InputNotifier extends Notifier<InputState> {
  @override
  InputState build() => const InputState();

  /// 更新输入文本
  void updateText(String text) {
    state = state.copyWith(text: text);
  }

  /// 添加附件
  void addAttachment(PendingAttachment attachment) {
    state = state.copyWith(
      attachments: [...state.attachments, attachment],
    );
  }

  /// 移除指定 ID 的附件
  void removeAttachment(String id) {
    state = state.copyWith(
      attachments: state.attachments.where((a) => a.id != id).toList(),
    );
  }

  /// 清空输入状态（文本和附件）
  void clear() {
    state = const InputState();
  }
}

/// 全局输入状态 Provider
///
/// 特点：
/// - 全局单例：所有会话共享同一份输入草稿
/// - 自动保留：切换会话时草稿不会丢失
final inputStateProvider =
    NotifierProvider<InputNotifier, InputState>(InputNotifier.new);