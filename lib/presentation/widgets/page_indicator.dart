import 'package:flutter/material.dart';
import '../utils/page_utils.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;    // ✅ 0-based 索引
  final int totalPages;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // ✅ 使用统一工具类
            PageUtils.formatSimple(currentPage, totalPages),
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}