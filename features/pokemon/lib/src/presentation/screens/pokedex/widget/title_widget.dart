import 'package:design_system/design_system.dart';
import 'package:pokemon/assets/assets.gen.dart' as pokemon_assets;
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SafeArea(child: SizedBox.shrink(), bottom: false),
        SizedBox(height: context.space(factor: 2)),
        Center(
          child: DSAssetImageWidget(
            pokemon_assets.Assets.images.pokedex.title.path,
            width: context.shortestSide * 0.7,
            height: context.shortestSide * 0.1,
            package: 'pokemon',
          ),
        ),
        SizedBox(height: context.space(factor: 2)),
        DSDividerWidget(),
      ],
    );
  }
}
