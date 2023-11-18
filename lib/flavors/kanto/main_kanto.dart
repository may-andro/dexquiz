import 'package:dexquiz/run_flavor.dart';
import 'package:dexquiz/build_config.dart';
import 'package:dexquiz/flavors/kanto/firebase_options_kanto.dart';

final _buildConfig = BuildConfig(
  buildEnvironment: BuildEnvironment.prod,
  buildFlavor: BuildFlavor.kanto,
  firebaseProjectName: 'kanto-dexquiz',
  firebaseOptions: DefaultFirebaseOptions.currentPlatform,
);

Future<void> main() async {
  runFlavor(buildConfig: _buildConfig);
}
