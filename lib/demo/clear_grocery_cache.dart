import 'package:cache/cache.dart';

class ClearGroceryCache extends KeyValueCache<bool> {
  ClearGroceryCache(final SharedPreferences sharedPreferences)
      : super(sharedPreferences, 'clear_grocery_cache');

  @override
  bool deserializeValue(Map<String, dynamic> map) {
    return map['clear_cache'] as bool;
  }

  @override
  Map<String, dynamic> serializeValue(bool value) {
    return {'clear_cache': value};
  }

  @override
  Duration get timeToLive => const Duration(minutes: 1);
}
