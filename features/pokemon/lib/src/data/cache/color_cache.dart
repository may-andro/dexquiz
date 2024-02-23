import 'package:cache/cache.dart';
import 'package:pokemon/src/data/entity/local/color_cache_entity.dart';

class ColorCache extends DBCache<ColorCacheEntity> {
  ColorCache(super.box);
}
