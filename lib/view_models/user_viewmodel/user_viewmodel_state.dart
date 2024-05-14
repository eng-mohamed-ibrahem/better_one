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

    /// error
    @Default(null) String? errorMessage,
  }) = _UserViewmodelState;
}
