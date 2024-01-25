import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    required this.label,
    this.subLabel,
    Key? key,
  }) : super(key: key);

  final String label;
  final String? subLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorPalette.neutral.grey2.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.space(factor: 1)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.space(factor: 2)),
            child: Row(
              children: [
                DSTextWidget(
                  label,
                  color: context.colorPalette.neutral.grey9,
                  style: context.typography.titleMedium,
                ),
                if (subLabel != null) ...[
                  Spacer(),
                  DSTextWidget(
                    subLabel!,
                    color: context.colorPalette.neutral.grey7,
                    style: context.typography.titleMedium,
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: context.space(factor: 1)),
        ],
      ),
    );
  }
}
