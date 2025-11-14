import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
class ApiException with _$ApiException implements Exception {
  // for server related errors
  const factory ApiException.serverException({required String message}) =
      _ServerException;

  // for socket exception from server
  const factory ApiException.network() = _Network;

  const factory ApiException.unAuthorizedException({required String message}) =
      _UnAuthorizedException;
}
