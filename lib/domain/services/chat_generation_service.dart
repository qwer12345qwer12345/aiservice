import 'package:aiservice/domain/services/character_card_parser.dart';
import '../../core/models/generation_event.dart';
import '../../data/repositories/conversation_repository.dart';
import '../../data/services/config_service.dart';
import '../../data/data_sources/remote_api_source.dart';
import 'chat_context_builder.dart';
import 'stream_processor.dart';

/// 流式生成服务（纯 Dart，依赖通过参数传递）
class ChatGenerationService {
  static Stream<GenerationEvent> generateStream({
    required ConversationRepository repository,
    required ConfigService configService,
    required RemoteApiSource apiSource,
    required String roundId,
    CharacterData? character,
  }) async* {
    final contextRounds = await repository.getContextRounds(roundId);
    final apiContext = await buildApiContextFromRounds(
      contextRounds,
      repository,
      character,
    );

    final config = await configService.loadConfig();

    final chatStream = apiSource.chatStream(
      loadConfig: () async => config,
      context: apiContext,
    );

    final processor = StreamProcessor();
    yield* processor.process(chatStream);
  }
}