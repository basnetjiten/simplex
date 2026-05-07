/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'package:freezed_annotation/freezed_annotation.dart';

import 'paging_cancel_token.dart';

part 'paging_state.freezed.dart';

/// Immutable state for [PagingCubit].
///
/// - [items]       — the accumulated list across all loaded pages; `null`
///                   means no fetch has completed yet (distinct from empty).
/// - [initialKey]  — the key used to load the very first page; also used
///                   when refreshing.
/// - [nextKey]     — the cursor/key returned by the last successful fetch;
///                   `null` when [hasNextPage] is false.
/// - [hasNextPage] — whether the API indicated more pages are available.
/// - [isLoading]   — true while a fetch is in progress.
/// - [error]       — the last thrown exception, cleared on the next fetch.
/// - [search]      — optional search query forwarded to [PagingFetchFn].
/// - [cancelToken] — token for the current in-flight request; `null` when idle.
@freezed
abstract class PagingState<K, T> with _$PagingState<K, T> {
  const factory PagingState({
    List<T>? items,
    K? initialKey,
    K? nextKey,
    Object? error,
    @Default(true) bool hasNextPage,
    @Default(false) bool isLoading,
    String? search,
    PagingCancelToken? cancelToken,
  }) = _PagingState<K, T>;

  const PagingState._();
}
