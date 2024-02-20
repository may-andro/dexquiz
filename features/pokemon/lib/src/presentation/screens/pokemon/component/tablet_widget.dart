import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:pokemon/src/presentation/screens/pokemon/widget/widget.dart';
import 'package:provider/provider.dart';

class TabletWidget extends StatelessWidget {
  const TabletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();
    return Stack(
      children: [
        Positioned.fill(child: BackgroundImageWidget()),
        _buildCloseButton(context),
        _buildFavoriteButton(context),
        _buildInfo(context),
        _buildImage(context, viewModel.pokemon.image),
        _buildDexEntry(context),
      ],
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Positioned(
      top: context.space(factor: 2),
      left: context.space(factor: 2),
      child: CloseButtonWidget(),
    );
  }

  Widget _buildFavoriteButton(BuildContext context) {
    return Positioned(
      top: context.space(factor: 2),
      right: context.space(factor: 2),
      child: FavoriteButtonWidget(),
    );
  }

  Widget _buildImage(BuildContext context, String url) {
    return Positioned(
      left: 0,
      right: 0,
      top: context.space(factor: 8),
      height: context.screenHeight * 0.4,
      child: ImageWidget(),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Positioned(
      left: context.space(factor: 2),
      right: context.space(factor: 2),
      top: context.screenHeight * 0.4,
      child: Column(
        children: [
          InfoWidget(false),
          SizedBox(height: context.space(factor: 2)),
          StatsWidget(false),
        ],
      ),
    );
  }

  Widget _buildDexEntry(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: context.space(factor: 2),
      child: SafeArea(child: PokedexEntryWidget()),
    );
  }
}
