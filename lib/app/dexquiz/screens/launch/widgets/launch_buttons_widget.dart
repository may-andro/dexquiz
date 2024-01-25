import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';

class LaunchButtonsWidget extends StatelessWidget {
  const LaunchButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchBloc, LaunchState>(
      builder: (context, state) {
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
            state is Success
                ? DSFabWidget(
                    fabType: DSFabImage(state.imageFab),
                    fabSize: DSFabSize.large,
                    color: context.colorPalette.brand.primary,
                    onPressed: () {},
                    elevation: context.dimens.elevationLevel3,
                  )
                : const CircularProgressIndicator(),
            state is Success
                ? DSFabWidget(
                    fabType: DSFabImage(state.imagePokedex),
                    color: context.colorPalette.brand.primary,
                    onPressed: () {},
                    elevation: context.dimens.elevationLevel2,
                  )
                : const CircularProgressIndicator(),
          ],
        );
      },
    );
  }
}
