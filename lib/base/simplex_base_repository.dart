import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:simplex/errors/api_exception.dart';
import 'package:simplex/errors/app_error.dart';
import 'package:simplex/typedefs/typedefs.dart';

/// A base repository class that provides standardized error handling and response processing
/// for API calls in the application.
///
/// This class serves as a foundation for all repository implementations, offering a consistent
/// way to handle API responses and convert them into a unified error handling pattern using
/// [Either] from the `fpdart` package.
///
/// ## Key Features
/// - Standardized API response handling with [EitherResponse]
/// - Automatic conversion of [ApiException] to [AppError]
/// - Type-safe response processing with generics
///
/// ## Basic Usage
///
/// ### Extending the Base Repository
/// ```dart
/// class UserRepository extends SimplexBaseRepository {
///   Future<EitherResponse<User>> getUser(String id) async {
///     return processApiCall<ApiUser, User>(
///       call: _apiClient.getUser(id),
///       onSuccess: (apiUser) => User.fromApi(apiUser),
///     );
///   }
/// }
/// ```
///
/// ### Handling Responses
/// ```dart
/// final result = await userRepository.getUser('123');
/// return result.match(
///   (error) => // Handle error case,
///   (user) => // Handle success case,
/// );
/// ```
///
/// ## Error Handling
/// The following [ApiException] types are automatically converted to [AppError]:
/// - `serverException` → `AppError.serverError`
/// - `network` → `AppError.noInternet`
/// - `unAuthorizedException` → `AppError.unAuthorized`
/// - `forbiddenException` → `AppError.unAuthorized`
/// - `sessionExpiredException` → `AppError.unAuthorized`
///
/// Any other exceptions are caught and converted to a generic server error.
///
/// ## Type Parameters
/// - [R]: The response type from the server/API
/// - [T]: The domain model type to return in the [EitherResponse]
///
/// ## Best Practices
/// - Extend this class for all repository implementations that make API calls
/// - Use the [processApiCall] method to wrap all API calls
/// - Keep business logic in the repository layer
/// - Convert API models to domain models in the [onSuccess] callback
///
/// See also:
/// - [ApiException] for API error types
/// - [AppError] for application error types
/// - [EitherResponse] for the response type definition
class SimplexBaseRepository {
  /// BaseRepository is not meant to be used with other than server
  /// (BaseRemoteSource).
  ///
  /// If you need to make http request or use third party plugin that can throw
  /// exception other that NetworkError don't use [SimplexBaseRepository].
  SimplexBaseRepository();

  /// [T] is Return type for [EitherResponse]
  ///
  /// [R] is response type from server that is params for [onSuccess] callback
  ///
  /// [onSuccess] callback returns the [T] and accept [R]
  ///
  /// This should not be used other that making request to server. Otherwise
  /// you would not be able to handle exceptions properly.
  EitherResponse<T> processApiCall<R, T>({
    required Future<R> call,
    required FutureOr<T> Function(R data) onSuccess,
  }) async {
    try {
      final R data = await call;
      return right(await onSuccess(data));
    } on ApiException catch (e) {
      final AppError appError = e.when(
        serverException: (String message) =>
            AppError.serverError(message: message),
        network: () => const AppError.noInternet(),
        unAuthorizedException: (String? message) => AppError.unAuthorized(),
        forbiddenException: (String? message) => AppError.unAuthorized(),
        sessionExpiredException: (String? message) => AppError.unAuthorized(),
      );

      return left(appError);
    } on Exception {
      return left(AppError.serverError(message: 'Server Error'));
    }
  }
}
