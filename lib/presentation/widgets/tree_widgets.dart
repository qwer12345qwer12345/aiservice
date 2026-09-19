import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/models/tree_node.dart';
import '../providers/chat_notifier.dart' show roundDetailProvider;

const double kTreeNodeWidth = 300.0;
const double kTreeNodeHeight = 200.0;
const double kTreeLevelSeparation = 120.0;
const double kTreeSiblingSeparation = 40.0;
const double kTreeCanvasPadding = 2000.0;

class TreeLayout {
  final Map<String, Offset> positions;
  final Size canvasSize;

  const TreeLayout({
    required this.positions,
    required this.canvasSize,
  });
}

class TreeLayoutComputer {
  static final Map<String, double> _nodeWidthCache = {};

  static TreeLayout compute(List<TreeNode> roots) {
    _nodeWidthCache.clear();
    for (final root in roots) {
      _computeWidthsForTree(root);
    }
    final positions = <String, Offset>{};
    double currentX = 0;
    double maxHeight = 0;

    for (final root in roots) {
      final tempPositions = <String, Offset>{};
      _layoutNode(root, currentX, 0, tempPositions);

      double minX = double.infinity, maxX = -double.infinity;
      double minY = double.infinity, maxY = -double.infinity;
      for (final pos in tempPositions.values) {
        minX = min(minX, pos.dx);
        maxX = max(maxX, pos.dx + kTreeNodeWidth);
        minY = min(minY, pos.dy);
        maxY = max(maxY, pos.dy + kTreeNodeHeight);
      }
      final width = maxX - minX;
      final height = maxY - minY;

      final offsetX = currentX - minX;
      for (final entry in tempPositions.entries) {
        positions[entry.key] = Offset(entry.value.dx + offsetX, entry.value.dy);
      }

      currentX += width + kTreeSiblingSeparation;
      maxHeight = max(maxHeight, height);
    }

    final canvasWidth = currentX + kTreeCanvasPadding * 2;
    final canvasHeight = maxHeight + kTreeCanvasPadding * 2;
    return TreeLayout(
      positions: positions,
      canvasSize: Size(canvasWidth, canvasHeight),
    );
  }

  static void _computeWidthsForTree(TreeNode root) {
    void postOrder(TreeNode node) {
      if (node.children.isEmpty) {
        _nodeWidthCache[node.id] = kTreeNodeWidth;
        return;
      }
      double total = 0;
      for (final child in node.children) {
        postOrder(child);
        total += _nodeWidthCache[child.id]!;
      }
      total += (node.children.length - 1) * kTreeSiblingSeparation;
      _nodeWidthCache[node.id] = total;
    }

    postOrder(root);
  }

  static double _subtreeWidth(TreeNode node) {
    return _nodeWidthCache[node.id] ?? kTreeNodeWidth;
  }

  static void _layoutNode(
    TreeNode node,
    double x,
    double y,
    Map<String, Offset> positions,
  ) {
    positions[node.id] = Offset(x, y);
    if (node.children.isEmpty) return;

    final childWidths = node.children.map((c) => _subtreeWidth(c)).toList();
    final totalChildrenWidth = childWidths.fold(0.0, (a, b) => a + b) +
        (node.children.length - 1) * kTreeSiblingSeparation;
    double startX = x + (kTreeNodeWidth - totalChildrenWidth) / 2;
    for (int i = 0; i < node.children.length; i++) {
      final child = node.children[i];
      final childWidth = childWidths[i];
      final childX = startX + childWidth / 2 - kTreeNodeWidth / 2;
      _layoutNode(child, childX, y + kTreeNodeHeight + kTreeLevelSeparation, positions);
      startX += childWidth + kTreeSiblingSeparation;
    }
  }

  static List<(Offset, Offset)> buildParentChildPairs(
    List<TreeNode> roots,
    Map<String, Offset> positions,
  ) {
    final pairs = <(Offset, Offset)>[];
    void traverse(TreeNode node) {
      final parentPos = positions[node.id];
      if (parentPos == null) return;
      for (final child in node.children) {
        final childPos = positions[child.id];
        if (childPos != null) {
          pairs.add((parentPos, childPos));
        }
        traverse(child);
      }
    }

    for (final root in roots) {
      traverse(root);
    }
    return pairs;
  }
}

