enum BuildEnvironment { debug, qa, prod }

enum BuildFlavor { kanto, jhoto }

class BuildConfig {
  BuildConfig({
    required this.buildEnvironment,
    required this.buildFlavor,
  });

  final BuildEnvironment buildEnvironment;
  final BuildFlavor buildFlavor;
}