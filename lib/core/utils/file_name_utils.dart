abstract class FileNameUtils {
  // Windows/Android/iOS 通用非法字符
  static final _illegalChars = RegExp(r'[<>:"/\\|?*]');

  // 清理非法字符
  static String sanitize(String name) {
    return name.replaceAll(_illegalChars, '_').trim();
  }

  // 生成唯一文件名 (如果存在冲突，自动加数字)
  // 注意：这里只处理字符串逻辑，实际文件存在性检查应在 Service 层
  static String makeUnique(String baseName, List<String> existingNames) {
    final cleanName = sanitize(baseName);
    if (!existingNames.contains('$cleanName.json')) {
      return '$cleanName.json';
    }

    int counter = 1;
    while (existingNames.contains('$cleanName$counter.json')) {
      counter++;
    }
    return '$cleanName$counter.json';
  }

  // 从文件名提取标题 (去掉 .json)
  static String extractTitle(String fileName) {
    return fileName.endsWith('.json') 
        ? fileName.substring(0, fileName.length - 5) 
        : fileName;
  }
}