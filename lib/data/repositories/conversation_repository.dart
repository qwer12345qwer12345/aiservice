import 'dart:typed_data';
import 'package:synchronized/synchronized.dart';
import '../../core/interfaces/file_service.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../../core/utils/id_generator.dart';

class ConversationRepository {
  final IFileService _fileService;

  final Map<String, Lock> _locks = {};

  ConversationRepository(this._fileService);

  Future<T> _runWithLock<T>(String fileName, Future<T> Function() action) {
    final lock = _locks.putIfAbsent(fileName, () => Lock());
    return lock.synchronized(action);
  }

  Set<String> _collectAttachmentPaths(Session session) {
    return session.rounds
        .expand((round) => round.userAttachments)
        .map((attachment) => attachment.relativePath)
        .toSet();
  }

  Future<Set<String>> _findRemovableAttachmentPaths({
    required String targetFileName,
    required Set<String> candidatePaths,
  }) async {
    if (candidatePaths.isEmpty) return <String>{};

    final allFileNames = await _fileService.getConversationFileList();
    final otherFileNames =
        allFileNames.where((name) => name != targetFileName).toList();

    final referencedByOthers = <String>{};

    for (final otherFileName in otherFileNames) {
      try {
        final otherSession = await _fileService.readSession(otherFileName);
        for (final round in otherSession.rounds) {
          for (final attachment in round.userAttachments) {
            if (candidatePaths.contains(attachment.relativePath)) {
              referencedByOthers.add(attachment.relativePath);
            }
          }
        }
      } catch (_) {
        // 忽略损坏/不可读会话
      }
    }

    return candidatePaths.difference(referencedByOthers);
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

  Future<void> saveSessionAndCleanupOrphanAttachments(
    String fileName,
    Session oldSession,
    Session newSession,
  ) async {
    return _runWithLock(fileName, () async {
      final oldPaths = _collectAttachmentPaths(oldSession);
      final newPaths = _collectAttachmentPaths(newSession);

      final removedPaths = oldPaths.difference(newPaths);
      final removablePaths = await _findRemovableAttachmentPaths(
        targetFileName: fileName,
        candidatePaths: removedPaths,
      );

      await _fileService.writeSession(fileName, newSession);

      for (final relativePath in removablePaths) {
        try {
          await _fileService.deleteAttachment(relativePath);
        } catch (_) {
          // 忽略单个附件删除失败，避免整个流程失败
        }
      }
    });
  }

  Future<void> deleteSession(String fileName) async {
    return _runWithLock(fileName, () async {
      Session? targetSession;
      try {
        targetSession = await _fileService.readSession(fileName);
      } catch (_) {
        targetSession = null;
      }

      if (targetSession != null) {
        final targetAttachmentPaths = _collectAttachmentPaths(targetSession);
        final removablePaths = await _findRemovableAttachmentPaths(
          targetFileName: fileName,
          candidatePaths: targetAttachmentPaths,
        );

        for (final relativePath in removablePaths) {
          try {
            await _fileService.deleteAttachment(relativePath);
          } catch (_) {
            // 忽略单个附件删除失败，避免整个会话删除失败
          }
        }
      }

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