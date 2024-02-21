import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:use_case/use_case.dart';

class MockRemoveFavoritesUseCase extends Mock
    implements RemoveFavoritesUseCase {
  void mockRight() {
    when(() => call(any())).thenAnswer((_) async => Right(null));
  }

  void mockLeft() {
    when(() => call(any())).thenAnswer((_) async => Left(UnknownFailure()));
  }
}
