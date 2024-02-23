import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:provider/provider.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();
    return DSAssetImageWidget(
      viewModel.pokemon.types.first.background,
      boxFit: BoxFit.fitHeight,
      width: double.maxFinite,
      height: double.maxFinite,
      package: 'pokemon',
    );
  }
}
