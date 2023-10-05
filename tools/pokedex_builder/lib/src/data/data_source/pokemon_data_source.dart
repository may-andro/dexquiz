import 'package:pokedex_builder/src/data/entity/pokemon/remote_pokemon.dart';
import 'package:pokedex_builder/src/data/service/remote_client_service.dart';
import 'package:pokedex_builder/src/exception/exceptions.dart';

abstract interface class PokemonDataSource {
  Future<RemotePokemon> fetchPokemon({required int index});
}

class PokemonDataSourceImpl implements PokemonDataSource {
  PokemonDataSourceImpl(this._remoteClientService);

  final RemoteClientService _remoteClientService;

  @override
  Future<RemotePokemon> fetchPokemon({required int index}) async {
    try {
      final response = await _remoteClientService.getApiCall('pokemon/$index');
      print('PokemonDataSourceImpl.fetchPokemon ${response.data}');
      return RemotePokemon.fromJson(response.data);
    } on TypeError catch (e) {
      throw ParsingException(e.stackTrace.toString());
    } catch (e) {
      rethrow;
    }
  }
}
