part of 'feedback_viewmodel.dart';

@freezed
class FeedbackViewmodelState with _$FeedbackViewmodelState {
  const factory FeedbackViewmodelState.initial() = _Initial;
  const factory FeedbackViewmodelState.sendFeedbackLoading() = _SendFeedbackLoading;

  const factory FeedbackViewmodelState.sendFeedbackSuccess() = _SendFeedbackSuccess;

  const factory FeedbackViewmodelState.sendFeedbackFailed(
      {required String message,
      required Failure failure}) = _SendFeedbackFailed;

  const factory FeedbackViewmodelState.getFeedbacksLoading() = _GetFeedbacksLoading;

  const factory FeedbackViewmodelState.getFeedbacksSuccess(
      {required List<FeedbackModel> feedbacks}) = _GetFeedbacksSuccess;

  const factory FeedbackViewmodelState.getFeedbacksFailed(
      {required String message,
      required Failure failure}) = _GetFeedbacksFailed;
}