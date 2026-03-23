import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../models/chat_page.dart';
import 'branch_navigator.dart';
import 'message_paginator.dart';

class ChatViewStateData {
  final String? currentRoundId;
  final List<ChatRound> branchPath;
  final ChatPageList pageList;

  const ChatViewStateData({
    required this.currentRoundId,
    required this.branchPath,
    required this.pageList,
  });
}

class ChatViewStateBuilder {
  static ChatViewStateData buildInitial(Session session) {
    final leaves = BranchNavigator.getAllBranchLeaves(session);
    final currentRoundId = leaves.isNotEmpty
        ? leaves.last.id
        : (session.rounds.isNotEmpty ? session.rounds.first.id : null);
    return buildForRound(session, currentRoundId);
  }

  static ChatViewStateData buildForRound(Session session, String? roundId) {
    final branchPath = roundId == null
        ? <ChatRound>[]
        : BranchNavigator.getCurrentBranchPath(session, roundId);

    final targetPageIndex = branchPath.isNotEmpty ? branchPath.length - 1 : 0;
    final pageList = MessagePaginator.paginate(branchPath, targetPageIndex);

    return ChatViewStateData(
      currentRoundId: roundId,
      branchPath: branchPath,
      pageList: pageList,
    );
  }
}