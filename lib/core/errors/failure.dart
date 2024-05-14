import 'package:dio/dio.dart';

class Failure {
  const Failure({required this.message});
  final String message;
}

class ApiFailure extends Failure {
  const ApiFailure({required super.message});
  factory ApiFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return const ApiFailure(message: 'Request was cancelled');
      case DioExceptionType.connectionTimeout:
        return const ApiFailure(message: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return const ApiFailure(message: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return const ApiFailure(message: 'Receive timeout');
      case DioExceptionType.badResponse:
        switch (dioError.response!.statusCode) {
          case 400:
            return const ApiFailure(
                message: 'The server could not understand the request.');
          case 401:
            return const ApiFailure(
                message:
                    'Authentication is required and has failed or has not been provided');
          case 403:
            return const ApiFailure(
                message:
                    'The server understood the request but refuses to authorize it');
          case 404:
            return const ApiFailure(
                message:
                    'The requested resource could not be found on the server.');
          case 500:
            return const ApiFailure(message: 'Internal Server Error');
          default:
            return ApiFailure(message: dioError.message!);
        }
      case DioExceptionType.badCertificate:
        return const ApiFailure(message: 'Bad certificate');
      case DioExceptionType.connectionError:
        return const ApiFailure(message: 'Connection error');
      case DioExceptionType.unknown:
        return const ApiFailure(message: 'Unknown error');
    }
  }
}

class SupabaseFailure extends Failure {
  SupabaseFailure({required super.message});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}

class OtherFailure extends Failure {
  OtherFailure({required super.message});
}
