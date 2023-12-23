import 'package:design_system/src/foundations/dimens/ds_grid.dart';
import 'package:design_system/src/foundations/foundations.dart';

class DimensImpl implements DSDimens {
  const DimensImpl();

  @override
  DSElevation get elevationLevel1 => const DSElevation(2);

  @override
  DSElevation get elevationLevel2 => const DSElevation(4);

  @override
  DSElevation get elevationLevel3 => const DSElevation(8);

  @override
  DSElevation get elevationNone => const DSElevation(0);

  @override
  DSRadius get radiusCircular => const DSRadius(250);

  @override
  DSRadius get radiusLevel1 => const DSRadius(4);

  @override
  DSRadius get radiusLevel2 => const DSRadius(8);

  @override
  DSRadius get radiusLevel3 => const DSRadius(16);

  @override
  DSGrid get grid => const DSGrid(8);
}
