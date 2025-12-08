import 'package:rxdart/rxdart.dart';

enum AuthErrorType { unauthorized, forbidden }

class AuthEvent {
  final AuthErrorType type;
  final String message;

  AuthEvent(this.type, this.message);
}

class SimplexAuthEventBus {
  SimplexAuthEventBus._();

  static final SimplexAuthEventBus instance = SimplexAuthEventBus._();

  final _subject = PublishSubject<AuthEvent>();

  /// Main stream
  Stream<AuthEvent> get stream => _subject.stream;

  Stream<AuthEvent> get events => _subject.stream;

  void emit(AuthEvent event) => _subject.add(event);

  void dispose() => _subject.close();
}
