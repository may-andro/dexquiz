import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';

import '../../domain/model/test_pokemon.dart';

class MockPokemonViewModel extends Mock implements PokemonViewModel {
  void mockOnInit() {
    when(() => onInit(testPokemon)).thenAnswer((_) async => null);
  }

  void mockUpdateFavouriteStatus() {
    when(() => updateFavouriteStatus()).thenAnswer((_) async => null);
  }

  void mockPokemons(Pokemon expected) {
    when(() => pokemon).thenReturn(expected);
  }

  void mockErrorMessage(String? expected) {
    when(() => errorMessage).thenReturn(expected);
  }

  void mockDescription(String? expected) {
    when(() => description).thenReturn(expected);
  }
}
