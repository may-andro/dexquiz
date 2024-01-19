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
                    Option(Assets.images.badgeBug.path, 'Badge Bug'),
                    Option(Assets.images.badgeDark.path, 'Badge Dark'),
                    Option(Assets.images.badgeDragon.path, 'Badge Dragon'),
                    Option(Assets.images.badgeElectric.path, 'Badge Electric'),
                    Option(Assets.images.badgeFairy.path, 'Badge Fairy'),
                    Option(Assets.images.badgeFight.path, 'Badge Fight'),
                    Option(Assets.images.badgeFire.path, 'Badge Fire'),
                    Option(Assets.images.badgeFlying.path, 'Badge Flying'),
                    Option(Assets.images.badgeGhost.path, 'Badge Ghost'),
                    Option(Assets.images.badgeGrass.path, 'Badge Grass'),
                    Option(Assets.images.badgeIce.path, 'Badge Ice'),
                    Option(Assets.images.badgeLugia.path, 'Badge Lugia'),
                    Option(Assets.images.badgeMagikarp.path, 'Badge Magikarp'),
                    Option(Assets.images.badgeNormal.path, 'Badge Normal'),
                    Option(Assets.images.badgePikachu.path, 'Badge Pikachu'),
                    Option(Assets.images.badgePoison.path, 'Badge Poison'),
                    Option(Assets.images.badgePokemon.path, 'Badge Pokemon'),
                    Option(Assets.images.badgePsychic.path, 'Badge Psychic'),
                    Option(Assets.images.badgeRock.path, 'Badge Rock'),
                    Option(Assets.images.badgeSteel.path, 'Badge Steel'),
                    Option(Assets.images.badgeWater.path, 'Badge Water'),
                    Option(Assets.images.pokeBadge.path, 'Poke Badge'),
                    Option(Assets.images.pokeball.path, 'Pokeball'),
                    Option(Assets.images.pokeballGreat.path, 'Pokeball Great'),
                    Option(Assets.images.pokeballPremier.path, 'Pokeball Premier'),
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
