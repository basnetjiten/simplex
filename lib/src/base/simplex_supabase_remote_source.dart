/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 06/06/2026
 */

import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/auth_error_interceptor.dart';
import '../errors/api_exception.dart';
import '../extensions/supabase_exception_extension.dart';
import '../logging/logger.dart';

/// A base remote source for Supabase-based API/Function calls, query execution,
/// database queries, and storage operations.
class SimplexSupabaseRemoteSource {
  /// The [SupabaseClient] instance.
  final SupabaseClient supabaseClient;

  final AuthErrorInterceptor _authErrorInterceptor =
      AuthErrorInterceptor.instance;

  SimplexSupabaseRemoteSource(this.supabaseClient);

  /// Executes a Supabase operation, automatically converting any exception to
  /// [ApiException] and triggering global authentication intercepts if unauthorized.
  Future<T> executeSupabaseCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on ApiException catch (e) {
      _interceptAuthError(e);
      rethrow;
    } catch (e, stackTrace) {
      SimplexAppLogger.logAppError(e, stackTrace);
      final mappedException = e.toSupabaseApiException();
      _interceptAuthError(mappedException);
      throw mappedException;
    }
  }

  void _interceptAuthError(ApiException e) {
    e.maybeWhen(
      orElse: () {},
      unAuthorizedException: (String? message) =>
          _authErrorInterceptor.onUnAuthenticated(message ?? 'Un-Authenticated'),
      sessionExpiredException: (String? message) =>
          _authErrorInterceptor.onSessionExpired(message ?? 'Session Expired'),
      forbiddenException: (String? message) =>
          _authErrorInterceptor.onForbidden(message ?? 'Forbidden'),
    );
  }
}
