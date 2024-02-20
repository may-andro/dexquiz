import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_screen.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';
import 'package:provider/provider.dart';

class CapturedCardWidget extends StatelessWidget {
  const CapturedCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    final pokemon = viewModel.questionDTO?.pokemon;

    if (pokemon == null) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.all(context.space(factor: 2)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DSTextWidget(
            'Pokemon has been captured & added to pokedex',
            color: context.colorPalette.neutral.grey7,
            style: context.typography.bodyLarge,
            fontFamily: FontFamily.pokemon,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.space(factor: 2)),
          Row(
            children: [
              Expanded(
                child: Text(
                  pokemon.name.capitalize,
                  style: context.typography.headlineLarge.textStyle.copyWith(
                    color: pokemon.types.first.getColor(context).color,
                    fontFamily: FontFamily.pokemon,
                    package: 'design_system',
                    letterSpacing: 6,
                  ),
                ),
              ),
              DSIconButtonWidget(
                Icons.info_outline_rounded,
                iconColor: context.colorPalette.neutral.white,
                buttonColor: pokemon.types.first.getColor(context),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PokemonScreen(pokemon: pokemon),
                    ),
                  );
                },
                size: DSIconButtonSize.medium,
                elevation: context.dimens.elevationLevel2,
              ),
              SizedBox(width: context.space(factor: 2)),
              DSIconButtonWidget(
                Icons.skip_next,
                iconColor: context.colorPalette.neutral.white,
                buttonColor: pokemon.types.first.getColor(context),
                onPressed: viewModel.loadPokemon,
                size: DSIconButtonSize.medium,
                elevation: context.dimens.elevationLevel2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
