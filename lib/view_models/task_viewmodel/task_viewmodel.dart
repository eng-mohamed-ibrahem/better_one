import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/task_repo/task_repo_interface.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_viewmodel.freezed.dart';
part 'task_viewmodel_state.dart';

class TaskViewmodel extends Cubit<TaskViewmodelState> {
  TaskViewmodel({required this.taskRepo, required this.userRepo})
      : super(const _Initial()) {
    scrollController = ScrollController();
  }
  final TaskRepoInterface taskRepo;
  final UserRepoInterface userRepo;

  /// scroll controller
  late ScrollController scrollController;

  /// all tasks
  List<TaskModel> allTasks = [];

  /// total estimated time
  Duration totalEstimatedTime = Duration.zero;

  /// [getTasks] to get all tasks
  void getTasks() async {
    emit(const _AllTasksLoading());
    var result = await taskRepo.getAllTasks();
    result.when(
      success: (tasks) {
        emit(
          _AllTasksCompleted(allTasks: allTasks = tasks),
        );
        getTotalEstimatedTime();
      },
      failure: (error) {
        emit(_AllTasksFailed(
            message:
                error is OtherFailure ? "core.error".tr() : error.message));
      },
    );
  }

  void createTask(TaskModel task) async {
    emit(const _CreateTaskLoading());
    var result = await userRepo.addTask(task);
    result.when(
      success: (task) {
        allTasks.add(task);
        emit(
          _CreateTaskCompleted(createdTask: task),
        );
      },
      failure: (error) {
        emit(
          _CreateTaskFailed(
              message:
                  error is OtherFailure ? "core.error".tr() : error.message),
        );
      },
    );
  }

  void updateTask(TaskModel oldTask, TaskModel newTask) async {
    emit(const _UpdateTaskLoading());
    var result = await userRepo.updateTask(oldTask, newTask);
    result.when(
      success: (updatedTask) {
        int index = allTasks.indexOf(oldTask);
        allTasks[index] = newTask;
        emit(_UpdateTaskCompleted(updatedTask: updatedTask));
        getTotalEstimatedTime();
      },
      failure: (error) {
        emit(
          _UpdateTaskFailed(
              message:
                  error is OtherFailure ? "core.error".tr() : error.message),
        );
      },
    );
  }

  void deleteTask(TaskModel deletedTask) async {
    emit(const _DeleteTaskLoading());
    var result = await userRepo.removeTask(deletedTask);
    result.when(
      success: (task) {
        allTasks.remove(task);
        emit(
          _DeleteTaskCompleted(deletedTask: task),
        );
        getTotalEstimatedTime();
      },
      failure: (error) {
        emit(
          _DeleteTaskFailed(
              message:
                  error is OtherFailure ? "core.error".tr() : error.message),
        );
      },
    );
  }

  void getTaskById(String id) async {
    emit(const _GetTaskByIdLoading());
    var result = await userRepo.getTaskById(id);
    result.when(
      success: (task) {
        emit(
          _GetTaskByIdCompleted(taskById: task!),
        );
      },
      failure: (error) {
        emit(
          _GetTaskByIdFailed(
              message:
                  error is OtherFailure ? "core.error".tr() : error.message),
        );
      },
    );
  }

  void getTotalEstimatedTime() async {
    emit(const _GetTotalEstimatedTimeLoading());
    var result = await taskRepo.getTotoalEstimatedTime();
    result.when(
      success: (totalTime) {
        emit(
          _GetTotalEstimatedTimeCompleted(
              totalEstimatedTime: totalEstimatedTime =
                  Duration(microseconds: totalTime)),
        );
      },
      failure: (error) {
        kDebugPrint(error.message);
        emit(
          _GetTotalEstimatedTimeFailed(
              message:
                  error is OtherFailure ? "core.error".tr() : error.message),
        );
      },
    );
  }
}
