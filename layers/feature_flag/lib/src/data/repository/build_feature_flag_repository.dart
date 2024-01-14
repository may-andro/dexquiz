import 'dart:async';

import 'package:core/core.dart';
import 'package:feature_flag/src/domain/model/feature.dart';
import 'package:feature_flag/src/domain/repository/feature_flag_repository.dart';

class BuildFeatureFlagRepository implements FeatureFlagRepository {
  BuildFeatureFlagRepository(
    BuildConfig buildConfig,
    this._cacheRepositoryDelegate,
    this._remoteRepositoryDelegate,
  ) : _isCacheEnabled = buildConfig.buildEnvironment.isFeatureFlagCached;

  final FeatureFlagRepository _cacheRepositoryDelegate;
  final FeatureFlagRepository _remoteRepositoryDelegate;
  final bool _isCacheEnabled;

  @override
  FutureOr<void> initFeatureFlags() {
    if (_isCacheEnabled) return _cacheRepositoryDelegate.initFeatureFlags();
    return _remoteRepositoryDelegate.initFeatureFlags();
  }

  @override
  FutureOr<bool> getFeatureFlagStatus(Feature feature) {
    if (_isCacheEnabled) {
      return _cacheRepositoryDelegate.getFeatureFlagStatus(
        feature,
      );
    }
    return _remoteRepositoryDelegate.getFeatureFlagStatus(feature);
  }

  @override
  FutureOr<Map<Feature, bool>> getFeatureFlags() {
    if (_isCacheEnabled) {
      return _cacheRepositoryDelegate.getFeatureFlags();
    }
    return _remoteRepositoryDelegate.getFeatureFlags();
  }

  @override
  void disableFeatureFlag(Feature feature) {
    if (_isCacheEnabled) {
      return _cacheRepositoryDelegate.disableFeatureFlag(feature);
    }
    return _remoteRepositoryDelegate.disableFeatureFlag(feature);
  }

  @override
  void enableFeatureFlag(Feature feature) {
    if (_isCacheEnabled) {
      return _cacheRepositoryDelegate.enableFeatureFlag(feature);
    }
    return _remoteRepositoryDelegate.enableFeatureFlag(feature);
  }

  @override
  FutureOr<void> reset() {
    if (_isCacheEnabled) {
      return _cacheRepositoryDelegate.reset();
    }
    return _remoteRepositoryDelegate.reset();
  }
}
