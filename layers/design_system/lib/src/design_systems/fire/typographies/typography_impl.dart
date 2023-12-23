import 'package:design_system/src/foundations/typographies/font_weight.dart';
import 'package:design_system/src/foundations/typographies/typographies.dart';
import 'package:meta/meta.dart';

@internal
class TypographyImpl implements DSTypography {
  const TypographyImpl();

  @override
  DSTextStyle get displayLarge {
    return const DSTextStyle(
      fontSize: 57,
      fontWeight: fontRegular,
      letterSpacing: -0.25,
      height: 64 / 57,
    );
  }

  @override
  DSTextStyle get displayMedium {
    return const DSTextStyle(
      fontSize: 45,
      fontWeight: fontRegular,
      letterSpacing: 0,
      height: 52 / 45,
    );
  }

  @override
  DSTextStyle get displaySmall {
    return const DSTextStyle(
      fontSize: 36,
      fontWeight: fontRegular,
      letterSpacing: 0,
      height: 44 / 36,
    );
  }

  @override
  DSTextStyle get headlineLarge {
    return const DSTextStyle(
      fontSize: 32,
      fontWeight: fontRegular,
      letterSpacing: 0,
      height: 40 / 32,
    );
  }

  @override
  DSTextStyle get headlineMedium {
    return const DSTextStyle(
      fontSize: 28,
      fontWeight: fontRegular,
      letterSpacing: 0,
      height: 36 / 28,
    );
  }

  @override
  DSTextStyle get headlineSmall {
    return const DSTextStyle(
      fontSize: 24,
      fontWeight: fontRegular,
      letterSpacing: 0,
      height: 32 / 24,
    );
  }

  @override
  DSTextStyle get titleLarge {
    return const DSTextStyle(
      fontSize: 22,
      fontWeight: fontRegular,
      letterSpacing: 0,
      height: 28 / 22,
    );
  }

  @override
  DSTextStyle get titleMedium {
    return const DSTextStyle(
      fontSize: 16,
      fontWeight: fontRegular,
      letterSpacing: 0.15,
      height: 24 / 16,
    );
  }

  @override
  DSTextStyle get titleSmall {
    return const DSTextStyle(
      fontSize: 14,
      fontWeight: fontMedium,
      letterSpacing: 0.1,
      height: 20 / 14,
    );
  }

  @override
  DSTextStyle get labelLarge {
    return const DSTextStyle(
      fontSize: 14,
      fontWeight: fontMedium,
      letterSpacing: 0.1,
      height: 20 / 14,
    );
  }

  @override
  DSTextStyle get labelMedium {
    return const DSTextStyle(
      fontSize: 12,
      fontWeight: fontRegular,
      letterSpacing: 0.5,
      height: 16 / 12,
    );
  }

  @override
  DSTextStyle get labelSmall {
    return const DSTextStyle(
      fontSize: 11,
      fontWeight: fontRegular,
      letterSpacing: 0.5,
      height: 16 / 11,
    );
  }

  @override
  DSTextStyle get bodyLarge {
    return const DSTextStyle(
      fontSize: 16,
      fontWeight: fontRegular,
      letterSpacing: 0.5,
      height: 24 / 16,
    );
  }

  @override
  DSTextStyle get bodyMedium {
    return const DSTextStyle(
      fontSize: 14,
      fontWeight: fontRegular,
      letterSpacing: 0.25,
      height: 20 / 14,
    );
  }

  @override
  DSTextStyle get bodySmall {
    return const DSTextStyle(
      fontSize: 12,
      fontWeight: fontRegular,
      letterSpacing: 0.4,
      height: 16 / 12,
    );
  }
}
