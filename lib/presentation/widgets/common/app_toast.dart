// lib/presentation/widgets/common/app_toast.dart
import 'package:flutter/cupertino.dart';
import '../../../main.dart'; // 全局 navigatorKey

abstract class AppToast {
  static OverlayEntry? _entry;

  static void show(String message, {Duration duration = const Duration(seconds: 1)}) {
    _entry?.remove();
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    _entry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: IgnorePointer(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                color: const Color(0xE6111827),
                child: Text(
                  message,
                  style: const TextStyle(color: CupertinoColors.white, fontSize: 14),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_entry!);
    Future.delayed(duration, () {
      _entry?.remove();
      if (_entry != null) _entry = null;
    });
  }
}