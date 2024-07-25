import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_viewmodel.freezed.dart';
part 'user_viewmodel_state.dart';

class UserViewmodel extends Cubit<UserViewmodelState> {
  UserViewmodel({required this.userRepo}) : super(const UserViewmodelState());
  final UserRepoInterface userRepo;
  void logout() async {
    emit(state.copyWith(isLogoutLoading: true, isLogoutFailed: false));
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
    emit(state.copyWith(
        isGetUserDetailsLoading: true, isGetUserDetailsFailed: false));
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

  /// upload tasks
  void uploadTasks() async {}
}
