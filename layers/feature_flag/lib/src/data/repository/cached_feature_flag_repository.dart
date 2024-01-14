import 'dart:async';

import 'package:feature_flag/src/data/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/data/cache/feature_flag_config.dart';
import 'package:feature_flag/src/domain/model/feature.dart';
import 'package:feature_flag/src/domain/repository/feature_flag_repository.dart';

class CachedFeatureFlagRepository implements FeatureFlagRepository {
  CachedFeatureFlagRepository(
    this._featureFlagRepositoryDelegate,
    this._featureFlagCache,
  );

  final FeatureFlagRepository _featureFlagRepositoryDelegate;
  final FeatureFlagCache _featureFlagCache;

  @override
  Future<void> initFeatureFlags() async {
    final cache = await _featureFlagCache.all;
    if (cache.isEmpty) {
      _featureFlagRepositoryDelegate.initFeatureFlags();
      final remoteFeatureFlags =
          await _featureFlagRepositoryDelegate.getFeatureFlags();
      await _featureFlagCache.putAll(remoteFeatureFlags.featureFlagConfig);
    }
  }

  @override
  Future<Map<Feature, bool>> getFeatureFlags() async {
    final cacheFeatureFlags = await _featureFlagCache.all;
    return cacheFeatureFlags.featureMap;
  }

  @override
  Future<bool> getFeatureFlagStatus(Feature feature) async {
    final featureFlagCache = await _featureFlagCache.get(feature.key);
    return featureFlagCache?.isEnabled ?? false;
  }

  @override
  void disableFeatureFlag(Feature feature) {
    final featureFlagConfig = FeatureFlagConfig(
      featureKey: feature.key,
      isEnabled: false,
    );
    _featureFlagCache.put(featureFlagConfig);
  }

  @override
  void enableFeatureFlag(Feature feature) {
    final featureFlagConfig = FeatureFlagConfig(
      featureKey: feature.key,
      isEnabled: true,
    );
    _featureFlagCache.put(featureFlagConfig);
  }

  @override
  Future<void> reset() async {
    await _featureFlagCache.deleteAll();
    await initFeatureFlags();
  }
}

extension _FeatureMapExtension on Map<Feature, bool> {
  List<FeatureFlagConfig> get featureFlagConfig {
    final cacheList = <FeatureFlagConfig>[];
    forEach((key, value) {
      cacheList.add(FeatureFlagConfig(featureKey: key.key, isEnabled: value));
    });
    return cacheList;
  }
}

extension _FeatureFlagConfigExtension on List<FeatureFlagConfig> {
  Map<Feature, bool> get featureMap {
    final map = <Feature, bool>{};
    for (var featureFlagConfig in this) {
      final key = Feature.getFeature(featureFlagConfig.featureKey);
      map[key] = featureFlagConfig.isEnabled;
    }
    return map;
  }
}
