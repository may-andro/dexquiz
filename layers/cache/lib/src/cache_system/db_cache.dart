import 'package:cache/src/cache_system/cache.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BoxEntity {
  @HiveField(0)
  int cachedTimestamp;
  @HiveField(1)
  String key;

  BoxEntity({
    required this.cachedTimestamp,
    required this.key,
  });
}

class DBCache<T extends BoxEntity> extends Cache {
  DBCache(this._box);

  final Box<T> _box;
  int _cacheTimestamp = 0;

  Future<List<T>> get all async {
    final cachedEntities = _box.values.toList();
    final filteredEntries = cachedEntities.where((entity) {
      _cacheTimestamp = entity.cachedTimestamp;
      if (isExpired) {
        delete(entity.key);
      }
      return !isExpired;
    }).toList();
    return filteredEntries;
  }

  Future<T?> get(dynamic key) async {
    final entity = _box.get(key);
    if(entity == null) return null;
    _cacheTimestamp = entity.cachedTimestamp;
    if (isExpired) {
      await delete(key);
      return null;
    }
    return entity;
  }

  Future put(T entity) async {
    entity.cachedTimestamp = DateTime.now().millisecondsSinceEpoch;
    return _box.put(entity.key, entity);
  }

  Future putAll(List<T> entities) async {
    Map<String, T> map = {};
    for (var entity in entities) {
      entity.cachedTimestamp = DateTime.now().millisecondsSinceEpoch;
      map[entity.key] = entity;
    }
    return _box.putAll(map);
  }

  Future delete(dynamic key) => _box.delete(key);

  Future deleteAll() => _box.clear();

  Future close() => _box.close();

  @override
  int get lastCachedTimestamp => _cacheTimestamp;
}

/// This could be another way, but unit tests are tricky as Hive needs to be initialised.
/*class DBCache<T extends BoxEntity> extends Cache {
  DBCache(this._boxName);

  final String _boxName;

  late Box<T> _box;
  bool _isInitialised = false;
  int _cacheTimestamp = 0;

  Future get _initCache async {
    if (_isInitialised) return;
    _box = await Hive.openBox<T>('hive_$_boxName');
    _isInitialised = true;
  }

  Future<List<T>> get all async {
    await _initCache;
    final cachedEntities = _box.values.toList();
    final filteredEntries = cachedEntities.where((entity) {
      _cacheTimestamp = entity.cachedTimestamp;
      if (isExpired) {
        delete(entity.key);
      }
      return !isExpired;
    }).toList();
    return filteredEntries;
  }

  Future<T?> get(dynamic key) async {
    await _initCache;
    final entity = _box.get(key);
    _cacheTimestamp = entity?.cachedTimestamp ?? 0;
    if (isExpired) {
      delete(key);
      return null;
    }
    return entity;
  }

  Future put(T entity) async {
    await _initCache;
    entity.cachedTimestamp = DateTime.now().millisecondsSinceEpoch;
    return _box.put(entity.key, entity);
  }

  Future putAll(List<T> entities) async {
    await _initCache;
    Map<String, T> map = {};
    for (var entity in entities) {
      entity.cachedTimestamp = DateTime.now().millisecondsSinceEpoch;
      map[entity.key] = entity;
    }
    return _box.putAll(map);
  }

  Future delete(dynamic key) => _box.delete(key);

  Future deleteAll() => _box.clear();

  Future close() => _box.close();

  @override
  int get lastCachedTimestamp => _cacheTimestamp;
}*/
