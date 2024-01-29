import 'dart:async';

import 'package:dependency_injector/dependency_injector.dart';
import 'package:firebase/firebase.dart';
import 'package:log_reporter/src/log/composite_log_reporter.dart';
import 'package:log_reporter/src/log/firebase_log_reporter.dart';
import 'package:log_reporter/src/log/local_log_reporter.dart';
import 'package:log_reporter/src/log/log_reporter.dart';
import 'package:logger/logger.dart';

class LogReporterModuleConfigurator implements ModuleConfigurator {
  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) => null;

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) => null;

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) {
    serviceLocator.registerSingleton(() => Logger());

    final firebaseLogReporter = FirebaseLogReporter(
      serviceLocator.get<CrashlyticsLogUseCase>(),
    );
    final localLogReporter = LocalLogReporter(
      serviceLocator.get<Logger>(),
    );
    serviceLocator.registerSingleton<LogReporter>(
      () => CompositeLogReporter([
        firebaseLogReporter,
        localLogReporter,
      ]),
    );
  }
}
