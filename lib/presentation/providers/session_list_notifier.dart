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

class SessionListNotifier
    extends StateNotifier<AsyncValue<List<SessionListItem>>> {
  final Ref ref;

  SessionListNotifier(this.ref) : super(const AsyncValue.loading()) {
    ref.listen<AsyncValue<List<SessionListItem>>>(
      sessionListProvider,
      (previous, next) {
        state = next;
      },
    );
  }

  Future<void> refresh() async {
    // Stream 会自动同步，保留兼容方法
  }

  Future<void> deleteSession(String fileName) async {
    try {
      final repository = ref.read(conversationRepositoryProvider);
      await repository.deleteSession(fileName);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateSessionTitle(String fileName, String newTitle) async {
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final cleanTitle = newTitle.trim();
      if (cleanTitle.isEmpty) return;
      await repository.updateSessionTitle(fileName, cleanTitle);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<String> createSession(String title) async {
    final repository = ref.read(conversationRepositoryProvider);
    final cleanTitle = title.trim().isEmpty ? '新对话' : title.trim();

    final now = DateTime.now().millisecondsSinceEpoch;
    final sessionId = now.toString();
    final fileName = '$sessionId.json';

    await repository.createSession(fileName: fileName, title: cleanTitle);
    return fileName;
  }
}

final sessionListNotifierProvider = Provider<SessionListNotifier>((ref) {
  return SessionListNotifier(ref);
});