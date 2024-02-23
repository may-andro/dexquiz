import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SlidingPanelWidget extends StatelessWidget {
  const SlidingPanelWidget(this.height, {required this.child});

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      width: double.maxFinite,
      duration: Duration(seconds: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.dimens.radiusLevel3.value),
        ),
        color: context.colorPalette.background.primary.color,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 8.0,
            color: context.colorPalette.neutral.grey10.color,
          )
        ],
      ),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: child,
      ),
    );
  }
}
