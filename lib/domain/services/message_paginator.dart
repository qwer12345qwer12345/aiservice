import '../../core/models/chat_round.dart';
import '../models/chat_page.dart';

class MessagePaginator {
  static ChatPageList paginate(List<ChatRound> rounds, int currentPageIndex) {
    if (rounds.isEmpty) {
      return ChatPageList.fromPages([], 0);
    }

    // ✅ 移除 pageIndex 设置，索引由列表位置决定
    final pages = rounds.map((round) => ChatPage(round: round)).toList();
    
    final validIndex = currentPageIndex.clamp(0, pages.length - 1);
    return ChatPageList.fromPages(pages, validIndex);
  }

  static ChatPage? getPage(List<ChatRound> rounds, int pageIndex) {
    if (rounds.isEmpty || pageIndex < 0 || pageIndex >= rounds.length) {
      return null;
    }
    // ✅ 直接通过索引获取
    return ChatPage(round: rounds[pageIndex]);
  }

  static int getTotalPages(List<ChatRound> rounds) {
    return rounds.length;
  }
}