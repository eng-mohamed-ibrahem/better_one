import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/model/comment_model/comment_model.dart';
import 'package:better_one/repositories/comment_repo/comment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_viewmodel.freezed.dart';
part 'comment_viewmodel_state.dart';

class CommentViewModel extends Cubit<CommentViewModelState> {
  CommentViewModel({
    required CommentRepo commentRepo,
  })  : _commentRepo = commentRepo,
        super(const _Initial());
  final CommentRepo _commentRepo;
  void addComment(CommentModel comment) async {
    emit(const _AddCommentLoading());
    final result = await _commentRepo.addComment(comment);
    result.when(
      success: (comment) {
        emit(_AddCommentSuccess(comment: comment));
      },
      failure: (failure) {
        emit(_AddCommentFailed(failure: failure));
      },
    );
  }

  void updateComment(CommentModel comment) async {
    emit(const _UpdateCommentLoading());
    final result = await _commentRepo.updateComment(comment);
    result.when(
      success: (comment) {
        emit(_UpdateCommentSuccess(comment: comment));
      },
      failure: (failure) {
        emit(_UpdateCommentFailed(failure: failure));
      },
    );
  }

  void deleteComment(CommentModel comment) async {
    emit(const _DeleteCommentLoading());
    final result = await _commentRepo.deleteComment(comment.id);
    result.when(
      success: (_) {
        emit(_DeleteCommentSuccess(comment: comment));
      },
      failure: (failure) {
        emit(_DeleteCommentFailed(failure: failure));
      },
    );
  }

  void getComments(String taskId) async {
    emit(const _GetCommentsLoading());
    final result =
        await _commentRepo.getCommentsForTask(taskId, 10, loadMore: false);
    result.when(
      success: (comments) {
        emit(_GetCommentsSuccess(comments: comments));
      },
      failure: (failure) {
        emit(_GetCommentsFailed(failure: failure));
      },
    );
  }
}