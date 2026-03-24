import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import 'global_streaming_provider.dart';
import 'session_list_notifier.dart';

class HomeSessionItem {
  final Session session;
  final bool isStreaming;
  final bool hasUnseen;
  final String userPreview;
  final String aiPreview;
  final int roundCount;
  final int updatedAt;

  const HomeSessionItem({
    required this.session,
    required this.isStreaming,
    required this.hasUnseen,
    required this.userPreview,
    required this.aiPreview,
    required this.roundCount,
    required this.updatedAt,
  });
}

final homeSessionListProvider =
    Provider<AsyncValue<List<HomeSessionItem>>>((ref) {
  final sessionsAsync = ref.watch(sessionListProvider);
  final streamingSessions = ref.watch(globalStreamingSessionsProvider);
  final streamingPreviewMap = ref.watch(globalStreamingPreviewProvider);

  return sessionsAsync.whenData((sessions) {
    final items = sessions.map((session) {
      final fileName = '${session.id}.json';
      final isStreaming = streamingSessions.contains(fileName);
      final streamingPreview = streamingPreviewMap[fileName];

      final hasUnseen = session.rounds.any((r) => r.hasUnseenUpdate);
      final roundCount = session.rounds.length;

      final userPreview = session.rounds.isEmpty
          ? '点击开始新的对话'
          : session.rounds.last.userContent.trim().isEmpty
              ? '（空输入）'
              : session.rounds.last.userContent.trim();

      final aiPreview = streamingPreview != null
          ? (streamingPreview.content.trim().isEmpty
              ? '正在生成...'
              : streamingPreview.content)
          : session.rounds.isEmpty
              ? '等待助手回复'
              : ((session.rounds.last.assistantContent ?? '').trim().isEmpty
                  ? '（等待回复）'
                  : session.rounds.last.assistantContent!.trim());

      return HomeSessionItem(
        session: session,
        isStreaming: isStreaming,
        hasUnseen: hasUnseen,
        userPreview: userPreview,
        aiPreview: aiPreview,
        roundCount: roundCount,
        updatedAt: session.updatedAt,
      );
    }).toList();

    items.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return items;
  });
});