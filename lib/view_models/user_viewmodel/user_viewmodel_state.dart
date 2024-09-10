part of 'user_viewmodel.dart';

@freezed
class UserViewmodelState with _$UserViewmodelState {
  const factory UserViewmodelState.initial() = _Initial;

  const factory UserViewmodelState.logoutLoading() = _LogoutLoading;

  const factory UserViewmodelState.logoutSuccess() = _LogoutSuccess;

  const factory UserViewmodelState.logoutFailed(
      {required String message, required Failure failure}) = _LogoutFailed;

  const factory UserViewmodelState.getUserDetailsLoading() =
      _GetUserDetailsLoading;

  const factory UserViewmodelState.getUserDetailsSuccess(
      {required UserModel user}) = _GetUserDetailsSuccess;

  const factory UserViewmodelState.noUserFound({required String message}) =
      _NoUserFound;

  const factory UserViewmodelState.getUserDetailsFailed(
      {required String message,
      required Failure failure}) = _GetUserDetailsFailed;

  const factory UserViewmodelState.changeNameLoading() = _ChangeNameLoading;

  const factory UserViewmodelState.changeNameSuccess(
      {required UserModel user}) = _ChangeNameSuccess;

  const factory UserViewmodelState.changeNameFailed({required String message}) =
      _ChangeNameFailed;

  const factory UserViewmodelState.changeEmailLoading() = _ChangeEmailLoading;

  const factory UserViewmodelState.changeEmailSuccess(
      {required UserModel user}) = _ChangeEmailSuccess;

  const factory UserViewmodelState.changeEmailFailed(
      {required String message}) = _ChangeEmailFailed;

  const factory UserViewmodelState.changePasswordLoading() =
      _ChangePasswordLoading;

  const factory UserViewmodelState.changePasswordSuccess(
      {required UserModel user}) = _ChangePasswordSuccess;

  const factory UserViewmodelState.changePasswordFailed(
      {required String message}) = _ChangePasswordFailed;
}
