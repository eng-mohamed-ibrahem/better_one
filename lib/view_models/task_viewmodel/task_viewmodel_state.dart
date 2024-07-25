part of 'task_viewmodel.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TaskViewmodelState with _$TaskViewmodelState {
  const factory TaskViewmodelState({
    @Default(true) bool isInitial,

    /// get all tasks
    @Default(false) bool isGetAllTasksLoading,
    @Default(false) bool isGetAllTasksCompleted,
    @Default(false) bool isGetAllTasksFailed,
    @Default([]) List<TaskModel> allTasks,

    /// error message
    @Default(null) String? errorMessage,

    /// search
    @Default(false) bool isSearchLoading,
    @Default(false) bool isSearchCompleted,
    @Default(false) bool isSearchFailed,
    @Default(null) List<TaskModel>? searchedTasks,

    /// get total estimated time
    @Default(false) bool isGetTotalEstimatedTimeLoading,
    @Default(false) bool isGetTotalEstimatedTimeCompleted,
    @Default(false) bool isGetTotalEstimatedTimeFailed,

    /// update total estimated time
    @Default(false) bool isUpdateTotalEstimatedTimeLoading,
    @Default(false) bool isUpdateTotalEstimatedTimeCompleted,
    @Default(false) bool isUpdateTotalEstimatedTimeFailed,
    @Default(Duration.zero) Duration totalEstimatedTime,

    /// scroll controller
    @Default(null) ScrollController? scrollController,

    /// upload tasks
    @Default(false) bool isUploadTasksLoading,
    @Default(false) bool isUploadTasksSuccess,
    @Default(false) bool isUploadTasksFailed,

    /// download tasks
    @Default(false) bool isDownloadTasksLoading,
    @Default(false) bool isDownloadTasksSuccess,
    @Default(false) bool isDownloadTasksFailed,

    /// create task
    @Default(false) bool isCreateTaskLoading,
    @Default(false) bool isCreateTaskSuccess,
    @Default(false) bool isCreateTaskFailed,
    @Default(null) TaskModel? createdTask,

    /// update task
    @Default(false) bool isUpdateTaskLoading,
    @Default(false) bool isUpdateTaskSuccess,
    @Default(false) bool isUpdateTaskFailed,
    @Default(null) TaskModel? updatedTask,

    /// delete task
    @Default(false) bool isDeleteTaskLoading,
    @Default(false) bool isDeleteTaskSuccess,
    @Default(false) bool isDeleteTaskFailed,
    @Default(null) TaskModel? deletedTask,

    /// get task
    @Default(false) bool isGetTaskByIdLoading,
    @Default(false) bool isGetTaskByIdCompleted,
    @Default(false) bool isGetTaskByIdFailed,
    @Default(null) TaskModel? taskById,
  }) = _TaskViewmodelState;
}
