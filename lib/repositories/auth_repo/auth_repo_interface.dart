import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/user_model/user_model.dart';

abstract class AuthRepoInterface {
  Future<Result<UserModel, Failure>> logIn(
      {required String email, required String password});

  Future<Result<UserModel, Failure>> signUp(
      {required String email, required String password});

  Future<Result<bool, Failure>> logOut();
  Future<Result<bool, Failure>> isOnline();
}
