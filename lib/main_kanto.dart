import 'package:dexquiz/build_config.dart';
import 'package:dexquiz/run_flavor.dart';

final _buildConfig = BuildConfig(
  buildEnvironment: BuildEnvironment.prod,
  buildFlavor: BuildFlavor.kanto,
);

void main() {
  runFlavor(_buildConfig);
}