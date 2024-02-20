import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';
import 'package:provider/provider.dart';

class EscapedCardWidget extends StatelessWidget {
  const EscapedCardWidget({super.key});

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
        children: [
          Expanded(
            child: DSAssetImageWidget(
              Assets.gifs.error.path,
              boxFit: BoxFit.fill,
            ),
          ),
          SafeArea(
            bottom: true,
            left: false,
            right: false,
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DSTextWidget(
                    'The wild pokemon has been escaped',
                    color: context.colorPalette.neutral.grey7,
                    style: context.typography.bodyLarge,
                    fontFamily: FontFamily.pokemon,
                    textAlign: TextAlign.center,
                    textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                    ),
                  ),
                ),
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
          ),
        ],
      ),
    );
  }
}
