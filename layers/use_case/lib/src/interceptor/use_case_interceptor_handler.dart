import 'package:use_case/src/interceptor/use_case_interceptor.dart';
import 'package:use_case/src/interceptor/use_case_interceptor_data_source.dart';

class UseCaseInterceptionHandler {
  void register(UseCaseInterceptor interceptor) {
    UseCaseInterceptorDataSource.registerInterceptor(interceptor);
  }
}
