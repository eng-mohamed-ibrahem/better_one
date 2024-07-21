part of 'home_viewmodel.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HomeViewmodelState with _$HomeViewmodelState {
  const factory HomeViewmodelState({
    @Default(true) bool isInitial,
    //* get all tasks
    @Default(false) bool isGetAllTasksLoading,
    @Default(false) bool isGetAllTasksCompleted,
    @Default(false) bool isGetAllTasksFailed,
    @Default([]) List<TaskModel> allTasks,
    //* update task
    @Default(false) bool isTaskUpdateLoading,
    @Default(false) bool isTaskUpdateCompleted,
    @Default(false) bool isTaskUpdateFailed,
    @Default(null) TaskModel? updatedTask,
    //* remove task
    @Default(false) bool isTaskRemoveLoading,
    @Default(false) bool isTaskRemoveCompleted,
    @Default(false) bool isTaskRemoveFailed,
    @Default(null) TaskModel? removedTask,
    //* add task
    @Default(false) bool isTaskAddLoading,
    @Default(false) bool isTaskAddCompleted,
    @Default(false) bool isTaskAddFailed,
    @Default(null) TaskModel? addedTask,
    //* task by id
    @Default(false) bool isGetTaskByIdLoading,
    @Default(false) bool isGetTaskByIdCompleted,
    @Default(false) bool isGetTaskByIdFailed,
    @Default(null) TaskModel? taskById,
    //* error message
    @Default(null) String? errorMessage,
    //* search
    @Default(false) bool isSearchLoading,
    @Default(false) bool isSearchCompleted,
    @Default(false) bool isSearchFailed,
    @Default(null) List<TaskModel>? searchedTasks,
    // * get total estimated time
    @Default(false) bool isGetTotalEstimatedTimeLoading,
    @Default(false) bool isGetTotalEstimatedTimeCompleted,
    @Default(false) bool isGetTotalEstimatedTimeFailed,
    // * update total estimated time
    @Default(false) bool isUpdateTotalEstimatedTimeLoading,
    @Default(false) bool isUpdateTotalEstimatedTimeCompleted,
    @Default(false) bool isUpdateTotalEstimatedTimeFailed,
    @Default(Duration.zero) Duration totalEstimatedTime,
    //* scroll controller
    @Default(null) ScrollController? scrollController,
  }) = _HomeViewmodelState;
}