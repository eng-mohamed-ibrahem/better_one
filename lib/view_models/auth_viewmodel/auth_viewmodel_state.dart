part of 'auth_viewmodel.dart';

@freezed
class AuthViewmodelState with _$AuthViewmodelState {
  const factory AuthViewmodelState.initial() = _Initial;

  const factory AuthViewmodelState.signupLoading() = _SignupLoading;

  const factory AuthViewmodelState.signupSuccess({required UserModel user}) =
      _SignupSuccess;

  const factory AuthViewmodelState.signupFailed({required String message}) =
      _SignupFailed;

  const factory AuthViewmodelState.loginLoading() = _LoginLoading;

  const factory AuthViewmodelState.loginSuccess({required UserModel user}) =
      _LoginSuccess;

  const factory AuthViewmodelState.loginFailed({required String message}) =
      _LoginFailed;

  const factory AuthViewmodelState.sendForgotPasswordLoading() =
      _SendForgotPasswordLoading;

  const factory AuthViewmodelState.sendForgotPasswordSuccess() =
      _SendForgotPasswordSuccess;

  const factory AuthViewmodelState.sendForgotPasswordFailed(
      {required String message}) = _SendForgotPasswordFailed;

  const factory AuthViewmodelState.verifyPasswordResetCodeLoading() =
      _VerifyPasswordResetCodeLoading;

  const factory AuthViewmodelState.verifyPasswordResetCodeSuccess(
      {String? userEmail}) = _VerifyPasswordResetCodeSuccess;

  const factory AuthViewmodelState.verifyPasswordResetCodeFailed(
      {required String message}) = _VerifyPasswordResetCodeFailed;

  const factory AuthViewmodelState.resetPasswordLoading() =
      _ResetPasswordLoading;

  const factory AuthViewmodelState.resetPasswordSuccess() =
      _ResetPasswordSuccess;

  const factory AuthViewmodelState.resetPasswordFailed(
      {required String message}) = _ResetPasswordFailed;
}
