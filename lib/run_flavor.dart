import 'dart:async';

import 'package:app_config/app_config.dart';
import 'package:cache/cache.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:dev_menu/dev_menu.dart';
import 'package:dexquiz/app/dexquiz/dexquiz_app.dart';
import 'package:dexquiz/app/splash/splash_app.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:error_reporter/error_reporter.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase/firebase.dart';
import 'package:log_reporter/log_reporter.dart';
import 'package:pokemon/pokemon.dart';
import 'package:remote/remote.dart';
import 'package:settings/settings.dart';
import 'package:use_case/use_case.dart';

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

  final moduleConfigurators = [
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
    const AppConfigModuleConfigurator(),
    const FeatureSettingsModuleConfigurator(),
    const FeaturePokemonModuleConfigurator(),
    const DevMenuModuleConfigurator(),
  ];

  FlutterNativeSplash.remove();

  runApp(
    SplashApp(
      buildConfig: buildConfig,
      moduleConfigurators: moduleConfigurators,
      onInitializationSuccessful: _runMainApp,
    ),
  );
}

void _runMainApp(DesignSystem designSystem) {
  runApp(
    DexQuizApp(
      designSystem: designSystem,
      navigationObservers: [
        appServiceLocator.get<FirebaseAnalyticsObserver>(),
      ],
      buildConfig: appServiceLocator.get<BuildConfig>(),
    ),
  );
}
