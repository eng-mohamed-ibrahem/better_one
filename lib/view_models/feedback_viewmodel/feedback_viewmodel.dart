import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/model/feedback_model/feedback_model.dart';
import 'package:better_one/repositories/feedback_repo/feedback_repo_interface.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_viewmodel_state.dart';
part 'feedback_viewmodel.freezed.dart';

class FeedbackViewmodel extends Cubit<FeedbackViewmodelState> {
  FeedbackViewmodel({required FeedbackRepoInterface feedbackRepo})
      : _feedbackRepo = feedbackRepo,
        super(const _Initial());
  final FeedbackRepoInterface _feedbackRepo;

  void sendFeedback(FeedbackModel feedback) async {
    emit(const _SendFeedbackLoading());
    var result = await _feedbackRepo.sendFeedback(feedback: feedback);
    result.when(
      success: (_) {
        emit(const _SendFeedbackSuccess());
      },
      failure: (failure) {
        emit(
          _SendFeedbackFailed(
            failure: failure,
            message:
                failure is OtherFailure ? "core.error".tr() : failure.message,
          ),
        );
      },
    );
  }
}
