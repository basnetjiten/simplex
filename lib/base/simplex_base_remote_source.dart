import 'package:ferry/ferry.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:simplex/errors/api_exception.dart';
import 'package:simplex/extensions/api_exception_extension.dart';
import 'package:simplex/logging/logger.dart';

class SimplexBaseRemoteSource {
  SimplexBaseRemoteSource(this._client, this.localStorage);

  final Client _client;
  final LocalStorage localStorage;

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
    } catch (e, stackTrace) {
      SimplexAppLogger.logAppError(e, stackTrace);
      rethrow;
    }
  }
}
