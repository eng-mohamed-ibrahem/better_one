part of 'task_viewmodel.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TaskViewmodelState with _$TaskViewmodelState {
  
  factory TaskViewmodelState.initial() = _Initial;

  /// get all tasks
  factory TaskViewmodelState.allTasksLoading() = _AllTasksLoading;
  factory TaskViewmodelState.allTasksCompleted(
      {required List<TaskModel> allTasks}) = _AllTasksCompleted;
  factory TaskViewmodelState.allTasksFailed({required String message}) =
      _AllTasksFailed;

  /// search
  factory TaskViewmodelState.searchLoading() = _SearchLoading;
  factory TaskViewmodelState.searchCompleted(
      {required List<TaskModel> searchedTasks}) = _SearchCompleted;
  factory TaskViewmodelState.searchFailed({required String message}) =
      _SearchFailed;

  /// get total estimated time
  factory TaskViewmodelState.getTotalEstimatedTimeLoading() =
      _GetTotalEstimatedTimeLoading;
  factory TaskViewmodelState.getTotalEstimatedTimeCompleted(
      {required Duration totalEstimatedTime}) = _GetTotalEstimatedTimeCompleted;
  factory TaskViewmodelState.getTotalEstimatedTimeFailed(
      {required String message}) = _GetTotalEstimatedTimeFailed;

  /// update total estimated time
  factory TaskViewmodelState.updateTotalEstimatedTimeLoading() =
      _UpdateTotalEstimatedTimeLoading;
  factory TaskViewmodelState.updateTotalEstimatedTimeFailed(
      {required String message}) = _UpdateTotalEstimatedTimeFailed;
  factory TaskViewmodelState.updateTotalEstimatedTimeCompleted(
          {required Duration totalEstimatedTime}) =
      _UpdateTotalEstimatedTimeCompleted;

  /// upload tasks
  factory TaskViewmodelState.uploadTasksLoading() = _UploadTasksLoading;
  factory TaskViewmodelState.uploadTasksFailed({required String message}) =
      _UploadTasksFailed;
  factory TaskViewmodelState.uploadTasksCompleted(
      {required TaskModel meupdatedTaskssage}) = _UploadTasksCompleted;

  /// download tasks
  factory TaskViewmodelState.downloadTasksLoading() = _DownloadTasksLoading;
  factory TaskViewmodelState.downloadTasksFailed({required String message}) =
      _DownloadTasksFailed;
  factory TaskViewmodelState.downloadTasksCompleted(
      {required List<TaskModel> downloadedTasks}) = _DownloadTasksCompleted;

  /// update task
  factory TaskViewmodelState.updateTaskLoading() = _UpdateTaskLoading;
  factory TaskViewmodelState.updateTaskFailed({required String message}) =
      _UpdateTaskFailed;
  factory TaskViewmodelState.updateTaskCompleted(
      {required TaskModel updatedTask}) = _UpdateTaskCompleted;

  /// get task
  factory TaskViewmodelState.getTaskByIdLoading() = _GetTaskByIdLoading;
  factory TaskViewmodelState.getTaskByIdFailed({required String message}) =
      _GetTaskByIdFailed;
  factory TaskViewmodelState.getTaskByIdCompleted(
      {required TaskModel taskById}) = _GetTaskByIdCompleted;

  /// create task
  factory TaskViewmodelState.createTaskLoading() = _CreateTaskLoading;
  factory TaskViewmodelState.createTaskFailed({required String message}) =
      _CreateTaskFailed;
  factory TaskViewmodelState.createTaskCompleted(
      {required TaskModel createdTask}) = _CreateTaskCompleted;

  /// delete task
  factory TaskViewmodelState.deleteTaskLoading() = _DeleteTaskLoading;
  factory TaskViewmodelState.deleteTaskFailed({required String message}) =
      _DeleteTaskFailed;
  factory TaskViewmodelState.deleteTaskCompleted(
      {required TaskModel deletedTask}) = _DeleteTaskCompleted;
}
