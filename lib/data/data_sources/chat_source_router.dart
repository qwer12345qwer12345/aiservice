import 'package:aiservice/core/models/app_config.dart';

import 'chat_source.dart';
import 'remote_chat_source.dart';

class ChatSourceRouter {
  final RemoteChatSource remote;

  ChatSourceRouter(this.remote);

  ChatSource getSource(String apiMode) {
    return remote;
  }

  ChatSource getSourceFromConfig(ConfigProfile config) {
    return getSource(config.apiMode);
  }
}