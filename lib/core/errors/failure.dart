import 'package:dio/dio.dart';

class Failure {
  const Failure({required this.message});
  final String message;

  @override
  String toString() => "$runtimeType(message: $message)";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
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

class FirebaseFailure extends Failure {
  final String code;
  FirebaseFailure({required this.code, required super.message});
  factory FirebaseFailure.fromCode(String code) {
    switch (code) {
      case 'weak-password':
        {
          return FirebaseFailure(
            code: code,
            message: 'The password is too weak.',
          );
        }
      case 'invalid-email':
        {
          return FirebaseFailure(
            code: code,
            message: 'The email address is badly formatted.',
          );
        }
      case "user-not-found":
        {
          return FirebaseFailure(
            code: code,
            message: 'There is no user corresponding to this email.',
          );
        }
      case "wrong-password":
        {
          return FirebaseFailure(
            code: code,
            message: 'The password is wrong for the given email.',
          );
        }
      case 'email-already-in-use':
        {
          return FirebaseFailure(
            code: code,
            message: 'The account already exists for that email.',
          );
        }
      case 'invalid-credential':
        {
          return FirebaseFailure(
            code: code,
            message: 'The password is wrong for the given email',
          );
        }
      case "not-verified":
        {
          return FirebaseFailure(
            code: code,
            message: 'The email address is not verified.',
          );
        }
      case "no-user":
        {
          return FirebaseFailure(
            code: code,
            message: 'No user found',
          );
        }
      case "requires-recent-login":
        {
          return FirebaseFailure(
            code: code,
            message: 'Requires recent login',
          );
        }
      default:
        return FirebaseFailure(
          code: code,
          message: 'Something went wrong.',
        );
    }
  }
}

class NoUserLogedInFailure extends Failure {
  NoUserLogedInFailure({required super.message});
}

class NoInternetFailure extends Failure {
  NoInternetFailure({required super.message});
}

class ParserFailure extends Failure {
  ParserFailure({required super.message});
}

class OtherFailure extends Failure {
  OtherFailure({required super.message});
}
