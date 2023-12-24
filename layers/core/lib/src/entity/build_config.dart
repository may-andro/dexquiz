enum BuildEnvironment {
  debug,
  qa,
  prod;

  bool get isFirebaseEnabled => this == BuildEnvironment.prod;
}

enum BuildFlavor { kanto, johto }

class BuildConfig {
  BuildConfig({
    required this.buildEnvironment,
    required this.buildFlavor,
  });

  final BuildEnvironment buildEnvironment;
  final BuildFlavor buildFlavor;
}
