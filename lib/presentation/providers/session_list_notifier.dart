// presentation/providers/session_list_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import '../../di/providers.dart';

// ✅ 使用纯声明式 StreamProvider
final sessionListProvider = StreamProvider<List<Session>>((ref) {
  final repository = ref.watch(conversationRepositoryProvider);
  return repository.watchAllSessions();
});

// ✅ 保留命令式 notifier 用于需要直接调用方法的场景
class SessionListNotifier extends StateNotifier<AsyncValue<List<Session>>> {
  final Ref ref;

  SessionListNotifier(this.ref) : super(const AsyncValue.loading()) {
    // 监听上面的 StreamProvider
    ref.listen<AsyncValue<List<Session>>>(sessionListProvider, (previous, next) {
      state = next;
    });
  }

  Future<void> refresh() async {
    // Stream 会自动同步，保留此方法用于兼容性
  }

  Future<void> deleteSession(String fileName) async {
    try {
      final repository = ref.read(conversationRepositoryProvider);
      await repository.deleteSession(fileName);
      // Stream 会自动同步
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
      // Stream 会自动同步
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<String> createSession(String title) async {
    final repository = ref.read(conversationRepositoryProvider);
    final cleanTitle = title.trim().isEmpty ? '新对话' : title.trim();
    
    // 使用时间戳生成临时 ID
    final now = DateTime.now().millisecondsSinceEpoch;
    final sessionId = now.toString();
    final fileName = '$sessionId.json';
    
    await repository.createSession(fileName: fileName, title: cleanTitle);
    
    return fileName;
  }
}

// ✅ 使用 Provider 而非 StateNotifierProvider
final sessionListNotifierProvider = Provider<SessionListNotifier>((ref) {
  return SessionListNotifier(ref);
});