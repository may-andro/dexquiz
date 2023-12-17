import 'package:design_system/src/extensions/design_system_extension.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/dimens/dimens.dart';
import 'package:design_system/src/foundations/typographies/typographies.dart';
import 'package:design_system/src/design_systems/design_systems.dart';
import 'package:design_system/src/extensions/brightness_extension.dart';
import 'package:flutter/material.dart';

final class DSTheme {
  DSTheme({
    required this.brightness,
    required this.designSystem,
    required this.textScaleFactor,
  })  : _lightColorPalette = brightness.getLightColorPalette(designSystem),
        _darkColorPalette = brightness.getDarkColorPalette(designSystem),
        _typography = designSystem.typography,
        _dimens = designSystem.getDimens(textScaleFactor);

  final Brightness brightness;

  final DesignSystem designSystem;

  final double textScaleFactor;

  final DSColorPalette _lightColorPalette;

  final DSColorPalette _darkColorPalette;

  final DSTypography _typography;

  final DSDimens _dimens;

  DSColorPalette get lightColorPalette => _lightColorPalette;

  DSColorPalette get darkColorPalette => _darkColorPalette;

  DSColorPalette get colorPalette {
    return brightness.brightnessMapper<DSColorPalette>(
      light: lightColorPalette,
      dark: darkColorPalette,
    );
  }

  DSTypography get typography => _typography;

  DSDimens get dimens => _dimens;
}
