import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/presentation/mapper/hex_to_int_color_mapper.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:provider/provider.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget(this.isMobile, {super.key});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorPalette.neutral.grey2.color.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.all(context.space(factor: 2)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isMobile) ...[Spacer()],
            DSTextWidget(
              'Stats',
              color: context.colorPalette.neutral.grey9,
              style: context.typography.headlineMedium,
            ),
            SizedBox(height: context.space(factor: 2)),
            _StatsWidget(),
            SizedBox(height: context.space(factor: 2)),
          ],
        ),
      ),
    );
  }
}

class _StatsWidget extends StatelessWidget {
  const _StatsWidget();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();
    final stats = viewModel.pokemon.stats;
    final typeColor = viewModel.pokemon.types.first.getColor(context);
    final pokemonColor = viewModel.pokemonColor;
    return ListView.separated(
        padding: EdgeInsets.zero,
        physics: new NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return SizedBox(height: context.space(factor: 2));
        },
        itemCount: stats.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _StatsItemWidget(
            stats[index],
            primary: pokemonColor?.primary.hexToIntColor ?? typeColor.color,
            secondary: pokemonColor?.secondary.hexToIntColor ??
                context.colorPalette.neutral.grey2.color,
          );
        });
  }
}

class _StatsItemWidget extends StatelessWidget {
  const _StatsItemWidget(
    this.stat, {
    required this.primary,
    required this.secondary,
  });

  final Stat stat;
  final Color primary;
  final Color secondary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: DSTextWidget(
            stat.name.capitalize,
            style: context.typography.bodyLarge,
            color: context.colorPalette.neutral.grey9,
          ),
        ),
        Expanded(
          flex: 3,
          child: _ProgressWidget(
            stat.baseStat / 100,
            primary: primary,
            secondary: secondary,
          ),
        ),
      ],
    );
  }
}

class _ProgressWidget extends StatelessWidget {
  const _ProgressWidget(
    this.progress, {
    required this.primary,
    required this.secondary,
  });

  final double progress;
  final Color primary;
  final Color secondary;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: context.space(factor: 2),
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: secondary,
      ),
      child: FractionallySizedBox(
        widthFactor: progress,
        child: Container(
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: primary,
          ),
        ),
      ),
    );
  }
}
