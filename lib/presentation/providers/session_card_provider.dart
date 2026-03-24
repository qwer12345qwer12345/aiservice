import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import '../../di/providers.dart';

final sessionFileNamesProvider = FutureProvider<List<String>>((ref) async {
  final repository = ref.read(conversationRepositoryProvider);
  final fileNames = await repository.getAllSessionFileNames();
  final sessions = <Session>[];

  for (final fileName in fileNames) {
    try {
      final session = await repository.getSession(fileName);
      sessions.add(session);
    } catch (_) {}
  }

  sessions.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  return sessions.map((e) => '${e.id}.json').toList();
});

final sessionCardProvider =
    FutureProvider.family<Session, String>((ref, fileName) async {
  final repository = ref.read(conversationRepositoryProvider);
  return repository.getSession(fileName);
});