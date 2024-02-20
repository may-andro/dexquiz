import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:provider/provider.dart';

class PokedexEntryWidget extends StatelessWidget {
  const PokedexEntryWidget();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();
    final color = viewModel.pokemon.types.first.getColor(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color.color, width: 2),
        color: color.color.withOpacity(0.2),
      ),
      height: context.space(factor: 8),
      width: context.space(factor: 8),
      child: Center(
        child: DSRichTextWidget(
          children: [
            DSTextSpan(
              text: '#',
              color: context.colorPalette.neutral.white,
              style: context.typography.titleMedium,
            ),
            DSTextSpan(
              text: '${viewModel.pokemon.id}',
              color: context.colorPalette.neutral.white,
              style: context.typography.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
