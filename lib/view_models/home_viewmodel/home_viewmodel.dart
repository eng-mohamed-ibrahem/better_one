import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/task_repo/task_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_viewmodel.freezed.dart';
part 'home_viewmodel_state.dart';

class HomeViewmodel extends Cubit<HomeViewmodelState> {
  HomeViewmodel({required this.taskRepo})
      : super(HomeViewmodelState(
          scrollController: ScrollController(),
        ));
  final TaskRepoInterface taskRepo;

  void getTasks() async {
    emit(state.copyWith(
      isGetAllTasksLoading: true,
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
        });
  }
}
