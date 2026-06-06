/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 06/06/2026
 */

import 'package:supabase_flutter/supabase_flutter.dart';
import '../errors/api_exception.dart';

extension SupabaseExceptionX on Object {
  /// Converts a Supabase or generic object exception to an [ApiException].
  ApiException toSupabaseApiException({bool forceLogout = false}) {
    final self = this;
    if (self is PostgrestException) {
      final statusCode = self.code != null ? int.tryParse(self.code!) : null;
      final message = self.message;

      if (forceLogout) {
        return ApiException.sessionExpiredException(message: message);
      } else if (statusCode == 401 || self.code == 'PGRST301' || self.code == 'PGRST302') {
        // PGRST301/302 typically relate to JWT/auth claims issues in Postgrest
        return ApiException.unAuthorizedException(message: message);
      } else if (statusCode == 403) {
        return ApiException.forbiddenException(message: message);
      }

      return ApiException.serverException(message: message);
    }

    if (self is AuthException) {
      final message = self.message;
      final statusCode = self.statusCode != null ? int.tryParse(self.statusCode!) : null;

      if (forceLogout) {
        return ApiException.sessionExpiredException(message: message);
      } else if (statusCode == 401 || message.contains('invalid_grant') || message.contains('expired')) {
        return ApiException.unAuthorizedException(message: message);
      } else if (statusCode == 403) {
        return ApiException.forbiddenException(message: message);
      }

      return ApiException.serverException(message: message);
    }

    if (self is StorageException) {
      final message = self.message;
      final statusCode = self.statusCode != null ? int.tryParse(self.statusCode!) : null;

      if (statusCode == 401) {
        return ApiException.unAuthorizedException(message: message);
      } else if (statusCode == 403) {
        return ApiException.forbiddenException(message: message);
      }

      return ApiException.serverException(message: message);
    }

    return ApiException.serverException(message: toString());
  }
}
