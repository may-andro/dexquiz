import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/launch_screen.dart';
import 'package:flutter/material.dart';

class DexQuizApp extends StatelessWidget {
  const DexQuizApp({
    required this.designSystem,
    required this.navigationObservers,
    required this.buildConfig,
    super.key,
  });

  final DesignSystem designSystem;
  final List<NavigatorObserver> navigationObservers;
  final BuildConfig buildConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DexQuiz',
      navigatorObservers: navigationObservers,
      builder: (context, child) {
        return DSThemeBuilderWidget(
          brightness: context.platformBrightness,
          designSystem: designSystem,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const LaunchScreen(),
    );
  }
}
