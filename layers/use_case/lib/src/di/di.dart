import 'package:get_it/get_it.dart';
import 'package:use_case/src/interceptor/use_case_interceptor_handler.dart';

void setupPackageDependencies(final GetIt getIt) {
  getIt.registerFactory(() => UseCaseInterceptionHandler());
}
