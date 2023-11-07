import 'package:firebase_core/firebase_core.dart';

enum BuildEnvironment { debug, qa, prod }

enum BuildFlavor { kanto, jhoto }

class BuildConfig {
  BuildConfig({
    required this.buildEnvironment,
    required this.buildFlavor,
    required this.firebaseProjectName,
    required this.firebaseOptions,
  });

  final BuildEnvironment buildEnvironment;
  final BuildFlavor buildFlavor;
  final String firebaseProjectName;
  final FirebaseOptions firebaseOptions;
}
