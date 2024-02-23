import 'package:pokemon/src/data/entity/remote/pokemon_entity.dart';
import 'package:pokemon/src/data/mapper/pokemon_entity_mapper.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/domain/model/pokemon_color.dart';
import 'package:pokemon/src/domain/repository/pokemon_repository.dart';
import 'package:remote/remote.dart';

final class RemotePokemonRepository implements PokemonRepository {
  RemotePokemonRepository(this.restApiService);

  final RestApiService restApiService;

  @override
  Future<List<Pokemon>> fetchPokedex(String flavor) async {
    return [];
  }

  @override
  Future<Pokemon?> fetchPokemon(int index) async {
    final response = await restApiService.get<Map<String, dynamic>?>(
      'pokemon/$index',
    );
    if (response == null) {
      return null;
    }
    return PokemonEntity.fromJson(response).toPokemon();
  }

  @override
  Future<String?> fetchPokemonDescription(int index) async {
    return null;
  }

  @override
  Future<PokemonColor?> fetchPokemonColor(int index) async {
    return null;
  }
}
