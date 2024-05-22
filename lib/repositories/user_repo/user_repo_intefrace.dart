import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/user_model/user_model.dart';

abstract class UserRepoInterface {
  Future<ResultHandler<UserModel?, Failure>> getUserDetails();
  Future<ResultHandler<bool, Failure>> logOut();

  Future<ResultHandler<UserModel?, Failure>> updateUserDetails({
    String? newEmail,
    String? newPassword,
    String? newDisplayName,
  });
}
