import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/user_model/user_model.dart';

abstract class AuthInterface {
  Future<ResultHandler<UserModel, ApiFailure>> logIn(
      {required String email, required String password});
  Future<ResultHandler<UserModel, ApiFailure>> signUp(
      {required String email, required String password});
}
