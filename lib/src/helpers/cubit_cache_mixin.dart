/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'cubit_cache_store.dart';

mixin CubitCacheMixin {
  /// Builds key from runtime cubit name. Can be overridden for unique instances of same type.
  String get cacheKey => '${runtimeType}Data';

  /// Read cached value
  T? readFromCache<T>() {
    return CubitCacheStoreHelper.get<T>(cacheKey);
  }

  /// Write cached value
  void storeToCache<T>(T value) {
    CubitCacheStoreHelper.set(cacheKey, value);
  }

  /// Clear cache for this cubit only
  void clearCache() {
    CubitCacheStoreHelper.remove(cacheKey);
  }
}
