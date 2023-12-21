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
        ThemeAddon<DSTheme>(
          themes: [
            WidgetbookTheme(
              name: 'Grass [Light]',
              data: DSTheme(
                brightness: Brightness.light,
                designSystem: DesignSystem.grass,
                textScaleFactor: 1,
              ),
            ),
            WidgetbookTheme(
              name: 'Grass [Dark]',
              data: DSTheme(
                brightness: Brightness.dark,
                designSystem: DesignSystem.grass,
                textScaleFactor: 1,
              ),
            ),
            WidgetbookTheme(
              name: 'Fire [Light]',
              data: DSTheme(
                brightness: Brightness.light,
                designSystem: DesignSystem.fire,
                textScaleFactor: 1,
              ),
            ),
            WidgetbookTheme(
              name: 'Fire [Dark]',
              data: DSTheme(
                brightness: Brightness.dark,
                designSystem: DesignSystem.fire,
                textScaleFactor: 1,
              ),
            ),
          ],
          themeBuilder: (context, theme, child) {
            return DSThemeWidget(
              dsTheme: theme,
              child: child,
            );
          },
        ),
      ],
    );
  }
}
