import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/pokemon.dart';
import 'package:settings/settings.dart';

class LaunchButtonsWidget extends StatelessWidget {
  const LaunchButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchBloc, LaunchState>(
      builder: (context, state) {
        if (state is Success) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DSFabWidget(
                fabType: DSFabIcon(Icons.settings),
                color: context.colorPalette.brand.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingScreen()),
                  );
                },
                elevation: context.dimens.elevationLevel2,
              ),
              if (state.isQuizEnabled) ...[
                DSFabWidget(
                  //fabType: DSFabImage(state.imageFab),
                  fabType: DSFabIcon(Icons.catching_pokemon_rounded),
                  fabSize: DSFabSize.large,
                  color: context.colorPalette.brand.primary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuizScreen()),
                    );
                  },
                  elevation: context.dimens.elevationLevel3,
                ),
              ],
              if (state.isPokedexEnabled) ...[
                DSFabWidget(
                  fabType: DSFabImage(state.imagePokedex),
                  color: context.colorPalette.brand.primary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PokedexScreen()),
                    );
                  },
                  elevation: context.dimens.elevationLevel2,
                ),
              ],
            ],
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
