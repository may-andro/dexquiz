import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/pokedex/pokedex_view_model.dart';
import 'package:pokemon/src/presentation/screens/pokedex/widget/widget.dart';
import 'package:provider/provider.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PokeballWidget(
            sizeFactor: 0.4,
            rightFactor: -0.2,
            topFactor: -0.15,
          ),
          PokeballWidget(
            sizeFactor: 0.8,
            leftFactor: -0.3,
            bottomFactor: -0.35,
          ),
          ViewModelProviderWidget<PokedexViewModel>(
            onViewModelProvided: (viewModel) => viewModel.onInit(),
            builder: (context, viewModel, widget) {
              return _buildPokedex(context);
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: DSFabWidget(
        onPressed: () => Navigator.pop(context),
        fabType: DSFabIcon(Icons.close),
        color: context.colorPalette.brand.primary,
      ),
    );
  }

  Widget _buildPokedex(BuildContext context) {
    final viewModel = context.read<PokedexViewModel>();

    return Column(
      children: [
        const TitleWidget(),
        Expanded(
          child: ViewStateBuilderWidget(
            viewState: viewModel.viewState,
            loadingBuilder: _buildLoadingState,
            errorBuilder: _buildErrorState,
            builder: _buildSuccessState,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return DSLoadingWidget(
      height: context.shortestSide * 0.2,
      width: context.shortestSide * 0.2,
    );
  }

  Widget _buildErrorState(BuildContext context) {
    final viewModel = context.read<PokedexViewModel>();
    final errorMessage = viewModel.errorMessage;

    return FailureWidget(
      error: '${errorMessage.split(':')[0]}',
      cause: '${errorMessage.split(':')[1]}',
      onRetry: viewModel.fetchPokedex,
    );
  }

  Widget _buildSuccessState(BuildContext context) {
    return const PokedexWidget();
  }
}
