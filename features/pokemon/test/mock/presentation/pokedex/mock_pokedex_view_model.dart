import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/pokedex/pokedex_view_model.dart';

class MockPokedexViewModel extends Mock implements PokedexViewModel {
  void mockViewState(ViewState expected) {
    when(() => viewState).thenReturn(expected);
  }

  void mockOnInit() {
    when(() => onInit()).thenAnswer((_) async => null);
  }

  void mockFetchPokedex() {
    when(() => fetchPokedex()).thenAnswer((_) async => null);
  }

  void mockPokemons(List<Pokemon> list) {
    when(() => pokemons).thenReturn(list);
  }

  void mockErrorMessage(String error) {
    when(() => errorMessage).thenReturn(error);
  }
}
