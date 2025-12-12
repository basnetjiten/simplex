import 'package:simplex/base/simplex_auth_error_interceptor.dart';
import 'package:simplex/core/simplex_auth_event_bus.dart';

/// A singleton interceptor that handles authentication-related errors by emitting
/// corresponding events through the [SimplexAuthEventBus].
///
/// This interceptor processes different types of authentication errors:
/// - [onForbidden]: Handles 403 Forbidden errors
/// - [onUnAuthenticated]: Handles 401 Unauthorized errors
/// - [onSessionExpired]: Handles session expiration scenarios
///
/// The interceptor uses the singleton pattern to ensure a single point of control
/// for authentication error handling throughout the application.
class AuthErrorInterceptor implements SimplexAuthErrorInterceptor {
  AuthErrorInterceptor._internal();

  static final AuthErrorInterceptor _instance =
      AuthErrorInterceptor._internal();

  static AuthErrorInterceptor get instance => _instance;

  final SimplexAuthEventBus _authEventBus = SimplexAuthEventBus.instance;

  @override
  void onForbidden(String message) {
    _authEventBus.emit(AuthEvent(AuthErrorType.forbidden, message));
  }

  @override
  void onUnAuthenticated(String message) {
    _authEventBus.emit(AuthEvent(AuthErrorType.unAuthenticated, message));
  }

  @override
  void onSessionExpired(String message) {
    _authEventBus.emit(AuthEvent(AuthErrorType.sessionExpired, message));
  }
}
