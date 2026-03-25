import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import '../../domain/services/branch_navigator.dart';
import 'session_list_notifier.dart';

class HomeSessionItem {
  final Session session;
  final bool hasUnseen;
  final String userPreview;
  final int roundCount;
  final int updatedAt;
  final String? previewRoundId;

  const HomeSessionItem({
    required this.session,
    required this.hasUnseen,
    required this.userPreview,
    required this.roundCount,
    required this.updatedAt,
    required this.previewRoundId,
  });
}

final homeSessionListProvider =
    Provider<AsyncValue<List<HomeSessionItem>>>((ref) {
  final sessionsAsync = ref.watch(sessionListProvider);

  return sessionsAsync.whenData((sessions) {
    final items = sessions.map((session) {
      final hasUnseen = session.rounds.any((r) => r.hasUnseenUpdate);
      final roundCount = session.rounds.length;

      final previewRoundId = session.rounds.isEmpty
          ? null
          : BranchNavigator.getAllBranchLeaves(session).isNotEmpty
              ? BranchNavigator.getAllBranchLeaves(session).last.id
              : session.rounds.last.id;

      final previewRound = previewRoundId == null
          ? null
          : session.rounds.firstWhere(
              (r) => r.id == previewRoundId,
              orElse: () => session.rounds.last,
            );

      final userPreview = previewRound == null
          ? '点击开始新的对话'
          : previewRound.userContent.trim().isEmpty
              ? '（空输入）'
              : previewRound.userContent.trim();

      return HomeSessionItem(
        session: session,
        hasUnseen: hasUnseen,
        userPreview: userPreview,
        roundCount: roundCount,
        updatedAt: session.updatedAt,
        previewRoundId: previewRoundId,
      );
    }).toList();

    items.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return items;
  });
});