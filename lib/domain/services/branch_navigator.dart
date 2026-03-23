import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../models/tree_node.dart';
import 'tree_builder.dart';

class BranchNavigator {
  static List<ChatRound> getCurrentBranchPath(
    Session session,
    String currentRoundId,
  ) {
    if (session.rounds.isEmpty) return const [];
    final roots = TreeBuilder.buildTree(session.rounds);
    final path = TreeBuilder.findPath(roots, currentRoundId);
    if (path == null) {
      return [...session.rounds]
        ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
    return path.nodes.map((node) => node.round).toList();
  }

  static String switchBranch(Session session, String targetRoundId) {
    if (session.rounds.isEmpty) return targetRoundId;
    final roots = TreeBuilder.buildTree(session.rounds);
    final path = TreeBuilder.findPath(roots, targetRoundId);
    if (path == null) return targetRoundId;
    return path.targetNode.id;
  }

  static List<TreeNode> getAllBranchLeaves(Session session) {
    if (session.rounds.isEmpty) return const [];
    final roots = TreeBuilder.buildTree(session.rounds);
    return TreeBuilder.findLeafNodes(roots);
  }

  static bool isOnLatestBranch(Session session, String currentRoundId) {
    if (session.rounds.isEmpty) return true;
    final roots = TreeBuilder.buildTree(session.rounds);
    final leaves = TreeBuilder.findLeafNodes(roots);
    if (leaves.isEmpty) return true;
    final latestLeaf = leaves.reduce((a, b) {
      return a.round.createdAt >= b.round.createdAt ? a : b;
    });
    return latestLeaf.id == currentRoundId;
  }
}