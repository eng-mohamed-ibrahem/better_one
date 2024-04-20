import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/user_model/user_model.dart';

abstract class AuthInterface {
  void init();
  Future<Result<UserModel, ApiFailure>> logIn(
      {required String email, required String password});
  Future<Result<UserModel, ApiFailure>> signUp(
      {required String email, required String password});
  Future<Result<bool, ApiFailure>> logOut();
  Future<Result<bool, ApiFailure>> isOnline();
}
