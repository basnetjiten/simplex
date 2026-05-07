/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'cubit_cache_store.dart';

/// Adds simple key-value caching to any Cubit.
///
/// The cache key is derived automatically from the concrete cubit's
/// [runtimeType], so each subclass gets its own isolated cache slot
/// without any manual configuration.
///
/// Usage:
/// ```dart
/// class MyCubit extends Cubit<MyState> with CubitCacheMixin {
///   void load() {
///     final cached = readFromCache<List<Item>>();
///     if (cached != null) { /* show immediately */ }
///     // ... fetch fresh data, then:
///     storeToCache<List<Item>>(freshData);
///   }
/// }
/// ```
mixin CubitCacheMixin {
  /// Unique cache key derived from the concrete cubit's runtime type.
  String get cacheKey => '${runtimeType}Data';

  /// Returns the cached value cast to [T], or `null` if no entry exists.
  T? readFromCache<T>() => CubitCacheStoreHelper.get<T>(cacheKey);

  /// Persists [value] under this cubit's [cacheKey].
  void storeToCache<T>(T value) => CubitCacheStoreHelper.set(cacheKey, value);

  /// Removes this cubit's entry from the cache store.
  void clearCache() => CubitCacheStoreHelper.remove(cacheKey);
}
