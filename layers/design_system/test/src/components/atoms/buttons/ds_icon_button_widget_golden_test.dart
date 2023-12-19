import 'package:design_system/src/components/atoms/buttons/buttons.dart';
import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../utils/alchemist_utils.dart';

void main() {
  groupGoldenForBrightnessAndDS(
    'Icon Button Widget',
    _getConfigs,
  );
}

List<TestCase> _getConfigs(DSTheme dsTheme) {
  final list = <TestCase>[];
  for (final elevation in [
    dsTheme.dimens.elevationNone,
    dsTheme.dimens.elevationLevel1,
    dsTheme.dimens.elevationLevel2,
    dsTheme.dimens.elevationLevel3
  ]) {
    for (final color in [
      dsTheme.colorPalette.brand.primary,
      dsTheme.colorPalette.semantic.error
    ]) {
      list.add(
        TestCase(
          'elevation:$elevation color: $color',
          DSIconButtonWidget(
            Icons.person,
            elevation: elevation,
            color: color,
            onPressed: () {},
          ),
        ),
      );
    }
  }
  return list;
}
