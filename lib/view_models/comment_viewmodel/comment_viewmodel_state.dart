part of 'comment_viewmodel.dart';

@freezed
class CommentViewModelState with _$CommentViewModelState {
  const factory CommentViewModelState.initial() = _Initial;

  /// Get Comments
  const factory CommentViewModelState.getCommentsLoading() =
      _GetCommentsLoading;
  const factory CommentViewModelState.getCommentsSuccess(
      {required List<CommentModel> comments}) = _GetCommentsSuccess;
  const factory CommentViewModelState.getCommentsFailed(
      {required Failure failure}) = _GetCommentsFailed;

  /// load more comments
  const factory CommentViewModelState.loadMoreCommentsLoading() =
      _LoadMoreCommentsLoading;
  const factory CommentViewModelState.loadMoreCommentsFailed(
      {required Failure failure}) = _LoadMoreCommentsFailed;

  /// Add Comment
  const factory CommentViewModelState.addCommentLoading() = _AddCommentLoading;
  const factory CommentViewModelState.addCommentSuccess(
      {required CommentModel comment}) = _AddCommentSuccess;
  const factory CommentViewModelState.addCommentFailed(
      {required Failure failure}) = _AddCommentFailed;

  /// Delete Comment
  const factory CommentViewModelState.deleteCommentLoading() =
      _DeleteCommentLoading;
  const factory CommentViewModelState.deleteCommentSuccess(
      {required CommentModel comment}) = _DeleteCommentSuccess;
  const factory CommentViewModelState.deleteCommentFailed(
      {required Failure failure}) = _DeleteCommentFailed;

  /// Update Comment
  const factory CommentViewModelState.updateCommentLoading() =
      _UpdateCommentLoading;
  const factory CommentViewModelState.updateCommentSuccess(
      {required CommentModel comment}) = _UpdateCommentSuccess;
  const factory CommentViewModelState.updateCommentFailed(
      {required Failure failure}) = _UpdateCommentFailed;
}
