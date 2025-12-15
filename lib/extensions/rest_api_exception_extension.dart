import 'package:dio/dio.dart';
import 'package:simplex/errors/api_exception.dart';

extension RestApiExceptionDioX on DioException {
  ApiException toRestApiException({bool forceLogout = false}) {
    int? statusCode;
    dynamic apiData;

    switch (type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.receiveTimeout:
        return ApiException.timeOut(message: 'Time out Error');

      case DioExceptionType.badResponse:
        statusCode = response?.statusCode!;
        apiData = response?.data;

        final String? message = apiData?['Message'];

        if (forceLogout) {
          return ApiException.sessionExpiredException(message: message);
        } else if (statusCode == 401) {
          return ApiException.unAuthorizedException(message: message);
        } else if (statusCode == 403) {
          return ApiException.forbiddenException(message: message);
        }

        return ApiException.serverException(
          message: message ?? 'Server Exception',
        );
      case DioExceptionType.badCertificate:
        return ApiException.serverException(
          message: message ?? 'Bad Certificate',
        );
      case DioExceptionType.cancel:
        return ApiException.serverException(
          message: message ?? 'Bad Certificate',
        );
      case DioExceptionType.unknown:
        return ApiException.serverException(message: message ?? 'Unknow Error');
    }
  }
}
