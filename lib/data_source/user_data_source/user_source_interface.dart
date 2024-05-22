import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/task_model/task_model.dart';

import '../../model/user_model/user_model.dart';

abstract class UserSourceInterface {
  Future<ResultHandler<UserModel?, Failure>> getUserDetails();

  Future<ResultHandler<bool, Failure>> logOut();
  Future<ResultHandler<UserModel?, Failure>> updateUserDetails({
    String? newEmail,
    String? newPassword,
    String? newDisplayName,
  });

  Future<ResultHandler<bool, Failure>> uploadTasks(
      {required List<TaskModel> tasks});
}
