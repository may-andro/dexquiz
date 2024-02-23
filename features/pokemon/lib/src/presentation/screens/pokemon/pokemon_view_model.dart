import 'package:pokemon/src/domain/domain.dart';
import 'package:pokemon/src/domain/model/pokemon_color.dart';
import 'package:pokemon/src/presentation/base/base.dart';

class PokemonViewModel extends BaseViewModel {
  PokemonViewModel(
    this._addToFavoritesUseCase,
    this._removeFavoritesUseCase,
    this._isFavoriteUseCase,
    this._fetchDescriptionUseCase,
    this._fetchColorUseCase,
  );

  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFavoritesUseCase _removeFavoritesUseCase;
  final IsFavoriteUseCase _isFavoriteUseCase;
  final FetchDescriptionUseCase _fetchDescriptionUseCase;
  final FetchColorUseCase _fetchColorUseCase;

  late Pokemon _pokemon;

  String? _description;

  PokemonColor? _pokemonColor;

  String? _errorMessage;

  Pokemon get pokemon => _pokemon;

  String? get description => _description;

  PokemonColor? get pokemonColor => _pokemonColor;

  String? get errorMessage => _errorMessage;

  Future<void> onInit(Pokemon pokemon) async {
    _pokemon = pokemon;
    await _getFavouriteStatus();
    await _getDescription();
    await _getColor();
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

  Future<void> _getColor() async {
    final either = await _fetchColorUseCase(pokemon.id);
    either.fold((left) {
      if (left is NullColorFailure) {
        _pokemonColor = null;
      } else {
        _pokemonColor = null;
      }
    }, (right) {
      _pokemonColor = right;
    });
  }
}
