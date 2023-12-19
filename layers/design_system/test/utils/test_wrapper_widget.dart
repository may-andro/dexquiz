import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/material.dart';

class TestWidgetWrapper extends StatelessWidget {
  const TestWidgetWrapper({
    super.key,
    required this.dsTheme,
    required this.child,
  });

  final DSTheme dsTheme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (_, child) {
        return DSThemeWidget(
          dsTheme: dsTheme,
          child: child!,
        );
      },
      home: Scaffold(body: child),
    );
  }
}
