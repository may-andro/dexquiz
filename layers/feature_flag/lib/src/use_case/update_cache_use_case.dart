import 'package:feature_flag/src/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/cache/feature_flag_config.dart';
import 'package:feature_flag/src/model/feature.dart';
import 'package:firebase/firebase.dart';
import 'package:use_case/use_case.dart';

class UpdateCacheUseCase extends BaseNoParamAsyncUseCase<void, NoFailure> {
  UpdateCacheUseCase(
    this._getRemoteConfigValueUseCase,
    this._featureFlagCache,
  );

  final GetRemoteConfigValueUseCase _getRemoteConfigValueUseCase;
  final FeatureFlagCache _featureFlagCache;

  @override
  AsyncEither<NoFailure, void> execute() async {
    final localFeatureFlags = Feature.values.map((feature) {
      return FeatureFlagConfig(
        featureKey: feature.key,
        isEnabled: _getRemoteConfigValueUseCase(feature.key).asBool(),
      );
    }).toList();
    await _featureFlagCache.deleteAll();
    await _featureFlagCache.putAll(localFeatureFlags);
    return const Right(null);
  }
}
