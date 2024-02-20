import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/presentation/screens/pokedex/pokedex_view_model.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_screen.dart';
import 'package:provider/provider.dart';

class PokedexWidget extends StatelessWidget {
  const PokedexWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DSResponsiveContainerWidget(
      mobileBuilder: (context) => _buildGridView(context, 3, 'mobile_view'),
      tabletBuilder: (context) => _buildGridView(context, 5, 'tablet_view'),
      desktopBuilder: (context) => _buildGridView(context, 7, 'desktop_view'),
    );
  }

  Widget _buildGridView(
    BuildContext context,
    int crossAxisCount,
    String key,
  ) {
    final viewModel = context.read<PokedexViewModel>();
    final pokemons = viewModel.pokemons;
    return GridView.builder(
      padding: EdgeInsets.only(
        bottom: context.space(factor: 10),
        left: context.space(factor: 2),
        right: context.space(factor: 2),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: context.space(factor: 2),
        mainAxisSpacing: context.space(factor: 2),
      ),
      itemCount: pokemons.length,
      itemBuilder: (_, index) => _PokemonItem(pokemon: pokemons[index]),
      cacheExtent: 9999,
    );
  }
}

class _PokemonItem extends StatelessWidget {
  const _PokemonItem({
    required this.pokemon,
    Key? key,
  }) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final color = pokemon.isCaptured
        ? Colors.transparent
        : context.colorPalette.neutral.black.color;
    final blendMode =
        pokemon.isCaptured ? BlendMode.saturation : BlendMode.modulate;

    return SizedBox(
      height: context.space(factor: 3),
      width: context.space(factor: 3),
      child: InkWell(
        onTap: pokemon.isCaptured
            ? () => _goToPokemonDetail(context, pokemon)
            : null,
        child: Stack(
          children: [
            Hero(
              tag: pokemon.image,
              child: DSColorFilteredImageWidget(
                filterColor: color,
                blendMode: blendMode,
                imageUrl: pokemon.image,
                sizeFactor: 0.1,
              ),
            ),
            if (pokemon.isFavorite) ...[
              Positioned(
                top: context.space(factor: 0.4),
                right: context.space(factor: 0.4),
                child: Icon(
                  Icons.favorite,
                  color: context.colorPalette.semantic.error.color,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  void _goToPokemonDetail(BuildContext context, Pokemon pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PokemonScreen(pokemon: pokemon),
      ),
    );
  }
}
