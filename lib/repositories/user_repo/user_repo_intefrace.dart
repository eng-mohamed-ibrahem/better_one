import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/user_model/user_model.dart';

abstract class UserRepoInterface {
  Future<Result<bool, Failure>> setUserDataToLocal({required UserModel user});
  Future<Result<UserModel, Failure>> getUserDataFromLocal();
}
