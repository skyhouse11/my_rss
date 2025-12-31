import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:my_rss/core/di/service_locator.dart';
import 'package:my_rss/material_mapping.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FThemes.zinc.dark;

    return MaterialApp.router(
      supportedLocales: FLocalizations.supportedLocales,
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      theme: theme.toCustomMaterialTheme(),
      builder: (_, child) => FAnimatedTheme(data: theme, child: child!),
    );
  }
}
