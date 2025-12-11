import 'package:simplex/helpers/cubit_cache_store.dart';

mixin CubitCacheMixin {
  /// Builds key from runtime cubit name
  String get _cacheKey => '${runtimeType}Data';

  /// Read cached value
  T? readFromCache<T>() {
    return CubitCacheStoreHelper.get<T>(_cacheKey);
  }

  /// Write cached value
  void storeToCache(dynamic value) {
    CubitCacheStoreHelper.set(_cacheKey, value);
  }

  /// Clear cache for this cubit only
  void clearCache() {
    CubitCacheStoreHelper.remove(_cacheKey);
  }
}
