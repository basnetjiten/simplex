import 'dart:async';

import 'package:simplex/base/simplex_base_bloc.dart';
import 'package:simplex/typedefs/typedefs.dart';

import 'paging_state.dart';

class PagingCubit<K, T> extends SimplexCubit<PagingState<K, T>> {
  PagingCubit({required this.fetchFn, required K initialKey})
    : super(PagingState<K, T>(keys: <K>[initialKey]));

  final PagingFetchFn<K, T> fetchFn;

  /// Fetches the next page of data using the fetch function.
  Future<void> fetchNext() async {
    if (state.isLoading || !state.hasNextPage) {
      return;
    }

    final K? pageKey = state.lastKey;
    if (pageKey == null) {
      emit(state.copyWith(hasNextPage: false));
      return;
    }

    state.cancelToken?.cancel();
    final PagingCancelToken cancelToken = PagingCancelToken();

    emit(
      state.copyWith(isLoading: true, error: null, cancelToken: cancelToken),
    );

    try {
      final (List<T> result, K? nextKey) = await fetchFn(pageKey, state.search);
      if (cancelToken.isCancelled) {
        return;
      }

      final PagingState<K, T> newState = state.copyWith(
        isLoading: false,
        error: null,
        hasNextPage: nextKey != null,
        pages: <List<T>>[...?state.pages, result],
        keys: <K>[...?state.keys, if (nextKey != null) nextKey],
        cancelToken: null,
      );
      emit(newState);
    } catch (e) {
      if (!cancelToken.isCancelled) {
        emit(state.copyWith(isLoading: false, error: e, cancelToken: null));
      }
    }
  }

  /// Refreshes the data by clearing current pages and fetching from the initial key.
  Future<void> refresh() async {
    state.cancelToken?.cancel();
    final K? initialKey = state.keys?.firstOrNull;
    if (initialKey == null) {
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final (List<T> result, K? nextKey) = await fetchFn(
        initialKey,
        state.search,
      );

      final PagingState<K, T> newState = state.copyWith(
        isLoading: false,
        error: null,
        hasNextPage: nextKey != null,
        pages: <List<T>>[result],
        keys: <K>[initialKey, if (nextKey != null) nextKey],
      );
      emit(newState);
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    }
  }

  /// Changes the search query and refetches data with the new search term.
  Future<void> changeSearch(String? newSearch) async {
    state.cancelToken?.cancel();
    final K? initialKey = state.keys?.firstOrNull;
    emit(
      PagingState<K, T>(
        search: newSearch,
        keys: initialKey != null ? <K>[initialKey] : null,
      ),
    );
    await fetchNext();
  }

  /// Adds an item to the beginning of the first page.
  void prependItem(T item) {
    final List<List<T>> currentPages = List<List<T>>.from(
      state.pages ?? <List<T>>[],
    );
    if (currentPages.isEmpty) {
      currentPages.add(<T>[item]);
    } else {
      currentPages[0] = <T>[item, ...currentPages[0]];
    }
    emit(state.copyWith(pages: currentPages));
  }

  /// Adds an item to the end of the last page.
  void appendItem(T item) {
    final List<List<T>> currentPages = List<List<T>>.from(
      state.pages ?? <List<T>>[],
    );
    if (currentPages.isEmpty) {
      currentPages.add(<T>[item]);
    } else {
      final int lastPageIndex = currentPages.length - 1;
      currentPages[lastPageIndex] = <T>[...currentPages[lastPageIndex], item];
    }
    emit(state.copyWith(pages: currentPages));
  }

  /// Deletes an item at the specified index across all pages.
  void delete({required String id, required int index}) {
    final List<List<T>> currentPages = List<List<T>>.from(
      state.pages ?? <List<T>>[],
    );
    if (currentPages.isEmpty) {
      return;
    }

    int currentCount = 0;
    for (int i = 0; i < currentPages.length; i++) {
      final int pageLength = currentPages[i].length;
      if (index < currentCount + pageLength) {
        final int itemIndex = index - currentCount;
        final List<T> updatedPage = List<T>.from(currentPages[i])
          ..removeAt(itemIndex);
        currentPages[i] = updatedPage;
        emit(state.copyWith(pages: currentPages));
        return;
      }
      currentCount += pageLength;
    }
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
