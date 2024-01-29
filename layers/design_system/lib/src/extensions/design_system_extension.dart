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
        return const grass.DarkColorPalette();
      case DesignSystem.fire:
        return const fire.DarkColorPalette();
    }
  }

  DSColorPalette get lightColorPalette {
    switch (this) {
      case DesignSystem.grass:
        return const grass.LightColorPalette();
      case DesignSystem.fire:
        return const fire.LightColorPalette();
    }
  }

  DSDimens getDimens() {
    switch (this) {
      case DesignSystem.grass:
        return const grass.DimensImpl();
      case DesignSystem.fire:
        return const fire.DimensImpl();
    }
  }

  DSTypography get typography {
    switch (this) {
      case DesignSystem.grass:
        return const grass.TypographyImpl();
      case DesignSystem.fire:
        return const fire.TypographyImpl();
    }
  }
}
