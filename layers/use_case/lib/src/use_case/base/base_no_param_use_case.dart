import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/base/use_case_mixin.dart';

abstract class BaseNoParamUseCase<O, F extends Failure, T>
    with UseCaseExecutionMixin<T> {
  T call() {
    return executeWithInterceptor(
      tag: tag,
      params: null,
      resultCallback: () => execute(),
    );
  }

  T execute();

  String get tag => '${runtimeType}_${DateTime.now().microsecondsSinceEpoch}';

  void reportError(Object error, StackTrace st) => onError(tag, error, st);
}
