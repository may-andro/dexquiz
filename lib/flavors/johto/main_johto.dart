import 'package:core/core.dart';
import 'package:dexquiz/run_flavor.dart';
import 'package:dexquiz/flavors/johto/firebase_options_johto.dart';

final _buildConfig = BuildConfig(
  buildEnvironment: BuildEnvironment.prod,
  buildFlavor: BuildFlavor.johto,
);

Future<void> main() async {
  runFlavor(
    buildConfig: _buildConfig,
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
    firebaseProjectName: 'johto-dexquiz',
  );
}
