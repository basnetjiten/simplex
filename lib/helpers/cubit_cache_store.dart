class CubitCacheStoreHelper {
  CubitCacheStoreHelper._();

  static final Map<String, dynamic> _cache = {};

  static T? get<T>(String key) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }

  static void set(String key, dynamic value) {
    _cache[key] = value;
  }

  static void remove(String key) {
    _cache.remove(key);
  }

  static void clearAll() {
    _cache.clear();
  }
}
