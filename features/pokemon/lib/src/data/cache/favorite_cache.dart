import 'package:cache/cache.dart';
import 'package:pokemon/src/data/entity/local/favorite_cache_entity.dart';

class FavoriteCache extends DBCache<FavoriteCacheEntity> {
  FavoriteCache(super.box);
}
