class SessionListItem {
  final String id;
  final String title;
  final int updatedAt;
  final bool hasUnseen;
  final int roundCount;
  final String? previewRoundId;
  final String userPreview;
  final String aiPreview;
  final bool isStreaming;

  const SessionListItem({
    required this.id,
    required this.title,
    required this.updatedAt,
    required this.hasUnseen,
    required this.roundCount,
    required this.previewRoundId,
    required this.userPreview,
    required this.aiPreview,
    required this.isStreaming,
  });
}