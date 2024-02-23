import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:use_case/use_case.dart';

class MockFetchRandomPokemonUseCase extends Mock
    implements FetchRandomPokemonUseCase {
  void mockRight(Pokemon expected) {
    when(() => call()).thenAnswer((_) async => Right(expected));
  }

  void mockLeft(FetchRandomPokemonFailure failure) {
    when(() => call()).thenAnswer((_) async => Left(failure));
  }
}
