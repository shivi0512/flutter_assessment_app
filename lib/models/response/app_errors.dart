
import '../../constants/app_strings.dart';

abstract class AppErrors implements Exception {
  String get message;
}

class ApiError extends AppErrors {
  @override
  final String message;

  ApiError({
    this.message = AppStrings.unknownError,
  });
}

class TimeoutError extends AppErrors {
  @override
  final String message;

  TimeoutError({
    this.message = AppStrings.connectionTimeout,
  });
}

class NoConnectionError extends AppErrors {
  @override
  final String message;

  NoConnectionError({
    this.message = AppStrings.noConnection,
  });
}

class UnAuthorizeError extends AppErrors {
  @override
  final String message;

  UnAuthorizeError({
    this.message = AppStrings.unauthorize,
  });
}