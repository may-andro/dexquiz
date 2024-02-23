import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/model/option.dart';
import 'package:storybook/src/widgets/base_scaffold_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Asset Image Widget',
  type: DSAssetImage,
)
DSAssetImage buttonWidget(BuildContext context) {
  return const DSAssetImage();
}

class DSAssetImage extends StatelessWidget {
  const DSAssetImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: 'DSAssetImageWidget',
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(context.space(factor: 2)),
          child: DSAssetImageWidget(
            context.knobs
                .list<Option<String>>(
                  label: 'Select Files',
                  options: [
                    Option(Assets.images.badge.badgeLugia.path, 'Badge Lugia'),
                    Option(Assets.images.badge.badgeMagikarp.path,
                        'Badge Magikarp'),
                    Option(
                        Assets.images.badge.badgePikachu.path, 'Badge Pikachu'),
                    Option(
                        Assets.images.badge.badgePokemon.path, 'Badge Pokemon'),
                    Option(Assets.images.pokeBadge.path, 'Poke Badge'),
                    Option(Assets.images.pokeball.path, 'Pokeball'),
                    Option(Assets.images.pokeballGreat.path, 'Pokeball Great'),
                    Option(
                        Assets.images.pokeballPremier.path, 'Pokeball Premier'),
                    Option(Assets.images.pokeballUltra.path, 'Pokeball Ultra'),
                    Option(Assets.images.pokemonJhoto.path, 'Pokemon Jhoto'),
                    Option(Assets.images.pokemonLogo.path, 'Pokemon Logo'),
                    Option(Assets.images.pokemonMaster.path, 'Pokemon Master'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            width: context.knobs.doubleOrNull
                .slider(
                  label: 'Width',
                  min: 0,
                  initialValue: null,
                  max: context.screenHeight,
                  divisions: 10,
                )
                ?.toDouble(),
            height: context.knobs.doubleOrNull
                .slider(
                  label: 'Height',
                  min: 0,
                  initialValue: null,
                  max: context.screenWidth,
                  divisions: 10,
                )
                ?.toDouble(),
          ),
        ),
      ),
    );
  }
}
