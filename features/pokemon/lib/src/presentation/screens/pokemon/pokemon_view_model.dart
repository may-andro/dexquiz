import 'package:pokemon/src/domain/domain.dart';
import 'package:pokemon/src/presentation/base/base.dart';

class PokemonViewModel extends BaseViewModel {
  PokemonViewModel(
    this._addToFavoritesUseCase,
    this._removeFavoritesUseCase,
    this._isFavoriteUseCase,
    this._fetchDescriptionUseCase,
  );

  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFavoritesUseCase _removeFavoritesUseCase;
  final IsFavoriteUseCase _isFavoriteUseCase;
  final FetchDescriptionUseCase _fetchDescriptionUseCase;

  late Pokemon _pokemon;

  String? _description;

  Pokemon get pokemon => _pokemon;

  String? get description => _description;

  void onInit(Pokemon pokemon) async {
    _pokemon = pokemon;
    (await _isFavoriteUseCase(pokemon.id)).fold((left) {
      // do nothing
    }, (right) {
      _pokemon = _pokemon = _pokemon.copyWith(isFavorite: right);
    });
    (await _fetchDescriptionUseCase(pokemon.id)).fold((left) {
      if (left is NullDescriptionFailure) {
        _description = 'No description found!';
      } else {
        _description =
            'Failed to fetch the description due to unknown error: ${left.cause}';
      }
    }, (right) {
      _description = right;
    });
    notifyListeners();
  }

  Future<void> updateFavouriteStatus() async {
    if (_pokemon.isFavorite) {
      await _removeFavoritesUseCase(pokemon.id);
      _pokemon = _pokemon.copyWith(isFavorite: false);
    } else {
      _pokemon = _pokemon.copyWith(isFavorite: true);
      await _addToFavoritesUseCase(pokemon.id);
    }
    notifyListeners();
  }
}
