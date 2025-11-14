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
        if (graphqlResponse['statusCode'].toString() == '401' || forceLogout) {
          return ApiException.serverException(
            message:
                graphqlResponse['message'] ?? 'Session Expired, Please login',
          );
        }

        if (graphqlResponse['message'] is List &&
            (graphqlResponse['message']).isNotEmpty) {
          final String input = graphqlResponse['message'][0].toString();

          final int index = input.lastIndexOf('.');

          final String errorMessage = (index != -1)
              ? input.substring(index + 1)
              : input;

          return ApiException.serverException(message: errorMessage);
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
}
