import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:meta/meta.dart';

@internal
class DarkColorPalette implements DSColorPalette {
  @override
  BrandColorScheme get brand {
    return const BrandColorScheme(
      primary: DSColor(0xFFFDBA4B),
      onPrimary: DSColor(0xFF442C00),
      primaryContainer: DSColor(0xFF614000),
      onPrimaryContainer: DSColor(0xFFFFDDB0),
      secondary: DSColor(0xFFDCC3A1),
      onSecondary: DSColor(0xFF3D2E16),
      secondaryContainer: DSColor(0xFF55442A),
      onSecondaryContainer: DSColor(0xFFF9DEBB),
      tertiary: DSColor(0xFFB6CEA3),
      onTertiary: DSColor(0xFF233517),
      tertiaryContainer: DSColor(0xFF394C2B),
      onTertiaryContainer: DSColor(0xFFD2EABD),
    );
  }

  @override
  NeutralColorScheme get neutral {
    return const NeutralColorScheme(
      black: DSColor(0xFF000000),
      white: DSColor(0xFFFFFFFF),
      grey1: DSColor(0xFF111112),
      grey2: DSColor(0xFF1A1A1A),
      grey3: DSColor(0xFF292929),
      grey4: DSColor(0xFF3A3A3A),
      grey5: DSColor(0xFF616161),
      grey6: DSColor(0xFF8C8C8C),
      grey7: DSColor(0xFFB3B3B3),
      grey8: DSColor(0xFFCCCCCC),
      grey9: DSColor(0xFFE3E3E3),
      grey10: DSColor(0xFFF7F7F7),
    );
  }

  @override
  SemanticColorScheme get semantic {
    return const SemanticColorScheme(
      info: DSColor(0xFF187AF2),
      onInfo: DSColor(0xFFFFFFFF),
      infoContainer: DSColor(0xFF031C3A),
      onInfoContainer: DSColor(0xFFFFFFFF),
      success: DSColor(0xFF00AD4B),
      onSuccess: DSColor(0xFFFFFFFF),
      successContainer: DSColor(0xFF00513A),
      onSuccessContainer: DSColor(0xFF002F15),
      warning: DSColor(0xFFFE7C0B),
      onWarning: DSColor(0xFFFFFFFF),
      warningContainer: DSColor(0xFF3E1E09),
      onWarningContainer: DSColor(0xFFFFFFFF),
      error: DSColor(0xFFFFB4AB),
      onError: DSColor(0xFF690005),
      errorContainer: DSColor(0xFF93000A),
      onErrorContainer: DSColor(0xFFFFDAD6),
    );
  }

  @override
  BackgroundColorScheme get background {
    return const BackgroundColorScheme(
      primary: DSColor(0xFF1F1B16),
      onPrimary: DSColor(0xFFEAE1D9),
      surface: DSColor(0xFF16130E),
      onSurface: DSColor(0xFFCEC5BD),
      disabled: DSColor(0xFF425B6E),
      onDisabled: DSColor(0xFF3A3A3A),
      surfaceVariant: DSColor(0xFF4F4539),
      onSurfaceVariant: DSColor(0xFFD2C4B4),
      inverseSurface: DSColor(0xFFEAE1D9),
      onInverseSurface: DSColor(0xFF1F1B16),
      shadow: DSColor(0xFF000000),
      scrim: DSColor(0xFF000000),
    );
  }
}
