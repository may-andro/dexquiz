import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ChoiceCardWidget extends StatelessWidget {
  const ChoiceCardWidget(
    this.choice, {
    required this.color,
    required this.isEnabled,
    super.key,
  });

  final String choice;
  final DSColor color;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isEnabled
        ? context.colorPalette.background.primary.color
        : context.colorPalette.background.disabled.color;

    final textColor = isEnabled ? color : context.colorPalette.neutral.grey3;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.dimens.radiusLevel1.value),
      ),
      color: backgroundColor,
      elevation: isEnabled ? context.dimens.elevationLevel2.value : 0,
      child: Padding(
        padding: EdgeInsets.all(context.space(factor: 0.5)),
        child: SizedBox(
          //height: context.space(factor: 8),
          //width: context.space(factor: 8),
          height: context.space(factor: 4),
          width: context.space(factor: 4),
          child: Center(
            child: DSTextWidget(
              choice,
              style: context.typography.titleLarge,
              color: textColor,
              fontFamily: FontFamily.pokemon,
            ),
          ),
        ),
      ),
    );
  }
}
