import 'dart:async';
import 'package:aiservice/data/data_sources/chat_source_router.dart';
import 'package:uuid/uuid.dart';
import '../../core/models/attachment.dart';
import '../../core/models/chat_round.dart';
import '../../data/repositories/conversation_repository.dart';
import '../../data/services/config_service.dart';
import '../../presentation/models/pending_attachment.dart';
import 'attachment_preparer.dart';
import 'character_card_parser.dart';
import 'chat_context_builder.dart';
import 'stream_processor.dart';

class ChatService {
  static final Map<String, StreamSubscription> _activeGenerations = {};

  static Future<String> sendMessage({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSourceRouter sourceRouter,
    required String sessionId,
    required String content,
    required String? parentRoundId,
    required List<PendingAttachment> pendingAttachments,
    CharacterData? character,
  }) async {
    final savedAttachments = await savePendingAttachments(repository, pendingAttachments);
    final newRoundId = await _createRound(
      repository: repository,
      sessionId: sessionId,
      content: content,
      parentRoundId: parentRoundId,
      attachments: savedAttachments,
    );
    
    _startGeneration(
      repository: repository,
      configService: configService,
      sourceRouter: sourceRouter,
      roundId: newRoundId,
      character: character,
    );
    
    return newRoundId;
  }

  static Future<String> retryFromRound({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSourceRouter sourceRouter,
    required String sessionId,
    required ChatRound sourceRound,
    CharacterData? character,
  }) async {
    final newRoundId = await _createRound(
      repository: repository,
      sessionId: sessionId,
      content: sourceRound.userContent,
      parentRoundId: sourceRound.parentId,
      attachments: sourceRound.userAttachments,
    );

    _startGeneration(
      repository: repository,
      configService: configService,
      sourceRouter: sourceRouter,
      roundId: newRoundId,
      character: character,
    );

    return newRoundId;
  }

  static void stopGeneration(String roundId, ConversationRepository repository) {
    final subscription = _activeGenerations.remove(roundId);
    if (subscription != null) {
      subscription.cancel();
      repository.updateRound(
        roundId: roundId,
        isIncomplete: false,
        hasUnseenUpdate: true,
      );
    }
  }

  static Future<void> _startGeneration({
    required ConversationRepository repository,
    required ConfigService configService,
    required ChatSourceRouter sourceRouter,
    required String roundId,
    CharacterData? character,
  }) async {
    final contextRounds = await repository.getContextRounds(roundId);
    final apiContext = await buildApiContextFromRounds(
      contextRounds,
      repository,
      character,
    );

    final config = await configService.loadConfig();
    final source = sourceRouter.getSourceFromConfig(config);
    
    final chatStream = source.chatStream(
      config: config,
      context: apiContext,
    );

    final processor = StreamProcessor();
    final eventStream = processor.process(chatStream);

    final subscription = eventStream.listen((event) {
      event.when(
        partial: (content, reasoning) {
          repository.updateRound(
            roundId: roundId,
            assistantContent: content,
            assistantThinking: reasoning,
            isIncomplete: true,
          );
        },
        completed: (content, reasoning) {
          repository.updateRound(
            roundId: roundId,
            assistantContent: content,
            assistantThinking: reasoning,
            isIncomplete: false,
            hasUnseenUpdate: true,
          );
          _activeGenerations.remove(roundId);
        },
        failed: (error) {
          repository.updateRound(
            roundId: roundId,
            assistantContent: '[错误]\n$error',
            assistantThinking: '',
            isIncomplete: false,
            hasUnseenUpdate: true,
          );
          _activeGenerations.remove(roundId);
        },
      );
    });

    _activeGenerations[roundId] = subscription;
  }

  static Future<String> _createRound({
    required ConversationRepository repository,
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
    await repository.appendRound(sessionId, newRound);
    return newRound.id;
  }
}