import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/base/base_use_case.dart';
import 'package:use_case/src/use_case/stream/stream_either.dart';

abstract class BaseStreamUseCase<O, I, F extends Failure>
    extends BaseUseCase<O, I, F, StreamEither<F, O>> {}
