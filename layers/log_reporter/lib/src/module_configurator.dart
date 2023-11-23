import 'dart:async';

import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:firebase/firebase.dart';
import 'package:log_reporter/src/log/composite_log_reporter.dart';
import 'package:log_reporter/src/log/firebase_log_reporter.dart';
import 'package:log_reporter/src/log/local_log_reporter.dart';
import 'package:log_reporter/src/log/log_reporter.dart';
import 'package:logger/logger.dart';

final moduleConfigurator = _ModuleConfigurator();

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
