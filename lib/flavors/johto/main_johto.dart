import 'package:core/core.dart';
import 'package:dexquiz/run_flavor.dart';
import 'package:dexquiz/flavors/johto/firebase_options_johto.dart';
import 'package:collection/collection.dart';

Future<void> main() async {
  const buildEnv = String.fromEnvironment('build_env', defaultValue: 'staging');
  final buildConfig = BuildConfig(
    buildEnvironment: BuildEnvironment.values.firstWhereOrNull(
          (env) => env.name == buildEnv,
        ) ??
        BuildEnvironment.staging,
    buildFlavor: BuildFlavor.johto,
  );

  runFlavor(
    buildConfig: buildConfig,
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
    firebaseProjectName: 'johto-dexquiz',
  );
}
