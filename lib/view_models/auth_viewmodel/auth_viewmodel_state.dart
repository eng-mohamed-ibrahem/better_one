part of 'auth_viewmodel.dart';

@freezed
class AuthViewmodelState with _$AuthViewmodelState {
  const factory AuthViewmodelState.initial() = _Initial;

  const factory AuthViewmodelState.signupLoading() = _SignupLoading;

  const factory AuthViewmodelState.signupSuccess({required UserModel user}) = _SignupSuccess;

  const factory AuthViewmodelState.signupFailed({required String message}) =
      _SignupFailed;

  const factory AuthViewmodelState.loginLoading() = _LoginLoading;

  const factory AuthViewmodelState.loginSuccess({required UserModel user}) = _LoginSuccess;

  const factory AuthViewmodelState.loginFailed({required String message}) =
      _LoginFailed;
}
