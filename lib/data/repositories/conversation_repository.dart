// data/repositories/conversation_repository.dart

import 'dart:async';
import 'dart:typed_data';
import 'package:drift/drift.dart';
import '../../core/interfaces/file_service.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../../domain/models/session_list_item.dart';
import '../database/database.dart';
import '../../core/utils/id_generator.dart';
import '../../domain/models/session_card_meta.dart';

class ConversationRepository {
  final AppDatabase _db;
  final IFileService _fileService;

  ConversationRepository(this._db, this._fileService);

  String _getId(String fileName) => fileName.replaceAll('.json', '');

  // 检查附件是否被其他 Round 引用
  Future<bool> _isAttachmentUsedElsewhere(
      String relativePath, List<String> excludeRoundIds) async {
    final query = _db.select(_db.dbAttachments).join([
      innerJoin(
        _db.dbChatRounds,
        _db.dbChatRounds.id.equalsExp(_db.dbAttachments.roundId),
      )
    ])
      ..where(_db.dbAttachments.relativePath.equals(relativePath))
      ..where(_db.dbChatRounds.id.isNotIn(excludeRoundIds));
    final result = await query.get();
    return result.isNotEmpty;
  }

  Stream<List<SessionListItem>> watchSessionListItems() {
    final query = (_db.select(_db.dbSessions)
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));

