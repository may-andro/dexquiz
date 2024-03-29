import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:firebase/src/analytics/analytics.dart';
import 'package:firebase/src/firestore/firestore.dart';
import 'package:firebase/src/crashlytics/crashlytics.dart';
import 'package:firebase/src/remote_config/get_all_remote_configs_use_case.dart';
import 'package:firebase/src/remote_config/get_remote_config_value_use_case.dart';
import 'package:firebase/src/remote_config/initialise_remote_config_use_case.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseModuleConfigurator implements ModuleConfigurator {
  FirebaseModuleConfigurator(
    this.isFirebaseEnabled,
    this.firebaseProjectName,
    this.firebaseOptions,
  );

  final bool isFirebaseEnabled;
  final String firebaseProjectName;
  final FirebaseOptions firebaseOptions;

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) {
    final firebaseCrashlytics = serviceLocator.get<FirebaseCrashlytics>();
    firebaseCrashlytics.setCrashlyticsCollectionEnabled(isFirebaseEnabled);

    final crashlyticsLogUseCase = serviceLocator.get<CrashlyticsLogUseCase>();
    crashlyticsLogUseCase.call('App Started');

    final logEventUseCase = serviceLocator.get<LogEventUseCase>();
    logEventUseCase.call(
      'app_started',
      parameters: {
        'time': '${DateTime.now().microsecondsSinceEpoch}',
      },
    );
  }

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) async {
    await Firebase.initializeApp(
      name: firebaseProjectName,
      options: firebaseOptions,
    );
  }

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) async {
    _injectCrashlytics(serviceLocator);
    await _injectRemoteConfig(serviceLocator);
    _injectAnalytics(serviceLocator);
    _injectFirestore(serviceLocator);
  }

  void _injectCrashlytics(ServiceLocator serviceLocator) {
    serviceLocator.registerSingleton(() => FirebaseCrashlytics.instance);

    serviceLocator.registerFactory(
      () => CrashlyticsForceCrashUseCase(
        serviceLocator.get<FirebaseCrashlytics>(),
        serviceLocator.get<IsCrashlyticsEnabledUseCase>(),
      ),
    );
    serviceLocator.registerFactory(
      () => CrashlyticsLogUseCase(
        serviceLocator.get<FirebaseCrashlytics>(),
        serviceLocator.get<IsCrashlyticsEnabledUseCase>(),
      ),
    );
    serviceLocator.registerFactory(
      () => CrashlyticsRecordErrorUseCase(
        serviceLocator.get<FirebaseCrashlytics>(),
        serviceLocator.get<IsCrashlyticsEnabledUseCase>(),
      ),
    );
    serviceLocator.registerFactory(
      () => CrashlyticsFlutterRecordErrorUseCase(
        serviceLocator.get<FirebaseCrashlytics>(),
        serviceLocator.get<IsCrashlyticsEnabledUseCase>(),
      ),
    );
    serviceLocator.registerFactory(
      () => IsCrashlyticsEnabledUseCase(
        serviceLocator.get<FirebaseCrashlytics>(),
      ),
    );
    serviceLocator.registerFactory(
      () => SetCrashlyticsEnabledUseCase(
        serviceLocator.get<FirebaseCrashlytics>(),
      ),
    );
    serviceLocator.registerFactory(
      () => SetCrashlyticsUserUseCase(
        serviceLocator.get<FirebaseCrashlytics>(),
        serviceLocator.get<IsCrashlyticsEnabledUseCase>(),
      ),
    );
  }

  Future<void> _injectRemoteConfig(ServiceLocator serviceLocator) async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await InitialiseRemoteConfigUseCase(remoteConfig).call();

    serviceLocator.registerFactory(
      () => GetRemoteConfigValueUseCase(remoteConfig),
    );

    serviceLocator.registerFactory(
      () => GetAllRemoteConfigsUseCase(remoteConfig),
    );
  }

  void _injectAnalytics(ServiceLocator serviceLocator) {
    final firebaseAnalytics = FirebaseAnalytics.instance;
    firebaseAnalytics.setAnalyticsCollectionEnabled(isFirebaseEnabled);

    serviceLocator.registerFactory(
      () => FirebaseAnalyticsObserver(analytics: firebaseAnalytics),
    );

    serviceLocator.registerFactory(
      () => LogEventUseCase(firebaseAnalytics),
    );
    serviceLocator.registerFactory(
      () => SetDefaultParamsToEventUseCase(firebaseAnalytics),
    );
    serviceLocator.registerFactory(
      () => SetUserUseCase(firebaseAnalytics),
    );
  }

  void _injectFirestore(ServiceLocator serviceLocator) {
    final firebaseFirestore = FirebaseFirestore.instance;

    serviceLocator.registerFactory(
      () => AddToCollectionUseCase(firebaseFirestore),
    );
    serviceLocator.registerFactory(
      () => GetCollectionUseCase(firebaseFirestore),
    );
    serviceLocator.registerFactory(
      () => AddDocumentUseCase(firebaseFirestore),
    );
    serviceLocator.registerFactory(
      () => DeleteDocumentUseCase(firebaseFirestore),
    );
    serviceLocator.registerFactory(
      () => GetDocumentUseCase(firebaseFirestore),
    );
    serviceLocator.registerFactory(
      () => UpdateDocumentUseCase(firebaseFirestore),
    );
  }
}
