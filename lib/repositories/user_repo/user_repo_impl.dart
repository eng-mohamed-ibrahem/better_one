import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/user_data_source/locale_user_source.dart';
import 'package:better_one/data_source/user_data_source/remote_user_source.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../core/utils/network_connection/network_connection.dart';

class UserRepoImpl implements UserRepoInterface {
  UserRepoImpl(
      {required this.localeUserSource, required this.remoteUserSource});
  final LocaleUserSource localeUserSource;
  final RemoteUserSource remoteUserSource;
  @override
  Future<ResultHandler<UserModel?, Failure>> getUserDetails() async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await remoteUserSource.getUserDetails();
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> logOut() async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await remoteUserSource.logOut();
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<UserModel?, Failure>> updateUserDetails(
      {String? newEmail, String? newPassword, String? newDisplayName}) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await remoteUserSource.updateUserDetails(
        newEmail: newEmail,
        newPassword: newPassword,
        newDisplayName: newDisplayName,
      );
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel task) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await remoteUserSource.addTask(task);
    }
    return await localeUserSource.addTask(task);
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> removeTask(
      TaskModel removedTask) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await remoteUserSource.removeTask(removedTask);
    }
    return await localeUserSource.removeTask(removedTask);
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await remoteUserSource.updateTask(oldTask, newTask);
    }
    return await localeUserSource.updateTask(oldTask, newTask);
  }

  @override
  Future<ResultHandler<TaskModel?, Failure>> getTaskById(String id) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await remoteUserSource.getTaskById(id);
    }
    return await localeUserSource.getTaskById(id);
  }
}
