import 'package:either_dart/either.dart';

typedef StreamEither<L, R> = Stream<Either<L, R>>;
