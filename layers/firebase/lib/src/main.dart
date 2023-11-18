import 'package:firebase/src/di/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';

Future<void> preSetUpModule({
  required final String projectName,
  required final FirebaseOptions firebaseOptions,
}) async {
  await Firebase.initializeApp(name: projectName, options: firebaseOptions);
}

void setUpModule(final GetIt getIt) {
  setupPackageDependencies(getIt);
}

Future<void> postSetUpModule(
  final GetIt getIt, {
  required final bool isCrashlyticsEnabled,
}) async {
  final firebaseCrashlytics = getIt.get<FirebaseCrashlytics>();
  firebaseCrashlytics.setCrashlyticsCollectionEnabled(isCrashlyticsEnabled);
}
