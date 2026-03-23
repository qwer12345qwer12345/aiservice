import 'package:intl/intl.dart';

abstract class TimeFormatUtils {
  static final DateFormat _dateTimeFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  static String formatTimestamp(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return _dateTimeFormat.format(dateTime);
  }
}