import 'dart:async';

enum AuthErrorType { unauthorized, forbidden }

class AuthEvent {
  final AuthErrorType type;
  final String message;

  AuthEvent(this.type, this.message);
}

class SimplexAuthEventBus {
  SimplexAuthEventBus._internal();

  static final SimplexAuthEventBus _instance = SimplexAuthEventBus._internal();

  factory SimplexAuthEventBus.instance() => _instance;

  final _controller = StreamController<AuthEvent>.broadcast();

  Stream<AuthEvent> get stream => _controller.stream;

  void emit(AuthEvent event) => _controller.add(event);

  void dispose() => _controller.close();
}
