import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simplex/errors/app_error.dart';

part 'auth_exception.freezed.dart';

@freezed
class AuthException with _$AuthException implements Exception {
  const AuthException._();

  /// User may cancel social login process for that case [AuthException.aborted] can be used
  const factory AuthException.aborted() = _AuthExceptionAborted;

  /// If while login SDK throws some unknown error which is not being handled
  /// [AuthException.unexpected] can be used.
  const factory AuthException.unexpected() = _AuthExceptionUnexpected;

  /// When server returns a valid error message
  const factory AuthException.error(AppError error) = _AuthExceptionNetwork;

  AppError toAppError() {
    return when(
      aborted: () => const AppError.validationError(message: 'Login cancelled'),
      unexpected: () => AppError.validationError(message: 'Server Error'),
      error: (AppError error) => error,
    );
  }
}
