import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

sealed class DSBottomSheet {
  Widget buildContent(BuildContext context);
}

class DSMessageBottomSheet extends DSBottomSheet {
  DSMessageBottomSheet({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSTextWidget(
          title,
          color: context.colorPalette.neutral.grey8,
          style: context.typography.titleLarge,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: context.space(factor: 0.5)),
        const DSDividerWidget(variant: DSDividerVariant.level3),
        SizedBox(height: context.space(factor: 0.5)),
        DSTextWidget(
          description,
          color: context.colorPalette.neutral.grey7,
          style: context.typography.titleMedium,
        ),
      ],
    );
  }
}

class DSClosableBottomSheet extends DSBottomSheet {
  DSClosableBottomSheet({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DSTextWidget(
              title,
              color: context.colorPalette.neutral.grey8,
              style: context.typography.titleLarge,
              textAlign: TextAlign.start,
            ),
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
                color: context.colorPalette.neutral.grey8.color,
              ),
            ),
          ],
        ),
        SizedBox(height: context.space(factor: 0.5)),
        const DSDividerWidget(variant: DSDividerVariant.level3),
        SizedBox(height: context.space(factor: 0.5)),
        DSTextWidget(
          description,
          color: context.colorPalette.neutral.grey7,
          style: context.typography.titleMedium,
        ),
      ],
    );
  }
}

class DSMessageActionBottomSheet extends DSBottomSheet {
  DSMessageActionBottomSheet({
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onPressed,
  });

  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DSTextWidget(
          title,
          color: context.colorPalette.neutral.grey8,
          style: context.typography.titleLarge,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: context.space(factor: 0.5)),
        const DSDividerWidget(variant: DSDividerVariant.level3),
        SizedBox(height: context.space(factor: 0.5)),
        DSTextWidget(
          description,
          color: context.colorPalette.neutral.grey7,
          style: context.typography.titleMedium,
        ),
        SizedBox(height: context.space(factor: 1)),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: context.width * 0.3,
            child: DSButtonWidget(
              label: buttonLabel,
              onPressed: onPressed,
              border: DSButtonBorder.rounded,
              size: DSButtonSize.small,
            ),
          ),
        )
      ],
    );
  }
}
