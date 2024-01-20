import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DSFabWidget extends StatelessWidget {
  const DSFabWidget({
    required this.fabType,
    this.fabSize = DSFabSize.small,
    this.color,
    this.toolTipLabel,
    this.heroTag,
    this.onPressed,
    this.elevation,
    super.key,
  });

  final DSFabType fabType;
  final DSFabSize fabSize;
  final DSColor? color;
  final String? toolTipLabel;
  final String? heroTag;
  final VoidCallback? onPressed;
  final DSElevation? elevation;

  @override
  Widget build(BuildContext context) {
    final child = fabType.getContent(context, fabSize.sizeFactor);
    final splashColor = context.colorPalette.brand.secondary.color;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        context.dimens.radiusCircular.value,
      ),
    );
    if (fabSize == DSFabSize.large) {
      return FloatingActionButton.large(
        onPressed: onPressed,
        elevation: elevation?.value,
        heroTag: heroTag,
        tooltip: toolTipLabel,
        backgroundColor: color?.color,
        splashColor: splashColor,
        shape: shape,
        child: child,
      );
    }
    return FloatingActionButton(
      onPressed: onPressed,
      elevation: elevation?.value,
      heroTag: heroTag,
      tooltip: toolTipLabel,
      backgroundColor: color?.color,
      splashColor: splashColor,
      shape: shape,
      child: child,
    );
  }
}

sealed class DSFabType {}

final class DSFabImage extends DSFabType {
  DSFabImage(this.imagePath);

  final String imagePath;
}

final class DSFabIcon extends DSFabType {
  DSFabIcon(this.icon);

  final IconData icon;
}

enum DSFabSize { small, large }

extension _DSFabSizeExtension on DSFabSize {
  double get sizeFactor {
    switch (this) {
      case DSFabSize.small:
        return 3;
      case DSFabSize.large:
        return 6;
    }
  }
}

extension _DSFabTypeExtension on DSFabType {
  Widget getContent(BuildContext context, double sizeFactor) {
    switch (this) {
      case DSFabIcon():
        return Icon(
          (this as DSFabIcon).icon,
          size: context.space(factor: sizeFactor),
          color: context.colorPalette.neutral.white.color,
        );
      case DSFabImage():
        return Image.asset(
          (this as DSFabImage).imagePath,
          width: context.space(factor: sizeFactor),
          height: context.space(factor: sizeFactor),
          color: context.colorPalette.neutral.white.color,
          package: 'design_system',
        );
    }
  }
}
