import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/models/chat_round.dart';

part 'tree_node.freezed.dart';

@freezed
class TreeNode with _$TreeNode {
  const factory TreeNode({
    required String id,
    String? parentId,
    required ChatRound round,
    required List<TreeNode> children,
    required int depth,
    String? preview,
  }) = _TreeNode;

  factory TreeNode.fromRound({
    required ChatRound round,
    required int depth,
  }) {
    final userText = round.userContent.trim();
    final aiText = round.assistantContent?.trim() ?? '（等待回复）';

    final userPreview =
        userText.length > 20 ? '${userText.substring(0, 20)}...' : userText;
    final aiPreview =
        aiText.length > 20 ? '${aiText.substring(0, 20)}...' : aiText;

    return TreeNode(
      id: round.id,
      parentId: round.parentId,
      round: round,
      children: const [],
      depth: depth,
      preview: 'YOU: $userPreview\nAI: $aiPreview',
    );
  }
}

@freezed
class TreePath with _$TreePath {
  const factory TreePath({
    required List<TreeNode> nodes,
    required TreeNode targetNode,
  }) = _TreePath;
}