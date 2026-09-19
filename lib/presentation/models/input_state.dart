import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/models/pending_attachment.dart';

part 'input_state.freezed.dart';

@freezed
abstract class InputState with _$InputState {
  const factory InputState({
    /// 输入框文本
    @Default('') String text,

    /// 附件列表
    @Default([]) List<PendingAttachment> attachments,
  }) = _InputState;
}

/// 扩展方法：计算是否允许发送
extension InputStateX on InputState {
  bool get canSend => text.trim().isNotEmpty || attachments.isNotEmpty;
}