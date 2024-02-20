import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:provider/provider.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();
    return SafeArea(
      child: DSIconButtonWidget(
        Icons.close,
        iconColor: context.colorPalette.neutral.white,
        buttonColor: viewModel.pokemon.types.first.getColor(context),
        onPressed: () => Navigator.pop(context),
        elevation: context.dimens.elevationLevel2,
        size: DSIconButtonSize.medium,
      ),
    );
  }
}
