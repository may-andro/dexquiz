import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/dimens/dimens.dart';
import 'package:design_system/src/foundations/typographies/typographies.dart';
import 'package:design_system/src/theme/ds_theme.dart';
import 'package:design_system/src/theme/ds_theme_widget.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  DSTheme get theme => DSThemeWidget.of(this);

  DSColorPalette get colorPalette => theme.colorPalette;

  DSTypography get typography => theme.typography;

  DSDimens get dimens => theme.dimens;

  double space({double factor = 1}) {
    return factor * theme.dimens.grid.value * textScaleFactor;
  }

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this).textScaler.scale(10) / 10;
}
