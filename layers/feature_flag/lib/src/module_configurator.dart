import 'dart:async';

import 'package:cache/cache.dart';
import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:feature_flag/src/data/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/data/cache/feature_flag_config.dart';
import 'package:feature_flag/src/data/repository/build_feature_flag_repository.dart';
import 'package:feature_flag/src/data/repository/cached_feature_flag_repository.dart';
import 'package:feature_flag/src/data/repository/remote_feature_flag_repository.dart';
import 'package:feature_flag/src/domain/repository/feature_flag_repository.dart';
import 'package:feature_flag/src/domain/use_case/init_feature_flags_use_case.dart';
import 'package:firebase/firebase.dart';

import 'domain/use_case/get_feature_flags_use_case.dart';
import 'domain/use_case/is_feature_enabled_use_case.dart';
import 'domain/use_case/reset_feature_flags_use_case.dart';
import 'domain/use_case/set_feature_status_use_case.dart';

class FeatureFlagModuleConfigurator implements ModuleConfigurator {
  const FeatureFlagModuleConfigurator();

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) async {
    await serviceLocator.get<InitFeatureFlagsUseCase>().call();
  }

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) async {}

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) async {
    final hive = serviceLocator.get<HiveInterface>();
    hive.registerAdapter(FeatureFlagConfigAdapter());
    final featureFlagBox = await hive.openBox<FeatureFlagConfig>(
      'feature_flag_box',
    );

    // cache
    serviceLocator.registerSingleton(
      () => FeatureFlagCache(featureFlagBox),
    );

    // repository
    final remoteFeatureFlagRepository = RemoteFeatureFlagRepository(
      serviceLocator.get<GetAllRemoteConfigsUseCase>(),
    );
    final cachedFeatureFlagRepository = CachedFeatureFlagRepository(
      remoteFeatureFlagRepository,
      serviceLocator.get<FeatureFlagCache>(),
    );
    serviceLocator.registerSingleton<FeatureFlagRepository>(
      () => BuildFeatureFlagRepository(
        serviceLocator.get<BuildConfig>(),
        remoteFeatureFlagRepository,
        cachedFeatureFlagRepository,
      ),
    );

    // use case
    serviceLocator.registerFactory(
      () => GetFeatureFlagsUseCase(
        serviceLocator.get<FeatureFlagRepository>(),
      ),
    );
    serviceLocator.registerFactory(
      () => InitFeatureFlagsUseCase(
        serviceLocator.get<FeatureFlagRepository>(),
      ),
    );
    serviceLocator.registerFactory(
      () => IsFeatureEnabledUseCase(
        serviceLocator.get<FeatureFlagRepository>(),
      ),
    );
    serviceLocator.registerFactory(
      () => ResetFeatureFlagsUseCase(
        serviceLocator.get<FeatureFlagRepository>(),
      ),
    );
    serviceLocator.registerSingleton(
      () => SetFeatureFlagStatusUseCase(
        serviceLocator.get<FeatureFlagRepository>(),
      ),
    );
  }
}
