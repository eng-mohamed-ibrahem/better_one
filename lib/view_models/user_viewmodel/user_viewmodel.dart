import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_viewmodel.freezed.dart';
part 'user_viewmodel_state.dart';

class UserViewmodel extends Cubit<UserViewmodelState> {
  UserViewmodel({required this.userRepo}) : super(const UserViewmodelState());
  final UserRepoInterface userRepo;
  void logout() async {
    emit(state.copyWith(isLogoutLoading: true, isLogoutFailed: false));
    var result = await userRepo.logOut();
    result.when(
      success: (loggedOut) {
        emit(
          state.copyWith(
            isLogoutLoading: false,
            isLogoutSuccess: loggedOut,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isLogoutLoading: false,
            isLogoutFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void getUserDetails() async {
    emit(state.copyWith(
        isGetUserDetailsLoading: true, isGetUserDetailsFailed: false));
    var userData = await userRepo.getUserDetails();
    userData.when(
      success: (user) {
        emit(
          state.copyWith(
            isGetUserDetailsLoading: false,
            isGetUserDetailsSuccess: true,
            user: user,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isGetUserDetailsLoading: false,
            isGetUserDetailsFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  /// upload tasks
  void uploadTasks() async {}

  void createTask(TaskModel task) async {
    emit(state.copyWith(isCreateTaskLoading: true, isCreateTaskFailed: false));
    var result = await userRepo.addTask(task);
    result.when(
      success: (task) {
        emit(
          state.copyWith(
            isCreateTaskLoading: false,
            isCreateTaskSuccess: true,
            createdTask: task,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isCreateTaskLoading: false,
            isCreateTaskSuccess: false,
            isCreateTaskFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void updateTask(TaskModel oldTask, TaskModel newTask) async {
    emit(state.copyWith(isUpdateTaskLoading: true, isUpdateTaskFailed: false));
    var result = await userRepo.updateTask(oldTask, newTask);
    result.when(
      success: (updatedTask) {
        emit(
          state.copyWith(
            isUpdateTaskLoading: false,
            isUpdateTaskSuccess: true,
            updatedTask: updatedTask,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isUpdateTaskLoading: false,
            isUpdateTaskSuccess: false,
            isUpdateTaskFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void deleteTask(TaskModel deletedTask) async {
    emit(state.copyWith(isDeleteTaskLoading: true, isDeleteTaskFailed: false));
    var result = await userRepo.removeTask(deletedTask);
    result.when(
      success: (task) {
        emit(
          state.copyWith(
            isDeleteTaskLoading: false,
            isDeleteTaskSuccess: true,
            deletedTask: task,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isDeleteTaskLoading: false,
            isDeleteTaskSuccess: false,
            isDeleteTaskFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void getTaskById(String id) async {
    emit(state.copyWith(
      isGetTaskByIdLoading: true,
      isGetTaskByIdFailed: false,
      taskById: null,
    ));
    var result = await userRepo.getTaskById(id);
    result.when(
      success: (task) {
        emit(
          state.copyWith(
            isGetTaskByIdLoading: false,
            isGetTaskByIdCompleted: true,
            taskById: task,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isGetTaskByIdLoading: false,
            isGetTaskByIdCompleted: false,
            isGetTaskByIdFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }
}
