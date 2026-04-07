import '../models/tree_node.dart';

List<TreeNode> buildTree(List<({String id, String? parentId})> topology) {
  if (topology.isEmpty) return [];

  final nodeMap = <String, TreeNode>{
    for (final t in topology)
      t.id: TreeNode(id: t.id, parentId: t.parentId, children: const [], depth: 0),
  };

  final childrenMap = <String, List<String>>{};
  final rootIds = <String>[];

  for (final t in topology) {
    if (t.parentId == null) {
      rootIds.add(t.id);
    } else {
      childrenMap.putIfAbsent(t.parentId!, () => []).add(t.id);
    }
  }

  final roots = <TreeNode>[];
  for (final rootId in rootIds) {
    final root = nodeMap[rootId];
    if (root != null) {
      roots.add(_buildSubtreeIterative(root, childrenMap, nodeMap));
    }
  }
  return roots;
}

TreeNode _buildSubtreeIterative(
  TreeNode root,
  Map<String, List<String>> childrenMap,
  Map<String, TreeNode> nodeMap,
) {
  final postOrder = <TreeNode>[];
  final stack = <TreeNode>[root];
  while (stack.isNotEmpty) {
    final node = stack.removeLast();
    postOrder.add(node);
    for (final cid in childrenMap[node.id] ?? []) {
      final child = nodeMap[cid];
      if (child != null) stack.add(child);
    }
  }

  final updatedMap = <String, TreeNode>{};
  for (int i = postOrder.length - 1; i >= 0; i--) {
    final original = postOrder[i];
    final childIds = childrenMap[original.id] ?? [];
    final builtChildren = <TreeNode>[];
    int maxChildDepth = -1;
    for (final cid in childIds) {
      final builtChild = updatedMap[cid]!;
      builtChildren.add(builtChild);
      if (builtChild.depth > maxChildDepth) maxChildDepth = builtChild.depth;
    }
    updatedMap[original.id] = original.copyWith(
      depth: maxChildDepth + 1,
      children: builtChildren,
    );
  }
  return updatedMap[root.id]!;
}