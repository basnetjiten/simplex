import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError {
  const factory AppError.serverError({required String message}) = _ServerError;

  const factory AppError.validationError({required String message}) =
      _ValidationError;

  const factory AppError.unAuthorized() = _UnAuthorized;

  const factory AppError.unAuthenticated() = _UnAuthenticated;

  const factory AppError.noInternet() = _NoInternet;

  const factory AppError.timeOut({required String message}) = _TimeOut;

  const factory AppError.unSupportedPlatform({required String message}) =
      _UnSupportedPlatform;
}


