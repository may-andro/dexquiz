import 'dart:async';

import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:dexquiz/error_reporter/app_blacklist_error_handler.dart';
import 'package:dexquiz/error_reporter/app_fatal_exception_handler.dart';
import 'package:dexquiz/utils/app_bloc_observer.dart';
import 'package:dexquiz/utils/log_use_case_interceptor.dart';
import 'package:error_reporter/error_reporter.dart';
import 'package:flutter/foundation.dart';
import 'package:log_reporter/log_reporter.dart';
import 'package:use_case/use_case.dart';

late final ServiceLocator appServiceLocator;

class AppModuleConfigurator implements ModuleConfigurator {
  AppModuleConfigurator(this._buildConfig);

  final BuildConfig _buildConfig;

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) {
    final errorReporter = appServiceLocator.get<ErrorReporter>();

    /// uncaught asynchronous errors that aren't handled by the Flutter framework
    PlatformDispatcher.instance.onError = (error, stack) {
      errorReporter.globalErrorHandler(error, stack);
      return true;
    };

    /// set use case interceptor
    appServiceLocator.get<UseCaseInterceptionHandler>().register(
          appServiceLocator.get<LogUseCaseInterceptor>(),
        );

    /// set blacklist error
    appServiceLocator.get<RegisterBlacklistErrorHandlerUseCase>().call(
          AppBlacklistErrorHandler(),
        );

    /// set fatal error handler
    appServiceLocator.get<RegisterFatalErrorHandlerUseCase>().call(
          AppFatalErrorHandler(),
        );
  }

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) => null;

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) async {
    appServiceLocator = serviceLocator;
    serviceLocator.registerSingleton(() => _buildConfig);

    serviceLocator.registerFactory(
      () => LogUseCaseInterceptor(serviceLocator.get<LogReporter>()),
    );

    serviceLocator.registerFactory(
      () => AppBlocObserver(serviceLocator.get<LogReporter>()),
    );
  }
}
