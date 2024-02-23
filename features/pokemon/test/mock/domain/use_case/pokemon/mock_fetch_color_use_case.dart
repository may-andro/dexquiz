import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:pokemon/src/domain/model/pokemon_color.dart';
import 'package:use_case/use_case.dart';

class MockFetchColorUseCase extends Mock implements FetchColorUseCase {
  void mockRight(PokemonColor expected) {
    when(() => call(any())).thenAnswer((_) async => Right(expected));
  }

  void mockLeft(FetchColorFailure failure) {
    when(() => call(any())).thenAnswer((_) async => Left(failure));
  }
}
