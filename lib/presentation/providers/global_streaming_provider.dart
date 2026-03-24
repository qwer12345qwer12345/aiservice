import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalStreamingSessionsProvider =
    StateProvider<Set<String>>((ref) => <String>{});