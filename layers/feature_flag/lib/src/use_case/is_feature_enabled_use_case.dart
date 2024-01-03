import 'package:feature_flag/src/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/model/feature.dart';
import 'package:use_case/use_case.dart';

class IsFeatureEnabledUseCase
    extends BaseAsyncUseCase<bool, Feature, NoFailure> {
  IsFeatureEnabledUseCase(this._featureFlagCache);

  final FeatureFlagCache _featureFlagCache;

  @override
  AsyncEither<NoFailure, bool> execute(Feature input) async {
    try {
      final localFeature = await _featureFlagCache.get(input.key);
      return Right(localFeature?.isEnabled ?? false);
    } on Exception catch (e, st) {
      reportError(e, st);
      return Left(NoFailure());
    }
  }
}
