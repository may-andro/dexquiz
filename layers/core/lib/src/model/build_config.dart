enum BuildEnvironment {
  staging,
  prod;

  bool get isFirebaseEnabled => this == BuildEnvironment.prod;

  bool get isFeatureFlagCached => this == BuildEnvironment.staging;

  bool get isRemoteLoggingEnabled => this == BuildEnvironment.staging;

  bool get isSplashDescriptive => this == BuildEnvironment.staging;
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
