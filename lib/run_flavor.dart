import 'dart:async';

import 'package:dexquiz/build_config.dart';
import 'package:dexquiz/dexquiz_app.dart';
import 'package:dexquiz/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:log_reporter/log_reporter.dart' as log_reporter;
import 'package:firebase/firebase.dart' as firebase;

Future<void> runFlavor({
  required BuildConfig buildConfig,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await _preSetUpModule(buildConfig);
  _setupLocator(buildConfig);
  await _postSetUpModule(buildConfig);

  final crashlyticsLogUseCase = getIt.get<firebase.CrashlyticsLogUseCase>();
  crashlyticsLogUseCase.call('App Started');

  final logReporter = getIt.get<log_reporter.LogReporter>();
  logReporter.debug('Hey I am the debug logger');
  logReporter.error('Hey I am the error logger');

  final crashlyticsForceCrashUseCase =
      getIt.get<firebase.CrashlyticsForceCrashUseCase>();
  crashlyticsForceCrashUseCase();

  runApp(const DexQuizApp());
}

void _setupLocator(final BuildConfig buildConfig) {
  setupAppModule(buildConfig);
  firebase.setUpModule(getIt);
  log_reporter.setUpModule(getIt);
}

Future<void> _preSetUpModule(final BuildConfig buildConfig) async {
  await firebase.preSetUpModule(
    firebaseOptions: buildConfig.firebaseOptions,
    projectName: buildConfig.firebaseProjectName,
  );
}

Future<void> _postSetUpModule(final BuildConfig buildConfig) async {
  await firebase.postSetUpModule(
    getIt,
    isCrashlyticsEnabled: true,
  );
}
