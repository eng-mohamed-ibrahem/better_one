import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_viewmodel_state.dart';
part 'search_viewmodel.freezed.dart';

class SearchViewmodel extends Cubit<SearchViewmodelState> {
  SearchViewmodel({required this.userRepo}) : super(const _Initial());
 final UserRepoInterface userRepo;

   void search (String query) async {
    emit(const _SearchLoading());
    var result = await userRepo.search(query);
    result.when(
      success: (searchedTasks) {
        emit(
          _SearchCompleted(searchedTasks: searchedTasks),
        );
      },
      failure: (error) {
        emit(
          _SearchFailed(
              message:
                  error is OtherFailure ? "core.error".tr() : error.message),
        );
      },
    );
  }
}
