/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../errors/app_error.dart';
import '../extensions/app_error_extension.dart';
import '../pagination/models/paginated_response_model.dart';

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
/// ### Create a BLoC that extends SimplexBloc
/// ```dart
/// class UserBloc extends SimplexBloc<UserEvent, UserState> {
///   final UserRepository _repository;
///
///   UserBloc(this._repository) : super(const UserState.initial()) {
///     on<LoadUserEvent>(_onLoadUser);
///   }
///
///   Future<void> _onLoadUser(LoadUserEvent event, Emitter<UserState> emit) async {
///     await handleAPICall<User>(
///       emitter: emit,
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
abstract class SimplexBloc<E, S> extends Bloc<E, S>
    with SimplexBaseMixin<S> {
  SimplexBloc(super.state);

  /// Handles an API call that returns `Either<AppError, R>`
  ///
  /// - [emitter] is optional for use in BlocBuilders or event handlers
  /// - [call] is the API function returning `Either<AppError, R>`
  /// - [onSuccess] maps the success result to a new state
  /// - [onFailure] maps error messages to a state
  /// - [onInvalid] optional, for handling invalid state separately
  Future<void> handleAPICall<R>({
    required Emitter<S> emitter,
    required Future<Either<AppError, R>> call,
    required S Function(R data) onSuccess,
    required S Function(String error) onFailure,
    S Function(String error)? onInvalid,
  }) async {
    await performAPICall<R>(
      call: call,
      onSuccess: onSuccess,
      onFailure: onFailure,
      onInvalid: onInvalid,
      emitState: emitter.call,
    );
  }

  /// Handles a paginated API call and returns the items and next page key.
  ///
  /// - [page] is the current page number.
  /// - [call] is the API call returning `Either<AppError, R>`.
  Future<(List<T>, int?)> handlePagingCall<T, R extends PaginatedResponse<T>>({
    required int page,
    required Future<Either<AppError, R>> call,
  }) async {
    return performPagingCall<T, R>(page: page, call: call);
  }
}

abstract class SimplexCubit<S> extends Cubit<S>
    with SimplexBaseMixin<S> {
  SimplexCubit(super.initialState);

  /// Handles an API call that returns `Either<AppError, R>`
  /// - [call] is the API function returning `Either<AppError, R>`
  /// - [onSuccess] maps the success result to a new state
  /// - [onFailure] maps error messages to a state
  /// - [onInvalid] optional, for handling invalid state separately
  Future<void> handleAPICall<R>({
    required Future<Either<AppError, R>> call,
    required S Function(R data) onSuccess,
    required S Function(String error) onFailure,
    S Function(String error)? onInvalid,
  }) async {
    await performAPICall<R>(
      call: call,
      onSuccess: onSuccess,
      onFailure: onFailure,
      onInvalid: onInvalid,
      emitState: emit,
    );
  }

  /// Handles a paginated API call and returns the items and next page key.
  ///
  /// - [page] is the current page number.
  /// - [call] is the API call returning `Either<AppError, R>`.

  Future<(List<T>, int?)> handlePagingCall<T, R extends PaginatedResponse<T>>({
    required int page,
    required Future<Either<AppError, R>> call,
  }) async {
    return performPagingCall<T, R>(page: page, call: call);
  }
}

mixin SimplexBaseMixin<S> on BlocBase<S> {
  /// Internal method to handle API calls and state emission
  Future<void> performAPICall<R>({
    required Future<Either<AppError, R>> call,
    required S Function(R data) onSuccess,
    required S Function(String error) onFailure,
    required void Function(S) emitState,
    S Function(String error)? onInvalid,
  }) async {
    if (isClosed) return;

    try {
      final response = await call;

      response.fold(
        (error) => _emitError(error, onFailure, emitState),
        (data) => emitState(onSuccess(data)),
      );
    } on AppError catch (error) {
      if (!isClosed && onInvalid != null) {
        _emitError(error, onInvalid, emitState);
      }
    } catch (error) {
      log('SimplexBaseMixin Error: $error');
    }
  }

  void _emitError(
    AppError error,
    S Function(String) onInvalidOrFailure,
    void Function(S) emitState,
  ) {
    final state = error.mapErrorMessage<S>(onInvalidOrFailure);
    emitState(state);
  }

  /// Internal method to handle paginated API calls.
  Future<(List<T>, int?)> performPagingCall<T, R extends PaginatedResponse<T>>({
    required int page,
    required Future<Either<AppError, R>> call,
  }) async {
    final response = await call;

    return response.fold(
      (error) => throw Exception(error.mapErrorMessage((String error) => error)),
      (data) {
        return (data.items, data.hasNext ? page + 1 : null);
      },
    );
  }
}

@Deprecated('Use SimplexBloc or SimplexCubit instead')
abstract class SimplexBlocBase<E, S> extends BlocBase<S> {
  SimplexBlocBase(super.state);

  /// Handles an API call that returns `Either<AppError, R>`
  ///
  /// - [emitter] is optional for use in BlocBuilders or event handlers
  /// - [call] is the API function returning `Either<AppError, R>`
  /// - [onSuccess] maps the success result to a new state
  /// - [onFailure] maps error messages to a state
  /// - [onInvalid] optional, for handling invalid state separately
  Future<void> handleAPICall<R>({
    Emitter<S>? emitter,
    required Future<Either<AppError, R>> call,
    required Function(R data) onSuccess,
    required S Function(String error) onFailure,
    S Function(String error)? onInvalid,
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
  void _emitState(Emitter<S>? emitter, S state) {
    emitter != null ? emitter(state) : emit(state);
  }

  /// Emits the state based on error
  void _emitError(
    Emitter<S>? emitter,
    AppError error,
    S Function(String) onInvalidOrFailure,
  ) {
    final state = error.mapErrorMessage<S>(onInvalidOrFailure);
    _emitState(emitter, state);
  }
}
