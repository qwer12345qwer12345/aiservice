import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_event.freezed.dart';

/// 生成过程中的统一事件
@freezed
class GenerationEvent with _$GenerationEvent {
  const factory GenerationEvent.partial({
    required String content,
    required String reasoning,
  }) = PartialGeneration;

  const factory GenerationEvent.completed({
    required String content,
    required String reasoning,
  }) = CompletedGeneration;

  const factory GenerationEvent.failed({
    required String error,
  }) = FailedGeneration;
}