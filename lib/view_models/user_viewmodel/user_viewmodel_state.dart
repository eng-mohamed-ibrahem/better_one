part of 'user_viewmodel.dart';

@freezed
class UserViewmodelState with _$UserViewmodelState {
  const factory UserViewmodelState.initial() = _Initial;

  const factory UserViewmodelState.logoutLoading() = _LogoutLoading;

  const factory UserViewmodelState.logoutSuccess() = _LogoutSuccess;

  const factory UserViewmodelState.logoutFailed({required String message}) =
      _LogoutFailed;

  const factory UserViewmodelState.getUserDetailsLoading() =
      _GetUserDetailsLoading;

  const factory UserViewmodelState.getUserDetailsSuccess(
      {required UserModel user}) = _GetUserDetailsSuccess;

  const factory UserViewmodelState.noUserFound({required String message}) =
      _NoUserFound;

  const factory UserViewmodelState.getUserDetailsFailed(
      {required String message}) = _GetUserDetailsFailed;
}
