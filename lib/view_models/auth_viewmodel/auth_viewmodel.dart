import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/auth_repo/auth_repo_interface.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_viewmodel.freezed.dart';
part 'auth_viewmodel_state.dart';

class AuthViewmodel extends Cubit<AuthViewmodelState> {
  AuthViewmodel({required this.authRepo}) : super(const _Initial());
  final AuthRepoInterface authRepo;
  static AuthViewmodel get(BuildContext context) =>
      BlocProvider.of<AuthViewmodel>(context);

  void signup(
      {required String email,
      required String password,
      required String name}) async {
    emit(const _SignupLoading());
    var result =
        await authRepo.signUp(email: email, password: password, name: name);
    result.when(
      success: (userModel) {
        emit(
          _SignupSuccess(user: userModel),
        );
      },
      failure: (failure) {
        if (failure is ParserFailure || failure is OtherFailure) {
          emit(
            _SignupFailed(
              message: 'core.wrong'.tr(),
            ),
          );
          return;
        }
        emit(
          _SignupFailed(message: failure.message),
        );
      },
    );
  }

  void login({required String email, required String password}) async {
    emit(const _LoginLoading());
    var result = await authRepo.logIn(email: email, password: password);
    result.when(
      success: (userModel) {
        emit(_LoginSuccess(user: userModel));
      },
      failure: (failure) {
        if (failure is ParserFailure || failure is OtherFailure) {
          emit(
            _LoginFailed(message: 'core.wrong'.tr()),
          );
          return;
        }
        emit(
          _LoginFailed(message: failure.message),
        );
      },
    );
  }

  void sendForgotPassword({required String email}) async {
    emit(const _SendForgotPasswordLoading());
    var result = await authRepo.sendForgotPassword(email);
    result.when(
      success: (_) {
        emit(const _SendForgotPasswordSuccess());
      },
      failure: (failure) {
        if (failure is ParserFailure || failure is OtherFailure) {
          emit(
            _SendForgotPasswordFailed(message: 'core.wrong'.tr()),
          );
          return;
        }
        emit(
          _SendForgotPasswordFailed(message: failure.message),
        );
      },
    );
  }

  void verifyPasswordResetCode({required String code}) async {
    emit(const _VerifyPasswordResetCodeLoading());
    var result = await authRepo.verifyPasswordResetCode(code);
    result.when(
      success: (message) {
        emit(const _VerifyPasswordResetCodeSuccess());
      },
      failure: (failure) {
        if (failure is ParserFailure || failure is OtherFailure) {
          emit(
            _VerifyPasswordResetCodeFailed(message: 'core.wrong'.tr()),
          );
          return;
        }
        emit(
          _VerifyPasswordResetCodeFailed(message: failure.message),
        );
      },
    );
  }
}
