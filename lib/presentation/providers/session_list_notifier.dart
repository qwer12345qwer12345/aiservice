import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';
import '../../domain/models/session_list_item.dart';
import '../../domain/models/session_card_meta.dart';
import 'package:uuid/uuid.dart';

final sessionListProvider = StreamProvider<List<SessionListItem>>((ref) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSessionListItems();
});

final sessionCardMetaProvider =
    StreamProvider.family<SessionCardMeta, String>((ref, sessionId) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchSessionCardMeta(sessionId);
});

class SessionListController {
  final Ref ref;

  SessionListController(this.ref);

  Future<void> deleteSession(String sessionId) async {
    final repository = ref.read(conversationRepositoryProvider);
    await repository.deleteSession(sessionId);
  }

  Future<void> updateSessionTitle(String sessionId, String newTitle) async {
    final repository = ref.read(conversationRepositoryProvider);
    final cleanTitle = newTitle.trim();
    if (cleanTitle.isEmpty) return;
    await repository.updateSessionTitle(sessionId, cleanTitle);
  }

  Future<String> createSession(String title) async {
    final repository = ref.read(conversationRepositoryProvider);

    final sessionId = const Uuid().v4();

    await repository.createSession(sessionId: sessionId, title: '新对话');
    return sessionId;
  }
}

final sessionListControllerProvider = Provider<SessionListController>((ref) {
  return SessionListController(ref);
});