import 'package:pokedex_builder/src/domain/repository/pokedex_repository.dart';
import 'package:pokedex_builder/src/exception/exceptions.dart';

const _regionKanto = 'kanto';
const _regionJohto = 'johto';

class PokedexRepositoryImpl implements PokedexRepository {
  @override
  int getPokedexEndIndex(String region) {
    switch (region) {
      case _regionKanto:
        return 151;
      case _regionJohto:
        return 251;
      default:
        throw UnknownRegionException(region);
    }
  }

  @override
  int getPokedexStartIndex(String region) {
    switch (region) {
      case _regionKanto:
        return 1;
      case _regionJohto:
        return 152;
      default:
        throw UnknownRegionException(region);
    }
  }
}
