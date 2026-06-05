import '../../core/models/app_config.dart';
import 'chat_source.dart';
import 'local_chat_source.dart';
import 'remote_chat_source.dart';

class ChatSourceRouter {
  final RemoteChatSource remote;
  final LocalChatSource local;

  ChatSourceRouter(this.remote, this.local);

  ChatSource getSource(String apiMode) {
    return apiMode == 'local' ? local : remote;
  }
  
  ChatSource getSourceFromConfig(AppConfig config) {
    return getSource(config.apiMode);
  }
}