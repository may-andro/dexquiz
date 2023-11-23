import 'package:core/core.dart';
import 'package:dexquiz/run_flavor.dart';
import 'package:dexquiz/flavors/johto/firebase_options_johto.dart';

final _buildConfig = BuildConfig(
  buildEnvironment: BuildEnvironment.prod,
  buildFlavor: BuildFlavor.johto,
  firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  firebaseProjectName: 'johto-dexquiz',
  isCrashlyticsEnabled: true,
);

Future<void> main() async {
  runFlavor(buildConfig: _buildConfig);
}
