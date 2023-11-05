import 'package:use_case/src/interceptor/use_case_interceptor_data_source.dart';

mixin UseCaseExecutionMixin<T> {
  final _interceptors = UseCaseInterceptorDataSource.registeredInterceptorList;

  T executeWithInterceptor({
    required String tag,
    required dynamic params,
    required T Function() resultCallback,
  }) {
    for (var interceptor in _interceptors) {
      interceptor.onCall<dynamic>(tag, params);
    }
    try {
      final result = resultCallback();
      for (var interceptor in _interceptors) {
        interceptor.onSuccess(tag, result);
      }
      return result;
    } catch (error, stackTrace) {
      onError(tag, error, stackTrace);
      rethrow;
    }
  }

  void onError(String tag, Object error, StackTrace stackTrace) {
    for (var interceptor in _interceptors) {
      interceptor.onError(tag, error, stackTrace);
    }
  }
}
