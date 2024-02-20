import 'package:cache/cache.dart';
import 'package:pokemon/src/data/entity/local/description_cache_entity.dart';

class DescriptionCache extends DBCache<DescriptionCacheEntity> {
  DescriptionCache(super.box);
}
