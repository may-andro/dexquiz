import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/pokedex/pokedex_view_model.dart';

import '../../../mock/domain/model/test_pokemon.dart';
import '../../../mock/domain/use_case/pokemon/mock_fetch_pokedex_use_case.dart';

void main() {
  group(PokedexViewModel, () {
    late PokedexViewModel pokedexViewModel;

    late BuildConfig buildConfig;
    late MockFetchPokedexUseCase mockFetchPokedexUseCase;

    setUp(() {
      buildConfig = BuildConfig(
        buildEnvironment: BuildEnvironment.staging,
        buildFlavor: BuildFlavor.kanto,
      );
      mockFetchPokedexUseCase = MockFetchPokedexUseCase();

      pokedexViewModel = PokedexViewModel(
        mockFetchPokedexUseCase,
        buildConfig,
      );
    });

    group('fetchPokedex', () {
      test('should set ${ViewState.error} when error occurs', () async {
        mockFetchPokedexUseCase.mockLeft();

        await pokedexViewModel.fetchPokedex();

        expect(pokedexViewModel.isStateError, true);
      });

      test('should set ${ViewState.success} when data is received', () async {
        mockFetchPokedexUseCase.mockRight([testPokemon]);

        await pokedexViewModel.fetchPokedex();

        expect(pokedexViewModel.isStateSuccess, true);
        expect(pokedexViewModel.pokemons.length, 1);
      });
    });
  });
}
