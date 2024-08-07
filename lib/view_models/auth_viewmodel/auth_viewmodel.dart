import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/auth_repo/auth_repo_interface.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'auth_viewmodel.freezed.dart';
part 'auth_viewmodel_state.dart';

class AuthViewmodel extends Cubit<AuthViewmodelState> {
  AuthViewmodel({required this.authRepo}) : super(const AuthViewmodelState()) {
    GetIt.I.registerSingleton<AuthViewmodel>(this);
  }
  final AuthRepoInterface authRepo;
  static AuthViewmodel get(BuildContext context) =>
      BlocProvider.of<AuthViewmodel>(context);

  void signup(
      {required String email,
      required String password,
      required String name}) async {
    emit(release().copyWith(isSignupLoading: true));
    var result =
        await authRepo.signUp(email: email, password: password, name: name);
    result.when(
      success: (userModel) {
        debugPrint(userModel.toString());
        emit(
          state.copyWith(
            isSignupLoading: false,
            isSignupSuccess: true,
            userModel: userModel,
          ),
        );
      },
      failure: (failure) {
        if (failure is ParserFailure || failure is OtherFailure) {
          debugPrint(
              "=====================================\n${failure.toString()}\n===================================");
          emit(
            state.copyWith(
              isSignupLoading: false,
              isSignupSuccess: false,
              isSignupFailed: true,
              errorMessage: 'core.wrong'.tr(),
            ),
          );
          return;
        }
        emit(
          state.copyWith(
            isSignupLoading: false,
            isSignupSuccess: false,
            isSignupFailed: true,
            errorMessage: failure.message,
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
      failure: (failure) {
        if (failure is ParserFailure || failure is OtherFailure) {
          debugPrint(
              "=====================================\n${failure.toString()}\n===================================");
          emit(
            state.copyWith(
              isLoginLoading: false,
              isLoginSuccess: false,
              isLoginFailed: true,
              errorMessage: 'core.wrong'.tr(),
            ),
          );
          return;
        }
        emit(
          state.copyWith(
            isLoginLoading: false,
            isLoginSuccess: false,
            isLoginFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  AuthViewmodelState release() {
    return state.copyWith(
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
