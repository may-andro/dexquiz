import 'dart:async';

import 'package:cache/cache.dart';
import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/dexquiz_app.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:log_reporter/log_reporter.dart';
import 'package:firebase/firebase.dart';
import 'package:remote/remote.dart';
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

  await setUpDIGraph(
    configurators: [
      AppModuleConfigurator(buildConfig),
      FirebaseModuleConfigurator(
        buildConfig.buildEnvironment.isFirebaseEnabled,
        firebaseProjectName,
        firebaseOptions,
      ),
      LogReporterModuleConfigurator(),
      UseCaseModuleConfigurator(),
      ErrorReporterModuleConfigurator(
        buildConfig.buildEnvironment.isFirebaseEnabled,
      ),
      const CacheModuleConfigurator(),
      const FeatureFlagModuleConfigurator(),
      RemoteModuleConfigurator(
        buildConfig.buildEnvironment.isRemoteLoggingEnabled,
        'https://pokeapi.co/api/v2/',
      ),
    ],
  );

  FlutterNativeSplash.remove();

  runApp(DexQuizApp(
    designSystem: DesignSystem.fire,
    navigationObservers: [
      appServiceLocator.get<FirebaseAnalyticsObserver>(),
    ],
    buildConfig: appServiceLocator.get<BuildConfig>(),
  ));
}