class OrthogonalLinePainter extends CustomPainter {
  final List<(Offset, Offset)> pairs;

  OrthogonalLinePainter({required this.pairs});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CupertinoColors.separator
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;
    for (final pair in pairs) {
      final parentCenter = Offset(
        pair.$1.dx + kTreeNodeWidth / 2,
        pair.$1.dy + kTreeNodeHeight / 2,
      );
      final childCenter = Offset(
        pair.$2.dx + kTreeNodeWidth / 2,
        pair.$2.dy + kTreeNodeHeight / 2,
      );
      final start = Offset(parentCenter.dx, parentCenter.dy + kTreeNodeHeight / 2);
      final end = Offset(childCenter.dx, childCenter.dy - kTreeNodeHeight / 2);
      final midY = (start.dy + end.dy) / 2;
      final path = Path()
        ..moveTo(start.dx, start.dy)
        ..lineTo(start.dx, midY)
        ..lineTo(end.dx, midY)
        ..lineTo(end.dx, end.dy);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant OrthogonalLinePainter oldDelegate) {
    if (identical(pairs, oldDelegate.pairs)) return false;
    if (pairs.length != oldDelegate.pairs.length) return true;
    for (int i = 0; i < pairs.length; i++) {
      if (pairs[i] != oldDelegate.pairs[i]) return true;
    }
    return false;
  }
}

class TreeNodeCard extends ConsumerWidget {
  final String roundId;
  final VoidCallback onSwitch;
  final VoidCallback onDelete;

  const TreeNodeCard({
    super.key,
    required this.roundId,
    required this.onSwitch,
    required this.onDelete,
  });

  Widget _buildStatusDot({required bool isStreaming, required bool hasUnseen}) {
    if (isStreaming) {
      return Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemOrange,
          shape: BoxShape.circle,
        ),
      );
    }
    if (hasUnseen) {
      return Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemBlue,
          shape: BoxShape.circle,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final round = ref.watch(roundDetailProvider(roundId)).valueOrNull;
    final dateText = round == null
        ? null
        : DateFormat('yyyy-MM-dd HH:mm:ss')
            .format(DateTime.fromMillisecondsSinceEpoch(round.createdAt));
    final userText = round?.userContent;
    final aiText = round == null
        ? null
        : ((round.assistantContent ?? '').trim().isEmpty
            ? '（等待回复）'
            : round.assistantContent!);

    void showActionSheet() {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: const Text('节点操作'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                onDelete();
              },
              child: const Text('删除节点'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
        ),
      );
    }

    return GestureDetector(
      onLongPress: showActionSheet,
      child: Container(
        width: kTreeNodeWidth,
        height: kTreeNodeHeight,
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.systemBackground,
            context,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    dateText ?? '加载中...',
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          color: CupertinoDynamicColor.resolve(
                            CupertinoColors.label,
                            context,
                          ),
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (round != null && (round.isIncomplete || round.hasUnseenUpdate))
                  _buildStatusDot(
                    isStreaming: round.isIncomplete,
                    hasUnseen: round.hasUnseenUpdate,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: PreviewSlot(
                label: 'YOU',
                content: userText,
                loading: round == null,
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: PreviewSlot(
                label: 'AI',
                content: aiText,
                loading: round == null,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton.filled(
                borderRadius: BorderRadius.circular(12),
                onPressed: onSwitch,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text('切换到此分支'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewSlot extends StatelessWidget {
  final String label;
  final String? content;
  final bool loading;

  const PreviewSlot({
    super.key,
    required this.label,
    required this.content,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = CupertinoDynamicColor.resolve(CupertinoColors.label, context);
    final style = CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: textColor);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 34,
          child: Text('$label ', style: style),
        ),
        Expanded(
          child: loading
              ? const Text('加载中...', maxLines: 2, overflow: TextOverflow.ellipsis)
              : Text(
                  (content == null || content!.trim().isEmpty) ? '（空）' : content!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: style,
                ),
        ),
      ],
    );
  }
}
