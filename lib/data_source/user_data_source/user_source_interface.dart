import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/user_model/user_model.dart';

abstract class UserSourceInterface {
  Future<ResultHandler<bool, Failure>> setUserDataToLocal(
      {required UserModel user});
  Future<ResultHandler<UserModel, Failure>> getUserDataFromLocal();
}