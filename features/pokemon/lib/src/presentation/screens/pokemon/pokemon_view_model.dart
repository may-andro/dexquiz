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

  String? _errorMessage;

  Pokemon get pokemon => _pokemon;

  String? get description => _description;

  String? get errorMessage => _errorMessage;

  Future<void> onInit(Pokemon pokemon) async {
    _pokemon = pokemon;
    await _getFavouriteStatus();
    await _getDescription();
    notifyListeners();
  }

  Future<void> updateFavouriteStatus() async {
    if (_pokemon.isFavorite) {
      final either = await _removeFavoritesUseCase(pokemon.id);
      either.fold((left) {
        _errorMessage =
            'Failed to update the favorite status of the ${_pokemon.name}';
      }, (right) {
        _errorMessage = null;
        _pokemon = _pokemon.copyWith(isFavorite: false);
      });
    } else {
      final either = await _addToFavoritesUseCase(pokemon.id);
      either.fold((left) {
        _errorMessage =
            'Failed to update the favorite status of the ${_pokemon.name}';
      }, (right) {
        _errorMessage = null;
        _pokemon = _pokemon.copyWith(isFavorite: true);
      });
    }
    _errorMessage = 'test';
    notifyListeners();
  }

  Future<void> _getFavouriteStatus() async {
    final favoriteEither = await _isFavoriteUseCase(pokemon.id);
    favoriteEither.fold((left) {
      _errorMessage =
          'Failed to get the favorite status of the ${_pokemon.name}';
    }, (right) {
      _errorMessage = null;
      _pokemon = _pokemon.copyWith(isFavorite: right);
    });
  }

  Future<void> _getDescription() async {
    final either = await _fetchDescriptionUseCase(pokemon.id);
    either.fold((left) {
      if (left is NullDescriptionFailure) {
        _description = 'No description found!';
      } else {
        _description =
            'Failed to fetch the description due to unknown error: ${left.cause}';
      }
    }, (right) {
      _description = right;
    });
  }
}
