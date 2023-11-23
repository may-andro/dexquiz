import 'dart:async';

import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:firebase/src/crashlytics/crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

final moduleConfigurator = _ModuleConfigurator();

class _ModuleConfigurator implements ModuleConfigurator<BuildConfig> {
  @override
  FutureOr<void> postDependenciesSetup(
    BuildConfig config,
    ServiceLocator serviceLocator,
  ) {
    final firebaseCrashlytics = serviceLocator.get<FirebaseCrashlytics>();
    firebaseCrashlytics.setCrashlyticsCollectionEnabled(
      config.isCrashlyticsEnabled,
    );
  }

  @override
  FutureOr<void> preDependenciesSetup(
    BuildConfig config,
    ServiceLocator serviceLocator,
  ) async {
    await Firebase.initializeApp(
      name: config.firebaseProjectName,
      options: config.firebaseOptions,
    );
  }

  @override
  FutureOr<void> registerDependencies(
    BuildConfig config,
    ServiceLocator serviceLocator,
  ) {
    _injectCrashlytics(serviceLocator);
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
}
