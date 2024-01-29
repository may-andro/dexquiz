import 'package:flutter/material.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/design_systems/design_systems.dart';
import 'package:design_system/src/extensions/design_system_extension.dart';

extension BrightnessExtension on Brightness {
  T brightnessMapper<T>({
    required T light,
    required T dark,
  }) {
    if (isLightMode) {
      return light;
    }

    return dark;
  }

  DSColorPalette getLightColorPalette(DesignSystem designSystem) {
    return designSystem.lightColorPalette;
  }

  DSColorPalette getDarkColorPalette(DesignSystem designSystem) {
    return designSystem.darkColorPalette;
  }

  bool get isDarkMode => this == Brightness.dark;

  bool get isLightMode => this == Brightness.light;
}
