/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

abstract class SimplexAuthErrorInterceptor {
  void onUnAuthenticated(String message);
  void onSessionExpired(String message);
  void onForbidden(String message);
}
