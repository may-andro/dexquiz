import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SectionTileWidget extends StatelessWidget {
  const SectionTileWidget({
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: context.colorPalette.neutral.grey1.color,
      onTap: onTap,
      leading: leadingIcon != null
          ? Icon(
              leadingIcon,
              color: context.colorPalette.neutral.grey6.color,
            )
          : SizedBox.shrink(),
      title: DSTextWidget(
        label,
        color: context.colorPalette.neutral.grey7,
        style: context.typography.labelLarge,
      ),
      trailing: trailingIcon != null
          ? Icon(
              trailingIcon,
              color: context.colorPalette.neutral.grey6.color,
            )
          : const SizedBox.shrink(),
    );
  }
}
