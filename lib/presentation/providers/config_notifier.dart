import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/app_config.dart';
import '../../di/providers.dart';

final configProvider = StreamProvider<ConfigProfile>((ref) {
  return ref.read(configServiceProvider).watchActiveConfig();
});

final globalSettingsProvider = StreamProvider<GlobalSettings>((ref) {
  return ref.read(configServiceProvider).watchGlobalSettings();
});