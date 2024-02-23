import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:meta/meta.dart';

@internal
final class LightColorPalette implements DSColorPalette {
  const LightColorPalette();

  @override
  BrandColorScheme get brand {
    return const BrandColorScheme(
      primary: DSColor(0xFF805600),
      onPrimary: DSColor(0xFFFFFFFF),
      primaryContainer: DSColor(0xFFFFDDB0),
      onPrimaryContainer: DSColor(0xFF281800),
      secondary: DSColor(0xFF6F5B40),
      onSecondary: DSColor(0xFFFFFFFF),
      secondaryContainer: DSColor(0xFFF9DEBB),
      onSecondaryContainer: DSColor(0xFF261904),
      tertiary: DSColor(0xFF506441),
      onTertiary: DSColor(0xFFFFFFFF),
      tertiaryContainer: DSColor(0xFFD2EABD),
      onTertiaryContainer: DSColor(0xFF0E2005),
    );
  }

  @override
  NeutralColorScheme get neutral {
    return const NeutralColorScheme(
      black: DSColor(0xFF000000),
      white: DSColor(0xFFFFFFFF),
      grey1: DSColor(0xFFF9F7F7),
      grey2: DSColor(0xFFE3E3E3),
      grey3: DSColor(0xFFCCCCCC),
      grey4: DSColor(0xFFB3B3B3),
      grey5: DSColor(0xFF8C8C8C),
      grey6: DSColor(0xFF616161),
      grey7: DSColor(0xFF3A3A3A),
      grey8: DSColor(0xFF292929),
      grey9: DSColor(0xFF1A1A1A),
      grey10: DSColor(0xFF111112),
    );
  }

  @override
  SemanticColorScheme get semantic {
    return const SemanticColorScheme(
      info: DSColor(0xFF001C7A),
      onInfo: DSColor(0xFFFFFFFF),
      infoContainer: DSColor(0xFFCCD3EB),
      onInfoContainer: DSColor(0xFFFFFFFF),
      success: DSColor(0xFF007A3E),
      onSuccess: DSColor(0xFFFFFFFF),
      successContainer: DSColor(0xFFD4F9ED),
      onSuccessContainer: DSColor(0xFFFFFFFF),
      warning: DSColor(0xFFAD5400),
      onWarning: DSColor(0xFFFFFFFF),
      warningContainer: DSColor(0xFFFCF2E8),
      onWarningContainer: DSColor(0xFF092017),
      error: DSColor(0xFFBA1A1A),
      onError: DSColor(0xFFFFFFFF),
      errorContainer: DSColor(0xFFFFDAD6),
      onErrorContainer: DSColor(0xFF410002),
    );
  }

  @override
  BackgroundColorScheme get background {
    return const BackgroundColorScheme(
      primary: DSColor(0xFFFFFBFF),
      onPrimary: DSColor(0xFF1F1B16),
      surface: DSColor(0xFFFFF8F3),
      onSurface: DSColor(0xFF1F1B16),
      disabled: DSColor(0xFFDFE3E6),
      onDisabled: DSColor(0xFFB3B3B3),
      surfaceVariant: DSColor(0xFFEFE0CF),
      onSurfaceVariant: DSColor(0xFF4F4539),
      inverseSurface: DSColor(0xFF34302A),
      onInverseSurface: DSColor(0xFFF9EFE7),
      shadow: DSColor(0xFF000000),
      scrim: DSColor(0xFF000000),
    );
  }

  @override
  ElementalColorScheme get elemental {
    return const ElementalColorScheme(
      bug: DSColor(0xFFA6B91A),
      dark: DSColor(0xFF705746),
      dragon: DSColor(0xFF6F35FC),
      electric: DSColor(0xFFF7D02C),
      fairy: DSColor(0xFFD685AD),
      fighting: DSColor(0xFFC22E28),
      fire: DSColor(0xFFEE8130),
      flying: DSColor(0xFFA98FF3),
      ghost: DSColor(0xFF735797),
      grass: DSColor(0xFF7AC74C),
      ground: DSColor(0xFFE2BF65),
      ice: DSColor(0xFF96D9D6),
      normal: DSColor(0xFFA8A77A),
      poison: DSColor(0xFFA33EA1),
      psychic: DSColor(0xFFF95587),
      rock: DSColor(0xFFB6A136),
      steel: DSColor(0xFFB7B7CE),
      water: DSColor(0xFF6390F0),
    );
  }
}
