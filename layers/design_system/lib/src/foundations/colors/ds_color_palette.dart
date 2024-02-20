import 'package:design_system/src/foundations/colors/ds_color_scheme.dart';

abstract interface class DSColorPalette {
  BrandColorScheme get brand;

  SemanticColorScheme get semantic;

  NeutralColorScheme get neutral;

  BackgroundColorScheme get background;

  ElementalColorScheme get elemental;
}
