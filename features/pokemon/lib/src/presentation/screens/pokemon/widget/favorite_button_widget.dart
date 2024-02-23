import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:provider/provider.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();
    final pokemon = viewModel.pokemon;
    return SafeArea(
      child: DSIconButtonWidget(
        Icons.favorite,
        iconColor: pokemon.isFavorite
            ? context.colorPalette.semantic.error
            : context.colorPalette.neutral.white,
        buttonColor: pokemon.types.first.getColor(context),
        onPressed: viewModel.updateFavouriteStatus,
        elevation: context.dimens.elevationLevel2,
        size: DSIconButtonSize.medium,
      ),
    );
  }
}
