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
import '../../domain/models/session_card_meta.dart';

class ConversationRepository {
  final AppDatabase _db;
  final IFileService _fileService;
  ConversationRepository(this._db, this._fileService);

  String _getId(String fileName) => fileName.replaceAll('.json', '');

  // ========== 响应式查询 ==========

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

  Stream<Session?> watchSession(String fileName) {
    final sessionId = _getId(fileName);
    final query = _db.select(_db.dbSessions).join([
      leftOuterJoin(
        _db.dbChatRounds,
        _db.dbChatRounds.sessionId.equalsExp(_db.dbSessions.id),
      ),
      leftOuterJoin(
        _db.dbAttachments,
        _db.dbAttachments.roundId.equalsExp(_db.dbChatRounds.id),
      ),
    ])
      ..where(_db.dbSessions.id.equals(sessionId))
      ..orderBy([OrderingTerm.asc(_db.dbChatRounds.createdAt)]);
    return query.watch().map(_mapSessionFromJoinedRows);
  }

  // ========== 私有辅助方法 ==========

  Session? _mapSessionFromJoinedRows(List<TypedResult> rows) {
    if (rows.isEmpty) return null;
    final sessionRow = rows.first.readTable(_db.dbSessions);
    final roundMap = <String, DbChatRound>{};
    final attachmentMap = <String, List<Attachment>>{};

    for (final row in rows) {
      final roundRow = row.readTableOrNull(_db.dbChatRounds);
      if (roundRow == null) continue;
      roundMap.putIfAbsent(roundRow.id, () => roundRow);
      final attachmentRow = row.readTableOrNull(_db.dbAttachments);
      if (attachmentRow != null) {
        attachmentMap.putIfAbsent(roundRow.id, () => []).add(
          Attachment(
            id: attachmentRow.id,
            name: attachmentRow.name,
            relativePath: attachmentRow.relativePath,
            isImage: attachmentRow.isImage,
            mimeType: attachmentRow.mimeType,
          ),
        );
      }
    }

    final sortedRoundRows = roundMap.values.toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

    final rounds = sortedRoundRows
        .map((roundRow) => _mapToChatRound(
              roundRow,
              attachmentMap[roundRow.id] ?? const <Attachment>[],
            ))
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

  // ========== 附件清理逻辑 (简化版) ==========

  /// 检查数据库中是否仍存在该附件的引用
  Future<bool> _hasAttachmentReference(String relativePath) async {
    final row = await (_db.select(_db.dbAttachments)
          ..where((t) => t.relativePath.equals(relativePath))
          ..limit(1))
        .getSingleOrNull();
    return row != null;
  }

  /// 统一清理孤儿附件：检查引用，无引用则删除物理文件
  Future<void> _cleanupOrphanAttachments(Iterable<String> relativePaths) async {
    for (final path in relativePaths.toSet()) {
      if (!await _hasAttachmentReference(path)) {
        try {
          await _fileService.deleteAttachment(path);
        } catch (_) {
          // 忽略删除失败，避免阻塞流程
        }
      }
    }
  }

  // ========== 写操作 ==========

  Future<void> deleteRoundsAndCleanupOrphanAttachments(
    String fileName,
    List<String> roundIds,
  ) async {
    if (roundIds.isEmpty) return;
    final sessionId = _getId(fileName);

    // 1. 收集候选附件路径
    final candidatePaths = (await (_db.select(_db.dbAttachments).join([
      innerJoin(
        _db.dbChatRounds,
        _db.dbChatRounds.id.equalsExp(_db.dbAttachments.roundId),
      ),
    ])
          ..where(_db.dbChatRounds.sessionId.equals(sessionId))
          ..where(_db.dbChatRounds.id.isIn(roundIds)))
        .get())
        .map((row) => row.readTable(_db.dbAttachments).relativePath)
        .toSet();

    // 2. 提交数据库变更 (级联删除会自动清理 dbAttachments)
    await _db.transaction(() async {
      await (_db.delete(_db.dbChatRounds)
            ..where((t) => t.sessionId.equals(sessionId) & t.id.isIn(roundIds)))
          .go();
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(
        DbSessionsCompanion(
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });

    // 3. 基于最终态清理物理文件
    await _cleanupOrphanAttachments(candidatePaths);
  }

  Future<void> deleteSession(String fileName) async {
    final sessionId = _getId(fileName);

    // 1. 收集候选附件路径
    final candidatePaths = (await (_db.select(_db.dbAttachments).join([
      innerJoin(
        _db.dbChatRounds,
        _db.dbChatRounds.id.equalsExp(_db.dbAttachments.roundId),
      ),
    ])
          ..where(_db.dbChatRounds.sessionId.equals(sessionId)))
        .get())
        .map((row) => row.readTable(_db.dbAttachments).relativePath)
        .toSet();

    // 2. 提交数据库变更
    await (_db.delete(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .go();

    // 3. 基于最终态清理物理文件
    await _cleanupOrphanAttachments(candidatePaths);
  }

  Future<Session> createSession({
    required String fileName,
    required String title,
  }) async {
    final sessionId = _getId(fileName);
    final now = DateTime.now().millisecondsSinceEpoch;
    final session = Session(
      id: sessionId,
      title: title,
      createdAt: now,
      updatedAt: now,
      rounds: [],
    );
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

  Future<void> updateSessionTitle(String fileName, String title) async {
    final sessionId = _getId(fileName);
    await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .write(
      DbSessionsCompanion(
        title: Value(title),
        updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
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
          .write(
        DbSessionsCompanion(
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });
  }

  Future<void> updateRound(
    String fileName,
    String roundId,
    ChatRound updatedRound,
  ) async {
    final sessionId = _getId(fileName);
    await _db.transaction(() async {
      await (_db.update(_db.dbChatRounds)..where((t) => t.id.equals(roundId)))
          .write(
        DbChatRoundsCompanion(
          assistantThinking: Value(updatedRound.assistantThinking),
          assistantContent: Value(updatedRound.assistantContent),
          isIncomplete: Value(updatedRound.isIncomplete),
          hasUnseenUpdate: Value(updatedRound.hasUnseenUpdate),
        ),
      );
      await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
          .write(
        DbSessionsCompanion(
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });
  }

  // ========== 附件读写接口保留 ==========
  Future<String> saveAttachment(Uint8List data, String fileName) async =>
      await _fileService.saveAttachment(data, fileName);

  Future<Uint8List> getAttachment(String relativePath) async =>
      await _fileService.readAttachment(relativePath);

  Future<void> deleteAttachment(String relativePath) async =>
      await _fileService.deleteAttachment(relativePath);
}