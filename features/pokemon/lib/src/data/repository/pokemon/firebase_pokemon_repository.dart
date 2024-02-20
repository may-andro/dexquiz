import 'package:firebase/firebase.dart';
import 'package:pokemon/src/data/entity/firebase/pokemon_entity.dart';
import 'package:pokemon/src/data/mapper/fb_pokemon_entity_mapper.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/domain/repository/pokemon_repository.dart';

final class FirebasePokemonRepository implements PokemonRepository {
  FirebasePokemonRepository(this._getDocumentUseCase);

  final GetDocumentUseCase _getDocumentUseCase;

  @override
  Future<List<Pokemon>> fetchPokedex(String flavor) async {
    final getDocumentParam = GetDocumentParam('pokedex', flavor);
    final pokedexJson = await _getDocumentUseCase(getDocumentParam);
    if (pokedexJson == null) {
      return [];
    }
    final pokemons = pokedexJson['pokemons'] as List<dynamic>;
    return pokemons.map((pokemon) {
      return PokemonEntity.fromJson(pokemon as Map<String, dynamic>)
          .toPokemon();
    }).toList();
  }

  @override
  Future<Pokemon?> fetchPokemon(int index) async {
    return null;
  }

  @override
  Future<String?> fetchPokemonDescription(int index) async {
    final getDocumentParam = GetDocumentParam('description', '$index');
    final json = await _getDocumentUseCase(getDocumentParam);
    if (json == null) {
      return null;
    }
    return json['description'] as String;
  }
}
