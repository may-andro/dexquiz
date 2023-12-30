import 'dart:convert';

import 'package:cache/src/cache_system/cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class KeyValueCache<V> extends Cache {
  KeyValueCache(
    this._sharedPreferences,
    this._cacheKey,
  );

  final SharedPreferences _sharedPreferences;
  final String _cacheKey;

  V deserializeValue(Map<String, dynamic> map);

  Map<String, dynamic> serializeValue(V value);

  @override
  int get lastCachedTimestamp => _sharedPreferences.getInt(_expirationKey) ?? 0;

  Future<V?> get() async {
    final value = _sharedPreferences.getString(_cacheKey);
    if (value == null) return null;
    if (isExpired) {
      await delete();
      return null;
    }
    return deserializeValue(jsonDecode(value));
  }

  Future<bool> put(V value) {
    _sharedPreferences.setInt(
      _expirationKey,
      DateTime.now().millisecondsSinceEpoch,
    );
    return _sharedPreferences.setString(
      _cacheKey,
      jsonEncode(serializeValue(value)),
    );
  }

  Future<bool> delete() {
    _sharedPreferences.remove(_expirationKey);
    return _sharedPreferences.remove(_cacheKey);
  }

  String get _expirationKey => '$_cacheKey.expiration';
}
