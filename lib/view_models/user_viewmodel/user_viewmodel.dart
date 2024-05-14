import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_viewmodel_state.dart';
part 'user_viewmodel.freezed.dart';

class UserViewmodel extends Cubit<UserViewmodelState> {
  UserViewmodel({required this.userRepo}) : super(const UserViewmodelState());
  final UserRepoInterface userRepo;
  void logout() async {
    emit(release().copyWith(isLogoutLoading: true));
    var result = await userRepo.logOut();
    result.when(
      success: (loggedOut) {
        emit(
          state.copyWith(
            isLogoutLoading: false,
            isLogoutSuccess: loggedOut,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isLogoutLoading: false,
            isLogoutFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void getUserDetails() async {
    emit(release().copyWith(isGetUserDetailsLoading: true));
    var userData = await userRepo.getUserDetails();
    userData.when(
      success: (user) {
        emit(
          state.copyWith(
            isGetUserDetailsLoading: false,
            isGetUserDetailsSuccess: true,
            user: user,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isGetUserDetailsLoading: false,
            isGetUserDetailsFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void isActive() async {
    emit(release().copyWith(isUserActiveLoading: true));
    var userActive = await userRepo.isActive();
    userActive.when(
      success: (isActive) {
        emit(
          state.copyWith(
            isUserActiveLoading: false,
            isUserActiveSuccess: true,
            isActive: isActive,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isUserActiveLoading: false,
            isUserActiveFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  UserViewmodelState release() {
    return state.copyWith(
      isLogoutLoading: false,
      isLogoutFailed: false,
      isLogoutSuccess: false,
      isGetUserDetailsFailed: false,
      isGetUserDetailsLoading: false,
      isGetUserDetailsSuccess: false,
      isUserActiveFailed: false,
      isUserActiveLoading: false,
      isUserActiveSuccess: false,
      errorMessage: null,
    );
  }
}
