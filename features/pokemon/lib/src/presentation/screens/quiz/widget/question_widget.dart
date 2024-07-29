import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:pokemon/assets/assets.gen.dart' as pokemon_assets;
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/capture_status.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';
import 'package:provider/provider.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    final isEscaped = viewModel.answerDTO?.status == CaptureStatus.escaped;
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: DSAssetImageWidget(
            pokemon_assets.Assets.images.quiz.bgQuiz.path,
            boxFit: BoxFit.contain,
            color: context.isDarkMode
                ? context.colorPalette.neutral.grey7
                : context.colorPalette.neutral.grey3,
            package: 'pokemon',
          ),
        ),
        Positioned.fill(
          child: AnimatedScale(
            scale: isEscaped ? 0 : 1,
            duration: Duration(milliseconds: 300),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: EdgeInsets.all(context.shortestSide * 0.2),
                child: ViewStateBuilderWidget(
                  viewState: viewModel.viewState,
                  loadingBuilder: _buildLoadingState,
                  errorBuilder: _buildErrorState,
                  builder: _buildPokemonImage,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: AnimatedOpacity(
            opacity: isEscaped ? 1 : 0,
            duration: Duration(milliseconds: 300),
            child: _buildErrorState(context),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return SizedBox.shrink();
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: DSErrorIconWidget(
        height: context.shortestSide * 0.2,
        width: context.shortestSide * 0.2,
      ),
    );
  }

  Widget _buildPokemonImage(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    final isVisible = viewModel.answerDTO?.status == CaptureStatus.caught;
    final color = isVisible
        ? Colors.transparent
        : context.colorPalette.neutral.black.color;
    final blendMode = isVisible ? BlendMode.saturation : BlendMode.modulate;
    final pokemonImage = viewModel.questionDTO?.pokemon.image ?? '';
    return Hero(
      tag: pokemonImage,
      child: Animate(
        effects: isVisible
            ? [
                ShimmerEffect(delay: 100.ms, duration: 500.ms),
                ShakeEffect(delay: 600.ms, duration: 500.ms),
              ]
            : [ScaleEffect()],
        child: DSColorFilteredImageWidget(
          imageUrl: pokemonImage,
          boxFit: BoxFit.contain,
          filterColor: color,
          blendMode: blendMode,
          sizeFactor: 0.6,
        ),
      ),
    );
  }
}
