part of 'user_viewmodel.dart';

@freezed
class UserViewmodelState with _$UserViewmodelState {
  const factory UserViewmodelState({
    @Default(true) bool isInitialized,
    @Default(false) bool isLogoutLoading,
    @Default(false) bool isLogoutSuccess,
    @Default(false) bool isLogoutFailed,
    @Default(null) UserModel? user,
    @Default(null) String? errorMessage,
  }) = _UserViewmodelState;
}
