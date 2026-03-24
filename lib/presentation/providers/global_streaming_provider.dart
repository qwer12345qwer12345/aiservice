import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamingPreview {
  final String roundId;
  final String content;
  final String reasoning;

  const StreamingPreview({
    required this.roundId,
    this.content = '',
    this.reasoning = '',
  });
}

final globalStreamingSessionsProvider =
    StateProvider<Set<String>>((ref) => <String>{});

final globalStreamingPreviewProvider =
    StateProvider<Map<String, StreamingPreview>>((ref) => {});