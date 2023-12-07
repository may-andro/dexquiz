import 'dart:async';

import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:dexquiz/utils/log_use_case_interceptor.dart';
import 'package:log_reporter/log_reporter.dart';

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
    serviceLocator.registerFactory(
      () => LogUseCaseInterceptor(
        serviceLocator.get<LogReporter>(),
      ),
    );
  }
}
