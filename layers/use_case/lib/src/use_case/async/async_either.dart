import 'package:either_dart/either.dart';

typedef AsyncEither<L, R> = Future<Either<L, R>>;
