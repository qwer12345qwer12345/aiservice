import 'dart:async';
import 'dart:io';
import 'package:uuid/uuid.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../core/models/generation_event.dart';
import '../../core/models/pending_attachment.dart';
import '../../data/data_sources/chat_source.dart';
import '../../data/repositories/conversation_repository.dart';
import '../../data/services/config_service.dart';
import 'chat_context_builder.dart';
import 'stream_processor.dart';

class ChatService {
  final ConversationRepository _repository;
  final ConfigService _configService;
  final ChatSource _chatSource;
  final Map<String, StreamSubscription> _activeGenerations = {};

  ChatService({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSource chatSource,
  })  : _repository = repository,
        _configService = configService,
        _chatSource = chatSource;

  Future<String> sendMessage({
    required String sessionId,
    required String content,
    required String? parentRoundId,
    required List<PendingAttachment> pendingAttachments,
  }) async {
    final savedAttachments = await _savePendingAttachments(pendingAttachments);
    final newRoundId = await _createRound(
      sessionId: sessionId,
      content: content,
      parentRoundId: parentRoundId,
      attachments: savedAttachments,
    );

    _startGeneration(roundId: newRoundId);

    return newRoundId;
  }

  Future<String> retryFromRound({
    required String sessionId,
    required ChatRound sourceRound,
  }) async {
    final newAttachments = sourceRound.userAttachments.map((old) {
      return Attachment(
        id: const Uuid().v4(),
        name: old.name,
        relativePath: old.relativePath,
        isImage: old.isImage,
        mimeType: old.mimeType,
      );
    }).toList();

    final newRoundId = await _createRound(
      sessionId: sessionId,
      content: sourceRound.userContent,
      parentRoundId: sourceRound.parentId,
      attachments: newAttachments,
    );

    _startGeneration(roundId: newRoundId);

    return newRoundId;
  }

  void stopGeneration(String roundId) {
    final subscription = _activeGenerations.remove(roundId);
    if (subscription != null) {
      subscription.cancel();
      _repository.updateRound(
        roundId: roundId,
        isIncomplete: false,
        hasUnseenUpdate: true,
      );
    }
  }

  Future<List<Attachment>> _savePendingAttachments(List<PendingAttachment> pending) async {
    final result = <Attachment>[];
    for (final item in pending) {
      final bytes = await File(item.path).readAsBytes();
      final relativePath = await _repository.saveAttachment(bytes, item.name);
      result.add(
        Attachment(
          id: item.id,
          name: item.name,
          relativePath: relativePath,
          isImage: item.isImage,
          mimeType: item.mimeType,
        ),
      );
    }
    return result;
  }

  Future<void> _startGeneration({
    required String roundId,
  }) async {
    final contextRounds = await _repository.getContextRounds(roundId);
    final apiContext = await buildApiContextFromRounds(
      contextRounds,
      _repository,
    );

    final config = await _configService.loadActiveConfig();

    final chatStream = _chatSource.chatStream(
      config: config,
      context: apiContext,
    );

    final processor = StreamProcessor();
    final eventStream = processor.process(chatStream);

    final subscription = eventStream.listen((event) {
      switch (event) {
        case PartialGeneration(:final content, :final reasoning):
          _repository.updateRound(
            roundId: roundId,
            assistantContent: content,
            assistantThinking: reasoning,
            isIncomplete: true,
          );
        case CompletedGeneration(:final content, :final reasoning):
          _repository.updateRound(
            roundId: roundId,
            assistantContent: content,
            assistantThinking: reasoning,
            isIncomplete: false,
            hasUnseenUpdate: true,
          );
          _activeGenerations.remove(roundId);
        case FailedGeneration(:final content, :final reasoning):
          _repository.updateRound(
            roundId: roundId,
            assistantContent: content,
            assistantThinking: reasoning,
            isIncomplete: false,
            hasUnseenUpdate: true,
          );
          _activeGenerations.remove(roundId);
      }
    });

    _activeGenerations[roundId] = subscription;
  }

  Future<String> _createRound({
    required String sessionId,
    required String content,
    required String? parentRoundId,
    required List<Attachment> attachments,
  }) async {
    final newRound = ChatRound(
      id: const Uuid().v4(),
      parentId: parentRoundId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      userContent: content,
      userAttachments: attachments,
      isIncomplete: true,
      hasUnseenUpdate: false,
    );
    await _repository.appendRound(sessionId, newRound);
    return newRound.id;
  }
}