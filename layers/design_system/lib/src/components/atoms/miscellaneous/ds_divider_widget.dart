import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DSDividerWidget extends StatelessWidget {
  const DSDividerWidget({
    this.variant = DSDividerVariant.level1,
    this.isVertical = false,
    super.key,
  });

  final DSDividerVariant variant;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final size = variant.getSize(context);
    final color = variant.getColor(context);
    if (isVertical) {
      return VerticalDivider(width: size, color: color);
    }
    return Divider(height: size, color: color);
  }
}

enum DSDividerVariant {
  level1,
  level2,
  level3;

  Color getColor(BuildContext context) {
    switch (this) {
      case level1:
        return context.colorPalette.neutral.grey9.color;
      case level2:
        return context.colorPalette.neutral.grey7.color;
      case level3:
        return context.colorPalette.neutral.grey5.color;
    }
  }

  double getSize(BuildContext context) {
    switch (this) {
      case level1:
        return 1;
      case level2:
        return 2;
      case level3:
        return 4;
    }
  }
}
