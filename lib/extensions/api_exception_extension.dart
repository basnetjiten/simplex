import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:simplex/errors/api_exception.dart';
import 'package:simplex/logging/logger.dart';

extension ApiExceptionXGraphQl<TData, TVars>
    on OperationResponse<TData, TVars> {
  /// Convert GraphQl errors in OperationResponse to ApiException
  ApiException toApiException({bool forceLogout = false}) {
    try {
      if (linkException?.originalException is DioException &&
          (linkException?.originalException as DioException).error
              is SocketException) {
        return const ApiException.network();
      }

      final Map<String, dynamic>? graphqlResponse =
          graphqlErrors?.first.extensions?['response'];

      if (graphqlResponse != null) {
        final String message = _extractMessage(graphqlResponse);

        final int? statusCode = graphqlResponse['statusCode'] as int?;
        if (forceLogout) {
          return ApiException.unAuthorizedException(message: message);
        }
        if (statusCode == 401) {
          return ApiException.unAuthorizedException(message: message);
        }

        if (statusCode == 403) {
          return ApiException.forbiddenException(message: message);
        }

        // we are interested for first error only
        final String errorMessage = graphqlErrors!.first.message;
        return ApiException.serverException(message: errorMessage);
      } else {
        return ApiException.serverException(message: 'Server Error');
      }
    } catch (_) {
      SimplexAppLogger.logDebug(
        info: linkException?.originalException.toString(),
      );

      return ApiException.serverException(message: 'Server Error');
    }
  }

  String _extractMessage(Map<String, dynamic> response) {
    final message = response['message'];

    if (message is String) return message;
    if (message is List && message.isNotEmpty) return message.first.toString();

    return graphqlErrors?.first.message ?? 'An error occurred';
  }
}
