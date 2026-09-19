import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class DbConfigStore extends Table {
  IntColumn get id => integer().autoIncrement()(); // 永远只有一条记录 id=1
  TextColumn get activeProfileId => text()();
}

class DbConfigProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get baseUrl => text()();
  TextColumn get apiKey => text()();
  TextColumn get selectedModel => text().nullable()();
  TextColumn get modelsPath => text()();
  TextColumn get chatPath => text()();
  TextColumn get apiMode => text()();
  @override
  Set<Column> get primaryKey => {id};
}

class DbAvailableModels extends Table {
  TextColumn get profileId => text().references(DbConfigProfiles, #id, onDelete: KeyAction.cascade)();
  TextColumn get modelId => text()();
  BoolColumn get overrideSupportsReasoning => boolean().nullable()();
  BoolColumn get overrideSupportsVision => boolean().nullable()();
  @override
  Set<Column> get primaryKey => {profileId, modelId};
}


class DbSessions extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class DbChatRounds extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text().references(DbSessions, #id, onDelete: KeyAction.cascade)();
  TextColumn get parentId => text().nullable()();
  IntColumn get createdAt => integer()();
  TextColumn get userContent => text()();
  TextColumn get assistantThinking => text().nullable()();
  TextColumn get assistantContent => text().nullable()();
  BoolColumn get isIncomplete => boolean().withDefault(const Constant(false))();
  BoolColumn get hasUnseenUpdate => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class DbAttachments extends Table {
  TextColumn get id => text()();
  TextColumn get roundId => text().references(DbChatRounds, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get relativePath => text()();
  BoolColumn get isImage => boolean().withDefault(const Constant(false))();
  TextColumn get mimeType => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ==========================================
// Database
// ==========================================
@DriftDatabase(
  tables: [
    DbConfigStore,
    DbConfigProfiles,
    DbAvailableModels,
    DbSessions,
    DbChatRounds,
    DbAttachments,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          // 开启 SQLite 外键约束，实现级联删除
          await customStatement('PRAGMA foreign_keys = ON');
          // 开启 WAL 模式以大幅提高并发读写性能，避免流式写入阻塞查询
          await customStatement('PRAGMA journal_mode = WAL');
          // 创建核心索引，避免全表扫描
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_chat_rounds_session ON db_chat_rounds(session_id, created_at DESC)',
          );
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_chat_rounds_parent ON db_chat_rounds(parent_id)',
          );
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_attachments_round ON db_attachments(round_id)',
          );
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ai_chat_v1.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}