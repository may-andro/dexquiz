import 'dart:async';

import 'package:cache/cache.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:feature_flag/src/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/cache/feature_flag_config.dart';
import 'package:feature_flag/src/use_case/get_all_feature_flags_use_case.dart';
import 'package:feature_flag/src/use_case/init_module_use_case.dart';
import 'package:feature_flag/src/use_case/update_cache_use_case.dart';
import 'package:feature_flag/src/use_case/is_feature_enabled_use_case.dart';
import 'package:feature_flag/src/use_case/set_feature_enabled_use_case.dart';
import 'package:firebase/firebase.dart';
import 'package:log_reporter/log_reporter.dart';

class FeatureFlagModuleConfigurator implements ModuleConfigurator {
  const FeatureFlagModuleConfigurator();

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) {
    serviceLocator.get<InitModuleUseCase>().call();
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
    serviceLocator.registerSingleton(
      () => FeatureFlagCache(featureFlagBox),
    );

    serviceLocator.registerFactory(
      () => GetAllFeatureFlagsUseCase(
        serviceLocator.get<FeatureFlagCache>(),
      ),
    );
    serviceLocator.registerFactory(
      () => InitModuleUseCase(
        serviceLocator.get<UpdateCacheUseCase>(),
        serviceLocator.get<FeatureFlagCache>(),
        serviceLocator.get<LogReporter>(),
      ),
    );
    serviceLocator.registerFactory(
      () => UpdateCacheUseCase(
        serviceLocator.get<GetRemoteConfigValueUseCase>(),
        serviceLocator.get<FeatureFlagCache>(),
      ),
    );
    serviceLocator.registerFactory(
      () => IsFeatureEnabledUseCase(serviceLocator.get<FeatureFlagCache>()),
    );
    serviceLocator.registerSingleton(
      () => SetFeatureEnabledUseCase(serviceLocator.get<FeatureFlagCache>()),
    );
  }
}
