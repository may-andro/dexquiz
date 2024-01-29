import 'package:either_dart/either.dart';
import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/base/base_use_case.dart';

abstract class BaseSyncUseCase<O, I, F extends Failure>
    extends BaseUseCase<O, I, F, Either<F, O>> {}
