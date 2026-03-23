import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_state.freezed.dart';

@freezed
abstract class PagingState<K, T> with _$PagingState<K, T> {
  const factory PagingState({
    List<List<T>>? pages,
    List<K>? keys,
    Object? error,
    @Default(true) bool hasNextPage,
    @Default(false) bool isLoading,
    String? search,
    PagingCancelToken? cancelToken,
  }) = _PagingState<K, T>;

  const PagingState._();

  bool get lastPageIsEmpty => pages?.lastOrNull?.isEmpty ?? true;

  K? get lastKey => keys?.lastOrNull;
}

/// A simple implementation of a cancel token.
class PagingCancelToken {
  PagingCancelToken();

  bool _isCancelled = false;
  final _completer = Completer<void>();

  /// Whether the token has been cancelled.
  bool get isCancelled => _isCancelled;

  /// Completes when cancelled.
  Future<void> get whenCancelled => _completer.future;

  /// Cancel the operation.
  void cancel() {
    if (_isCancelled) {
      return;
    }
    _isCancelled = true;
    _completer.complete();
  }
}
