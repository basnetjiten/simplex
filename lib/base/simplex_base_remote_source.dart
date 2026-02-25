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

/// ## Basic Usage
///
/// ### 1. GraphQL Remote Source
/// ```dart
/// class UserRemoteSource extends SimplexBaseRemoteSource {
///   UserRemoteSource(Client client) : super.graphql(client);
///
///   Future<User> getUser(String userId) async {
///     final request = GetUserQuery(
///       variables: GetUserArguments(id: userId),
///     ).request;
///
///     final response = await executeGraphqlApiCall(request);
///     return response;
///   }
/// }
/// ```
///
/// ### 2. REST Remote Source
/// ```dart
/// class UserRemoteSource extends SimplexBaseRemoteSource {
///   UserRemoteSource(Dio dio) : super.rest(dio);
///
///   Future<User> getUser(String userId) async {
///     return executeRestApiCall(
///       request: (dio) => dio.get('/users/$userId'),
///       onResponse: (data) => User.fromJson(data),
///     );
///   }
/// }
/// ```
///
/// ### 3. Mixed Usage (Deprecated style)
/// ```dart
/// class LegacyRemoteSource extends SimplexBaseRemoteSource {
///   LegacyRemoteSource(Client client, Dio dio) : super(client, dio);
///   ...
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
  /// Default constructor (Deprecated).
  ///
  /// Use [SimplexBaseRemoteSource.graphql] or [SimplexBaseRemoteSource.rest] instead.
  @Deprecated(
    'Use SimplexBaseRemoteSource.graphql(client) or SimplexBaseRemoteSource.rest(dioClient) instead. '
  )
  SimplexBaseRemoteSource(this._graphqlClient, this._dioClient);

  /// Constructor for GraphQL-based remote sources.
  SimplexBaseRemoteSource.graphql(Client graphqlClient)
    : _graphqlClient = graphqlClient,
      _dioClient = null;

  /// Constructor for REST-based remote sources.
  SimplexBaseRemoteSource.rest(Dio dioClient)
    : _dioClient = dioClient,
      _graphqlClient = null;

  final Client? _graphqlClient;

  final Dio? _dioClient;

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
    assert(
      _graphqlClient != null,
      'GraphQL Client is null. Ensure you initialized SimplexBaseRemoteSource with a GraphQL client.',
    );
    try {
      final OperationResponse<TData, TVars> response = await _graphqlClient!
          .request(operationRequest)
          .firstWhere((OperationResponse<TData, TVars> r) => !r.loading);

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
    assert(
      _dioClient != null,
      'Dio Client is null. Ensure you initialized SimplexBaseRemoteSource with a Dio client.',
    );
    try {
      final response = await request(_dioClient!);
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
