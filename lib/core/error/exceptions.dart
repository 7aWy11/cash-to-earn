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
  ServerException([String message = 'Server error occurred']) : super(message);
}

/// Exception thrown when there's a network error
class NetworkException extends AppException {
  NetworkException([String message = 'No internet connection'])
    : super(message);
}

/// Exception thrown when cache operation fails
class CacheException extends AppException {
  CacheException([String message = 'Cache error occurred']) : super(message);
}

/// Exception thrown when authentication fails
class AuthenticationException extends AppException {
  AuthenticationException([String message = 'Authentication failed'])
    : super(message);
}

/// Exception thrown when authorization fails
class AuthorizationException extends AppException {
  AuthorizationException([String message = 'Access denied']) : super(message);
}

/// Exception thrown when data validation fails
class ValidationException extends AppException {
  ValidationException([String message = 'Validation failed']) : super(message);
}

/// Exception thrown when requested resource is not found
class NotFoundException extends AppException {
  NotFoundException([String message = 'Resource not found']) : super(message);
}

/// Exception thrown when request times out
class TimeoutException extends AppException {
  TimeoutException([String message = 'Request timeout']) : super(message);
}
