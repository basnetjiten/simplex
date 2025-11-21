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

  /// Simple success (message optional)
  const factory BlocStatus.success({String? message}) = _Success;

  /// Error with optional message
  const factory BlocStatus.error({String? error}) = _Error;

  /// Success with attached generic data — wrapped in ApiData<T>
  const factory BlocStatus.successWithData({
    required ApiData<dynamic> apiData,
    String? message,
  }) = _SuccessWithData;

  bool get isLoading => this is _Loading;

  bool get isError => this is _Error;

  bool get isSuccess => this is _Success || this is _SuccessWithData;
}

class ApiData<T> {
  final T _data;
  final String? message;

  const ApiData({required T data, this.message}) : _data = data;

  /// Extracts data as type [R]
  ///
  /// Must explicitly provide the type parameter:
  /// ```dart
  /// final model = apiData.as<ExpiryModel>();
  /// ```
  ///
  /// Throws [ArgumentError] if type is not explicitly provided.
  R as<R extends Object>() {
    // ✅ Prevent dynamic/Object in debug mode
    assert(
      R != dynamic && R != Object,
      'Type parameter must be explicitly provided. '
      'Use: apiData.as<YourType>() instead of apiData.as()',
    );

    // ✅ Additional runtime check for production
    if (R == dynamic || R == Object) {
      throw ArgumentError(
        'Type parameter must be explicitly provided. '
        'Usage: apiData.as<YourType>()\n'
        'Example: apiData.as<ExpiryModel>()',
      );
    }

    return _data as R;
  }

  @override
  String toString() => 'ApiData($_data)';
}
