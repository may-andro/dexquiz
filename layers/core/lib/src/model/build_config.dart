enum BuildEnvironment {
  staging,
  prod;

  bool get isFirebaseEnabled => this == BuildEnvironment.prod;

  bool get isFeatureFlagCached => this == BuildEnvironment.staging;
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