    return query.watch().map((sessions) {
      return sessions.map((session) {
        return SessionListItem(
          id: session.id,
          title: session.title,
          updatedAt: session.updatedAt,
        );
      }).toList();
    });
  }

  Stream<SessionCardMeta> watchSessionCardMeta(String sessionId) {
    final query = (_db.select(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]));

    return query.watch().map((rounds) {
      final previewRound = rounds.isEmpty ? null : rounds.last;
      final hasUnseen = rounds.any((r) => r.hasUnseenUpdate);

      final userPreview = previewRound == null
          ? '点击开始新的对话'
          : previewRound.userContent.trim().isEmpty
              ? '（空输入）'
              : previewRound.userContent.trim();

      final aiPreview = previewRound == null
          ? '（等待回复）'
          : (previewRound.assistantContent?.trim().isNotEmpty ?? false)
              ? previewRound.assistantContent!
              : (previewRound.isIncomplete ? '正在生成...' : '（等待回复）');

      return SessionCardMeta(
        roundCount: rounds.length,
        previewRoundId: previewRound?.id,
        userPreview: userPreview,
        aiPreview: aiPreview,
        hasUnseen: hasUnseen,
        isStreaming: previewRound?.isIncomplete == true,
      );
    });
  }

  /// 监听单个会话的完整数据（包含所有轮次和附件）
  Stream<Session?> watchSession(String fileName) {
    final sessionId = _getId(fileName);

    // 监听会话元数据变更
    final sessionQuery = _db.select(_db.dbSessions)
      ..where((t) => t.id.equals(sessionId));

    return sessionQuery.watchSingleOrNull().asyncMap((sessionRow) async {
      if (sessionRow == null) return null;
      return _buildSessionFromRow(sessionRow);
    });
  }

  /// 监听会话的轮次列表
  Stream<List<ChatRound>> watchRounds(String sessionId) {
    final roundsQuery = _db.select(_db.dbChatRounds)
      ..where((t) => t.sessionId.equals(sessionId))
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]);

    return roundsQuery.watch().asyncMap((roundRows) async {
      final rounds = <ChatRound>[];
      for (final round in roundRows) {
        final attachments = await _getAttachmentsForRound(round.id);
        rounds.add(_mapToChatRound(round, attachments));
      }
      return rounds;
    });
  }

  /// 监听单个轮次的数据
  Stream<ChatRound?> watchRound(String roundId) {
    final query = _db.select(_db.dbChatRounds)
      ..where((t) => t.id.equals(roundId));

    return query.watchSingleOrNull().asyncMap((roundRow) async {
      if (roundRow == null) return null;
      final attachments = await _getAttachmentsForRound(roundId);
      return _mapToChatRound(roundRow, attachments);
    });
  }

  // ========== 私有辅助方法 ==========

  Future<Session> _buildSessionFromRow(DbSession sessionRow) async {
    final sessionId = sessionRow.id;

    // 查询所有轮次
    final roundsQuery = _db.select(_db.dbChatRounds)
      ..where((t) => t.sessionId.equals(sessionId))
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]);
    final roundRows = await roundsQuery.get();

    if (roundRows.isEmpty) {
      return Session(
        id: sessionRow.id,
        title: sessionRow.title,
        createdAt: sessionRow.createdAt,
        updatedAt: sessionRow.updatedAt,
        config: sessionRow.config,
        hasUnseenUpdate: sessionRow.hasUnseenUpdate,
        rounds: const [],
      );
    }

    // 查询所有相关附件
    final roundIds = roundRows.map((r) => r.id).toList();
    final attachmentsQuery = _db.select(_db.dbAttachments)
      ..where((t) => t.roundId.isIn(roundIds));
    final attachmentRows = await attachmentsQuery.get();

    // 组装 Attachments Map
    final attachMap = <String, List<Attachment>>{};
    for (final a in attachmentRows) {
      attachMap.putIfAbsent(a.roundId, () => []).add(
            Attachment(
              id: a.id,
              name: a.name,
              relativePath: a.relativePath,
              isImage: a.isImage,
              mimeType: a.mimeType,
            ),
          );
    }

    // 组装 Rounds
    final rounds = roundRows
        .map((r) => _mapToChatRound(r, attachMap[r.id] ?? []))
        .toList();

    return Session(
      id: sessionRow.id,
      title: sessionRow.title,
      createdAt: sessionRow.createdAt,
      updatedAt: sessionRow.updatedAt,
      config: sessionRow.config,
      hasUnseenUpdate: sessionRow.hasUnseenUpdate,
      rounds: rounds,
    );
  }

  Future<List<Attachment>> _getAttachmentsForRound(String roundId) async {
    final query = _db.select(_db.dbAttachments)
      ..where((t) => t.roundId.equals(roundId));
    final rows = await query.get();
    return rows
        .map((a) => Attachment(
              id: a.id,
              name: a.name,
              relativePath: a.relativePath,
              isImage: a.isImage,
              mimeType: a.mimeType,
            ))
        .toList();
  }

  ChatRound _mapToChatRound(DbChatRound row, List<Attachment> attachments) {
    return ChatRound(
      id: row.id,
      parentId: row.parentId,
      createdAt: row.createdAt,
      userContent: row.userContent,
      userAttachments: attachments,
      assistantThinking: row.assistantThinking,
      assistantContent: row.assistantContent,
      isIncomplete: row.isIncomplete,
      hasUnseenUpdate: row.hasUnseenUpdate,
    );
  }

  // ========== 现有的同步方法保留，用于初始化和一次性读取 ==========

  Future<List<String>> getAllSessionFileNames() async {
    final sessions = await (_db.select(_db.dbSessions)
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .get();
    return sessions.map((s) => '${s.id}.json').toList();
  }

  Future<Session> getSession(String fileName) async {
    final sessionId = _getId(fileName);
    final sessionRow = await (_db.select(_db.dbSessions)
          ..where((t) => t.id.equals(sessionId)))
        .getSingle();
    return _buildSessionFromRow(sessionRow);
  }

  Future<void> deleteRounds(String sessionId, List<String> roundIds) async {
    if (roundIds.isEmpty) return;
    await (_db.delete(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId) & t.id.isIn(roundIds)))
        .go();
  }

  Future<void> saveSession(
      String fileName, Session newSession) async {
    final sessionId = _getId(fileName);

    await _db.transaction(() async {
      final allAttachments = <DbAttachmentsCompanion>[];

      for (final round in newSession.rounds) {
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

        allAttachments.addAll(round.userAttachments
            .map((a) => DbAttachmentsCompanion.insert(
                  id: a.id,
                  roundId: round.id,
                  name: a.name,
                  relativePath: a.relativePath,
                  isImage: Value(a.isImage),
                  mimeType: Value(a.mimeType),
                )));
      }

      for (final attach in allAttachments) {
        await _db.into(_db.dbAttachments).insertOnConflictUpdate(attach);
      }

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

  Future<void> saveSessionAndCleanupOrphanAttachments(
    String fileName, Session oldSession, Session newSession,
  ) async {
    final oldPaths = oldSession.rounds
        .expand((r) => r.userAttachments)
        .map((a) => a.relativePath)
        .toSet();
    final newPaths = newSession.rounds
        .expand((r) => r.userAttachments)
        .map((a) => a.relativePath)
        .toSet();
    final removedPaths = oldPaths.difference(newPaths);
    final deletedRoundIds = oldSession.rounds
        .where((oldR) => !newSession.rounds.any((newR) => newR.id == oldR.id))
        .map((r) => r.id)
        .toList();

    await saveSession(fileName, newSession);

    for (final path in removedPaths) {
      if (!await _isAttachmentUsedElsewhere(path, deletedRoundIds)) {
        try {
          await _fileService.deleteAttachment(path);
        } catch (_) {}
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
      final paths = targetSession.rounds
          .expand((r) => r.userAttachments)
          .map((a) => a.relativePath)
          .toSet();
      final allRoundIds = targetSession.rounds.map((r) => r.id).toList();
      for (final path in paths) {
        if (!await _isAttachmentUsedElsewhere(path, allRoundIds)) {
          try {
            await _fileService.deleteAttachment(path);
          } catch (_) {}
        }
      }
    }
    await (_db.delete(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .go();
  }

  Future<String> saveAttachment(Uint8List data, String fileName) async =>
      await _fileService.saveAttachment(data, fileName);
  Future<Uint8List> getAttachment(String relativePath) async =>
      await _fileService.readAttachment(relativePath);
  Future<void> deleteAttachment(String relativePath) async =>
      await _fileService.deleteAttachment(relativePath);

  Future<Session> createSession({required String fileName, required String title}) async {
    final sessionId = _getId(fileName);
    final now = DateTime.now().millisecondsSinceEpoch;
    final session = Session(
        id: sessionId,
        title: title,
        createdAt: now,
        updatedAt: now,
        rounds: []);

    await _db.into(_db.dbSessions).insert(
          DbSessionsCompanion.insert(
            id: session.id,
            title: session.title,
            createdAt: session.createdAt,
            updatedAt: session.updatedAt,
          ),
        );
    return session;
  }

  Future<Session> createSessionWithGeneratedId({required String title}) async {
    final sessionId = IdGenerator.generate();
    return createSession(fileName: '$sessionId.json', title: title);
  }

  Future<void> updateSessionTitle(String fileName, String title) async {
    final sessionId = _getId(fileName);
    await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .write(DbSessionsCompanion(
          title: Value(title),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ));
  }

  Future<List<Session>> getAllSessions() async {
    final ids = await getAllSessionFileNames();
    final sessions = <Session>[];
    for (final id in ids) {
      try {
        sessions.add(await getSession(id));
      } catch (_) {}
    }
    return sessions;
  }

  Future<void> appendRound(String fileName, ChatRound round) async {
    final sessionId = _getId(fileName);
    await _db.transaction(() async {
      await _db.into(_db.dbChatRounds).insert(
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
      for (final attach in round.userAttachments) {
        await _db.into(_db.dbAttachments).insert(
              DbAttachmentsCompanion.insert(
                id: attach.id,
                roundId: round.id,
                name: attach.name,
                relativePath: attach.relativePath,
                isImage: Value(attach.isImage),
                mimeType: Value(attach.mimeType),
              ),
            );
      }
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(DbSessionsCompanion(
              updatedAt: Value(DateTime.now().millisecondsSinceEpoch)));
    });
  }

  Future<void> updateRound(
      String fileName, String roundId, ChatRound updatedRound) async {
    final sessionId = _getId(fileName);
    await _db.transaction(() async {
      await (_db.update(_db.dbChatRounds)
            ..where((t) => t.id.equals(roundId)))
          .write(
            DbChatRoundsCompanion(
              assistantThinking: Value(updatedRound.assistantThinking),
              assistantContent: Value(updatedRound.assistantContent),
              isIncomplete: Value(updatedRound.isIncomplete),
              hasUnseenUpdate: Value(updatedRound.hasUnseenUpdate),
            ),
          );
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(DbSessionsCompanion(
              updatedAt: Value(DateTime.now().millisecondsSinceEpoch)));
    });
  }
}