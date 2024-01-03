import 'package:feature_flag/src/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/model/feature.dart';
import 'package:use_case/use_case.dart';

class GetAllFeatureFlagsUseCase
    extends BaseNoParamAsyncUseCase<Map<Feature, bool>, NoFailure> {
  GetAllFeatureFlagsUseCase(this._featureFlagCache);

  final FeatureFlagCache _featureFlagCache;

  @override
  AsyncEither<NoFailure, Map<Feature, bool>> execute() async {
    final featureFlagConfigs = await _featureFlagCache.all;
    final map = <Feature, bool>{};
    for (var featureFlagConfig in featureFlagConfigs) {
      map[Feature.getFeature(featureFlagConfig.featureKey)] =
          featureFlagConfig.isEnabled;
    }
    return Right(map);
  }
}
