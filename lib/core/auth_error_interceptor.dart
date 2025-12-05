import 'package:simplex/base/simplex_auth_error_interceptor.dart';
import 'package:simplex/core/simplex_auth_event_bus.dart';

class AuthErrorInterceptor implements SimplexAuthErrorInterceptor {
  AuthErrorInterceptor();

  final SimplexAuthEventBus _authEventBus = SimplexAuthEventBus.instance();

  @override
  void onForbidden(String message) {
    _authEventBus.emit(AuthEvent(AuthErrorType.unauthorized, message));
  }

  @override
  void onUnauthorized(String message) {
    _authEventBus.emit(AuthEvent(AuthErrorType.unauthorized, message));
  }
}
