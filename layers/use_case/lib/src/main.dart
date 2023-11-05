import 'package:get_it/get_it.dart';
import 'package:use_case/src/di/di.dart';

Future<void> setUpModule(final GetIt getIt) async {
  setupPackageDependencies(getIt);
}
