import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/utils/app_route_observer.dart';
import 'di/providers.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  await container.read(initProvider.notifier).initialize();
  final initState = container.read(initProvider);
  if (initState.status != InitStatus.success) {
    throw Exception('应用初始化失败：${initState.errorMessage}');
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Chat',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      navigatorObservers: [appRouteObserver],
      home: const HomePage(),
    );
  }
}