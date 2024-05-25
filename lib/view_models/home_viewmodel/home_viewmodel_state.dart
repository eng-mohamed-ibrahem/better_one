part of 'home_viewmodel.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HomeViewmodelState with _$HomeViewmodelState {
  const factory HomeViewmodelState({
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

    /// download tasks
    @Default(false) bool isDownloadTasksLoading,
    @Default(false) bool isDownloadTasksCompleted,
    @Default(false) bool isDownloadTasksFailed,
  }) = _HomeViewmodelState;
}
