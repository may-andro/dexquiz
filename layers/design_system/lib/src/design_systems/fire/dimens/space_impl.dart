import 'package:design_system/src/foundations/dimens/dimens.dart';
import 'package:meta/meta.dart';

@internal
class SpaceImpl implements DSSpace {
  SpaceImpl(this.textScaleFactor);

  final double textScaleFactor;

  @override
  double get space => 8;
}
