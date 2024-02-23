import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:use_case/use_case.dart';

class MockFetchPokedexUseCase extends Mock implements FetchPokedexUseCase {
  void mockRight(List<Pokemon> pokemons) {
    when(() => call(any())).thenAnswer((_) async => Right(pokemons));
  }

  void mockLeft() {
    when(() => call(any())).thenAnswer(
      (_) async => Left(UnknownFailure(cause: Exception())),
    );
  }
}
