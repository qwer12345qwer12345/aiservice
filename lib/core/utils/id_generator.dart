import 'package:uuid/uuid.dart';

abstract class IdGenerator {
  static final _uuid = const Uuid();

  static String generate() {
    return _uuid.v4();
  }
}