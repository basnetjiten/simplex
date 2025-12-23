import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simplex/errors/app_error.dart';

part 'social_auth_exception.freezed.dart';

@freezed
class SocialAuthException with _$SocialAuthException implements Exception {
  const SocialAuthException._();

  /// User may cancel social login process for that case [SocialAuthException.aborted] can be used
  const factory SocialAuthException.aborted() = _SocialAuthExceptionAborted;

  /// If while login SDK throws some unknown error which is not being handled
  /// [SocialAuthException.unexpected] can be used.
  const factory SocialAuthException.unexpected() =
      _SocialAuthExceptionUnexpected;

  /// When server returns a valid error message
  const factory SocialAuthException.error(AppError error) =
      _SocialAuthExceptionNetwork;

  AppError toAppError() {
    return when(
      aborted: () => const AppError.validationError(message: 'Login cancelled'),
      unexpected: () => AppError.validationError(message: 'Server Error'),
      error: (AppError error) => error,
    );
  }
}
