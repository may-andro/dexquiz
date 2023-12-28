import 'package:cache/cache.dart';
import 'package:dexquiz/demo/grocery.dart';

/*class GroceryCache extends DBCache<Grocery> {
  GroceryCache() : super('grocery_box');

  @override
  Duration get timeToLive => const Duration(minutes: 1);
}*/


class GroceryCache extends DBCache<Grocery> {
  GroceryCache(super.box);

  @override
  Duration get timeToLive => const Duration(minutes: 1);
}