import 'package:pokemon/src/data/repository/pokemon/cached_pokemon_repository.dart';
import 'package:pokemon/src/data/repository/pokemon/firebase_pokemon_repository.dart';
import 'package:pokemon/src/data/repository/pokemon/remote_pokemon_repository.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/domain/model/pokemon_color.dart';
import 'package:pokemon/src/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final FirebasePokemonRepository _firebaseDelegate;
  final RemotePokemonRepository _remoteDelegate;
  final CachedPokemonRepository _cachedDelegate;

  PokemonRepositoryImpl(
    this._firebaseDelegate,
    this._remoteDelegate,
    this._cachedDelegate,
  );

  final _sessionPokedex = <Pokemon>[];

  @override
  Future<List<Pokemon>> fetchPokedex(String flavor) async {
    if (_sessionPokedex.isEmpty) {
      var pokedex = await _cachedDelegate.fetchPokedex(flavor);
      if (pokedex.isEmpty) {
        pokedex = await _firebaseDelegate.fetchPokedex(flavor);
        if (pokedex.isNotEmpty) {
          _cachedDelegate.setPokemonCache(pokedex);
        }
      }
      pokedex.sort((a, b) => a.id.compareTo(b.id));
      _sessionPokedex.addAll(pokedex);
    }
    return _sessionPokedex;
  }

  @override
  Future<Pokemon?> fetchPokemon(int index) async {
    if (_sessionPokedex.isEmpty) {
      var pokemon = await _cachedDelegate.fetchPokemon(index);
      if (pokemon == null) {
        pokemon = await _remoteDelegate.fetchPokemon(index);
      }
      return pokemon;
    }
    return _sessionPokedex[index];
  }

  @override
  Future<String?> fetchPokemonDescription(int index) async {
    String? description = await _cachedDelegate.fetchPokemonDescription(index);
    if (description == null) {
      description = await _firebaseDelegate.fetchPokemonDescription(index);
      if (description != null) {
        _cachedDelegate.setDescriptionCache(index, description);
      }
    }
    return description;
  }

  @override
  Future<PokemonColor?> fetchPokemonColor(int index) async {
    var pokemonColor = await _cachedDelegate.fetchPokemonColor(index);
    if (pokemonColor == null) {
      pokemonColor = await _firebaseDelegate.fetchPokemonColor(index);
      if (pokemonColor != null) {
        _cachedDelegate.setColorCache(index, pokemonColor);
      }
    }
    return pokemonColor;
  }
}
