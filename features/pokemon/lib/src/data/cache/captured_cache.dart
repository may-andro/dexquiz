import 'package:cache/cache.dart';
import 'package:pokemon/src/data/entity/local/captured_cache_entity.dart';

class CapturedCache extends DBCache<CapturedCacheEntity> {
  CapturedCache(super.box);
}
