import 'package:core/core.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/domain/use_case/pokemon/fetch_pokedex_use_case.dart';
import 'package:pokemon/src/presentation/base/view_model/base_view_model.dart';

class PokedexViewModel extends BaseViewModel {
  PokedexViewModel(
    this._fetchPokedexUseCase,
    this._buildConfig,
  );

  final FetchPokedexUseCase _fetchPokedexUseCase;
  final BuildConfig _buildConfig;

  late List<Pokemon> _pokemons;

  late String _errorMessage;

  List<Pokemon> get pokemons => _pokemons;

  String get errorMessage => _errorMessage;

  Future<void> onInit() async {
    await fetchPokedex();
  }

  Future<void> fetchPokedex() async {
    setLoadingState();
    final pokemons = await _fetchPokedexUseCase(_buildConfig.buildFlavor.name);

    pokemons.fold((left) {
      _errorMessage = 'Failed to fetch pokedex due to: ${left.cause}';
      setErrorState();
    }, (right) {
      _pokemons = right;
      setSuccessState();
    });
  }
}
