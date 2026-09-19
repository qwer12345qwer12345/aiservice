// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TreeNode _$TreeNodeFromJson(Map<String, dynamic> json) => _TreeNode(
  id: json['id'] as String,
  parentId: json['parentId'] as String?,
  children: (json['children'] as List<dynamic>)
      .map((e) => TreeNode.fromJson(e as Map<String, dynamic>))
      .toList(),
  depth: (json['depth'] as num).toInt(),
);

Map<String, dynamic> _$TreeNodeToJson(_TreeNode instance) => <String, dynamic>{
  'id': instance.id,
  'parentId': instance.parentId,
  'children': instance.children,
  'depth': instance.depth,
};

_TreePath _$TreePathFromJson(Map<String, dynamic> json) => _TreePath(
  nodes: (json['nodes'] as List<dynamic>)
      .map((e) => TreeNode.fromJson(e as Map<String, dynamic>))
      .toList(),
  targetNode: TreeNode.fromJson(json['targetNode'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TreePathToJson(_TreePath instance) => <String, dynamic>{
  'nodes': instance.nodes,
  'targetNode': instance.targetNode,
};
