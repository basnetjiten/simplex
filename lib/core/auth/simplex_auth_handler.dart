class SimplexAuthHandler {
  static AuthErrorHandler? _handler;

  static void init(AuthErrorHandler handler) => _handler = handler;

  static void notifyUnauthorized(String message) =>
      _handler?.onUnauthorized(message);

  static void notifyForbidden(String message) => _handler?.onForbidden(message);
}

abstract class AuthErrorHandler {
  void onUnauthorized(String message);

  void onForbidden(String message);
}
