import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/view/widgets/input_field/comment_input_field.dart';
import 'package:better_one/view_models/comment_viewmodel/comment_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentInputHandler extends StatelessWidget {
  const CommentInputHandler({
    super.key,
    required TextEditingController commentController,
    required FocusNode commentFocusNode,
    required this.taskId,
  })  : _commentController = commentController,
        _commentFocusNode = commentFocusNode;

  final TextEditingController _commentController;
  final FocusNode _commentFocusNode;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentViewModel, CommentViewModelState>(
      listener: (context, state) {
        state.whenOrNull(
          addCommentSuccess: (comment) {
            _commentController.clear();
            _commentFocusNode.unfocus();
          },
          addCommentFailed: (failure) {
            showSnackBar(context, message: failure.message);
          },
          updateCommentLoading: (_) {
            _commentFocusNode.unfocus();
          },
          updateCommentSuccess: (comment) {
            _commentController.clear();
            showSnackBar(context, message: "comment.comment_updated".tr());
          },
          notifyUpdateComment: (oldComment) {
            _commentFocusNode.requestFocus();
            _commentController.text = oldComment.comment;
          },
        );
      },
      //? todo delete it and use dialog to make update typing
      buildWhen: (previous, current) {
        return current.maybeWhen(
          loadMoreCommentsFailed: (failure) => false,
          loadMoreCommentsLoading: () => false,
          orElse: () => true,
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const SizedBox.shrink(),
          getCommentsFailed: (failure) => const SizedBox.shrink(),
          getCommentsLoading: () => const SizedBox.shrink(),
          orElse: () {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: CommentInputField(
                commentController: _commentController,
                focusNode: _commentFocusNode,
                onSend: (comment) {
                  state.maybeWhen(
                    notifyUpdateComment: (oldComment) {
                      context.read<CommentViewModel>().updateComment(
                            oldComment.copyWith(
                              comment: comment,
                            ),
                          );
                    },
                    orElse: () {
                      context.read<CommentViewModel>().addComment(
                            comment: comment,
                            taskId: taskId,
                          );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
