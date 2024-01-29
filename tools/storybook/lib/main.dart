import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const StorybookApp());
}

@widgetbook.App()
class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      appBuilder: (context, child) {
        return Scaffold(body: child);
      },
      addons: [
        DeviceFrameAddon(
          devices: [
            ...Devices.ios.all,
            ...Devices.android.all,
          ],
        ),
        TextScaleAddon(
          scales: [0.5, 0.75, 1.0, 1.5, 2.0],
          initialScale: 1,
        ),
        ThemeAddon<_CustomTheme>(
          themes: [
            WidgetbookTheme(
              name: 'Grass [Light]',
              data: _CustomTheme(Brightness.light, DesignSystem.grass),
            ),
            WidgetbookTheme(
              name: 'Grass [Dark]',
              data: _CustomTheme(Brightness.dark, DesignSystem.grass),
            ),
            WidgetbookTheme(
              name: 'Fire [Light]',
              data: _CustomTheme(Brightness.light, DesignSystem.fire),
            ),
            WidgetbookTheme(
              name: 'Fire [Dark]',
              data: _CustomTheme(Brightness.dark, DesignSystem.fire),
            ),
          ],
          themeBuilder: (context, theme, child) {
            return DSThemeBuilderWidget(
              designSystem: theme.designSystem,
              brightness: theme.brightness,
              child: child,
            );
          },
        ),
      ],
    );
  }
}

class _CustomTheme {
  _CustomTheme(this.brightness, this.designSystem);

  final Brightness brightness;
  final DesignSystem designSystem;
}
