import 'package:feature_flag/src/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/cache/feature_flag_config.dart';
import 'package:feature_flag/src/model/feature.dart';
import 'package:use_case/use_case.dart';

class SetFeatureEnabledParam {
  SetFeatureEnabledParam(this.feature, {required this.isEnabled});

  Feature feature;
  bool isEnabled;
}

class SetFeatureEnabledUseCase
    extends BaseAsyncUseCase<void, SetFeatureEnabledParam, NoFailure> {
  SetFeatureEnabledUseCase(this._featureFlagCache);

  final FeatureFlagCache _featureFlagCache;

  @override
  AsyncEither<NoFailure, void> execute(SetFeatureEnabledParam param) async {
    try {
      await _featureFlagCache.put(
        FeatureFlagConfig(
          featureKey: param.feature.key,
          isEnabled: param.isEnabled,
        ),
      );
      return const Right(null);
    } on Exception catch (e, st) {
      reportError(e, st);
      return Left(NoFailure());
    }
  }
}
