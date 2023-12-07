import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/base/base_no_param_use_case.dart';
import 'package:use_case/src/use_case/stream/stream_either.dart';

abstract class BaseNoParamStreamUseCase<O, F extends Failure>
    extends BaseNoParamUseCase<O, F, StreamEither<F, O>> {}
