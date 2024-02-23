/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGifsGen {
  const $AssetsGifsGen();

  /// File path: assets/gifs/eeve.gif
  AssetGenImage get eeve => const AssetGenImage('assets/gifs/eeve.gif');

  /// File path: assets/gifs/error.gif
  AssetGenImage get error => const AssetGenImage('assets/gifs/error.gif');

  /// File path: assets/gifs/intro.gif
  AssetGenImage get intro => const AssetGenImage('assets/gifs/intro.gif');

  /// File path: assets/gifs/loading.gif
  AssetGenImage get loading => const AssetGenImage('assets/gifs/loading.gif');

  /// File path: assets/gifs/pokemon.gif
  AssetGenImage get pokemon => const AssetGenImage('assets/gifs/pokemon.gif');

  /// File path: assets/gifs/suicune.gif
  AssetGenImage get suicune => const AssetGenImage('assets/gifs/suicune.gif');

  /// List of all assets
  List<AssetGenImage> get values =>
      [eeve, error, intro, loading, pokemon, suicune];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesBadgeGen get badge => const $AssetsImagesBadgeGen();

  /// File path: assets/images/poke_badge.png
  AssetGenImage get pokeBadge =>
      const AssetGenImage('assets/images/poke_badge.png');

  /// File path: assets/images/pokeball.png
  AssetGenImage get pokeball =>
      const AssetGenImage('assets/images/pokeball.png');

  /// File path: assets/images/pokeball_great.png
  AssetGenImage get pokeballGreat =>
      const AssetGenImage('assets/images/pokeball_great.png');

  /// File path: assets/images/pokeball_premier.png
  AssetGenImage get pokeballPremier =>
      const AssetGenImage('assets/images/pokeball_premier.png');

  /// File path: assets/images/pokeball_ultra.png
  AssetGenImage get pokeballUltra =>
      const AssetGenImage('assets/images/pokeball_ultra.png');

  /// File path: assets/images/pokemon_jhoto.jpeg
  AssetGenImage get pokemonJhoto =>
      const AssetGenImage('assets/images/pokemon_jhoto.jpeg');

  /// File path: assets/images/pokemon_logo.png
  AssetGenImage get pokemonLogo =>
      const AssetGenImage('assets/images/pokemon_logo.png');

  /// File path: assets/images/pokemon_master.png
  AssetGenImage get pokemonMaster =>
      const AssetGenImage('assets/images/pokemon_master.png');

  /// File path: assets/images/warning.png
  AssetGenImage get warning => const AssetGenImage('assets/images/warning.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        pokeBadge,
        pokeball,
        pokeballGreat,
        pokeballPremier,
        pokeballUltra,
        pokemonJhoto,
        pokemonLogo,
        pokemonMaster,
        warning
      ];
}

class $AssetsLottieFilesGen {
  const $AssetsLottieFilesGen();

  /// File path: assets/lottieFiles/error.json
  String get error => 'assets/lottieFiles/error.json';

  /// File path: assets/lottieFiles/jhoto.json
  String get jhoto => 'assets/lottieFiles/jhoto.json';

  /// File path: assets/lottieFiles/kanto.json
  String get kanto => 'assets/lottieFiles/kanto.json';

  /// File path: assets/lottieFiles/pokeball.json
  String get pokeball => 'assets/lottieFiles/pokeball.json';

  /// List of all assets
  List<String> get values => [error, jhoto, kanto, pokeball];
}

class $AssetsImagesBadgeGen {
  const $AssetsImagesBadgeGen();

  /// File path: assets/images/badge/badge_johtodex.png
  AssetGenImage get badgeJohtodex =>
      const AssetGenImage('assets/images/badge/badge_johtodex.png');

  /// File path: assets/images/badge/badge_kantodex.png
  AssetGenImage get badgeKantodex =>
      const AssetGenImage('assets/images/badge/badge_kantodex.png');

  /// File path: assets/images/badge/badge_lugia.png
  AssetGenImage get badgeLugia =>
      const AssetGenImage('assets/images/badge/badge_lugia.png');

  /// File path: assets/images/badge/badge_magikarp.png
  AssetGenImage get badgeMagikarp =>
      const AssetGenImage('assets/images/badge/badge_magikarp.png');

  /// File path: assets/images/badge/badge_pikachu.png
  AssetGenImage get badgePikachu =>
      const AssetGenImage('assets/images/badge/badge_pikachu.png');

  /// File path: assets/images/badge/badge_pokemon.png
  AssetGenImage get badgePokemon =>
      const AssetGenImage('assets/images/badge/badge_pokemon.png');

  /// File path: assets/images/badge/badge_pokemons.png
  AssetGenImage get badgePokemons =>
      const AssetGenImage('assets/images/badge/badge_pokemons.png');

  /// File path: assets/images/badge/badge_ryhorn.png
  AssetGenImage get badgeRyhorn =>
      const AssetGenImage('assets/images/badge/badge_ryhorn.png');

  /// File path: assets/images/badge/badge_victory.png
  AssetGenImage get badgeVictory =>
      const AssetGenImage('assets/images/badge/badge_victory.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        badgeJohtodex,
        badgeKantodex,
        badgeLugia,
        badgeMagikarp,
        badgePikachu,
        badgePokemon,
        badgePokemons,
        badgeRyhorn,
        badgeVictory
      ];
}

class Assets {
  Assets._();

  static const $AssetsGifsGen gifs = $AssetsGifsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieFilesGen lottieFiles = $AssetsLottieFilesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
