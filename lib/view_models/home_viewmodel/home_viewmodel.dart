import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/task_repo/task_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'home_viewmodel.freezed.dart';
part 'home_viewmodel_state.dart';

class HomeViewmodel extends Cubit<HomeViewmodelState> {
  HomeViewmodel({required this.taskRepoInterface})
      : super(HomeViewmodelState(
          scrollController: ScrollController(),
        ));
  final TaskRepoInterface taskRepoInterface;

  static HomeViewmodel get(context) => BlocProvider.of<HomeViewmodel>(context);

  void getTasks() async {
    release();
    emit(state.copyWith(
      isGetAllTasksLoading: true,
      isInitial: false,
    ));
    var result = await taskRepoInterface.getTasks();
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

  void addTask(TaskModel task) async {
    release();
    emit(state.copyWith(isTaskAddLoading: true));
    var result = await taskRepoInterface.addTask(task);
    result.when(
      success: (task) {
        emit(
          state.copyWith(
            isTaskAddLoading: false,
            isTaskAddCompleted: true,
            addedTask: task,
            allTasks: state.allTasks..add(task),
          ),
        );
        state.scrollController!.hasClients
            ? state.scrollController!.animateTo(
                state.scrollController!.position.maxScrollExtent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              )
            : null;
      },
      failure: (error) {
        emit(
          state.copyWith(
            isTaskAddLoading: false,
            isTaskAddCompleted: false,
            isTaskAddFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void updateTask(TaskModel oldTask, TaskModel newTask) async {
    release();
    emit(state.copyWith(isTaskUpdateLoading: true));
    int index = state.allTasks.indexOf(oldTask);
    var result = await taskRepoInterface.updateTask(oldTask, newTask);
    result.when(
      success: (updatedTask) {
        emit(
          state.copyWith(
            isTaskUpdateLoading: false,
            isTaskUpdateCompleted: true,
            updatedTask: updatedTask,
            allTasks: state.allTasks..[index] = updatedTask,
          ),
        );
      },
      failure: (error) {
        Logger().e(error.message);
        emit(
          state.copyWith(
            isTaskUpdateLoading: false,
            isTaskUpdateCompleted: false,
            isTaskUpdateFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void removeTask(TaskModel removedTask) async {
    release();
    emit(state.copyWith(isTaskRemoveLoading: true));
    var result = await taskRepoInterface.removeTask(removedTask);
    result.when(
      success: (value) {
        updateTotalEstimatedTime(removedTask.elapsedTime, isAdding: false);
        emit(
          state.copyWith(
            isTaskRemoveLoading: false,
            isTaskRemoveCompleted: true,
            removedTask: removedTask,
            allTasks: state.allTasks..remove(removedTask),
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isTaskRemoveLoading: false,
            isTaskRemoveCompleted: false,
            isTaskRemoveFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void getTaskById(String id) async {
    release();
    emit(state.copyWith(isGetTaskByIdLoading: true, taskById: null));
    var result = await taskRepoInterface.getTaskById(id);
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

  /// update task and total estimated time on exit
  /// [plusTime] is added to task and total estimated time
  /// this happen if exit while task is in progress
  void updateTaskAndTotalEstimatedTime(
      TaskModel task, TaskStatus status, Duration plusTime) {
    updateTask(
      task,
      task.copyWith(
        elapsedTime: task.elapsedTime + plusTime,
        status: status,
      ),
    );
    updateTotalEstimatedTime(plusTime);
  }

  void getTotalEstimatedTime() async {
    release();
    var result = await taskRepoInterface.getTotoalEstimatedTime();
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
        });
  }

  void updateTotalEstimatedTime(Duration updatedTime,
      {bool isAdding = true}) async {
    release();
    var result = await taskRepoInterface.updateTotalEstimatedTime(
        updatedTime.inMicroseconds, isAdding);
    result.when(
      success: (totalTime) => emit(
        state.copyWith(
          isUpdateTotalEstimatedTimeCompleted: true,
          totalEstimatedTime: Duration(microseconds: totalTime),
        ),
      ),
      failure: (error) {
        emit(
          state.copyWith(
            isUpdateTotalEstimatedTimeCompleted: false,
            isUpdateTotalEstimatedTimeFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  /// release all states to initial state except [allTasks] and [totalEstimatedTime]
  /// i use this when navigate back from [TaskScreen] to release all states corresponding to this screen
  void release() {
    emit(
      state.copyWith(
        isTaskAddLoading: false,
        isTaskAddCompleted: false,
        isTaskAddFailed: false,
        isTaskUpdateLoading: false,
        isTaskUpdateCompleted: false,
        isTaskUpdateFailed: false,
        isTaskRemoveLoading: false,
        isTaskRemoveCompleted: false,
        isTaskRemoveFailed: false,
        isGetTaskByIdLoading: false,
        isGetTaskByIdCompleted: false,
        isGetTaskByIdFailed: false,
        errorMessage: null,
        // addedTask: null,
        // updatedTask: null,
        // removedTask: null,
        // taskById: null,
      ),
    );
  }
}
