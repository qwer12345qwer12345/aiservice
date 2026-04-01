import 'dart:typed_data';
import 'package:drift/drift.dart';
import '../../core/interfaces/file_service.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../../core/utils/id_generator.dart';
import '../database/database.dart';

class ConversationRepository {
  final AppDatabase _db;
  final IFileService _fileService;

  ConversationRepository(this._db, this._fileService);

  String _getId(String fileName) => fileName.replaceAll('.json', '');

  // 检查附件是否被其他 Round 引用
  // ✅ 替换原来的方法，入参从排除会话改成排除【本次要删除的轮次ID列表】
  Future<bool> _isAttachmentUsedElsewhere(String relativePath, List<String> excludeRoundIds) async {
    final query = _db.select(_db.dbAttachments).join([
      innerJoin(
        _db.dbChatRounds,
        _db.dbChatRounds.id.equalsExp(_db.dbAttachments.roundId),
      )
    ])
      // ✅ 只排除本次要删除的轮次，其他所有轮次（含同会话未被删除的）都算有效引用
      ..where(_db.dbAttachments.relativePath.equals(relativePath))
      ..where(_db.dbChatRounds.id.isNotIn(excludeRoundIds));
    final result = await query.get();
    return result.isNotEmpty;
  }

  Future<List<String>> getAllSessionFileNames() async {
    final sessions = await (_db.select(_db.dbSessions)
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .get();
    return sessions.map((s) => '${s.id}.json').toList();
  }

  Future<Session> getSession(String fileName) async {
    final sessionId = _getId(fileName);

    // 1. 获取 Session Metadata
    final sessionRow = await (_db.select(_db.dbSessions)
          ..where((t) => t.id.equals(sessionId)))
        .getSingle();

    // 2. 获取所有的 Rounds
    final roundsRow = await (_db.select(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();

    if (roundsRow.isEmpty) {
      return Session(
        id: sessionRow.id, title: sessionRow.title, createdAt: sessionRow.createdAt,
        updatedAt: sessionRow.updatedAt, config: sessionRow.config, 
        hasUnseenUpdate: sessionRow.hasUnseenUpdate, rounds: [],
      );
    }

    // 3. 获取这些 Rounds 的所有附件
    final roundIds = roundsRow.map((r) => r.id).toList();
    final attachmentsRow = await (_db.select(_db.dbAttachments)
          ..where((t) => t.roundId.isIn(roundIds)))
        .get();

    // 组装 Attachments Map
    final attachMap = <String, List<Attachment>>{};
    for (final a in attachmentsRow) {
      attachMap.putIfAbsent(a.roundId, () => []).add(
        Attachment(
          id: a.id, name: a.name, relativePath: a.relativePath,
          isImage: a.isImage, mimeType: a.mimeType,
        ),
      );
    }

    // 组装 Rounds
    final rounds = roundsRow.map((r) => ChatRound(
      id: r.id, parentId: r.parentId, createdAt: r.createdAt,
      userContent: r.userContent, assistantThinking: r.assistantThinking,
      assistantContent: r.assistantContent, isIncomplete: r.isIncomplete,
      hasUnseenUpdate: r.hasUnseenUpdate, userAttachments: attachMap[r.id] ?? [],
    )).toList();

    return Session(
      id: sessionRow.id, title: sessionRow.title, createdAt: sessionRow.createdAt,
      updatedAt: sessionRow.updatedAt, config: sessionRow.config,
      hasUnseenUpdate: sessionRow.hasUnseenUpdate, rounds: rounds,
    );
  }

  /// 业务极简版 SaveSession：自动处理增改，无需比对
  Future<void> saveSession(String fileName, Session newSession) async {
    final sessionId = _getId(fileName);
    
    // 开启事务
    await _db.transaction(() async {
      final allAttachments = <DbAttachmentsCompanion>[];

      // 1. 遍历所有 Round，逐条 Upsert
      for (final round in newSession.rounds) {
        // ✅ 直接使用表的 insertOnConflictUpdate 方法
        // Drift 内部会自动优化，性能依然很高
        await _db.into(_db.dbChatRounds).insertOnConflictUpdate(
              DbChatRoundsCompanion.insert(
                id: round.id,
                sessionId: sessionId,
                parentId: Value(round.parentId),
                createdAt: round.createdAt,
                userContent: round.userContent,
                assistantThinking: Value(round.assistantThinking),
                assistantContent: Value(round.assistantContent),
                isIncomplete: Value(round.isIncomplete),
                hasUnseenUpdate: Value(round.hasUnseenUpdate),
              ),
            );

        // 收集附件
        allAttachments.addAll(round.userAttachments.map((a) => DbAttachmentsCompanion.insert(
              id: a.id,
              roundId: round.id,
              name: a.name,
              relativePath: a.relativePath,
              isImage: Value(a.isImage),
              mimeType: Value(a.mimeType),
            )));
      }

      // 2. 批量 Upsert 附件
      // 因为附件通常较多，这里为了保持一致性也用循环，或者你可以用 batch.insert (如果确定无冲突)
      for (final attach in allAttachments) {
        await _db.into(_db.dbAttachments).insertOnConflictUpdate(attach);
      }

      // 3. 更新会话元信息
      await _db.into(_db.dbSessions).insertOnConflictUpdate(
            DbSessionsCompanion(
              id: Value(sessionId),
              title: Value(newSession.title),
              createdAt: Value(newSession.createdAt),
              updatedAt: Value(newSession.updatedAt),
              config: Value(newSession.config),
              hasUnseenUpdate: Value(newSession.hasUnseenUpdate),
            ),
          );
    });
  }

  Future<void> deleteRounds(String sessionId, List<String> roundIds) async {
    if (roundIds.isEmpty) return;
    await (_db.delete(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId) & t.id.isIn(roundIds)))
        .go();
  }

  Future<void> saveSessionAndCleanupOrphanAttachments(
    String fileName, Session oldSession, Session newSession,
  ) async {
    final oldPaths = oldSession.rounds.expand((r) => r.userAttachments).map((a) => a.relativePath).toSet();
    final newPaths = newSession.rounds.expand((r) => r.userAttachments).map((a) => a.relativePath).toSet();
    final removedPaths = oldPaths.difference(newPaths);
    // ✅ 计算出本次要删除的轮次ID：旧会话有、新会话没有的轮次
    final deletedRoundIds = oldSession.rounds.where((oldR) => !newSession.rounds.any((newR) => newR.id == oldR.id)).map((r) => r.id).toList();

    await saveSession(fileName, newSession);

    for (final path in removedPaths) {
      if (!await _isAttachmentUsedElsewhere(path, deletedRoundIds)) {
        try { await _fileService.deleteAttachment(path); } catch (_) {}
      }
    }
  }

  Future<void> deleteSession(String fileName) async {
    final sessionId = _getId(fileName);
    Session? targetSession;
    try {
      targetSession = await getSession(fileName);
    } catch (_) {}

    if (targetSession != null) {
      final paths = targetSession.rounds.expand((r) => r.userAttachments).map((a) => a.relativePath).toSet();
      final allRoundIds = targetSession.rounds.map((r) => r.id).toList();
      for (final path in paths) {
        if (!await _isAttachmentUsedElsewhere(path, allRoundIds)) {
          try { await _fileService.deleteAttachment(path); } catch (_) {}
        }
      }
    }
    // 外键级联删除：只需删 Session，对应的 Rounds 和 Attachments 会由 SQLite 自动清理
    await (_db.delete(_db.dbSessions)..where((t) => t.id.equals(sessionId))).go();
  }

  // 附件读写通过 FileService 物理落盘
  Future<String> saveAttachment(Uint8List data, String fileName) async => await _fileService.saveAttachment(data, fileName);
  Future<Uint8List> getAttachment(String relativePath) async => await _fileService.readAttachment(relativePath);
  Future<void> deleteAttachment(String relativePath) async => await _fileService.deleteAttachment(relativePath);

  Future<Session> createSession({required String fileName, required String title}) async {
    final sessionId = _getId(fileName);
    final now = DateTime.now().millisecondsSinceEpoch;
    final session = Session(id: sessionId, title: title, createdAt: now, updatedAt: now, rounds: []);
    
    await _db.into(_db.dbSessions).insert(
      DbSessionsCompanion.insert(
        id: session.id, title: session.title, createdAt: session.createdAt, updatedAt: session.updatedAt,
      ),
    );
    return session;
  }

  Future<Session> createSessionWithGeneratedId({required String title}) async {
    final sessionId = IdGenerator.generate();
    return await createSession(fileName: '$sessionId.json', title: title);
  }

  Future<void> updateSessionTitle(String fileName, String title) async {
    final sessionId = _getId(fileName);
    await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .write(DbSessionsCompanion(
          title: Value(title), updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ));
  }

  Future<List<Session>> getAllSessions() async {
    final ids = await getAllSessionFileNames();
    final sessions = <Session>[];
    for (final id in ids) {
      try {
        sessions.add(await getSession(id));
      } catch (_) {} // 忽略损坏记录
    }
    return sessions;
  }

  // 增量插入，无需重写整个 JSON
  Future<void> appendRound(String fileName, ChatRound round) async {
    final sessionId = _getId(fileName);
    await _db.transaction(() async {
      await _db.into(_db.dbChatRounds).insert(
        DbChatRoundsCompanion.insert(
          id: round.id, sessionId: sessionId, parentId: Value(round.parentId),
          createdAt: round.createdAt, userContent: round.userContent,
          assistantThinking: Value(round.assistantThinking),
          assistantContent: Value(round.assistantContent),
          isIncomplete: Value(round.isIncomplete), hasUnseenUpdate: Value(round.hasUnseenUpdate),
        ),
      );
      for (final attach in round.userAttachments) {
        await _db.into(_db.dbAttachments).insert(
          DbAttachmentsCompanion.insert(
            id: attach.id, roundId: round.id, name: attach.name,
            relativePath: attach.relativePath, isImage: Value(attach.isImage), mimeType: Value(attach.mimeType),
          ),
        );
      }
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(DbSessionsCompanion(updatedAt: Value(DateTime.now().millisecondsSinceEpoch)));
    });
  }

  // 增量更新单轮
  Future<void> updateRound(String fileName, String roundId, ChatRound updatedRound) async {
    final sessionId = _getId(fileName);
    await _db.transaction(() async {
      await (_db.update(_db.dbChatRounds)..where((t) => t.id.equals(roundId))).write(
        DbChatRoundsCompanion(
          assistantThinking: Value(updatedRound.assistantThinking),
          assistantContent: Value(updatedRound.assistantContent),
          isIncomplete: Value(updatedRound.isIncomplete),
          hasUnseenUpdate: Value(updatedRound.hasUnseenUpdate),
        ),
      );
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(DbSessionsCompanion(updatedAt: Value(DateTime.now().millisecondsSinceEpoch)));
    });
  }
}