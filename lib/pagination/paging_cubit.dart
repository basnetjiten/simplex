import 'dart:async';

import 'package:simplex/base/simplex_base_bloc.dart';
import 'package:simplex/typedefs/typedefs.dart';

import 'paging_state.dart';

class PagingCubit<K, T> extends SimplexCubit<PagingState<K, T>> {
  PagingCubit({required this.fetchFn, required K initialKey})
      : super(PagingState<K, T>(keys: <K>[initialKey]));

  final PagingFetchFn<K, T> fetchFn;

  /// Fetches the next page of data.
  Future<void> fetchNext() async {
    if (state.isLoading || !state.hasNextPage) return;

    final K? pageKey = state.lastKey;
    if (pageKey == null) {
      emit(state.copyWith(hasNextPage: false));
      return;
    }

    state.cancelToken?.cancel();
    final PagingCancelToken cancelToken = PagingCancelToken();
    emit(state.copyWith(isLoading: true, error: null, cancelToken: cancelToken));

    try {
      final (List<T> result, K? nextKey) = await fetchFn(pageKey, state.search);
      if (cancelToken.isCancelled) return;

      emit(state.copyWith(
        isLoading: false,
        error: null,
        hasNextPage: nextKey != null,
        pages: [...?state.pages, result],
        keys: [...?state.keys, if (nextKey != null) nextKey],
        cancelToken: null,
      ));
    } catch (e) {
      if (!cancelToken.isCancelled) {
        emit(state.copyWith(isLoading: false, error: e, cancelToken: null));
      }
    }
  }

  /// Refreshes the data by clearing pages and fetching from initial key.
  Future<void> refresh() async {
    state.cancelToken?.cancel();
    final K? initialKey = state.keys?.first;
    if (initialKey == null) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final (List<T> result, K? nextKey) = await fetchFn(initialKey, state.search);

      emit(state.copyWith(
        isLoading: false,
        error: null,
        hasNextPage: nextKey != null,
        pages: [result],
        keys: [initialKey, if (nextKey != null) nextKey],
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    }
  }

  /// Changes the search query and refetches data.
  Future<void> changeSearch(String? newSearch) async {
    state.cancelToken?.cancel();
    final K? initialKey = state.keys?.first;
    emit(PagingState<K, T>(
      search: newSearch,
      keys: initialKey != null ? [initialKey] : null,
    ));
    await fetchNext();
  }

  /// Adds an item to the beginning of the first page.
  void prependItem(T item) {
    final List<List<T>> pages = state.pages ?? [];
    emit(state.copyWith(
      pages: pages.isEmpty
          ? [[item]]
          : [[item, ...pages.first], ...pages.skip(1)],
    ));
  }

  /// Adds an item to the end of the last page.
  void appendItem(T item) {
    final List<List<T>> pages = state.pages ?? [];
    emit(state.copyWith(
      pages: pages.isEmpty
          ? [[item]]
          : [...pages.take(pages.length - 1), [...pages.last, item]],
    ));
  }

  /// Deletes an item by ID across all pages.
  void deleteItem({required String id, required String Function(T) getId}) {
    final List<List<T>>? pages = state.pages;
    if (pages == null || pages.isEmpty) return;

    emit(state.copyWith(
      pages: pages
          .map((page) => page.where((item) => getId(item) != id).toList())
          .toList(),
    ));
  }

  /// Updates an item in the paginated list by matching its ID.
  void updateItem({
    required String id,
    required T updatedItem,
    required String Function(T) getId,
  }) {
    final List<List<T>>? pages = state.pages;
    if (pages == null || pages.isEmpty) return;

    emit(state.copyWith(
      pages: pages.map((page) {
        final int index = page.indexWhere((item) => getId(item) == id);
        if (index == -1) return page;
        return List<T>.of(page)..[index] = updatedItem;
      }).toList(),
    ));
  }

  /// Cancels the current loading operation.
  void cancel() {
    state.cancelToken?.cancel();
    emit(state.copyWith(isLoading: false, cancelToken: null));
  }

  /// Cleans up resources when the cubit is closed.
  @override
  Future<void> close() {
    state.cancelToken?.cancel();
    return super.close();
  }
}