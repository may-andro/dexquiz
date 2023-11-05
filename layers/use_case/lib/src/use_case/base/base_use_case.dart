import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/base/use_case_mixin.dart';

abstract class BaseUseCase<O, I, F extends Failure, T>
    with UseCaseExecutionMixin<T> {
  T call(I input) {
    return executeWithInterceptor(
      tag: tag,
      params: input,
      resultCallback: () => execute(input),
    );
  }

  T execute(I input);

  String get tag => '${runtimeType}_${DateTime.now().microsecondsSinceEpoch}';

  void reportError(Object error, StackTrace st) => onError(tag, error, st);
}
