import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:simplex/core/auth_error_interceptor.dart';
import 'package:simplex/errors/api_exception.dart';
import 'package:simplex/extensions/graphql_exception_extension.dart';
import 'package:simplex/extensions/rest_api_exception_extension.dart';
import 'package:simplex/logging/logger.dart';

/// A base class for handling GraphQL API calls with standardized error handling and authentication.
///
/// This class provides a foundation for making GraphQL requests and handling their responses
/// consistently across the application. It integrates with the Ferry client and includes
/// built-in error handling, logging, and authentication error interception.
///
/// ## Key Features
/// - Standardized API request execution with [executeApiCall]
/// - Automatic error handling and conversion to [ApiException]
/// - Authentication error interception and handling
/// - Request and error logging
///
/// ## Basic Usage
///
/// ### 1. Extend the base class
/// ```dart
/// class UserRemoteSource extends SimplexBaseRemoteSource {
///   UserRemoteSource(Client client) : super(client);
///
///   Future<User> getUser(String userId) async {
///     final request = GetUserQuery(
///       variables: GetUserArguments(id: userId),
///     ).request;
///
///     final response = await executeApiCall(request);
///     return response.user;
///   }
/// }
/// ```
///
/// ### 2. Handle API responses
/// ```dart
/// try {
///   final user = await userRemoteSource.getUser('123');
///   // Handle success
/// } on ApiException catch (e) {
///   // Handle specific API errors
///   if (e is UnauthorizedException) {
///     // Handle unauthorized access
///   }
///   // Other error handling...
/// }
/// ```
///
/// ## Error Handling
/// - Converts GraphQL errors to [ApiException] with appropriate types
/// - Automatically handles authentication errors through [AuthErrorInterceptor]
/// - Provides detailed error logging
///
/// ## Logging
/// - Logs request details including operation name
/// - Captures and logs all errors with stack traces
///
/// See also:
/// - [ApiException] for error types and handling
/// - [AuthErrorInterceptor] for authentication error handling
class SimplexBaseRemoteSource {
  SimplexBaseRemoteSource(this._graphqlClient, this._dioClient);

  final Client _graphqlClient;

  final Dio _dioClient;

  final AuthErrorInterceptor _authErrorInterceptor =
      AuthErrorInterceptor.instance;

  /// Executes a GraphQL API call using the provided [operationRequest].
  ///
  /// Sends the request to the remote server and handles the response.
  /// - Logs request details and duration for debugging purposes.
  /// - Throws an [ApiException] if the response contains errors or data is null.
  Future<TData> executeGraphqlApiCall<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest,
  ) async {
    try {
      final OperationResponse<TData, TVars> response = await _graphqlClient
          .request(operationRequest)
          .first;

      SimplexAppLogger.logInfo(
        info: '🚀 API Request: ${operationRequest.operation.operationName}',
      );

      if (response.hasErrors) {
        SimplexAppLogger.logError(
          error: '❌ API Error: ${response.linkException.toString()}',
        );
        throw response.toGraphqlApiException();
      }

      if (response.data != null) {
        return response.data!;
      }

      throw ApiException.serverException(message: 'Server Error');
    } on ApiException catch (e) {
      e.maybeWhen(
        orElse: () {},
        unAuthorizedException: (String? message) => _authErrorInterceptor
            .onUnAuthenticated(message ?? 'Un-Authenticated'),
        sessionExpiredException: (String? message) => _authErrorInterceptor
            .onSessionExpired(message ?? 'Session Expired'),
        forbiddenException: (String? message) =>
            _authErrorInterceptor.onForbidden(message ?? 'Forbidden'),
      );
      rethrow;
    } catch (e, stackTrace) {
      SimplexAppLogger.logAppError(e, stackTrace);
      rethrow;
    }
  }

  Future<T> executeRestApiCall<T>({
    required Future<Response> Function(Dio dio) request,
    required T Function(dynamic data) onResponse,
  }) async {
    try {
      final response = await request(_dioClient);
      if (response.statusCode! == 200) {
        return onResponse(response.data ?? {});
      } else {
        throw ApiException.serverException(
          message: response.data['message'] ?? 'UnExpected Error Occurred!',
        );
      }
    } on DioException catch (e) {
      throw e.toRestApiException;
    } catch (e) {
      throw const ApiException.serverException(
        message: 'UnExpected Error Occurred!',
      );
    }
  }
}
