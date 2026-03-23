import 'dart:typed_data';
import 'package:synchronized/synchronized.dart';
import '../../core/models/session.dart';
import '../../core/models/chat_round.dart';
import '../../core/interfaces/file_service.dart';
import '../../core/utils/id_generator.dart';

class ConversationRepository {
  final IFileService _fileService;

  // 针对特定文件名的异步互斥锁，防止并发任务覆盖存档
  final Map<String, Lock> _locks = {};

  ConversationRepository(this._fileService);

  /// 互斥锁执行器，确保对同一个文件操作是顺序的
  Future<T> _runWithLock<T>(String fileName, Future<T> Function() action) {
    final lock = _locks.putIfAbsent(fileName, () => Lock());
    return lock.synchronized(action);
  }

  Future<List<String>> getAllSessionFileNames() async {
    return await _fileService.getConversationFileList();
  }

  Future<Session> getSession(String fileName) async {
    return _runWithLock(fileName, () async {
      return await _fileService.readSession(fileName);
    });
  }

  Future<void> saveSession(String fileName, Session session) async {
    return _runWithLock(fileName, () async {
      await _fileService.writeSession(fileName, session);
    });
  }

  Future<void> deleteSession(String fileName) async {
    return _runWithLock(fileName, () async {
      await _fileService.deleteSession(fileName);
    });
  }

  Future<String> saveAttachment(Uint8List data, String fileName) async {
    return await _fileService.saveAttachment(data, fileName);
  }

  Future<Uint8List> getAttachment(String relativePath) async {
    return await _fileService.readAttachment(relativePath);
  }

  Future<void> deleteAttachment(String relativePath) async {
    await _fileService.deleteAttachment(relativePath);
  }

  Future<Session> createSession({
    required String fileName,
    required String title,
  }) async {
    return _runWithLock(fileName, () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      final session = Session(
        id: fileName.replaceAll('.json', ''),
        title: title,
        createdAt: now,
        updatedAt: now,
        rounds: [],
      );
      await _fileService.writeSession(fileName, session);
      return session;
    });
  }

  Future<Session> createSessionWithGeneratedId({
    required String title,
  }) async {
    final sessionId = IdGenerator.generate();
    final fileName = '$sessionId.json';
    return await createSession(
      fileName: fileName,
      title: title,
    );
  }

  Future<void> updateSessionTitle(String fileName, String title) async {
    return _runWithLock(fileName, () async {
      final session = await _fileService.readSession(fileName);
      final updatedSession = session.copyWith(
        title: title,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _fileService.writeSession(fileName, updatedSession);
    });
  }

  Future<List<Session>> getAllSessions() async {
    final fileNames = await getAllSessionFileNames();
    final sessions = <Session>[];

    for (final fileName in fileNames) {
      try {
        final session = await getSession(fileName);
        sessions.add(session);
      } catch (_) {
        // 忽略损坏/不可读的会话文件，避免整个列表崩掉
      }
    }

    sessions.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return sessions;
  }

  Future<void> appendRound(String fileName, ChatRound round) async {
    return _runWithLock(fileName, () async {
      final session = await _fileService.readSession(fileName);
      final updatedSession = session.copyWith(
        rounds: [...session.rounds, round],
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _fileService.writeSession(fileName, updatedSession);
    });
  }

  Future<void> updateRound(
    String fileName,
    String roundId,
    ChatRound updatedRound,
  ) async {
    return _runWithLock(fileName, () async {
      final session = await _fileService.readSession(fileName);
      final updatedRounds = session.rounds.map((round) {
        if (round.id == roundId) {
          return updatedRound;
        }
        return round;
      }).toList();

      final updatedSession = session.copyWith(
        rounds: updatedRounds,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );

      await _fileService.writeSession(fileName, updatedSession);
    });
  }
}