class SseEvent {
  final String? id;
  final String? event;
  final String data;

  const SseEvent({
    this.id,
    this.event,
    required this.data,
  });

  @override
  String toString() => 'SseEvent(id: $id, event: $event, data: $data)';
}