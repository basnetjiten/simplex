/*
* @Author: Jiten Basnet on 10/09/2024
* @Company: GTEN SOFTWARE PVT. LTD.
*/

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:simplex/errors/app_error.dart';

/// BaseBloc provides a reusable way to handle API calls
/// and map errors or success results to Bloc states.
abstract class SimpleBlocBase<Event, State> extends BlocBase<State> {
  SimpleBlocBase(super.state);

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
      log('SimpleBlocBase Error: $error');
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
