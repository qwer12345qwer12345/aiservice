import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/models/chat_round.dart';

part 'chat_page.freezed.dart';

@freezed
class ChatPage with _$ChatPage {
  const factory ChatPage({
    // ✅ 移除 pageIndex - 索引由列表位置决定
    required ChatRound round,
  }) = _ChatPage;
}

@freezed
class ChatPageList with _$ChatPageList {
  const factory ChatPageList({
    required List<ChatPage> pages,
    required int currentPageIndex,  // ✅ UI 状态的单一事实来源 (0-based)
    required int totalPages,
  }) = _ChatPageList;

  factory ChatPageList.fromPages(List<ChatPage> pages, int currentIndex) {
    return ChatPageList(
      pages: pages,
      currentPageIndex: pages.isEmpty ? 0 : currentIndex.clamp(0, pages.length - 1),
      totalPages: pages.length,
    );
  }
}

// ✅ 将 getter 移到 extension 中（Freezed 要求）
extension ChatPageListX on ChatPageList {
  /// 通过 roundId 查找页索引
  int? findPageIndexByRoundId(String roundId) {
    return pages.indexWhere((page) => page.round.id == roundId);
  }

  /// 获取当前页
  ChatPage? get currentPage {
    if (pages.isEmpty || currentPageIndex < 0 || currentPageIndex >= pages.length) {
      return null;
    }
    return pages[currentPageIndex];
  }

  /// 获取上一页索引
  int? get prevPageIndex {
    if (currentPageIndex <= 0) return null;
    return currentPageIndex - 1;
  }

  /// 获取下一页索引
  int? get nextPageIndex {
    if (currentPageIndex >= pages.length - 1) return null;
    return currentPageIndex + 1;
  }
}