import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/dimens/dimens.dart';
import 'package:design_system/src/foundations/typographies/typographies.dart';
import 'package:design_system/src/design_systems/design_systems.dart';
import 'package:design_system/src/design_systems/grass/grass.dart' as grass;
import 'package:design_system/src/design_systems/fire/fire.dart' as fire;

extension DesignSystemExtension on DesignSystem {
  DSColorPalette get darkColorPalette {
    switch (this) {
      case DesignSystem.grass:
        return grass.DarkColorPalette();
      case DesignSystem.fire:
        return fire.DarkColorPalette();
    }
  }

  DSColorPalette get lightColorPalette {
    switch (this) {
      case DesignSystem.grass:
        return grass.LightColorPalette();
      case DesignSystem.fire:
        return fire.LightColorPalette();
    }
  }

  DSDimens getDimens(double textScaleFactor) {
    switch (this) {
      case DesignSystem.grass:
        return grass.DimensImpl(textScaleFactor);
      case DesignSystem.fire:
        return fire.DimensImpl(textScaleFactor);
    }
  }

  DSTypography get typography {
    switch (this) {
      case DesignSystem.grass:
        return grass.TypographyImpl();
      case DesignSystem.fire:
        return fire.TypographyImpl();
    }
  }
}
