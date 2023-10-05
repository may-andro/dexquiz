import 'package:pokedex_builder/src/domain/model/pokemon/pokemon.dart';
import 'package:pokedex_builder/src/domain/use_case/firestore/create_firestore_collection_use_case.dart';
import 'package:test/test.dart';

void main() {
  group(CreateFirestoreCollectionUseCase, () {
    late CreateFirestoreCollectionUseCase useCase;

    setUp(() {
      useCase = CreateFirestoreCollectionUseCase();
    });

    group('execute', () {
      test('should return a valid Firestore collection JSON', () async {
        final List<Pokemon> pokemons = [
          Pokemon(
            index: 1,
            name: 'pokemon1',
            baseExperience: 64,
            weight: 69,
            height: 7,
            imageUrl: '',
            abilities: [],
            moves: [],
            types: [],
            stats: [],
          ),
          Pokemon(
            index: 2,
            name: 'pokemon2',
            baseExperience: 64,
            weight: 69,
            height: 7,
            imageUrl: '',
            abilities: [],
            moves: [],
            types: [],
            stats: [],
          ),
        ];

        final result = await useCase.execute(pokemons);

        expect(result, isNotNull);
        expect(result.containsKey('fields'), true);
        expect(result['fields'].containsKey('pokemons'), true);
        expect(result['fields']['pokemons'].containsKey('arrayValue'), true);
        expect(
          result['fields']['pokemons']['arrayValue'].containsKey('values'),
          true,
        );
        expect(
          result['fields']['pokemons']['arrayValue']['values'],
          isA<List<dynamic>>(),
        );

        // Clean up or additional assertions as needed.
      });
    });
  });
}
