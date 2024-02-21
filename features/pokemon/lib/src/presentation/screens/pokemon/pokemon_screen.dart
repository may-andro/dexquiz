import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/pokemon/component/mobile_widget.dart';
import 'package:pokemon/src/presentation/screens/pokemon/component/tablet_widget.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({required this.pokemon, super.key});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelProviderWidget<PokemonViewModel>(
        onViewModelProvided: (viewModel) async {
          await viewModel.onInit(pokemon);
        },
        builder: (context, viewModel, widget) {
          if (viewModel.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => context.showSnackBar(viewModel.errorMessage ?? ''),
            );
          }

          return DSResponsiveContainerWidget(
            mobileBuilder: (_) => MobileWidget(key: Key('mobile_widget')),
            tabletBuilder: (_) => TabletWidget(key: Key('tablet_widget')),
            desktopBuilder: (_) => TabletWidget(key: Key('desktop_widget')),
          );
        },
      ),
    );
  }
}
