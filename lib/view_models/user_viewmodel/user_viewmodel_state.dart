part of 'user_viewmodel.dart';

@freezed
class UserViewmodelState with _$UserViewmodelState {
  const factory UserViewmodelState({
    @Default(true) bool isInitialized,

    /// logout
    @Default(false) bool isLogoutLoading,
    @Default(false) bool isLogoutSuccess,
    @Default(false) bool isLogoutFailed,

    /// user details
    @Default(false) bool isGetUserDetailsLoading,
    @Default(false) bool isGetUserDetailsSuccess,
    @Default(false) bool isGetUserDetailsFailed,

    /// the current user
    @Default(null) UserModel? user,

    /// check activity of user
    @Default(false) bool isUserActiveLoading,
    @Default(false) bool isUserActiveSuccess,
    @Default(false) bool isUserActiveFailed,
    @Default(false) bool isActive,

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

    /// error
    @Default(null) String? errorMessage,
  }) = _UserViewmodelState;
}
