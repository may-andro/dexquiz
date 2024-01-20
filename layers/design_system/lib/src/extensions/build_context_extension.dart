import 'package:design_system/src/components/atoms/responsive_container/responsive_container.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/dimens/dimens.dart';
import 'package:design_system/src/foundations/typographies/typographies.dart';
import 'package:design_system/src/theme/ds_theme.dart';
import 'package:design_system/src/theme/ds_theme_widget.dart';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
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

  Size get size => MediaQuery.of(this).size;

  double get width => size.width;

  double get height => size.height;

  double get shortestSide => size.shortestSide;

  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  bool get isDarkMode => platformBrightness == Brightness.dark;

  double get textScaleFactor => MediaQuery.of(this).textScaler.scale(10) / 10;

  DeviceResolution get deviceResolution {
    switch (getWindowType(this)) {
      case AdaptiveWindowType.xsmall:
        return DeviceResolution.mobile;
      case AdaptiveWindowType.small:
        return DeviceResolution.tablet;
      case AdaptiveWindowType.medium:
        return DeviceResolution.desktop;
      case AdaptiveWindowType.large:
        return DeviceResolution.desktop;
      case AdaptiveWindowType.xlarge:
        return DeviceResolution.desktop;
      default:
        return DeviceResolution.mobile;
    }
  }
}
