import 'package:feature_flag/src/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/use_case/update_cache_use_case.dart';
import 'package:log_reporter/log_reporter.dart';
import 'package:use_case/use_case.dart';

class InitModuleUseCase extends BaseNoParamAsyncUseCase<void, NoFailure> {
  InitModuleUseCase(
    this._updateCacheUseCase,
    this._featureFlagCache,
    this._logReporter,
  );

  final UpdateCacheUseCase _updateCacheUseCase;
  final FeatureFlagCache _featureFlagCache;
  final LogReporter _logReporter;

  @override
  AsyncEither<NoFailure, void> execute() async {
    try {
      final cache = await _featureFlagCache.all;
      if (cache.isEmpty) {
        _logReporter.debug('No feature flag is found');
        await _updateCacheUseCase();
      }
      return const Right(null);
    } catch (e, st) {
      reportError(e, st);
      return Left(NoFailure());
    }
  }
}
