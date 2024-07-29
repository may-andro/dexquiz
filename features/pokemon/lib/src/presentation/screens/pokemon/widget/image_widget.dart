import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();
    final url = viewModel.pokemon.image;
    return Hero(
      tag: url,
      child: Animate(
        effects: [
          ShimmerEffect(duration: 800.ms),
          MoveEffect(delay: 800.ms, duration: 500.ms),
        ],
        child: DSColorFilteredImageWidget(
          key: const Key('pokemon_image_widget'),
          imageUrl: url,
          boxFit: BoxFit.contain,
        ),
      ),
    );
  }
}
