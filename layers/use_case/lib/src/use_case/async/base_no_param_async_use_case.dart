import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/async/async_either.dart';
import 'package:use_case/src/use_case/base/base_no_param_use_case.dart';

abstract class BaseNoParamAsyncUseCase<O, F extends Failure>
    extends BaseNoParamUseCase<O, F, AsyncEither<F, O>> {}
