import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/auth_repo/auth_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_viewmodel.freezed.dart';
part 'auth_viewmodel_state.dart';

class AuthViewmodel extends Cubit<AuthViewmodelState> {
  AuthViewmodel({required this.authRepo}) : super(const AuthViewmodelState());
  final AuthRepoInterface authRepo;
  static AuthViewmodel get(BuildContext context) =>
      BlocProvider.of<AuthViewmodel>(context);

  void signup({required String email, required String password}) async {
    emit(release().copyWith(isSignupLoading: true));
    var result = await authRepo.signUp(email: email, password: password);
    result.when(
      success: (userModel) {
        emit(
          state.copyWith(
            isSignupLoading: false,
            isSignupSuccess: true,
            userModel: userModel,
          ),
        );
      },
      failure: (failer) {
        emit(
          state.copyWith(
            isSignupLoading: false,
            isSignupSuccess: false,
            isSignupFailed: true,
            errorMessage: failer.message,
          ),
        );
      },
    );
  }

  void login({required String email, required String password}) async {
    emit(release().copyWith(isLoginLoading: true));
    var result = await authRepo.logIn(email: email, password: password);
    result.when(
      success: (userModel) {
        emit(
          state.copyWith(
            isLoginLoading: false,
            isLoginSuccess: true,
            userModel: userModel,
          ),
        );
      },
      failure: (failer) {
        emit(
          state.copyWith(
            isLoginLoading: false,
            isLoginSuccess: false,
            isLoginFailed: true,
            errorMessage: failer.message,
          ),
        );
      },
    );
  }

  void logout() async {
    emit(release().copyWith(isLogoutLoading: true));
    var result = await authRepo.logOut();
    result.when(
      success: (loggedOut) {
        emit(
          state.copyWith(
            isLogoutLoading: false,
            isLogoutSuccess: loggedOut,
          ),
        );
      },
      failure: (failer) {
        emit(
          state.copyWith(
            isLogoutLoading: false,
            isLogoutSuccess: false,
            isLogoutFailed: true,
            errorMessage: failer.message,
          ),
        );
      },
    );
  }

  AuthViewmodelState release() {
    return state.copyWith(
      isInitial: false,
      isLoginFailed: false,
      isLoginLoading: false,
      isLoginSuccess: false,
      isSignupFailed: false,
      isSignupLoading: false,
      isSignupSuccess: false,
      isLogoutFailed: false,
      isLogoutLoading: false,
      isLogoutSuccess: false,
      errorMessage: null,
    );
  }
}
