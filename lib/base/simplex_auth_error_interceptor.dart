abstract class SimplexAuthErrorInterceptor {
  void onUnAuthenticated(String message);
  void onSessionExpired(String message);
  void onForbidden(String message);
}
