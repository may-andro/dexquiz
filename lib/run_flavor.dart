import 'dart:async';

import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:dexquiz/dexquiz_app.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:dexquiz/service_locator/get_it_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:log_reporter/log_reporter.dart' as log_reporter;
import 'package:firebase/firebase.dart' as firebase;
import 'package:use_case/use_case.dart' as use_case;

const serviceLocator = GetItServiceLocator();

Future<void> runFlavor({
  required BuildConfig buildConfig,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await setUpDIGraph<BuildConfig>(
    configurators: [
      appModuleConfigurator,
      firebase.moduleConfigurator,
      log_reporter.moduleConfigurator,
      use_case.moduleConfigurator,
    ],
    config: buildConfig,
    serviceLocator: serviceLocator,
  );

  final crashlyticsLogUseCase =
      serviceLocator.get<firebase.CrashlyticsLogUseCase>();
  crashlyticsLogUseCase.call('App Started');

  final logReporter = serviceLocator.get<log_reporter.LogReporter>();
  logReporter.debug('Hey I am the debug logger');
  logReporter.error('Hey I am the error logger');

  final crashlyticsForceCrashUseCase =
      serviceLocator.get<firebase.CrashlyticsForceCrashUseCase>();
  crashlyticsForceCrashUseCase();

  runApp(const DexQuizApp());
}
