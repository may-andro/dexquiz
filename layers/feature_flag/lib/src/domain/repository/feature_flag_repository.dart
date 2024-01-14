import 'dart:async';

import 'package:feature_flag/src/domain/model/feature.dart';

abstract class FeatureFlagRepository {
  FutureOr<void> initFeatureFlags();

  FutureOr<Map<Feature, bool>> getFeatureFlags();

  FutureOr<bool> getFeatureFlagStatus(Feature feature);

  void enableFeatureFlag(Feature feature);

  void disableFeatureFlag(Feature feature);

  FutureOr<void> reset();
}
