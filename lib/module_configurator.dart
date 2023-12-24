import 'dart:async';

import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:dexquiz/utils/log_use_case_interceptor.dart';
import 'package:log_reporter/log_reporter.dart';

late final ServiceLocator appServiceLocator;

class AppModuleConfigurator implements ModuleConfigurator {
  AppModuleConfigurator(this._buildConfig);

  final BuildConfig _buildConfig;

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) => null;

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) => null;

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) {
    appServiceLocator = serviceLocator;
    serviceLocator.registerSingleton(() => _buildConfig);
    serviceLocator.registerFactory(
      () => LogUseCaseInterceptor(
        serviceLocator.get<LogReporter>(),
      ),
    );
  }
}
