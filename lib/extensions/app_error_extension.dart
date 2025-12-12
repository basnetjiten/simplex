import 'package:simplex/errors/app_error.dart';

/// Extension on [AppError] that provides a convenient way to map different
/// error types to a consistent message format.
///
/// The [mapErrorMessage] method takes a callback that will be invoked with
/// an appropriate error message based on the specific [AppError] type.
///
/// Example:
/// ```dart
/// final errorMessage = error.mapErrorMessage((message) => 'Error: $message');
/// ```
extension AppErrorExtension on AppError {
  T mapErrorMessage<T>(T Function(String error) onFailure) {
    return when(
      serverError: (message) => onFailure(message),
      validationError: (message) => onFailure(message),
      unAuthorized: () => onFailure("Unauthorized access."),
      unAuthenticated: () => onFailure("Unauthenticated access."),
      noInternet: () => onFailure("No internet connection."),
      timeOut: (message) => onFailure(message),
      unSupportedPlatform: (message) => onFailure(message),
    );
  }
}
