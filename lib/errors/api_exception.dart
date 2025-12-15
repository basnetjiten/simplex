import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
class ApiException with _$ApiException implements Exception {
  // for server related errors
  const factory ApiException.serverException({required String message}) =
      _ServerException;

  // for socket exception from server
  const factory ApiException.network() = _Network;

  const factory ApiException.unAuthorizedException({String? message}) =
      _UnAuthorizedException;

  const factory ApiException.sessionExpiredException({String? message}) =
      _SessionExpiredException;

  const factory ApiException.forbiddenException({String? message}) =
      _ForbiddenException;

  const factory ApiException.timeOut({required message}) = _TimeOutException;
}
