import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget(this.description, {super.key});

  final String description;

  final int _threshold = 160;

  @override
  Widget build(BuildContext context) {
    final children = <DSTextSpan>[];
    if (description.length > _threshold) {
      children.add(
        DSTextSpan(
          text: description.substring(0, _threshold),
          color: context.colorPalette.neutral.grey8,
          style: context.typography.titleMedium,
        ),
      );
      children.add(
        DSTextSpan(
          text: '... ',
          color: context.colorPalette.neutral.grey8,
          style: context.typography.titleMedium,
        ),
      );
      children.add(
        DSTextSpan(
          text: 'read more',
          color: context.colorPalette.neutral.grey9,
          style: context.typography.titleMedium,
          decoration: TextDecoration.underline,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              context.showBottomSheet(
                bottomSheet: DSClosableBottomSheet(
                  title: 'Description',
                  descriptions: [
                    DSTextSpan(
                      text: description,
                      color: context.colorPalette.neutral.grey8,
                      style: context.typography.titleMedium,
                    ),
                  ],
                ),
              );
            },
        ),
      );
    } else {
      children.add(
        DSTextSpan(
          text: description,
          color: context.colorPalette.neutral.grey8,
          style: context.typography.titleMedium,
        ),
      );
    }
    return DSRichTextWidget(
      key: const Key('description_widget'),
      children: children,
    );
  }
}
