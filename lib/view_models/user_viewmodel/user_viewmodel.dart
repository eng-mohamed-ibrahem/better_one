import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/utils/dependency_locator/inject.dart';

part 'user_viewmodel.freezed.dart';
part 'user_viewmodel_state.dart';

class UserViewmodel extends Cubit<UserViewmodelState> {
  UserViewmodel({required this.userRepo}) : super(const _Initial());
  final UserRepoInterface userRepo;
  late UserModel currentUser;
  void logout() async {
    emit(const _LogoutLoading());
    var result = await userRepo.logOut();
    result.when(
      success: (loggedOut) {
        emit(const _LogoutSuccess());
      },
      failure: (failure) {
        emit(
          _LogoutFailed(
            message:
                failure is OtherFailure ? "core.error".tr() : failure.message,
            failure: failure,
          ),
        );
      },
    );
  }

  void getUserDetails() async {
    emit(const _GetUserDetailsLoading());
    var userData = await userRepo.getUserDetails();
    userData.when(
      success: (user) {
        emit(
          _GetUserDetailsSuccess(user: currentUser = user),
        );
        inject<LocaleUserInfo>().setUsetData(user: currentUser);      },
      failure: (failure) {
        if (failure is FirebaseFailure) {
          if (failure.code == "no_user") {
            emit(_NoUserFound(message: "auth.${failure.code}".tr()));
            return;
          }
        }
        emit(
          _GetUserDetailsFailed(
            message:
                failure is OtherFailure ? "core.error".tr() : failure.message,
            failure: failure,
          ),
        );
      },
    );
  }

  void changeName(String name) async {
    emit(const _ChangeNameLoading());
    var result = await userRepo.updateUserDetails(newDisplayName: name);
    result.when(
      success: (user) {
        currentUser = user;
        inject<LocaleUserInfo>().setUsetData(user: currentUser);
        emit(_ChangeNameSuccess(user: user));
      },
      failure: (failure) {
        emit(
          _ChangeNameFailed(
            message:
                failure is OtherFailure ? "core.error".tr() : failure.message,
          ),
        );
      },
    );
  }

  void changeEmail(String email) async {
    emit(const _ChangeEmailLoading());
    var result = await userRepo.updateUserDetails(newEmail: email);
    result.when(
      success: (user) {
        emit(_ChangeEmailSuccess(user: user));
      },
      failure: (failure) {
        emit(
          _ChangeEmailFailed(
            message:
                failure is OtherFailure ? "core.error".tr() : failure.message,
          ),
        );
      },
    );
  }

  void changePassword(String password) async {
    emit(const _ChangePasswordLoading());
    var result = await userRepo.updateUserDetails(newPassword: password);
    result.when(
      success: (user) {
        currentUser = user;
        emit(_ChangePasswordSuccess(user: user));
      },
      failure: (failure) {
        emit(
          _ChangePasswordFailed(
            message:
                failure is OtherFailure ? "core.error".tr() : failure.message,
          ),
        );
      },
    );
  }

  void changeProfilePicture(String imagePath) async {
    emit(const _ChangeProfilePictureLoading());
    var result = await userRepo.updateUserDetails(newPhotoPath: imagePath);
    result.when(
      success: (user) {
        currentUser = user;
        inject<LocaleUserInfo>().setUsetData(user: currentUser);
        emit(_ChangeProfilePictureSuccess(user: user));
      },
      failure: (failure) {
        emit(
          _ChangeProfilePictureFailed(
            message:
                failure is OtherFailure ? "core.error".tr() : failure.message,
          ),
        );
      },
    );
  }
}
