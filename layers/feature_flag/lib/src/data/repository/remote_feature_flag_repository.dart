import 'package:feature_flag/src/domain/model/feature.dart';
import 'package:feature_flag/src/domain/repository/feature_flag_repository.dart';
import 'package:firebase/firebase.dart';
import 'package:collection/collection.dart';

class RemoteFeatureFlagRepository implements FeatureFlagRepository {
  RemoteFeatureFlagRepository(this._getAllRemoteConfigsUseCase);

  final GetAllRemoteConfigsUseCase _getAllRemoteConfigsUseCase;

  Map<Feature, bool> _remoteFeatureFlags = {};

  @override
  void initFeatureFlags() {
    _getAllRemoteConfigsUseCase().forEach((key, value) {
      final feature = Feature.values.firstWhereOrNull(
        (feature) => feature.key == key,
      );
      if (feature != null) {
        _remoteFeatureFlags[feature] = value.asBool();
      }
    });
  }

  @override
  Map<Feature, bool> getFeatureFlags() => _remoteFeatureFlags;

  @override
  bool getFeatureFlagStatus(Feature feature) {
    return _remoteFeatureFlags[feature] ?? false;
  }

  @override
  void disableFeatureFlag(Feature feature) {
    _remoteFeatureFlags[feature] = false;
  }

  @override
  void enableFeatureFlag(Feature feature) {
    _remoteFeatureFlags[feature] = true;
  }

  @override
  void reset() {
    _remoteFeatureFlags.clear();
    initFeatureFlags();
  }
}
