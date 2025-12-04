abstract class AuthErrorNotifier {
  void notifyUnauthorized(String? message);
  void notifyForbidden(String? message);
}
