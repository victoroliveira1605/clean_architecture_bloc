class ConnectionExceptions implements Exception {}

class ServerException implements Exception {}

class CacheException implements Exception {}

class TimeoutException extends ConnectionExceptions {
  TimeoutException() : super();
}

class NetworkException extends ConnectionExceptions {
  NetworkException() : super();
}

class BadRequestException extends ConnectionExceptions {
  BadRequestException() : super();
}

class UnauthorisedException extends ConnectionExceptions {
  UnauthorisedException() : super();
}

class AppExceptions implements Exception {
  final String error;
  AppExceptions(this.error) : super();
}

class GenericException extends AppExceptions {
  final String error;
  GenericException(this.error) : super(error);
}
