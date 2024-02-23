import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TestWidgetWrapper extends StatelessWidget {
  const TestWidgetWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (_, child) {
        return DSThemeBuilderWidget(
          brightness: Brightness.light,
          designSystem: DesignSystem.grass,
          child: child!,
        );
      },
      home: Scaffold(body: child),
    );
  }
}
