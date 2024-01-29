import 'package:pokedex_builder/src/data/repository/pokedex_repository_impl.dart';
import 'package:pokedex_builder/src/exception/exceptions.dart';
import 'package:test/test.dart';

void main() {
  group(PokedexRepositoryImpl, () {
    late PokedexRepositoryImpl pokedexRepositoryImpl;

    setUp(() {
      pokedexRepositoryImpl = PokedexRepositoryImpl();
    });

    group('getPokedexEndIndex', () {
      test('should return valid end index if the regions is valid', () {
        expect(pokedexRepositoryImpl.getPokedexEndIndex('johto'), 251);
        expect(pokedexRepositoryImpl.getPokedexEndIndex('kanto'), 151);
      });

      test('should throw $UnknownRegionException if the regions is invalid',
          () {
        expect(
          () => pokedexRepositoryImpl.getPokedexEndIndex('region'),
          throwsA(isA<UnknownRegionException>()),
        );
      });
    });

    group('getPokedexStartIndex', () {
      test('should return valid start index if the regions is valid', () {
        expect(pokedexRepositoryImpl.getPokedexStartIndex('johto'), 152);
        expect(pokedexRepositoryImpl.getPokedexStartIndex('kanto'), 1);
      });

      test('should throw $UnknownRegionException if the regions is invalid',
          () {
        expect(
          () => pokedexRepositoryImpl.getPokedexEndIndex('region'),
          throwsA(isA<UnknownRegionException>()),
        );
      });
    });
  });
}
