import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_status.freezed.dart';

@freezed
class BlocStatus<T> with _$BlocStatus<T> {
  const BlocStatus._();

  /// Initial idle state
  const factory BlocStatus.initial() = _Initial;

  /// Validation or pre-check failed
  const factory BlocStatus.invalid({String? message}) = _Invalid;

  /// Generic loading / processing state
  const factory BlocStatus.loading() = _Loading<T>;

  /// Error with optional message
  const factory BlocStatus.error({String? error}) = _Error<T>;

  /// Success with attached generic data
  const factory BlocStatus.successWithData(T data) = _SuccessWithData<T>;

  /// Simple success (message optional)
  const factory BlocStatus.success({String? message}) = _Success<T>;

  bool get isLoading => this is _Loading<T>;

  bool get isError => this is _Error<T>;

  bool get isSuccess => this is _Success<T>;
}
