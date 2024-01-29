import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashApp extends StatelessWidget {
  const SplashApp({
    required this.buildConfig,
    required this.moduleConfigurators,
    required this.onInitializationSuccessful,
    super.key,
  });

  final BuildConfig buildConfig;
  final List<ModuleConfigurator> moduleConfigurators;
  final Function(DesignSystem) onInitializationSuccessful;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: const Color(0xFFFFFFFF),
          onBackground: const Color(0xFF121212),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: const Color(0xFF121212),
          onBackground: const Color(0xFFFFFFFF),
        ),
      ),
      home: SplashScreen(
        buildConfig: buildConfig,
        moduleConfigurators: moduleConfigurators,
        onInitializationSuccessful: onInitializationSuccessful,
      ),
    );
  }
}
