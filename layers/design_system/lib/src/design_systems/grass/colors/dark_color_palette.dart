import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:meta/meta.dart';

@internal
final class DarkColorPalette implements DSColorPalette {
  const DarkColorPalette();

  @override
  BrandColorScheme get brand {
    return const BrandColorScheme(
      primary: DSColor(0xFF69DBAF),
      onPrimary: DSColor(0xFF003827),
      primaryContainer: DSColor(0xFF00513A),
      onPrimaryContainer: DSColor(0xFF86F8CA),
      secondary: DSColor(0xFFB3CCBE),
      onSecondary: DSColor(0xFF1F352B),
      secondaryContainer: DSColor(0xFF354B41),
      onSecondaryContainer: DSColor(0xFFCFE9DA),
      tertiary: DSColor(0xFFA6CCDF),
      onTertiary: DSColor(0xFF093544),
      tertiaryContainer: DSColor(0xFF254B5B),
      onTertiaryContainer: DSColor(0xFFC2E8FC),
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
      primary: DSColor(0xFF191C1A),
      onPrimary: DSColor(0xFFE1E3DF),
      surface: DSColor(0xFF111412),
      onSurface: DSColor(0xFFC5C7C4),
      disabled: DSColor(0xFF425B6E),
      onDisabled: DSColor(0xFF3A3A3A),
      surfaceVariant: DSColor(0xFF404944),
      onSurfaceVariant: DSColor(0xFFBFC9C2),
      inverseSurface: DSColor(0xFFE1E3DF),
      onInverseSurface: DSColor(0xFF191C1A),
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
