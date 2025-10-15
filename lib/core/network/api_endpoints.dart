import '../constants/app_constants.dart';

/// API endpoint definitions
class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = AppConstants.apiBaseUrl;

  // Helper method to build endpoint with path parameters
  static String buildEndpoint(String endpoint, Map<String, String> params) {
    String result = endpoint;
    params.forEach((key, value) {
      result = result.replaceAll('{$key}', value);
    });
    return result;
  }
}
