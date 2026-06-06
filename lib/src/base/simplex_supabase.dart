/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 06/06/2026
 */

import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../logging/logger.dart';

/// A wrapper around [Supabase] to initialize and retrieve client instances
/// easily.
class SimplexSupabase {
  SimplexSupabase._();

  /// Initializes the Supabase client.
  ///
  /// Can be called on startup in projects using Supabase.
  static Future<void> initialize({
    required String url,
    String? anonKey,
    String? publishableKey,
    http.Client? httpClient,
    bool debug = false,
  }) async {
    final key = publishableKey ?? anonKey;
    assert(key != null, 'Either anonKey or publishableKey must be provided');
    await Supabase.initialize(
      url: url,
      publishableKey: key!,
      httpClient: httpClient,
      debug: debug,
    );
  }

  /// Returns the global standalone [SupabaseClient] instance.
  static SupabaseClient get client {
    return Supabase.instance.client;
  }
}

/// A custom [http.Client] that logs request and response metadata.
/// Useful for debugging Supabase REST / Storage / RPC calls.
class SupabaseLoggerClient extends http.BaseClient {
  final http.Client _inner;

  SupabaseLoggerClient([http.Client? inner]) : _inner = inner ?? http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final String requestId = DateTime.now().millisecondsSinceEpoch.toString();
    SimplexAppLogger.logInfo(
      info: '🌐 [Supabase Req #$requestId] ${request.method} ${request.url}\n'
          'Headers: ${request.headers}',
    );

    try {
      final response = await _inner.send(request);
      
      SimplexAppLogger.logInfo(
        info: '✅ [Supabase Res #$requestId] Status: ${response.statusCode} for ${request.url}\n'
            'Headers: ${response.headers}',
      );
      
      return response;
    } catch (e, stackTrace) {
      SimplexAppLogger.logAppError(
        '❌ [Supabase Err #$requestId] $e for ${request.url}',
        stackTrace,
      );
      rethrow;
    }
  }

  @override
  void close() {
    _inner.close();
    super.close();
  }
}
