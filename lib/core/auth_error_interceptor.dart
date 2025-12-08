import 'package:simplex/base/simplex_auth_error_interceptor.dart';
import 'package:simplex/core/simplex_auth_event_bus.dart';

class AuthErrorInterceptor implements SimplexAuthErrorInterceptor {
  AuthErrorInterceptor._internal();

  static final AuthErrorInterceptor _instance =
      AuthErrorInterceptor._internal();

  static AuthErrorInterceptor get instance => _instance;

  factory AuthErrorInterceptor() => _instance;

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
