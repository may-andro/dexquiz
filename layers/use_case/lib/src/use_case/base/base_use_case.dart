import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/base/use_case_mixin.dart';

abstract class BaseUseCase<O, I, F extends Failure, T>
    with UseCaseExecutionMixin<T> {
  String? _tempTag;

  BaseUseCase();

  T call(I input) {
    _tempTag = _tempTag ?? _tag;
    return executeWithInterceptor(
      tag: _tempTag ?? '',
      params: input,
      resultCallback: () => execute(input),
    );
  }

  T execute(I input);

  String get _tag => '${runtimeType}_${DateTime.now().microsecondsSinceEpoch}';

  void reportError(Object error, StackTrace st) {
    _tempTag = _tempTag ?? _tag;
    onError(_tempTag ?? '', error, st);
  }
}
