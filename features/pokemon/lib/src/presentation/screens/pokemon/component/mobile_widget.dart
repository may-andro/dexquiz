import 'dart:async';
import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:pokemon/src/presentation/screens/pokemon/widget/trapezoid_down_widget.dart';
import 'package:pokemon/src/presentation/screens/pokemon/widget/trapezoid_up_widget.dart';
import 'package:pokemon/src/presentation/screens/pokemon/widget/widget.dart';
import 'package:provider/provider.dart';

class MobileWidget extends StatefulWidget {
  const MobileWidget({super.key});

  @override
  State<MobileWidget> createState() => _MobileWidgetState();
}

class _MobileWidgetState extends State<MobileWidget> {
  late PageController pageController;
  late StreamController<double> pageScrollController;

  @override
  void initState() {
    super.initState();
    pageScrollController = StreamController.broadcast();
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    )..addListener(() => pageScrollController.add(pageController.page ?? 0));
  }

  @override
  void dispose() {
    pageScrollController.close();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();
    return Stack(
      children: [
        Positioned.fill(child: BackgroundImageWidget()),
        _buildPageView(viewModel.pokemon.types.first.getColor(context)),
        _buildPokedexEntry(viewModel.pokemon.id.toString()),
        _buildImage(viewModel.pokemon.image),
        _buildCloseButton,
        _buildFavoriteButton,
      ],
    );
  }

  Widget _buildPageView(DSColor color) {
    return Positioned.fill(
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        physics: new NeverScrollableScrollPhysics(),
        children: [
          _AboutCardWidget(
            color: color,
            onNavigateToNext: () {
              pageController.animateToPage(
                1,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              );
            },
          ),
          _StatsCardWidget(
            color: color,
            onNavigateToNext: () {
              pageController.animateToPage(
                0,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPokedexEntry(String index) {
    return Positioned(
      bottom: 0.1 * context.height - context.space(factor: 4),
      left: context.width * 0.5 - context.space(factor: 4),
      child: StreamBuilder<double>(
        stream: pageScrollController.stream,
        builder: (context, snapshot) {
          final scroll = snapshot.data ?? 0;
          final yAxis =
              (-0.8 * context.height + context.space(factor: 0)) * scroll;

          return Transform(
            transform: Matrix4.translationValues(0, yAxis, 0.0),
            child: PokedexEntryWidget(),
          );
        },
      ),
    );
  }

  Widget _buildImage(String url) {
    return Positioned(
      left: 0,
      right: 0,
      top: context.space(factor: 8),
      height: context.screenHeight * 0.4,
      child: StreamBuilder<double>(
        stream: pageScrollController.stream,
        builder: (context, snapshot) {
          final scroll = snapshot.data ?? 0;
          final yAxis = scroll * context.height * 0.5;
          return Transform(
            transform: Matrix4.translationValues(0, yAxis, 0.0),
            child: ImageWidget(),
          );
        },
      ),
    );
  }

  Widget get _buildCloseButton {
    return Positioned(
      top: context.space(factor: Platform.isIOS ? 0 : 2),
      left: context.space(factor: 2),
      child: StreamBuilder<double>(
        stream: pageScrollController.stream,
        builder: (context, snapshot) {
          final scroll = snapshot.data ?? 0;
          final yAxis = scroll *
              (context.height * 0.9 -
                  context.space(factor: Platform.isIOS ? 6 : 2));
          return Transform(
            transform: Matrix4.translationValues(0, yAxis, 0.0),
            child: CloseButtonWidget(),
          );
        },
      ),
    );
  }

  Widget get _buildFavoriteButton {
    return Positioned(
      top: context.space(factor: Platform.isIOS ? 0 : 2),
      right: context.space(factor: 2),
      child: StreamBuilder<double>(
        stream: pageScrollController.stream,
        builder: (context, snapshot) {
          final scroll = snapshot.data ?? 0;
          final yAxis = scroll *
              (context.height * 0.9 -
                  context.space(factor: Platform.isIOS ? 6 : 2));

          return Transform(
            transform: Matrix4.translationValues(0, yAxis, 0.0),
            child: FavoriteButtonWidget(),
          );
        },
      ),
    );
  }
}

class _AboutCardWidget extends StatelessWidget {
  const _AboutCardWidget({required this.onNavigateToNext, required this.color});

  final VoidCallback onNavigateToNext;
  final DSColor color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: context.screenHeight * 0.3,
            left: context.space(factor: 2),
            right: context.space(factor: 2),
            bottom: context.space(factor: 0),
          ),
          child: TrapezoidDownWidget(child: InfoWidget(true)),
        ),
        Positioned(
          bottom: context.space(factor: 2.5),
          right: context.space(factor: 3),
          child: DSIconButtonWidget(
            Icons.arrow_downward_rounded,
            iconColor: context.colorPalette.neutral.white,
            buttonColor: color,
            onPressed: onNavigateToNext,
            size: DSIconButtonSize.medium,
          ),
        ),
      ],
    );
  }
}

class _StatsCardWidget extends StatelessWidget {
  const _StatsCardWidget({required this.onNavigateToNext, required this.color});

  final VoidCallback onNavigateToNext;
  final DSColor color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 0,
            left: context.space(factor: 2),
            right: context.space(factor: 2),
            bottom: context.screenHeight * 0.3,
          ),
          child: TrapezoidUpWidget(child: StatsWidget(true)),
        ),
        Positioned(
          top: context.space(factor: 2.5),
          left: context.space(factor: 3),
          child: DSIconButtonWidget(
            Icons.arrow_upward_rounded,
            iconColor: context.colorPalette.neutral.white,
            buttonColor: color,
            onPressed: onNavigateToNext,
            size: DSIconButtonSize.medium,
          ),
        ),
      ],
    );
  }
}
