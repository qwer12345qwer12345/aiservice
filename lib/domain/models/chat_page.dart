import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/models/chat_round.dart';

part 'chat_page.freezed.dart';

@freezed
class ChatPage with _$ChatPage {
  const factory ChatPage({
    required int pageIndex,
    required ChatRound round,
  }) = _ChatPage;
}

@freezed
class ChatPageList with _$ChatPageList {
  const factory ChatPageList({
    required List<ChatPage> pages,
    required int currentPageIndex,
    required int totalPages,
  }) = _ChatPageList;

  factory ChatPageList.fromPages(List<ChatPage> pages, int currentIndex) {
    return ChatPageList(
      pages: pages,
      currentPageIndex: pages.isEmpty ? 0 : currentIndex,
      totalPages: pages.length,
    );
  }
}