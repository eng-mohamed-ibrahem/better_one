import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/user_model/user_model.dart';

abstract class AuthInterface {
  void init();
  Future<ResultHandler<UserModel, ApiFailure>> logIn(
      {required String email, required String password});
  Future<ResultHandler<UserModel, ApiFailure>> signUp(
      {required String email, required String password});
  Future<ResultHandler<bool, ApiFailure>> logOut();
  Future<ResultHandler<bool, ApiFailure>> isOnline();
}
