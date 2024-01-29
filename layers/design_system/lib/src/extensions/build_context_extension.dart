import 'package:design_system/src/components/components.dart';
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

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DSTextWidget(
              'Oops...',
              style: typography.bodyLarge,
              color: colorPalette.neutral.grey1,
            ),
            SizedBox(height: space(factor: 0.5)),
            DSTextWidget(
              message,
              style: typography.bodyMedium,
              color: colorPalette.neutral.grey2,
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheet({
    required DSBottomSheet bottomSheet,
  }) {
    showModalBottomSheet(
      context: this,
      backgroundColor: colorPalette.background.primary.color,
      elevation: dimens.elevationLevel2.value,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(dimens.radiusLevel3.value),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.space(factor: 2)),
            child: bottomSheet.buildContent(context),
          ),
        );
      },
    );
  }
}
