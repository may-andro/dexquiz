import 'package:pokedex_builder/src/domain/model/pokemon/pokemon.dart';

class CreateFirestoreCollectionUseCase {
  Future<Map<String, dynamic>> execute(List<Pokemon> pokemons) async {
    return {
      'fields': {
        'pokemons': {
          'arrayValue': {
            'values': pokemons
                .map((pokemon) => pokemon.toFirestoreCollectionJson())
                .toList(),
          }
        },
      },
    };
  }
}
