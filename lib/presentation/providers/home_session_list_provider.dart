// presentation/providers/home_session_list_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
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

// 简化：直接监听 sessionListProvider，无需额外处理
final homeSessionListProvider = Provider<AsyncValue<List<HomeSessionItem>>>((ref) {
  final sessionsAsync = ref.watch(sessionListProvider);
  
  return sessionsAsync.whenData((sessions) {
    final items = sessions.map((session) {
      final hasUnseen = session.rounds.any((r) => r.hasUnseenUpdate);
      final roundCount = session.rounds.length;
      
      // 直接获取最后一个 round 作为预览
      final previewRound = session.rounds.isEmpty 
          ? null 
          : session.rounds.last;
      
      final previewRoundId = previewRound?.id;
      
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