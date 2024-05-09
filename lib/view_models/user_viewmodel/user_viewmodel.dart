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

  UserViewmodelState release() {
    return state.copyWith(
      isLogoutLoading: false,
      isLogoutFailed: false,
      isLogoutSuccess: false,
      errorMessage: null,
    );
  }
}
