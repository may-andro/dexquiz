import 'package:design_system/src/components/atoms/buttons/buttons.dart';
import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../utils/alchemist_utils.dart';

void main() {
  groupGoldenForBrightnessAndDS(
    'Progress Button Widget',
    _getConfigs,
  );
}

List<TestCase> _getConfigs(DSTheme dsTheme) {
  final list = <TestCase>[];
  for (final variant in DSProgressButtonVariant.values) {
    for (final icon in [null, Icons.add]) {
      for (final iDisabled in [true, false]) {
        for (final border in DSProgressButtonBorder.values) {
          for (final iconDirection in DSProgressButtonIconDirection.values) {
            for (final loadingIndicator in [null, 0.5]) {
              list.add(
                TestCase(
                  'variant:${variant.name} icon:$icon iDisabled: $iDisabled iconDirection: $iconDirection border: $border loadingIndicator: $loadingIndicator',
                  DSProgressButtonWidget(
                    label: 'Button',
                    icon: icon,
                    iconDirection: iconDirection,
                    onPressed: () {},
                    variant: variant,
                    border: border,
                    isDisabled: iDisabled,
                  ),
                ),
              );
            }
          }
        }
      }
    }
  }
  return list;
}
