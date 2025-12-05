/// Base exception class
class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

/// Exception thrown when server returns an error
class ServerException extends AppException {
  ServerException([super.message = 'Server error occurred']);
}

/// Exception thrown when there's a network error
class NetworkException extends AppException {
  NetworkException([super.message = 'No internet connection']);
}

/// Exception thrown when cache operation fails
class CacheException extends AppException {
  CacheException([super.message = 'Cache error occurred']);
}

/// Exception thrown when authentication fails
class AuthenticationException extends AppException {
  AuthenticationException([super.message = 'Authentication failed']);
}

/// Exception thrown when authorization fails
class AuthorizationException extends AppException {
  AuthorizationException([super.message = 'Access denied']);
}

/// Exception thrown when data validation fails
class ValidationException extends AppException {
  ValidationException([super.message = 'Validation failed']);
}

/// Exception thrown when requested resource is not found
class NotFoundException extends AppException {
  NotFoundException([super.message = 'Resource not found']);
}

/// Exception thrown when request times out
class TimeoutException extends AppException {
  TimeoutException([super.message = 'Request timeout']);
}
