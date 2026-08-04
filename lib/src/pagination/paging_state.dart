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
/// - [items]       — the accumulated list of all loaded items.
/// - [initialKey]  — the key used to load the very first page; also used when refreshing.
/// - [nextKey]     — the cursor/key returned by the last successful fetch; `null` when no more pages.
/// - [hasNextPage] — whether more pages are available to fetch.
/// - [isLoading]   — true while a fetch is in progress.
/// - [error]       — the last thrown exception, cleared on the next fetch.
/// - [search]      — optional search query forwarded to the fetch function.
/// - [cancelToken] — token for the current in-flight request.
@freezed
abstract class PagingState<K, T> with _$PagingState<K, T> {
  const factory PagingState({
    @Default([]) List<T> items,
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
