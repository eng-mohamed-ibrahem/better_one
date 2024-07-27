import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/task_repo/task_repo_interface.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_viewmodel.freezed.dart';
part 'task_viewmodel_state.dart';

class TaskViewmodel extends Cubit<TaskViewmodelState> {
  TaskViewmodel({required this.taskRepo, required this.userRepo})
      : super(TaskViewmodelState(
          scrollController: ScrollController(),
        ));
  final TaskRepoInterface taskRepo;
  final UserRepoInterface userRepo;

  void getTasks() async {
    emit(state.copyWith(
      isGetAllTasksLoading: true,
      isGetAllTasksFailed: false,
      isGetAllTasksCompleted: false,
      isInitial: false,
    ));
    var result = await taskRepo.getAllTasks();
    result.when(
      success: (tasks) {
        emit(
          state.copyWith(
            isGetAllTasksLoading: false,
            isGetAllTasksCompleted: true,
            allTasks: tasks,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isGetAllTasksLoading: false,
            isGetAllTasksCompleted: false,
            isGetAllTasksFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void createTask(TaskModel task) async {
    emit(state.copyWith(
        isCreateTaskLoading: true,
        isCreateTaskFailed: false,
        isCreateTaskSuccess: false));
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
    emit(state.copyWith(
        isUpdateTaskLoading: true,
        isUpdateTaskFailed: false,
        isUpdateTaskSuccess: false));
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
    emit(state.copyWith(
        isDeleteTaskLoading: true,
        isDeleteTaskFailed: false,
        isDeleteTaskSuccess: false));
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
      isGetTaskByIdCompleted: false,
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

  void getTotalEstimatedTime() async {
    var result = await taskRepo.getTotoalEstimatedTime();
    result.when(
      success: (totalTime) => emit(
        state.copyWith(
          isGetTotalEstimatedTimeCompleted: true,
          totalEstimatedTime: Duration(microseconds: totalTime),
        ),
      ),
      failure: (error) {
        emit(
          state.copyWith(
            isGetTotalEstimatedTimeCompleted: false,
            isGetTotalEstimatedTimeFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  TaskViewmodelState initialState() {
    return state.copyWith(
      isCreateTaskFailed: false,
      isCreateTaskLoading: false,
      isCreateTaskSuccess: false,
      isGetAllTasksCompleted: false,
      isGetAllTasksFailed: false,
      isGetAllTasksLoading: false,
      isDeleteTaskFailed: false,
      isDeleteTaskLoading: false,
      isDeleteTaskSuccess: false,
      isUpdateTaskFailed: false,
      isUpdateTaskLoading: false,
      isUpdateTaskSuccess: false,
      isGetTaskByIdCompleted: false,
      isGetTaskByIdFailed: false,
      isGetTaskByIdLoading: false,
      isDownloadTasksFailed: false,
      isDownloadTasksLoading: false,
      isDownloadTasksSuccess: false,
    );
  }
}
