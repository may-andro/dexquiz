import 'package:dexquiz/run_flavor.dart';
import 'package:core/core.dart';
import 'package:dexquiz/flavors/kanto/firebase_options_kanto.dart';
import 'package:collection/collection.dart';

Future<void> main() async {
  const buildEnv = String.fromEnvironment('build_env', defaultValue: 'staging');
  final buildConfig = BuildConfig(
    buildEnvironment: BuildEnvironment.values.firstWhereOrNull(
          (env) => env.name == buildEnv,
        ) ??
        BuildEnvironment.staging,
    buildFlavor: BuildFlavor.kanto,
  );

  runFlavor(
    buildConfig: buildConfig,
    firebaseProjectName: 'kanto-dexquiz',
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );
}
