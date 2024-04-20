part of 'auth_viewmodel.dart';

@freezed
class AuthViewmodelState with _$AuthViewmodelState {
  const factory AuthViewmodelState({
    @Default(true) bool isInitial,
    @Default(false) bool isSignupLoading,
    @Default(false) bool isSignupSuccess,
    @Default(false) bool isSignupFailed,
    @Default(false) bool isLoginLoading,
    @Default(false) bool isLoginSuccess,
    @Default(false) bool isLoginFailed,
    @Default(null) UserModel? userModel,
    @Default(false) bool isLogoutLoading,
    @Default(false) bool isLogoutSuccess,
    @Default(false) bool isLogoutFailed,
    @Default(null) String? errorMessage,
  }) = _AuthViewmodelState;
}
