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
          onViewModelProvided: (viewModel) => viewModel.onInit(pokemon),
          builder: (context, viewModel, widget) {
            return DSResponsiveContainerWidget(
              mobileBuilder: (_) => MobileWidget(),
              tabletBuilder: (_) => TabletWidget(),
              desktopBuilder: (_) => TabletWidget(),
            );
          }),
    );
  }
}
