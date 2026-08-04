/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 27/03/2026
 */

import '../base/simplex_base_bloc.dart';
import '../helpers/cubit_cache_mixin.dart';
import '../typedefs/typedefs.dart';
import 'paging_cancel_token.dart';
import 'paging_state.dart';

/// A generic paginated data cubit that handles data loading, searching, and caching.
///
/// [K] — the type of the pagination key/cursor (e.g. `int` for page numbers,
///        `String` for cursor-based APIs).
/// [T] — the type of each list item.
///
/// ### Basic usage
/// ```dart
/// final cubit = PagingCubit<int, User>(
///   fetchFn: (page, search) async {
///     final res = await api.getUsers(page: page, search: search);
///     return (res.items, res.nextPage);
///   },
///   initialKey: 1,
/// );
///
/// await cubit.fetchNext(); // loads first page
/// await cubit.fetchNext(); // loads second page
/// await cubit.refresh();   // resets and reloads from initialKey
/// ```
///
/// ### Caching
/// Pass `useCache: true` to hydrate the first page from cache on startup.
/// Only the first page is cached — subsequent pages are always fetched live.
/// The cache is skipped entirely when a search query is active.
class PagingCubit<K, T> extends SimplexCubit<PagingState<K, T>>
    with CubitCacheMixin {
  /// Creates a [PagingCubit].
  PagingCubit({
    required this.fetchFn,
    required K initialKey,
    this.useCache = false,
  }) : super(PagingState<K, T>(initialKey: initialKey)) {
    if (useCache) {
      final List<T>? cachedItems = readFromCache<List<T>>();
      if (cachedItems != null) {
        emit(state.copyWith(items: cachedItems));
      }
    }
  }

  /// The function used to fetch a page of data.
  final PagingFetchFn<K, T> fetchFn;

  /// Whether to cache the first page for faster initial rendering.
  final bool useCache;

  // ── Derived state helpers ─────────────────────────────────────────────────

  /// True when no page has been successfully loaded yet.
  bool get isFirstLoad => state.items.isEmpty;

  /// True when the search field contains a non-empty query.
  bool get isSearchActive => state.search != null && state.search!.isNotEmpty;

  // ── Public API ────────────────────────────────────────────────────────────

  /// Loads the next page of data.
  ///
  /// - On the very first call, this loads from [initialKey].
  /// - Subsequent calls use the [nextKey] from the previous fetch.
  /// - No-ops if a fetch is already in progress or there are no more pages.
  Future<void> fetchNext() async {
    if (state.isLoading || !state.hasNextPage) return;

    final K? key = isFirstLoad ? state.initialKey : state.nextKey;
    if (key == null) return;

    await _fetch(key: key, isRefresh: isFirstLoad);
  }

  /// Resets pagination and reloads from the [initialKey].
  Future<void> refresh() async {
    final K? initialKey = state.initialKey;
    if (initialKey == null) return;
    await _fetch(key: initialKey, isRefresh: true);
  }

  /// Updates the search query, resets pagination, and fetches the first page.
  Future<void> changeSearch(String? newSearch) async {
    _cancelCurrent();
    emit(PagingState<K, T>(initialKey: state.initialKey, search: newSearch));
    await fetchNext();
  }

  /// Cancels any in-flight request and clears the loading indicator.
  void cancel() {
    _cancelCurrent();
    emit(state.copyWith(isLoading: false, cancelToken: null));
  }

  // ── List mutation helpers ─────────────────────────────────────────────────

  /// Inserts [item] at the beginning of the list.
  void prependItem(T item) =>
      emit(state.copyWith(items: [item, ...state.items]));

  /// Appends [item] to the end of the list.
  void appendItem(T item) =>
      emit(state.copyWith(items: [...state.items, item]));

  /// Removes the item whose ID matches [id].
  void deleteItem({required String id, required String Function(T) getId}) {
    emit(
      state.copyWith(
        items: state.items.where((item) => getId(item) != id).toList(),
      ),
    );
  }

  /// Replaces the item whose ID matches [id] with [updatedItem].
  void updateItem({
    required String id,
    required T updatedItem,
    required String Function(T) getId,
  }) {
    final List<T> items = state.items;
    if (items.isEmpty) return;

    final int index = items.indexWhere((item) => getId(item) == id);
    if (index == -1) return;

    final List<T> updated = List<T>.from(items)..[index] = updatedItem;
    emit(state.copyWith(items: updated));
  }

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  @override
  Future<void> close() {
    _cancelCurrent();
    return super.close();
  }

  // ── Internal ──────────────────────────────────────────────────────────────

  void _cancelCurrent() => state.cancelToken?.cancel();

  Future<void> _fetch({required K key, bool isRefresh = false}) async {
    _cancelCurrent();
    final PagingCancelToken cancelToken = PagingCancelToken();

    emit(
      state.copyWith(isLoading: true, error: null, cancelToken: cancelToken),
    );

    try {
      final (List<T> result, K? nextKey) = await fetchFn(key, state.search);

      if (cancelToken.isCancelled) return;

      if (isRefresh && useCache && !isSearchActive) {
        storeToCache<List<T>>(result);
      }

      final List<T> items = isRefresh ? result : [...state.items, ...result];

      emit(
        state.copyWith(
          isLoading: false,
          error: null,
          items: items,
          nextKey: nextKey,
          hasNextPage: nextKey != null,
          cancelToken: null,
        ),
      );
    } catch (e) {
      if (!cancelToken.isCancelled) {
        emit(state.copyWith(isLoading: false, error: e, cancelToken: null));
      }
    }
  }
}
