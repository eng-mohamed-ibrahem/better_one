import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/model/comment_model/comment_model.dart';
import 'package:better_one/repositories/comment_repo/comment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'comment_viewmodel.freezed.dart';
part 'comment_viewmodel_state.dart';

class CommentViewModel extends Cubit<CommentViewModelState> {
  CommentViewModel({
    required CommentRepo commentRepo,
  })  : _commentRepo = commentRepo,
        super(const _Initial());
  final CommentRepo _commentRepo;

  final List<CommentModel> comments = [];

  void addComment({
    required String comment,
    required String taskId,
  }) async {
    emit(const _AddCommentLoading());
    var user = inject<LocaleUserInfo>().getUserData();
    CommentModel userComment = CommentModel(
      id: const Uuid().v4(),
      senderId: user!.id,
      taskId: taskId,
      comment: comment,
      userName: user.name,
      userImageUrl: user.photoUrl,
      createdAt: DateTime.now(),
    );
    final result = await _commentRepo.addComment(userComment);
    result.when(
      success: (comment) {
        comments.insert(0, comment);
        emit(_AddCommentSuccess(comment: comment));
      },
      failure: (failure) {
        emit(_AddCommentFailed(failure: failure));
      },
    );
  }

  void notifyOfUpdate({required CommentModel oldComment}) {
    emit(_NotifyUpdateComment(oldComment: oldComment));
  }

  void updateComment(CommentModel comment) async {
    emit(_UpdateCommentLoading(updatedComment: comment));
    final result = await _commentRepo.updateComment(comment);
    result.when(
      success: (comment) {
        comments[comments.indexWhere((c) => c.id == comment.id)] = comment;
        emit(_UpdateCommentSuccess(comment: comment));
      },
      failure: (failure) {
        emit(_UpdateCommentFailed(failure: failure));
      },
    );
  }

  void deleteComment(CommentModel comment, String taskId) async {
    emit(const _DeleteCommentLoading());
    final result = await _commentRepo.deleteComment(comment.id, taskId);
    result.when(
      success: (_) {
        comments.removeWhere((c) => c.id == comment.id);
        emit(_DeleteCommentSuccess(comment: comment));
      },
      failure: (failure) {
        emit(_DeleteCommentFailed(failure: failure));
      },
    );
  }

  void getComments(String taskId, {bool loadMore = false}) async {
    if (state is _LoadMoreCommentsLoading) {
      return;
    }
    loadMore
        ? emit(const _LoadMoreCommentsLoading())
        : emit(const _GetCommentsLoading());
    final result =
        await _commentRepo.getCommentsForTask(taskId, 10, loadMore: loadMore);
    result.when(
      success: (newComments) {
        comments.addAll(newComments);
        emit(_GetCommentsSuccess(comments: newComments));
      },
      failure: (failure) {
        loadMore
            ? emit(_LoadMoreCommentsFailed(failure: failure))
            : emit(_GetCommentsFailed(failure: failure));
      },
    );
  }
}
