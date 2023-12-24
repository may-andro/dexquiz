import 'dart:async';

import 'package:dependency_injector/dependency_injector.dart';
import 'package:firebase/src/crashlytics/crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

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
  }

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) async {
    await Firebase.initializeApp(
      name: firebaseProjectName,
      options: firebaseOptions,
    );
  }

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) {
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
