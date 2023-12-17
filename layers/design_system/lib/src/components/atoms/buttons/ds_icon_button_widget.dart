import 'package:flutter/material.dart';
import 'package:design_system/src/extensions/build_context_extension.dart';
import 'package:design_system/src/foundations/foundations.dart';

class DSIconButtonWidget extends StatelessWidget {
  const DSIconButtonWidget(
    this.icon, {
    required this.color,
    required this.onPressed,
    this.elevation,
    super.key,
  });

  final IconData icon;
  final DSColor color;
  final VoidCallback onPressed;
  final DSElevation? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(context.space(factor: 6), context.space(factor: 6)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        shadowColor: context.colorPalette.background.shadow.color,
        backgroundColor: context.colorPalette.background.primary.color,
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        elevation: elevation?.value ?? context.dimens.elevationNone.value,
      ),
      child: Icon(
        icon,
        size: context.space(factor: 3),
        color: color.color,
      ),
    );
  }
}
