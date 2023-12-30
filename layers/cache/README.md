## Table of Contents

- [Getting Started](#getting-started)
- [Database Cache](#database-cache)
- [Key Value Cache](#key-value-cache)
- [Memory Cache](#memory-cache)

## Getting Started

`Cache` module provides various caching strategy required during the app lifecycle.

There are 3 types of cache strategy exposed out of the module:
- Database Caching: This is used when the object to cache is complex.
- Key Value Cache: This is used to cache primitive types data and small objects.
- Memory Cache: This is used to cache an object during app's session only.

## Database Cache

We are using [Hive](https://docs.hivedb.dev/#/) as the database for the caching complex objects.
The module exposes `DBCache` which provides base functionality for using this cache. 
Here is an example with steps needs for successful creation of the `DBCache`:

- Step 1: Create the object needs to be caches as `HiveType`. Run the `build_runner` command for code generation.
```dart
import 'package:cache/cache.dart';

part 'grocery.g.dart';

@HiveType(typeId: 1)
class Grocery extends BoxEntity {
  @HiveField(2)
  final String item;
  @HiveField(3)
  final int quantity;
  @HiveField(4)
  final String metrics;

  Grocery({
    required this.item,
    required this.quantity,
    required this.metrics,
  }) : super(cachedTimestamp: 0, key: item);
}
```
- Step 2: Create the concrete implementation of the `DBCache`. Override the `timeToLive` to define the expiry time for the cache.
```dart
import 'package:cache/cache.dart';
import 'grocery.dart';

class GroceryCache extends DBCache<Grocery> {
  GroceryCache(super.box);

  @override
  Duration get timeToLive => const Duration(minutes: 1);
}
```
- Step 3: Register the newly created cache in the `module_configurator.dart`.
```dart
final hive = serviceLocator.get<HiveInterface>();
hive.registerAdapter(GroceryAdapter());
final groceryBox = await hive.openBox<Grocery>('grocery_box');
serviceLocator.registerSingleton(() => GroceryCache(groceryBox));
```
- Step 4: Use the concrete implementation of `DBCache` in the app.
```dart
appServiceLocator.get<GroceryCache>();
```

## Key Value Cache

The module exposes `Key-Value` cache using [SharedPreferences](https://pub.dev/packages/shared_preferences). This type is caches is used to store primitive type data types in the app.
The app exposes `KeyValueCache` which provide various functionality to cache the objects in the app.
Here is an example with steps needs for successful creation of the `KeyValueCache`:

- Step 1: Create the concrete implementation for the `KeyValueCache`. Override `timeToLive` for defining the expiration time.
```dart
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
```
- Step 2: Register the newly created cache in the `module_configurator.dart`.
```dart
final clearGroceryCache = ClearGroceryCache(serviceLocator.get<SharedPreferences>());
serviceLocator.registerSingleton(() => clearGroceryCache);
```
- Step 3: Use the concrete implementation of `KeyValueCache` in the app.
```dart
appServiceLocator.get<ClearGroceryCache>();
```

## Memory Cache
The module exposes `temporary` or `in memeory `cache through `MemoryCache`.
Here is an example with steps needs for successful creation of the `MemoryCache`:

- Step 1: Create the concrete implementation for the `MemoryCache`. Override `timeToLive` for defining the expiration time.
```dart
class TestMemoryCache extends MemoryCache<String> {
  @override
  Duration get timeToLive => const Duration(milliseconds: 300);
}
```
- Step 2: Register the newly created cache in the `module_configurator.dart`.
```dart
serviceLocator.registerSingleton(() => TestMemoryCache());
```
- Step 3: Use the concrete implementation of `MemoryCache` in the app.
```dart
appServiceLocator.get<TestMemoryCache>();
```
