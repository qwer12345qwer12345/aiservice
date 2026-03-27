/// 页码工具类 - 统一处理索引转换逻辑
/// 
/// 遵循 Flutter 规范：
/// - 内部逻辑使用 0-based 索引
/// - UI 展示使用 1-based 页码
abstract class PageUtils {
  /// 将 0-based 索引转换为 UI 展示的 1-based 页码
  static int toDisplayPage(int zeroBasedIndex) => zeroBasedIndex + 1;

  /// 将 UI 页码转换为 0-based 索引
  static int toInternalIndex(int displayPage) => displayPage - 1;

  /// 格式化页码显示："X / Y"
  static String formatSimple(int currentPageIndex, int totalPages) {
    if (totalPages == 0) return '0 / 0';
    return '${toDisplayPage(currentPageIndex)} / $totalPages';
  }

  /// 格式化页码显示："第 X 页 / 共 Y 页"
  static String format(int currentPageIndex, int totalPages) {
    if (totalPages == 0) return '第 0 页 / 共 0 页';
    return '第 ${toDisplayPage(currentPageIndex)} 页 / 共 $totalPages 页';
  }

  /// 计算进度条进度 (0.0 - 1.0)
  static double calculateProgress(int currentPageIndex, int totalPages) {
    if (totalPages == 0) return 0.0;
    return toDisplayPage(currentPageIndex).clamp(1, totalPages) / totalPages;
  }

  /// 验证页索引是否有效
  static bool isValidIndex(int index, int totalPages) {
    return index >= 0 && index < totalPages;
  }

  /// 安全获取页索引（越界时返回边界值）
  static int clampIndex(int index, int totalPages) {
    if (totalPages == 0) return 0;
    return index.clamp(0, totalPages - 1);
  }
}