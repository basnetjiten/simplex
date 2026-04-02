import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
abstract class AppError with _$AppError {
  const factory AppError.serverError({required String message}) = _ServerError;

  const factory AppError.validationError({required String message}) =
      _ValidationError;

  const factory AppError.unAuthorized(String? message) = _UnAuthorized;

  const factory AppError.unAuthenticated(String? message) = _UnAuthenticated;

  const factory AppError.noInternet(String? message) = _NoInternet;

  const factory AppError.timeOut({required String message}) = _TimeOut;

  const factory AppError.unSupportedPlatform({required String message}) =
      _UnSupportedPlatform;
}
