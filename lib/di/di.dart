import 'package:dexquiz/build_config.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupAppModule(final BuildConfig buildConfig) {
  getIt.registerLazySingleton(() => buildConfig);
}
