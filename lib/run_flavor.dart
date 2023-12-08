import 'dart:async';

import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:dexquiz/dexquiz_app.dart';
import 'package:dexquiz/error_reporter/app_blacklist_error_handler.dart';
import 'package:dexquiz/error_reporter/app_fatal_exception_handler.dart';
import 'package:dexquiz/error_reporter/blacklist_exception.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:dexquiz/service_locator/get_it_service_locator.dart';
import 'package:dexquiz/utils/log_use_case_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:log_reporter/log_reporter.dart' as log_reporter;
import 'package:firebase/firebase.dart' as firebase;
import 'package:use_case/use_case.dart' as use_case;
import 'package:error_reporter/error_reporter.dart' as error_reporter;

const serviceLocator = GetItServiceLocator();

Future<void> runFlavor({
  required BuildConfig buildConfig,
}) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setUpDIGraph<BuildConfig>(
    configurators: [
      appModuleConfigurator,
      firebase.moduleConfigurator,
      log_reporter.moduleConfigurator,
      use_case.moduleConfigurator,
      error_reporter.moduleConfigurator,
    ],
    config: buildConfig,
    serviceLocator: serviceLocator,
  );

  final errorReporter = serviceLocator.get<error_reporter.ErrorReporter>();

  // uncaught asynchronous errors that aren't handled by the Flutter framework
  PlatformDispatcher.instance.onError = (error, stack) {
    errorReporter.globalErrorHandler(error, stack);
    return true;
  };

  final crashlyticsLogUseCase =
      serviceLocator.get<firebase.CrashlyticsLogUseCase>();
  crashlyticsLogUseCase.call('App Started');

  final logReporter = serviceLocator.get<log_reporter.LogReporter>();
  logReporter.debug('Hey I am the debug logger');
  logReporter.error('Hey I am the error logger');

  /// set use case interceptor
  final logUseCaseInterceptor = serviceLocator.get<LogUseCaseInterceptor>();
  final useCaseInterceptionHandler =
      serviceLocator.get<use_case.UseCaseInterceptionHandler>();
  useCaseInterceptionHandler.register(logUseCaseInterceptor);

  /// set blacklist error
  final registerBlacklistExceptionHandlerUseCase =
      serviceLocator.get<error_reporter.RegisterBlacklistErrorHandlerUseCase>();
  final appBlacklistErrorHandler = AppBlacklistErrorHandler();
  registerBlacklistExceptionHandlerUseCase.call(appBlacklistErrorHandler);

  /// report blacklist error
  errorReporter.reportError(
    exception: BlacklistException(),
    stackTrace: StackTrace.current,
  );

  /// set fatal error handler
  final registerFatalErrorHandlerUseCase =
      serviceLocator.get<error_reporter.RegisterFatalErrorHandlerUseCase>();
  final appFatalErrorHandler = AppFatalErrorHandler();
  registerFatalErrorHandlerUseCase(appFatalErrorHandler);

  FlutterNativeSplash.remove();

  runApp(const DexQuizApp());

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
