class SessionCardMeta {
  final int roundCount;
  final String? previewRoundId;
  final String userPreview;
  final String aiPreview;
  final bool hasUnseen;
  final bool isStreaming;

  const SessionCardMeta({
    required this.roundCount,
    required this.previewRoundId,
    required this.userPreview,
    required this.aiPreview,
    required this.hasUnseen,
    required this.isStreaming,
  });
}