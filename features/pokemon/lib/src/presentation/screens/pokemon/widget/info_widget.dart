import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:pokemon/src/presentation/screens/pokemon/widget/description_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(this.isMobile, {super.key});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PokemonViewModel>();
    final pokemon = viewModel.pokemon;
    final color = viewModel.pokemon.types.first.getColor(context);

    return Container(
      key: const Key('pokemon_info_card'),
      color: context.colorPalette.neutral.grey2.color.withOpacity(0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.space(factor: 5)),
          Row(
            children: [
              _NameWidget(pokemon.name.capitalize, color: color),
              Spacer(),
              _ElementalTypeWidget(pokemon.types),
              SizedBox(width: context.space(factor: 1)),
            ],
          ),
          SizedBox(height: context.space(factor: 2)),
          _DescriptionWidget(viewModel.description),
          SizedBox(height: context.space(factor: 2)),
          _BiometricWidget(pokemon.height, pokemon.weight),
          SizedBox(height: context.space(factor: 2)),
          if (isMobile) ...[Spacer()]
        ],
      ),
    );
  }
}

class _NameWidget extends StatelessWidget {
  const _NameWidget(this.name, {required this.color});

  final String name;
  final DSColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            context.dimens.radiusCircular.value,
          ),
          bottomRight: Radius.circular(
            context.dimens.radiusCircular.value,
          ),
        ),
        color: color.color,
      ),
      padding: EdgeInsets.only(
        right: context.space(factor: 5),
        left: context.space(factor: 2),
        top: context.space(factor: 1),
        bottom: context.space(factor: 1),
      ),
      child: DSTextWidget(
        name,
        color: context.colorPalette.neutral.white,
        style: context.typography.headlineMedium,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget(this.description);

  final String? description;

  @override
  Widget build(BuildContext context) {
    Widget child = Shimmer.fromColors(
      key: const Key('shimmer_widget'),
      baseColor: context.colorPalette.neutral.grey2.color.withOpacity(0.5),
      highlightColor: context.colorPalette.neutral.grey2.color.withOpacity(0.8),
      enabled: true,
      child: Container(
        width: double.infinity,
        height: context.space(factor: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            context.dimens.radiusLevel2.value,
          ),
          color: context.colorPalette.neutral.grey2.color,
        ),
      ),
    );

    if (description != null) {
      child = DescriptionWidget(description ?? '');
    }
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.space(factor: 2)),
        child: child,
      ),
    );
  }
}

class _BiometricWidget extends StatelessWidget {
  const _BiometricWidget(this.height, this.weight);

  final int height;
  final int weight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.space(factor: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BiometricItemWidget(
            label: 'Height',
            value: '${height / 10} m',
            icon: Icons.height,
          ),
          _BiometricItemWidget(
            label: 'Weight',
            value: '${weight / 10} kg',
            icon: Icons.scale,
          ),
        ],
      ),
    );
  }
}

class _BiometricItemWidget extends StatelessWidget {
  const _BiometricItemWidget({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DSTextWidget(
          label,
          color: context.colorPalette.neutral.grey9,
          style: context.typography.titleMedium,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: context.colorPalette.neutral.grey7.color,
              size: context.space(factor: 3),
            ),
            SizedBox(width: context.space(factor: 1)),
            DSTextWidget(
              value,
              color: context.colorPalette.neutral.grey8,
              style: context.typography.titleMedium,
            ),
          ],
        )
      ],
    );
  }
}

class _ElementalTypeWidget extends StatelessWidget {
  const _ElementalTypeWidget(this.types);

  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      ...types
          .map((type) =>
              _ElementalItemWidget(type.image, type.getColor(context).color))
          .toList(),
    ]);
  }
}

class _ElementalItemWidget extends StatelessWidget {
  const _ElementalItemWidget(this.image, this.color);

  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.space(factor: 1)),
      child: Container(
        width: context.space(factor: 5),
        height: context.space(factor: 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        padding: EdgeInsets.all(context.space(factor: 1)),
        child: DSAssetImageWidget(
          image,
          color: context.colorPalette.neutral.white,
          package: 'pokemon',
        ),
      ),
    );
  }
}
