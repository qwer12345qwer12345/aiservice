import '../../core/models/chat_round.dart';
import '../models/tree_node.dart';

class TreeBuilder {
  static List<TreeNode> buildTree(List<ChatRound> rounds) {
    if (rounds.isEmpty) return [];

    final sortedRounds = [...rounds]
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

    final nodeMap = <String, TreeNode>{
      for (final round in sortedRounds)
        round.id: TreeNode.fromRound(
          round: round,
          depth: 0,
        ),
    };

    final childrenMap = <String, List<String>>{};
    final rootIds = <String>[];

    for (final round in sortedRounds) {
      final parentId = round.parentId;
      if (parentId == null) {
        rootIds.add(round.id);
      } else {
        childrenMap.putIfAbsent(parentId, () => []).add(round.id);
      }
    }

    final roots = <TreeNode>[];
    for (final rootId in rootIds) {
      final root = nodeMap[rootId];
      if (root != null) {
        roots.add(_buildSubtree(root, childrenMap, nodeMap, 0));
      }
    }

    roots.sort((a, b) => a.round.createdAt.compareTo(b.round.createdAt));
    return roots;
  }

  static TreeNode _buildSubtree(
    TreeNode node,
    Map<String, List<String>> childrenMap,
    Map<String, TreeNode> nodeMap,
    int depth,
  ) {
    final childIds = childrenMap[node.id] ?? [];
    final children = <TreeNode>[];

    for (final childId in childIds) {
      final child = nodeMap[childId];
      if (child != null) {
        children.add(_buildSubtree(child, childrenMap, nodeMap, depth + 1));
      }
    }

    children.sort((a, b) => a.round.createdAt.compareTo(b.round.createdAt));

    return node.copyWith(
      depth: depth,
      children: children,
    );
  }

  static TreePath? findPath(List<TreeNode> roots, String targetId) {
    for (final root in roots) {
      final path = _findPathRecursive(root, targetId, []);
      if (path != null) {
        return TreePath(
          nodes: path,
          targetNode: path.last,
        );
      }
    }
    return null;
  }

  static List<TreeNode>? _findPathRecursive(
    TreeNode node,
    String targetId,
    List<TreeNode> currentPath,
  ) {
    final newPath = [...currentPath, node];

    if (node.id == targetId) {
      return newPath;
    }

    for (final child in node.children) {
      final result = _findPathRecursive(child, targetId, newPath);
      if (result != null) {
        return result;
      }
    }

    return null;
  }

  static List<TreeNode> findLeafNodes(List<TreeNode> roots) {
    final leaves = <TreeNode>[];
    _findLeavesRecursive(roots, leaves);
    leaves.sort((a, b) => a.round.createdAt.compareTo(b.round.createdAt));
    return leaves;
  }

  static void _findLeavesRecursive(
    List<TreeNode> nodes,
    List<TreeNode> leaves,
  ) {
    for (final node in nodes) {
      if (node.children.isEmpty) {
        leaves.add(node);
      } else {
        _findLeavesRecursive(node.children, leaves);
      }
    }
  }

  static TreeNode? findLatestLeaf(TreeNode node) {
    if (node.children.isEmpty) {
      return node;
    }

    final latestChild = node.children.reduce((a, b) {
      return a.round.createdAt >= b.round.createdAt ? a : b;
    });

    return findLatestLeaf(latestChild);
  }
}