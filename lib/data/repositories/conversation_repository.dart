// data/repositories/conversation_repository.dart
import 'dart:async';
import 'package:drift/drift.dart';
import '../data_sources/local_file_source.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/session.dart';
import '../../domain/models/session_list_item.dart';
import '../database/database.dart';
import '../../domain/models/session_card_meta.dart';
import 'package:rxdart/rxdart.dart';

class ConversationRepository {
  final AppDatabase _db;
  final LocalFileSource _fileService;
  ConversationRepository(this._db, this._fileService);

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
    // 1. 仅查询最后一条 Round (倒序 + limit 1)
    final lastRoundStream = (_db.select(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(1))
        .watchSingleOrNull();

    // 2. 仅查询 Round 总数 (Count 聚合，不加载数据)
    final countStream = (
      _db.selectOnly(_db.dbChatRounds)
        ..addColumns([countAll()])
        ..where(_db.dbChatRounds.sessionId.equals(sessionId))
      )
      .watchSingle()
      .map((row) => row.read(countAll()) ?? 0);

    // 3. 检查是否存在未读更新 (limit 1 短路查询)
    final hasUnseenStream = (_db.select(_db.dbChatRounds)
          ..where((t) => t.sessionId.equals(sessionId))
          ..where((t) => t.hasUnseenUpdate.equals(true))
          ..limit(1))
        .watchSingleOrNull()
        .map((row) => row != null);

    // 4. 合并流
    return Rx.combineLatest3(lastRoundStream, countStream, hasUnseenStream,
        (lastRound, count, hasUnseen) {
      final previewRound = lastRound;
      
      // 预览文本逻辑保持不变，但基于单个对象计算
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
        roundCount: count,
        previewRoundId: previewRound?.id,
        userPreview: userPreview,
        aiPreview: aiPreview,
        hasUnseen: hasUnseen,
        isStreaming: previewRound?.isIncomplete == true,
      );
    });
  }
  // ========== 细粒度监听（新增） ==========

  /// 仅监听会话的拓扑结构（ID 与父子关系）
  /// 只有在增删消息时触发，AI 说话时不触发
  Stream<List<({String id, String? parentId})>> watchSessionTopology(String sessionId) {
    final query = _db.selectOnly(_db.dbChatRounds)
      ..addColumns([_db.dbChatRounds.id, _db.dbChatRounds.parentId])
      ..where(_db.dbChatRounds.sessionId.equals(sessionId))
      ..orderBy([OrderingTerm.asc(_db.dbChatRounds.createdAt)]);
      
    return query.watch().map((rows) => rows.map((r) => (
      id: r.read(_db.dbChatRounds.id)!,
      parentId: r.read(_db.dbChatRounds.parentId)
    )).toList());
  }

  /// 仅监听单条消息的完整详情（含附件）
  Stream<ChatRound?> watchSingleRound(String roundId) {
    final query = _db.select(_db.dbChatRounds).join([
      leftOuterJoin(
        _db.dbAttachments,
        _db.dbAttachments.roundId.equalsExp(_db.dbChatRounds.id),
      ),
    ])..where(_db.dbChatRounds.id.equals(roundId));

    return query.watch().map((rows) {
      if (rows.isEmpty) return null;
      final roundRow = rows.first.readTable(_db.dbChatRounds);
      final attachments = rows
          .where((row) => row.readTableOrNull(_db.dbAttachments) != null)
          .map((row) {
            final a = row.readTable(_db.dbAttachments);
            return Attachment(
              id: a.id,
              name: a.name,
              relativePath: a.relativePath,
              isImage: a.isImage,
              mimeType: a.mimeType,
            );
          }).toList();
      return _mapToChatRound(roundRow, attachments);
    });
  }

  Future<List<ChatRound>> getContextRounds(String roundId) async {
    // 1. 使用递归 CTE 直接查询从目标节点到根的路径（数据库层按时间正序返回）
    final roundsQuery = _db.customSelect(
      '''
      WITH RECURSIVE ctx_chain AS (
        -- 基础情况：目标节点
        SELECT id, session_id, parent_id, created_at, user_content,
              assistant_thinking, assistant_content, is_incomplete, has_unseen_update
        FROM db_chat_rounds WHERE id = :roundId
        UNION ALL
        -- 递归情况：向上查找父节点
        SELECT r.id, r.session_id, r.parent_id, r.created_at, r.user_content,
              r.assistant_thinking, r.assistant_content, r.is_incomplete, r.has_unseen_update
        FROM db_chat_rounds r
        INNER JOIN ctx_chain c ON r.id = c.parent_id
      )
      SELECT * FROM ctx_chain ORDER BY created_at ASC
      ''',
      readsFrom: {_db.dbChatRounds},
      variables: [Variable.withString(roundId)],
    );

    final dbRounds = await roundsQuery.map((row) {
      return DbChatRound(
        id: row.read<String>('id'),
        sessionId: row.read<String>('session_id'),
        parentId: row.read<String?>('parent_id'),
        createdAt: row.read<int>('created_at'),
        userContent: row.read<String>('user_content'),
        assistantThinking: row.read<String?>('assistant_thinking'),
        assistantContent: row.read<String?>('assistant_content'),
        isIncomplete: row.read<bool>('is_incomplete'),
        hasUnseenUpdate: row.read<bool>('has_unseen_update'),
      );
    }).get();

    if (dbRounds.isEmpty) return [];

    // 2. 批量查询链路上所有轮次的附件
    final roundIds = dbRounds.map((r) => r.id).toList();
    final dbAttachments = await (_db.select(_db.dbAttachments)
          ..where((t) => t.roundId.isIn(roundIds)))
        .get();

    // 3. 按 roundId 分组附件
    final attachmentMap = <String, List<Attachment>>{};
    for (final att in dbAttachments) {
      attachmentMap.putIfAbsent(att.roundId, () => []).add(
        Attachment(
          id: att.id,
          name: att.name,
          relativePath: att.relativePath,
          isImage: att.isImage,
          mimeType: att.mimeType,
        ),
      );
    }

    // 4. 组装返回（CTE 已按 created_at ASC 排序，无需 reversed）
    return dbRounds.map((round) => _mapToChatRound(round, attachmentMap[round.id] ?? [])).toList();
  }

  Stream<String?> watchSessionTitle(String sessionId) {
    return (_db.select(_db.dbSessions)
          ..where((t) => t.id.equals(sessionId)))
        .map((row) => row.title)
        .watchSingleOrNull();
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

  Future<void> _cleanupOrphanAttachments(Iterable<String> relativePaths) async {
    final uniquePaths = relativePaths.toSet();
    if (uniquePaths.isEmpty) return;

    final referencedPaths = await (_db.select(_db.dbAttachments)
          ..where((t) => t.relativePath.isIn(uniquePaths)))
        .map((t) => t.relativePath)
        .get();

    final orphanPaths = uniquePaths.difference(referencedPaths.toSet());

    for (final path in orphanPaths) {
      try {
        await _fileService.deleteAttachment(path);
      } catch (_) {
      }
    }
  }

  // ========== 写操作 ==========

  Future<void> deleteRoundsAndCleanupOrphanAttachments(
    String sessionId,
    List<String> roundIds,
  ) async {
    if (roundIds.isEmpty) return;

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

  Future<void> deleteSession(String sessionId) async {
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
    await (_db.delete(_db.dbSessions)..where((t) => t.id.equals(sessionId))).go();

    // 3. 基于最终态清理物理文件
    await _cleanupOrphanAttachments(candidatePaths);
  }

  Future<Session> createSession({
    required String sessionId,
    required String title,
  }) async {
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

  Future<void> updateSessionTitle(String sessionId, String title) async {
    await (_db.update(_db.dbSessions)..where((t) => t.id.equals(sessionId)))
        .write(
      DbSessionsCompanion(
        title: Value(title),
        updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  Future<void> appendRound(String sessionId, ChatRound round) async {
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
    String sessionId,
    String roundId,
    ChatRound updatedRound,
  ) async {
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