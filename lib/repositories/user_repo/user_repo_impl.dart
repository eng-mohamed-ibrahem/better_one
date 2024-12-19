import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/service/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/data_source/user_data_source/locale_user_source.dart';
import 'package:better_one/data_source/user_data_source/remote_user_source.dart';
import 'package:better_one/model/event_calendar_model/event_calendar_model.dart';
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

  /// [getUserDetails] to get user details
  ///
  @override
  Future<ResultHandler<UserModel, Failure>> getUserDetails() async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await remoteUserSource.getUserDetails();
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  /// [logOut] to log out user
  /// only if user is connected
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

  /// [updateUserDetails] to update user details
  /// only if user is connected
  @override
  Future<ResultHandler<UserModel, Failure>> updateUserDetails({
    String? newEmail,
    String? newPassword,
    String? newDisplayName,
    String? newPhotoPath,
  }) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await remoteUserSource.updateUserDetails(
        newEmail: newEmail,
        newPassword: newPassword,
        newDisplayName: newDisplayName,
        newPhotoPath: newPhotoPath,
      );
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  /// [addTask] to add task
  ///
  /// This function add task to database and also to server if user is connected to internet
  ///
  @override
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel task) async {
    var connected = await NetworkConnection.isConnected();
    var user = inject<LocaleUserInfo>().getUserData();
    if (connected && user != null) {
      var result = await remoteUserSource.addTask(task);
      return result.when(
        success: (addedTask) async {
          /// add task to locale database after adding task to server
          await localeUserSource.addTask(task);
          return ResultHandler.success(data: addedTask);
        },
        failure: (failure) async {
          return await localeUserSource.addTask(task);
        },
      );
    } else {
      return await localeUserSource.addTask(task);
    }
  }

  /// [removeTask] to remove task
  ///
  /// This function remove task from database and also from server if user is connected to internet
  @override
  Future<ResultHandler<TaskModel, Failure>> removeTask(
      TaskModel removedTask) async {
    var connected = await NetworkConnection.isConnected();
    var user = inject<LocaleUserInfo>().getUserData();
    if (connected && user != null) {
      var result = await remoteUserSource.removeTask(removedTask);
      return result.when(
        success: (removedTask) async {
          await localeUserSource.removeTask(removedTask);
          return ResultHandler.success(data: removedTask);
        },
        failure: (failure) async {
          return await localeUserSource.removeTask(removedTask);
        },
      );
    } else {
      return await localeUserSource.removeTask(removedTask);
    }
  }

  /// [updateTask] to update task
  ///
  /// This function update task in database and also in server if user is connected to internet
  @override
  Future<ResultHandler<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask) async {
    var connected = await NetworkConnection.isConnected();
    var user = inject<LocaleUserInfo>().getUserData();
    if (connected && user != null) {
      var result = await remoteUserSource.updateTask(oldTask, newTask);
      return result.when(
        success: (updatedTask) async {
          await localeUserSource.updateTask(oldTask, newTask);
          return ResultHandler.success(data: updatedTask);
        },
        failure: (failure) async {
          return await localeUserSource.updateTask(oldTask, newTask);
        },
      );
    }
    return await localeUserSource.updateTask(oldTask, newTask);
  }

  /// [getTaskById] to get task by id
  ///
  /// in case of internet get from server. else, get task from database
  @override
  Future<ResultHandler<TaskModel?, Failure>> getTaskById(String id) async {
    var connected = await NetworkConnection.isConnected();
    var user = inject<LocaleUserInfo>().getUserData();
    if (connected && user != null) {
      var result = await remoteUserSource.getTaskById(id);
      return result.when(
        success: (task) async {
          return ResultHandler.success(data: task);
        },
        failure: (failure) async {
          return await localeUserSource.getTaskById(id);
        },
      );
    } else {
      return await localeUserSource.getTaskById(id);
    }
  }

  @override
  Future<ResultHandler<List<TaskModel>, Failure>> filterWithStatuses(
      Set<TaskStatus> statuses) async {
    return await localeUserSource.filterWithStatuses(statuses);
  }

  @override
  Future<ResultHandler<List<TaskModel>, Failure>> search(String query) async {
    return await localeUserSource.search(query);
  }

  @override
  Future<ResultHandler<void, Failure>> createEvent(
      EventCalendarModel event) async {
    return await localeUserSource.createEvent(event);
  }
}
