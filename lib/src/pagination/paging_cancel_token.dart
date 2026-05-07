/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'dart:async';

/// A lightweight cancel token for in-flight paging requests.
class PagingCancelToken {
  bool _isCancelled = false;
  final _completer = Completer<void>();

  bool get isCancelled => _isCancelled;

  /// Completes when [cancel] is called.
  Future<void> get whenCancelled => _completer.future;

  void cancel() {
    if (_isCancelled) return;
    _isCancelled = true;
    _completer.complete();
  }
}
