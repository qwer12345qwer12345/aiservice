// lib/presentation/providers/session_list_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';
import '../../domain/models/session_list_item.dart';
import '../../domain/models/session_card_meta.dart';

final sessionListProvider = StreamProvider<List<SessionListItem>>((ref) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSessionListItems();
});

final sessionCardMetaProvider =
    StreamProvider.family<SessionCardMeta, String>((ref, sessionId) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSessionCardMeta(sessionId);
});