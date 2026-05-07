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

/// A generic paginated data cubit.
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
/// Pass `useCache: true` to hydrate the first page from cache on startup
/// while a silent background refresh runs in parallel.
/// Only the first page is cached — subsequent pages are always fetched live.
/// The cache is skipped entirely when a search query is active.
class PagingCubit<K, T> extends SimplexCubit<PagingState<K, T>>
    with CubitCacheMixin {
  PagingCubit({
    required this.fetchFn,
    required K initialKey,
    this.useCache = false,
  }) : super(PagingState<K, T>(initialKey: initialKey)) {
    if (useCache) {
      final List<T>? cachedPages = readFromCache<List<T>>();
      if (cachedPages != null) {
        // Show stale-while-revalidate: emit cached items immediately so the
        // UI renders without a loading spinner, then kick off a silent
        // background refresh to bring data up to date.
        emit(state.copyWith(pages: cachedPages));
        fetchNext();
      }
    }
  }

  /// The function used to fetch a page of data.
  /// Receives the page [key] and an optional [search] string.
  /// Must return a record of `(items, nextKey)` where [nextKey] is `null`
  /// when there are no further pages.
  final PagingFetchFn<K, T> fetchFn;

  /// Whether to cache the first page for stale-while-revalidate behaviour.
  /// Has no effect when a search query is active.
  final bool useCache;

  // ── Derived state helpers ─────────────────────────────────────────────────

  /// True when no page has been successfully loaded yet.
  bool get _isFirstLoad => state.pages.isEmpty;

  /// True when the search field contains a non-empty query.
  bool get _isSearchActive => state.search != null && state.search!.isNotEmpty;

  // ── Public API ────────────────────────────────────────────────────────────

  /// Loads the next page of data.
  ///
  /// - On the very first call (or after [refresh]/[changeSearch]) this loads
  ///   from [initialKey].
  /// - Subsequent calls advance using the [PagingState.nextKey] returned by
  ///   the previous fetch.
  /// - No-ops if a fetch is already in progress or there are no more pages.
  Future<void> fetchNext() async {
    if (state.isLoading || !state.hasNextPage) return;

    final K? key = _isFirstLoad ? state.initialKey : state.nextKey;
    if (key == null) return;

    await _fetch(key: key, isRefresh: _isFirstLoad);
  }

  /// Resets pagination and reloads from [PagingState.initialKey].
  ///
  /// Cancels any in-flight request before fetching.
  Future<void> refresh() async {
    final K? initialKey = state.initialKey;
    if (initialKey == null) return;
    await _fetch(key: initialKey, isRefresh: true);
  }

  /// Updates the search query, resets pagination, and fetches the first page.
  ///
  /// Cancels any in-flight request before resetting state.
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

  /// Inserts [item] at position 0 of the current list.
  /// Useful after a successful create-item API call.
  void prependItem(T item) =>
      emit(state.copyWith(pages: [item, ...state.pages]));

  /// Appends [item] to the end of the current list.
  /// Useful for optimistic additions or non-paginated inserts.
  void appendItem(T item) =>
      emit(state.copyWith(pages: [...state.pages, item]));

  /// Removes the item whose [getId] result matches [id].
  /// No-op if the item is not found.
  void deleteItem({required String id, required String Function(T) getId}) {
    emit(
      state.copyWith(
        pages: state.pages.where((item) => getId(item) != id).toList(),
      ),
    );
  }

  /// Replaces the item whose [getId] result matches [id] with [updatedItem].
  /// No-op if the item is not found.
  void updateItem({
    required String id,
    required T updatedItem,
    required String Function(T) getId,
  }) {
    final List<T> pages = state.pages;
    if (pages.isEmpty) return;

    final int index = pages.indexWhere((item) => getId(item) == id);
    if (index == -1) return;

    final List<T> updated = List<T>.from(pages)..[index] = updatedItem;
    emit(state.copyWith(pages: updated));
  }

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  /// Cancels any in-flight request before releasing resources.
  @override
  Future<void> close() {
    _cancelCurrent();
    return super.close();
  }

  // ── Internal ──────────────────────────────────────────────────────────────

  /// Cancels the current in-flight request if one exists.
  void _cancelCurrent() => state.cancelToken?.cancel();

  /// Core fetch implementation shared by [fetchNext] and [refresh].
  ///
  /// - Cancels any previous request and issues a new [PagingCancelToken].
  /// - On success, replaces the list ([isRefresh]) or appends to it.
  /// - Caches the result only on a first-page refresh without an active search.
  /// - On error, emits the exception without clearing existing [items].
  Future<void> _fetch({required K key, bool isRefresh = false}) async {
    _cancelCurrent();
    final PagingCancelToken cancelToken = PagingCancelToken();

    emit(
      state.copyWith(isLoading: true, error: null, cancelToken: cancelToken),
    );

    try {
      final (List<T> result, K? nextKey) = await fetchFn(key, state.search);

      // Discard the result if a newer request has already cancelled this one.
      if (cancelToken.isCancelled) return;

      // Cache only the first page and only when not searching, so the cache
      // always reflects a clean, unfiltered view of the list.
      if (isRefresh && useCache && !_isSearchActive) {
        storeToCache<List<T>>(result);
      }

      final List<T> items = isRefresh ? result : [...state.pages, ...result];

      emit(
        state.copyWith(
          isLoading: false,
          error: null,
          pages: items,
          nextKey: nextKey,
          hasNextPage: nextKey != null,
          cancelToken: null,
        ),
      );
    } catch (e) {
      // Only surface the error if this request wasn't intentionally cancelled.
      if (!cancelToken.isCancelled) {
        emit(state.copyWith(isLoading: false, error: e, cancelToken: null));
      }
    }
  }
}
