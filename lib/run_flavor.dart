import 'dart:async';

import 'package:cache/cache.dart';
import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/dexquiz_app.dart';
import 'package:dexquiz/error_reporter/app_blacklist_error_handler.dart';
import 'package:dexquiz/error_reporter/app_fatal_exception_handler.dart';
import 'package:dexquiz/error_reporter/blacklist_exception.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:dexquiz/utils/log_use_case_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:log_reporter/log_reporter.dart';
import 'package:firebase/firebase.dart';
import 'package:use_case/use_case.dart';
import 'package:error_reporter/error_reporter.dart';

Future<void> runFlavor({
  required String firebaseProjectName,
  required FirebaseOptions firebaseOptions,
  required BuildConfig buildConfig,
}) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final appModuleConfigurator = AppModuleConfigurator(buildConfig);
  final firebaseModuleConfigurator = FirebaseModuleConfigurator(
    buildConfig.buildEnvironment.isFirebaseEnabled,
    firebaseProjectName,
    firebaseOptions,
  );
  final logReporterModuleConfigurator = LogReporterModuleConfigurator();
  final useCaseModuleConfigurator = UseCaseModuleConfigurator();
  final errorReporterModuleConfigurator = ErrorReporterModuleConfigurator(
    buildConfig.buildEnvironment.isFirebaseEnabled,
  );
  const cacheModuleConfigurator = CacheModuleConfigurator();
  await setUpDIGraph(
    configurators: [
      appModuleConfigurator,
      firebaseModuleConfigurator,
      logReporterModuleConfigurator,
      useCaseModuleConfigurator,
      errorReporterModuleConfigurator,
      cacheModuleConfigurator,
    ],
  );

  final errorReporter = appServiceLocator.get<ErrorReporter>();

  // uncaught asynchronous errors that aren't handled by the Flutter framework
  PlatformDispatcher.instance.onError = (error, stack) {
    errorReporter.globalErrorHandler(error, stack);
    return true;
  };

  final crashlyticsLogUseCase = appServiceLocator.get<CrashlyticsLogUseCase>();
  crashlyticsLogUseCase.call('App Started');

  final logReporter = appServiceLocator.get<LogReporter>();
  logReporter.debug('Hey I am the debug logger');
  logReporter.error('Hey I am the error logger');

  /// set use case interceptor
  final logUseCaseInterceptor = appServiceLocator.get<LogUseCaseInterceptor>();
  final useCaseInterceptionHandler =
      appServiceLocator.get<UseCaseInterceptionHandler>();
  useCaseInterceptionHandler.register(logUseCaseInterceptor);

  /// set blacklist error
  final registerBlacklistExceptionHandlerUseCase =
      appServiceLocator.get<RegisterBlacklistErrorHandlerUseCase>();
  final appBlacklistErrorHandler = AppBlacklistErrorHandler();
  registerBlacklistExceptionHandlerUseCase.call(appBlacklistErrorHandler);

  /// report blacklist error
  errorReporter.reportError(
    exception: BlacklistException(),
    stackTrace: StackTrace.current,
  );

  /// set fatal error handler
  final registerFatalErrorHandlerUseCase =
      appServiceLocator.get<RegisterFatalErrorHandlerUseCase>();
  final appFatalErrorHandler = AppFatalErrorHandler();
  registerFatalErrorHandlerUseCase(appFatalErrorHandler);

  FlutterNativeSplash.remove();

  runApp(const DexQuizApp(designSystem: DesignSystem.fire));

  /// force crash using crashlytics
  /*final crashlyticsForceCrashUseCase =
      serviceLocator.get<firebase.CrashlyticsForceCrashUseCase>();
  crashlyticsForceCrashUseCase();*/

  /// report fatal error
  /*errorReporter.reportError(
    exception: error_reporter.FatalException(),
    stackTrace: StackTrace.current,
  );*/
}
