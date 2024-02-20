import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PokeballWidget extends StatelessWidget {
  const PokeballWidget({
    required this.sizeFactor,
    this.leftFactor,
    this.rightFactor,
    this.bottomFactor,
    this.topFactor,
    super.key,
  });

  final double sizeFactor;

  final double? leftFactor;
  final double? rightFactor;
  final double? topFactor;
  final double? bottomFactor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: const Key('bottom_pokeball'),
      left: leftFactor != null ? context.height * leftFactor! : null,
      right: rightFactor != null ? context.height * rightFactor! : null,
      top: topFactor != null ? context.height * topFactor! : null,
      bottom: bottomFactor != null ? context.height * bottomFactor! : null,
      child: DSAssetImageWidget(
        Assets.images.badge.badgePokemon.path,
        height: context.height * sizeFactor,
        width: context.height * sizeFactor,
        color: context.colorPalette.neutral.grey2,
      ),
    );
  }
}
