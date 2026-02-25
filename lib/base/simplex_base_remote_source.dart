import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:simplex/core/auth_error_interceptor.dart';
import 'package:simplex/errors/api_exception.dart';
import 'package:simplex/extensions/graphql_exception_extension.dart';
import 'package:simplex/extensions/rest_api_exception_extension.dart';
import 'package:simplex/logging/logger.dart';

/// A base class for handling API calls with standardized error handling and authentication.
///
/// For specialized versions, use [SimplexGraphqlRemoteSource] or [SimplexRestRemoteSource].
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
/// ### 1. GraphQL Remote Source (Recommended)
/// ```dart
/// class UserRemoteSource extends SimplexGraphqlRemoteSource {
///   UserRemoteSource(super.client);
///
///   Future<User> getUser(String userId) async {
///     ...
///   }
/// }
/// ```
///
/// ### 2. REST Remote Source (Recommended)
/// ```dart
/// class UserRemoteSource extends SimplexRestRemoteSource {
///   UserRemoteSource(super.dio);
///
///   Future<User> getUser(String userId) async {
///     ...
///   }
/// }
/// ```

///
/// ## Error Handling
/// - Converts GraphQL errors to [ApiException] with appropriate types
/// - Automatically handles authentication errors through [AuthErrorInterceptor]
/// - Provides detailed error logging
///
/// ## Logging
/// - Captures and logs all errors with stack traces
///
/// See also:
/// - [ApiException] for error types and handling
/// - [AuthErrorInterceptor] for authentication error handling
class SimplexBaseRemoteSource {
  /// Default positional constructor (Deprecated).
  ///
  /// Use [SimplexGraphqlRemoteSource] or [SimplexRestRemoteSource] for a cleaner syntax.
  @Deprecated(
    'Use SimplexGraphqlRemoteSource or SimplexRestRemoteSource instead.',
  )
  SimplexBaseRemoteSource(this.graphqlClient, this.dioClient);

  /// Named constructor for flexible/mixed usage.
  SimplexBaseRemoteSource.make({this.graphqlClient, this.dioClient});

  /// The GraphQL client.
  final Client? graphqlClient;

  /// The Dio client.
  final Dio? dioClient;

  final AuthErrorInterceptor _authErrorInterceptor =
      AuthErrorInterceptor.instance;

  /// Executes a GraphQL API call using the provided [operationRequest].
  ///
  /// - Throws an [ApiException] if the response contains errors or data is null.
  Future<TData> executeGraphqlApiCall<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest,
  ) async {
    assert(
      graphqlClient != null,
      'GraphQL Client is null. Ensure you initialized SimplexBaseRemoteSource with a GraphQL client.',
    );
    try {
      final OperationResponse<TData, TVars> response = await graphqlClient!
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
      dioClient != null,
      'Dio Client is null. Ensure you initialized SimplexBaseRemoteSource with a Dio client.',
    );
    try {
      final response = await request(dioClient!);
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

/// A specialized version of [SimplexBaseRemoteSource] for GraphQL only.
abstract class SimplexGraphqlRemoteSource extends SimplexBaseRemoteSource {
  SimplexGraphqlRemoteSource(Client graphqlClient) : super.make(graphqlClient: graphqlClient);
}

/// A specialized version of [SimplexBaseRemoteSource] for REST only.
abstract class SimplexRestRemoteSource extends SimplexBaseRemoteSource {
  SimplexRestRemoteSource(Dio dioClient) : super.make(dioClient: dioClient);
}
