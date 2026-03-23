import '../../core/models/chat_round.dart';
import '../models/chat_page.dart';

class MessagePaginator {
  static ChatPageList paginate(List<ChatRound> rounds, int currentPageIndex) {
    if (rounds.isEmpty) {
      return ChatPageList.fromPages([], 0);
    }

    final pages = <ChatPage>[
      for (int i = 0; i < rounds.length; i++)
        ChatPage(
          pageIndex: i,
          round: rounds[i],
        ),
    ];

    final validIndex = currentPageIndex.clamp(0, pages.length - 1);

    return ChatPageList.fromPages(pages, validIndex);
  }

  static ChatPage? getPage(List<ChatRound> rounds, int pageIndex) {
    if (rounds.isEmpty) return null;
    if (pageIndex < 0 || pageIndex >= rounds.length) return null;

    return ChatPage(
      pageIndex: pageIndex,
      round: rounds[pageIndex],
    );
  }

  static int getTotalPages(List<ChatRound> rounds) {
    return rounds.length;
  }
}