import 'package:aiservice/presentation/providers/character_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/generation_event.dart';
import '../../di/providers.dart';
import '../../domain/services/chat_context_builder.dart';
import '../../domain/services/stream_processor.dart';

final chatGenerationProvider =
  StreamProvider.family<void, String>((ref, roundId) {
    Stream<GenerationEvent> runTask() async* {
      final repository = ref.read(conversationRepositoryProvider);     
      final configService = ref.read(configServiceProvider);
      final apiSource = ref.read(remoteApiSourceProvider);

      // 1. 构建上下文
      final contextRounds = await repository.getContextRounds(roundId);
      final character = ref.read(currentCharacterProvider);
      final apiContext = await buildApiContextFromRounds(
        contextRounds,
        repository,
        character,   // 传递角色信息
      );

      // 2. 加载配置
      final config = await configService.loadConfig();

      // 3. 发起请求
      final stream = apiSource.chatStream(
        loadConfig: () async => config,
        context: apiContext,
      );

      // 4. 处理流
      final processor = StreamProcessor();
      yield* processor.process(stream);
    }

    void handleEvent(GenerationEvent event) {
      final repository = ref.read(conversationRepositoryProvider);

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

    return runTask().asyncMap((event) {
      handleEvent(event);
    });
  }
);