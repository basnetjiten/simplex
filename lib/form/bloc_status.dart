import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_status.freezed.dart';

@freezed
class BlocStatus with _$BlocStatus {
  const BlocStatus._();

  /// Initial idle state
  const factory BlocStatus.initial() = _Initial;

  /// Validation or pre-check failed
  const factory BlocStatus.invalid({String? message}) = _Invalid;

  /// Generic loading / processing/ submitting state
  const factory BlocStatus.loading() = _Loading;

  /// Error with optional message
  const factory BlocStatus.error({String? error}) = _Error;

  /// Success with attached generic data — wrapped in ApiData<T>
  const factory BlocStatus.successWithData(
    ApiData<Object> data, {
    String? message,
  }) = _SuccessWithData;

  /// Simple success (message optional)
  const factory BlocStatus.success({String? message}) = _Success;

  bool get isLoading => this is _Loading;

  bool get isError => this is _Error;

  bool get isSuccess => this is _Success || this is _SuccessWithData;
}

class ApiData<T> {
  final T data;
  final String? message;

  const ApiData({required this.data, this.message});

  @override
  String toString() => 'ApiData($data)';
}
