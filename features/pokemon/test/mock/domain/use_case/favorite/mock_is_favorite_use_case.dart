import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:use_case/use_case.dart';

class MockIsFavoriteUseCase extends Mock implements IsFavoriteUseCase {
  void mockRight(bool flag) {
    when(() => call(any())).thenAnswer((_) async => Right(flag));
  }

  void mockLeft() {
    when(() => call(any())).thenAnswer((_) async => Left(UnknownFailure()));
  }
}
