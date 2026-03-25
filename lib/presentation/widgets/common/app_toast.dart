import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class AppToast {
  static Future<void> show(
    String message, {
    ToastGravity gravity = ToastGravity.CENTER,
    Toast toastLength = Toast.LENGTH_SHORT,
    Color backgroundColor = const Color(0xE6111827),
    Color textColor = Colors.white,
    double fontSize = 14,
  }) async {
    await Fluttertoast.cancel();
    await Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}