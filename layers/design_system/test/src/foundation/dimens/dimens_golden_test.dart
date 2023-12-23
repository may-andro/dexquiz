import 'package:flutter/material.dart';

import '../../../utils/alchemist_utils.dart';

void main() {
  groupGoldenForBrightnessAndDS(
    'Dimens',
    (dsTheme) => [
      TestCase(
        'Elevation None',
        Card(
          elevation: dsTheme.dimens.elevationNone.value,
          color: dsTheme.colorPalette.brand.primary.color,
          child: const SizedBox(height: 120, width: 120),
        ),
      ),
      TestCase(
        'Elevation Level1',
        Card(
          elevation: dsTheme.dimens.elevationLevel1.value,
          color: dsTheme.colorPalette.brand.primary.color,
          child: const SizedBox(height: 120, width: 120),
        ),
      ),
      TestCase(
        'Elevation Level2',
        Card(
          elevation: dsTheme.dimens.elevationLevel2.value,
          color: dsTheme.colorPalette.brand.primary.color,
          child: const SizedBox(height: 120, width: 120),
        ),
      ),
      TestCase(
        'Elevation Level3',
        Card(
          elevation: dsTheme.dimens.elevationLevel3.value,
          color: dsTheme.colorPalette.brand.primary.color,
          child: const SizedBox(height: 120, width: 120),
        ),
      ),
    ],
    label: 'elevation',
  );
}
