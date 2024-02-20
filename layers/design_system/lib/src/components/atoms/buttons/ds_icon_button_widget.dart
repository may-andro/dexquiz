import 'package:flutter/material.dart';
import 'package:design_system/src/extensions/build_context_extension.dart';
import 'package:design_system/src/foundations/foundations.dart';

class DSIconButtonWidget extends StatelessWidget {
  const DSIconButtonWidget(
    this.icon, {
    required this.iconColor,
    required this.buttonColor,
    required this.onPressed,
    this.size = DSIconButtonSize.small,
    this.elevation,
    super.key,
  });

  final IconData icon;
  final DSColor iconColor;
  final DSColor buttonColor;
  final VoidCallback onPressed;
  final DSIconButtonSize size;
  final DSElevation? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          context.space(factor: size.heightFactor),
          context.space(factor: size.heightFactor),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        shadowColor: context.colorPalette.background.shadow.color,
        backgroundColor: buttonColor.color,
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        elevation: elevation?.value ?? context.dimens.elevationNone.value,
      ),
      child: Icon(
        icon,
        size: context.space(factor: size.iconSizeFactor),
        color: iconColor.color,
      ),
    );
  }
}

enum DSIconButtonSize {
  small(4, 2.5),
  medium(5, 2.8),
  large(6, 3);

  final double heightFactor;
  final double iconSizeFactor;

  const DSIconButtonSize(this.heightFactor, this.iconSizeFactor);
}
