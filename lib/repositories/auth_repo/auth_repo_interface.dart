import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/user_model/user_model.dart';

abstract class AuthRepoInterface {
  Future<ResultHandler<UserModel, Failure>> logIn(
      {required String email, required String password});

  Future<ResultHandler<UserModel, Failure>> signUp(
      {required String email, required String password, required String name});


}
