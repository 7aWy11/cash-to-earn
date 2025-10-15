import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Interceptor for API requests
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('🌐 REQUEST[${options.method}] => PATH: ${options.path}');
    }

    // Add authorization token if available
    // final token = await getStoredToken(); // Implement token retrieval
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }

    // Add common headers
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        '❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );
      print('ERROR MESSAGE: ${err.message}');
    }

    // Handle specific error codes
    if (err.response?.statusCode == 401) {
      // Handle unauthorized - refresh token or redirect to login
      if (kDebugMode) {
        print('🔒 Unauthorized - Token expired or invalid');
      }
    }

    super.onError(err, handler);
  }
}



