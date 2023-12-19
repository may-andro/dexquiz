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

  groupGoldenForBrightnessAndDS(
    'Dimens',
    (dsTheme) => [
      TestCase(
        'Radius Level1',
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(dsTheme.dimens.radiusLevel1.value),
            ),
          ),
          color: dsTheme.colorPalette.brand.primary.color,
          child: const SizedBox(height: 120, width: 120),
        ),
      ),
      TestCase(
        'Radius Level2',
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(dsTheme.dimens.radiusLevel2.value),
            ),
          ),
          color: dsTheme.colorPalette.brand.primary.color,
          child: const SizedBox(height: 120, width: 120),
        ),
      ),
      TestCase(
        'Radius Level3',
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(dsTheme.dimens.radiusLevel3.value),
            ),
          ),
          color: dsTheme.colorPalette.brand.primary.color,
          child: const SizedBox(height: 120, width: 120),
        ),
      ),
      TestCase(
        'Radius Circular',
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(dsTheme.dimens.radiusCircular.value),
            ),
          ),
          color: dsTheme.colorPalette.brand.primary.color,
          child: const SizedBox(height: 120, width: 120),
        ),
      ),
    ],
    label: 'radius',
  );

  groupGoldenForBrightnessAndDS(
    'Dimens',
    (dsTheme) => [
      TestCase(
        'Factor 1',
        Card(
          color: dsTheme.colorPalette.brand.primary.color,
          child: SizedBox(
            height: 10 * dsTheme.dimens.grid.value,
            width: 10 * dsTheme.dimens.grid.value,
          ),
        ),
      ),
      TestCase(
        'Factor 2',
        Card(
          color: dsTheme.colorPalette.brand.primary.color,
          child: SizedBox(
            height: 20 * dsTheme.dimens.grid.value,
            width: 20 * dsTheme.dimens.grid.value,
          ),
        ),
      ),
    ],
    label: 'grid',
  );
}
