import 'package:dexquiz/run_flavor.dart';
import 'package:dexquiz/build_config.dart';
import 'package:dexquiz/flavors/johto/firebase_options_johto.dart';

final _buildConfig = BuildConfig(
    buildEnvironment: BuildEnvironment.prod,
    buildFlavor: BuildFlavor.jhoto,
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
    firebaseProjectName: 'johto-dexquiz');

Future<void> main() async {
  runFlavor(buildConfig: _buildConfig);
}
