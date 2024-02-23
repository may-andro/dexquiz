import 'package:core/core.dart';
import 'package:design_system/design_system.dart';

extension BuildConfigExtension on BuildConfig {
  String get imageHeader {
    switch (buildFlavor) {
      case BuildFlavor.kanto:
        return Assets.images.pokemonLogo.path;
      case BuildFlavor.johto:
        return Assets.images.pokemonMaster.path;
    }
  }

  String get imageLaunch {
    switch (buildFlavor) {
      case BuildFlavor.kanto:
        return Assets.lottieFiles.kanto;
      case BuildFlavor.johto:
        return Assets.lottieFiles.jhoto;
    }
  }

  String get imageFab {
    switch (buildFlavor) {
      case BuildFlavor.kanto:
        return Assets.images.badge.badgeRyhorn.path;
      case BuildFlavor.johto:
        return Assets.images.badge.badgeLugia.path;
    }
  }

  String get imagePokedex {
    switch (buildFlavor) {
      case BuildFlavor.kanto:
        return Assets.images.badge.badgeKantodex.path;
      case BuildFlavor.johto:
        return Assets.images.badge.badgeJohtodex.path;
    }
  }
}
