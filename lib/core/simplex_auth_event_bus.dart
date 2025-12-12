import 'package:rxdart/rxdart.dart';

enum AuthErrorType { unAuthenticated, sessionExpired, forbidden }

class AuthEvent {
  final AuthErrorType type;
  final String message;

  AuthEvent(this.type, this.message);
}

/// A singleton event bus for handling authentication-related events throughout the application.
///
/// This class provides a centralized event stream for authentication state changes
/// and errors, using RxDart's [PublishSubject] for reactive event handling.
///
/// ## Usage
///
/// To listen for authentication events:
/// ```dart
/// final subscription = SimplexAuthEventBus.instance.events.listen((event) {
///   // Handle authentication event
/// });
///
/// // Remember to cancel subscription when done
/// subscription.cancel();
/// ```
///
/// To emit an authentication event:
/// ```dart
/// SimplexAuthEventBus.instance.emit(AuthEvent(AuthErrorType.unAuthenticated, 'Session expired'));
/// ```
///
/// ## Events
/// - [AuthErrorType.unAuthenticated]: When user is not authenticated
/// - [AuthErrorType.sessionExpired]: When user's session has expired
/// - [AuthErrorType.forbidden]: When user doesn't have required permissions
///
/// The event bus should be disposed when no longer needed using [dispose()].
class SimplexAuthEventBus {
  SimplexAuthEventBus._();

  static final SimplexAuthEventBus instance = SimplexAuthEventBus._();

  final _subject = PublishSubject<AuthEvent>();

  Stream<AuthEvent> get events => _subject.stream;

  void emit(AuthEvent event) => _subject.add(event);

  void dispose() => _subject.close();
}
