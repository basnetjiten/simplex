import 'package:simplex/base/simplex_auth_error_interceptor.dart';
import 'package:simplex/core/simplex_auth_event_bus.dart';

class AuthErrorInterceptor implements SimplexAuthErrorInterceptor {
  // Private constructor
  AuthErrorInterceptor._internal();

  // Static instance
  static final AuthErrorInterceptor _instance =
      AuthErrorInterceptor._internal();

  // Public accessor
  static AuthErrorInterceptor get instance => _instance;

  // Factory constructor (alternative way to access)
  factory AuthErrorInterceptor() => _instance;

  final SimplexAuthEventBus _authEventBus = SimplexAuthEventBus.instance;

  @override
  void onForbidden(String message) {
    _authEventBus.emit(
      AuthEvent(AuthErrorType.forbidden, message),
    ); // Fixed: was unauthorized
  }

  @override
  void onUnauthorized(String message) {
    _authEventBus.emit(AuthEvent(AuthErrorType.unauthorized, message));
  }
}
