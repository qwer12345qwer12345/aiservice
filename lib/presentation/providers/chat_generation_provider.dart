import 'package:aiservice/presentation/providers/character_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/generation_event.dart';
import '../../di/providers.dart';
import '../../domain/services/chat_generation_service.dart';

final chatGenerationProvider = StreamProvider.family<void, String>((ref, roundId) {
  final repository = ref.read(conversationRepositoryProvider);
  final configService = ref.read(configServiceProvider);
  final sourceRouter = ref.read(chatSourceRouterProvider);
  final character = ref.read(currentCharacterProvider);

  final eventStream = ChatGenerationService.generateStream(
    repository: repository,
    configService: configService,
    sourceRouter: sourceRouter,
    roundId: roundId,
    character: character,
  );

  void handleEvent(GenerationEvent event) {
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
      },
      failed: (error) {
        repository.updateRound(
          roundId: roundId,
          assistantContent: '[错误]\n$error',
          assistantThinking: '',
          isIncomplete: false,
          hasUnseenUpdate: true,
        );
      },
    );
  }

  return eventStream.asyncMap((event) {
    handleEvent(event);
  });
});