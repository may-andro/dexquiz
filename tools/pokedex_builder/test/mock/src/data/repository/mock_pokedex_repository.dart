import 'package:mocktail/mocktail.dart';
import 'package:pokedex_builder/src/domain/repository/pokedex_repository.dart';

class MockPokedexRepository extends Mock implements PokedexRepository {
  void mockGetPokedexEndIndex(int expected) {
    when(() => getPokedexEndIndex(any())).thenReturn(expected);
  }

  void mockGetPokedexStartIndex(int expected) {
    when(() => getPokedexStartIndex(any())).thenReturn(expected);
  }
}
