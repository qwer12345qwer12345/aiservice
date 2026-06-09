import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../core/models/app_config.dart';
import '../../core/models/session.dart';

part 'database.g.dart'; // 运行 build_runner 生成

// ==========================================
// Type Converters
// ==========================================
class AppConfigConverter extends TypeConverter<AppConfig, String> {
  const AppConfigConverter();
  @override
  AppConfig fromSql(String fromDb) => 
    AppConfig.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  @override
  String toSql(AppConfig value) => jsonEncode(value.toJson());
}

class SessionConfigConverter extends TypeConverter<SessionConfig, String> {
  const SessionConfigConverter();
  @override
  SessionConfig fromSql(String fromDb) => 
    SessionConfig.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  @override
  String toSql(SessionConfig value) => jsonEncode(value.toJson());
}

// ==========================================
// Tables
// ==========================================
class DbConfigStore extends Table {
  IntColumn get id => integer().autoIncrement()(); // 永远只有一条记录 id=1
  TextColumn get activeProfileId => text()();
}

class DbConfigProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get config => text().map(const AppConfigConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

class DbSessions extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  TextColumn get config => text().map(const SessionConfigConverter()).nullable()();
  BoolColumn get hasUnseenUpdate => boolean().withDefault(const Constant(false))();

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