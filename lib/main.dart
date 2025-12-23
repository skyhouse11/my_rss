import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:my_rss/core/di/di.dart';
import 'package:my_rss/core/router/app_router.dart';
import 'package:my_rss/material_mapping.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FThemes.zinc.dark;

    final router = getIt<AppRouter>();

    return MaterialApp.router(
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      supportedLocales: FLocalizations.supportedLocales,
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      theme: theme.toCustomMaterialTheme(),
      builder: (_, child) => FAnimatedTheme(data: theme, child: child!),
    );
  }
}
