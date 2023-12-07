import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/async/async_either.dart';
import 'package:use_case/src/use_case/base/base_use_case.dart';

abstract class BaseAsyncUseCase<O, I, F extends Failure>
    extends BaseUseCase<O, I, F, AsyncEither<F, O>> {}
