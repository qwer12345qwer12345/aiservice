import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import '../../di/providers.dart';

class SessionListNotifier extends StateNotifier<AsyncValue<List<Session>>> {
  final Ref ref;

  SessionListNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadSessions();
  }

  Future<void> _loadSessions() async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(conversationRepositoryProvider);
      final sessions = await repository.getAllSessions();
      state = AsyncValue.data(sessions);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    await _loadSessions();
  }

  Future<void> deleteSession(String fileName) async {
    try {
      final repository = ref.read(conversationRepositoryProvider);
      await repository.deleteSession(fileName);
      await _loadSessions();
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
      await _loadSessions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<String> createSession(String title) async {
    final repository = ref.read(conversationRepositoryProvider);
    final cleanTitle = title.trim().isEmpty ? '新对话' : title.trim();
    final session = await repository.createSessionWithGeneratedId(
      title: cleanTitle,
    );
    await _loadSessions();
    return '${session.id}.json';
  }
}

final sessionListProvider =
    StateNotifierProvider<SessionListNotifier, AsyncValue<List<Session>>>((ref) {
  return SessionListNotifier(ref);
});