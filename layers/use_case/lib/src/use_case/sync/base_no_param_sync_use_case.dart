import 'package:either_dart/either.dart';
import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/base/base_no_param_use_case.dart';

abstract class BaseNoParamSyncUseCase<O, F extends Failure>
    extends BaseNoParamUseCase<O, F, Either<F, O>> {}
