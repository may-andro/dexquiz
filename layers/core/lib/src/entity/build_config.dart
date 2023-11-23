import 'package:firebase/firebase.dart';

enum BuildEnvironment { debug, qa, prod }

enum BuildFlavor { kanto, johto }

class BuildConfig {
  BuildConfig({
    required this.buildEnvironment,
    required this.buildFlavor,
    required this.firebaseProjectName,
    required this.firebaseOptions,
    required this.isCrashlyticsEnabled,
  });

  final BuildEnvironment buildEnvironment;
  final BuildFlavor buildFlavor;
  final String firebaseProjectName;
  final FirebaseOptions firebaseOptions;
  final bool isCrashlyticsEnabled;
}
