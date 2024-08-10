part of 'task_viewmodel.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TaskViewmodelState with _$TaskViewmodelState {
  
 const factory TaskViewmodelState.initial() = _Initial;

  /// get all tasks
  const factory TaskViewmodelState.allTasksLoading() = _AllTasksLoading;
  const factory TaskViewmodelState.allTasksCompleted(
      {required List<TaskModel> allTasks}) = _AllTasksCompleted;
  const factory TaskViewmodelState.allTasksFailed({required String message}) =
      _AllTasksFailed;

  /// search
  const factory TaskViewmodelState.searchLoading() = _SearchLoading;
  const factory TaskViewmodelState.searchCompleted(
      {required List<TaskModel> searchedTasks}) = _SearchCompleted;
  const factory TaskViewmodelState.searchFailed({required String message}) =
      _SearchFailed;

  /// get total estimated time
  const factory TaskViewmodelState.getTotalEstimatedTimeLoading() =
      _GetTotalEstimatedTimeLoading;
  const factory TaskViewmodelState.getTotalEstimatedTimeCompleted(
      {required Duration totalEstimatedTime}) = _GetTotalEstimatedTimeCompleted;
  const factory TaskViewmodelState.getTotalEstimatedTimeFailed(
      {required String message}) = _GetTotalEstimatedTimeFailed;

  /// update total estimated time
  const factory TaskViewmodelState.updateTotalEstimatedTimeLoading() =
      _UpdateTotalEstimatedTimeLoading;
  const factory TaskViewmodelState.updateTotalEstimatedTimeFailed(
      {required String message}) = _UpdateTotalEstimatedTimeFailed;
  const factory TaskViewmodelState.updateTotalEstimatedTimeCompleted(
          {required Duration totalEstimatedTime}) =
      _UpdateTotalEstimatedTimeCompleted;

  /// upload tasks
  const factory TaskViewmodelState.uploadTasksLoading() = _UploadTasksLoading;
  const factory TaskViewmodelState.uploadTasksFailed({required String message}) =
      _UploadTasksFailed;
  const factory TaskViewmodelState.uploadTasksCompleted(
      {required TaskModel meupdatedTaskssage}) = _UploadTasksCompleted;

  /// download tasks
  const factory TaskViewmodelState.downloadTasksLoading() = _DownloadTasksLoading;
  const factory TaskViewmodelState.downloadTasksFailed({required String message}) =
      _DownloadTasksFailed;
  const factory TaskViewmodelState.downloadTasksCompleted(
      {required List<TaskModel> downloadedTasks}) = _DownloadTasksCompleted;

  /// update task
  const factory TaskViewmodelState.updateTaskLoading() = _UpdateTaskLoading;
  const factory TaskViewmodelState.updateTaskFailed({required String message}) =
      _UpdateTaskFailed;
  const factory TaskViewmodelState.updateTaskCompleted(
      {required TaskModel updatedTask}) = _UpdateTaskCompleted;

  /// get task
  const factory TaskViewmodelState.getTaskByIdLoading() = _GetTaskByIdLoading;
  const factory TaskViewmodelState.getTaskByIdFailed({required String message}) =
      _GetTaskByIdFailed;
  const factory TaskViewmodelState.getTaskByIdCompleted(
      {required TaskModel taskById}) = _GetTaskByIdCompleted;

  /// create task
  const factory TaskViewmodelState.createTaskLoading() = _CreateTaskLoading;
  const factory TaskViewmodelState.createTaskFailed({required String message}) =
      _CreateTaskFailed;
  const factory TaskViewmodelState.createTaskCompleted(
      {required TaskModel createdTask}) = _CreateTaskCompleted;

  /// delete task
  const factory TaskViewmodelState.deleteTaskLoading() = _DeleteTaskLoading;
  const factory TaskViewmodelState.deleteTaskFailed({required String message}) =
      _DeleteTaskFailed;
  const factory TaskViewmodelState.deleteTaskCompleted(
      {required TaskModel deletedTask}) = _DeleteTaskCompleted;
}
