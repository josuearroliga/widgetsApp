import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  static const name = 'main_screen';

  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    /*  final isDarkMode = ref.watch(isDarkModeEnabled);
    final selectedColor = ref.watch(colorSelectedProvider); */
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      //Here we will use riverpod to change the selected color and the darkmode state, we need to send the darkmode state here as a boolean.
      theme: appTheme.getTheme(),
    );
  }
}
