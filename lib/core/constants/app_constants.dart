abstract class AppConstants {
  // 文件夹名称
  static const String dirConversations = 'conversations';
  static const String dirAttachments = 'attachments';

  // 文件名
  static const String fileConfig = 'config.json';

  // 配置键
  static const String keyBaseUrl = 'baseUrl';
  static const String keyApiKey = 'apiKey';
  static const String keyTheme = 'theme';
  static const String keyModel = 'selectedModel';

  // 默认值
  static const String defaultBaseUrl = 'https://api.openai.com/v1';
  static const String defaultTheme = 'system';

  // 文件扩展名
  static const String extJson = '.json';

  // 分页
  static const int pageSizeMessages = 1; // 每页显示的消息对数 (逻辑上)
}