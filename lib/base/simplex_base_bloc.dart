/*
* @Author: Jiten Basnet on 10/09/2024
* @Company: GTEN SOFTWARE PVT. LTD.
*/

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:simplex/errors/app_error.dart';
import 'package:simplex/extensions/app_error_extension.dart';

/// A custom base BLoC class that simplifies API call handling and state management.
///
/// This abstract class provides a standardized way to handle API calls and
/// state transitions in BLoCs, with built-in error handling and state emission.
///
/// ## Key Features
/// - Simplified API call handling with [Either] type
/// - Automatic error handling and state management
/// - Support for both synchronous and asynchronous state updates
/// - Built-in error mapping using [AppError]
///
/// ## Basic Usage
///
/// ###Create a BLoC that extends SimplexBlocBase
/// ```dart
/// class UserBloc extends SimplexBlocBase<UserEvent, UserState> {
///   final UserRepository _repository;
///
///   UserBloc(this._repository) : super(const UserState.initial()) {
///     on<LoadUserEvent>(_onLoadUser);
///   }
///
///   Future<void> _onLoadUser()  {
///     await handleAPICall<User>(
///       call: _repository.getUser(event.userId),
///       onSuccess: (user) => state.copyWith(
///         status: UserStatus.loaded,
///         user: user,
///       ),
///       onFailure: (error) => state.copyWith(
///         status: UserStatus.failure,
///         error: error,
///       ),
///     );
///   }
/// }
/// ```
///
abstract class SimplexBlocBase<Event, State> extends BlocBase<State> {
  SimplexBlocBase(super.state);

  /// Handles an API call that returns Either<AppError, R>
  ///
  /// - [emitter] is optional for use in BlocBuilders or event handlers
  /// - [call] is the API function returning Either<AppError, R>
  /// - [onSuccess] maps the success result to a new state
  /// - [onFailure] maps error messages to a state
  /// - [onInvalid] optional, for handling invalid state separately
  Future<void> handleAPICall<R>({
    Emitter<State>? emitter,
    required Future<Either<AppError, R>> call,
    required Function(R data) onSuccess,
    required State Function(String error) onFailure,
    State Function(String error)? onInvalid,
  }) async {
    if (isClosed) return;

    try {
      final response = await call;

      // Handle success or failure using Either.fold
      response.fold(
        (error) => _emitError(emitter, error, onFailure),
        (data) => _emitState(emitter, onSuccess(data)),
      );
    } on AppError catch (error) {
      if (!isClosed && onInvalid != null) {
        _emitError(emitter, error, onInvalid);
      }
    } catch (error) {
      log('SimplexBlocBase Error: $error');
    }
  }

  /// Emits the state based on success
  void _emitState(Emitter<State>? emitter, State state) {
    emitter != null ? emitter(state) : emit(state);
  }

  /// Emits the state based on error
  void _emitError(
    Emitter<State>? emitter,
    AppError error,
    State Function(String) onInvalidOrFailure,
  ) {
    final state = error.mapErrorMessage<State>(onInvalidOrFailure);
    _emitState(emitter, state);
  }
}
