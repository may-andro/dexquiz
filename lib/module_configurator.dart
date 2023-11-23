import 'dart:async';

import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';

final appModuleConfigurator = _ModuleConfigurator();

class _ModuleConfigurator implements ModuleConfigurator<BuildConfig> {
  @override
  FutureOr<void> postDependenciesSetup(
    BuildConfig config,
    ServiceLocator serviceLocator,
  ) {
    return null;
  }

  @override
  FutureOr<void> preDependenciesSetup(
    BuildConfig config,
    ServiceLocator serviceLocator,
  ) {
    return null;
  }

  @override
  FutureOr<void> registerDependencies(
    BuildConfig config,
    ServiceLocator serviceLocator,
  ) {
    serviceLocator.registerSingleton(() => config);
  }
}
