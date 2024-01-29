import 'dart:async';

import 'package:dependency_injector/dependency_injector.dart';
import 'package:error_reporter/src/blacklist_error/blacklist_error.dart';
import 'package:error_reporter/src/fatal_error/fatal_error.dart';
import 'package:error_reporter/src/reporter/crashlytics_error_reporter.dart';
import 'package:error_reporter/src/reporter/error_reporter.dart';
import 'package:error_reporter/src/reporter/logger_error_reporter.dart';
import 'package:firebase/firebase.dart';
import 'package:log_reporter/log_reporter.dart';

class ErrorReporterModuleConfigurator implements ModuleConfigurator {
  ErrorReporterModuleConfigurator(this.isFirebaseEnabled);

  final bool isFirebaseEnabled;

  @override
  FutureOr<void> postDependenciesSetup(
    ServiceLocator serviceLocator,
  ) async {
    serviceLocator.get<ErrorReporter>().init();
  }

  @override
  FutureOr<void> preDependenciesSetup(
    ServiceLocator serviceLocator,
  ) {
    return Future.value();
  }

  @override
  FutureOr<void> registerDependencies(
    ServiceLocator serviceLocator,
  ) {
    // Blacklist errors
    serviceLocator.registerSingleton<BlacklistErrorController>(
      () => BlacklistErrorController(),
    );

    serviceLocator.registerFactory<RegisterBlacklistErrorHandlerUseCase>(
      () => RegisterBlacklistErrorHandlerUseCase(
        serviceLocator.get<BlacklistErrorController>(),
      ),
    );

    serviceLocator.registerFactory<IsBlacklistedErrorUseCase>(
      () => IsBlacklistedErrorUseCase(
        serviceLocator.get<BlacklistErrorController>(),
      ),
    );

    //Fatal Error Handler
    serviceLocator.registerSingleton<FatalErrorController>(
      () => FatalErrorController(),
    );

    serviceLocator.registerFactory<FatalErrorHandlerUseCase>(
      () => FatalErrorHandlerUseCase(
        serviceLocator.get<FatalErrorController>(),
      ),
    );

    serviceLocator.registerFactory<RegisterFatalErrorHandlerUseCase>(
      () => RegisterFatalErrorHandlerUseCase(
        serviceLocator.get<FatalErrorController>(),
      ),
    );

    serviceLocator.registerFactory<IsFatalErrorUseCase>(
      () => IsFatalErrorUseCase(),
    );

    // Error Reporter
    ErrorReporter errorReporter = LoggerErrorReporter(
      serviceLocator.get<IsFatalErrorUseCase>(),
      serviceLocator.get<FatalErrorHandlerUseCase>(),
      serviceLocator.get<LogReporter>(),
    );
    if (isFirebaseEnabled) {
      errorReporter = CrashlyticsErrorReporter(
        serviceLocator.get<IsBlacklistedErrorUseCase>(),
        serviceLocator.get<IsFatalErrorUseCase>(),
        serviceLocator.get<FatalErrorHandlerUseCase>(),
        serviceLocator.get<CrashlyticsRecordErrorUseCase>(),
        serviceLocator.get<CrashlyticsFlutterRecordErrorUseCase>(),
        serviceLocator.get<LogReporter>(),
      );
    }
    serviceLocator.registerSingleton<ErrorReporter>(() => errorReporter);
  }
}
