import 'package:firebase/src/crashlytics/crashlytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';

void setupPackageDependencies(final GetIt getIt) {
  _injectCrashlytics(getIt);
}

void _injectCrashlytics(final GetIt getIt) {
  getIt.registerSingleton(FirebaseCrashlytics.instance);

  getIt.registerFactory(
    () => CrashlyticsForceCrashUseCase(
      getIt.get<FirebaseCrashlytics>(),
    ),
  );
  getIt.registerFactory(
    () => CrashlyticsLogUseCase(getIt.get<FirebaseCrashlytics>()),
  );
  getIt.registerFactory(
    () => CrashlyticsRecordErrorUseCase(getIt.get<FirebaseCrashlytics>()),
  );
  getIt.registerFactory(
    () => CrashlyticsFlutterRecordErrorUseCase(
      getIt.get<FirebaseCrashlytics>(),
    ),
  );
  getIt.registerFactory(
    () => IsCrashlyticsEnabledUseCase(getIt.get<FirebaseCrashlytics>()),
  );
  getIt.registerFactory(
    () => SetCrashlyticsEnabledUseCase(getIt.get<FirebaseCrashlytics>()),
  );
  getIt.registerFactory(
    () => SetCrashlyticsUserUseCase(getIt.get<FirebaseCrashlytics>()),
  );
}
