import 'package:ferry/ferry.dart';
import 'package:simplex/core/auth_error_interceptor.dart';
import 'package:simplex/errors/api_exception.dart';
import 'package:simplex/extensions/api_exception_extension.dart';
import 'package:simplex/logging/logger.dart';

class SimplexBaseRemoteSource {
  SimplexBaseRemoteSource(this._client);

  final Client _client;

  final AuthErrorInterceptor _authErrorInterceptor =
      AuthErrorInterceptor.instance;

  /// Executes a GraphQL API call using the provided [operationRequest].
  ///
  /// Sends the request to the remote server and handles the response.
  /// - Logs request details and duration for debugging purposes.
  /// - Throws an [ApiException] if the response contains errors or data is null.
  Future<TData> executeApiCall<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest,
  ) async {
    try {
      final OperationResponse<TData, TVars> response = await _client
          .request(operationRequest)
          .first;

      SimplexAppLogger.logInfo(
        info: ':::API Request::: ${operationRequest.operation.operationName}',
      );

      if (response.hasErrors) {
        SimplexAppLogger.logError(
          error: ':::API ERROR::: ${response.linkException.toString()}',
        );
        throw response.toApiException();
      }

      if (response.data != null) {
        return response.data!;
      }

      throw ApiException.serverException(message: 'Server Error');
    } on ApiException catch (e) {
      e.maybeWhen(
        orElse: () {},
        unAuthorizedException: (String? message) =>
            _authErrorInterceptor.onUnauthorized(message ?? 'Un-Authorized'),
        sessionExpiredException: (String? message) =>
            _authErrorInterceptor.onUnauthorized(message ?? 'Un-Authorized'),
        forbiddenException: (String? message) =>
            _authErrorInterceptor.onForbidden(message ?? 'Forbidden'),
      );
      rethrow;
    } catch (e, stackTrace) {
      SimplexAppLogger.logAppError(e, stackTrace);
      rethrow;
    }
  }
}
