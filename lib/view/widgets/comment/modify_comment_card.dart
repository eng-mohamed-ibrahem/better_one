import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/model/comment_model/comment_model.dart';
import 'package:better_one/view/widgets/comment/comment_card.dart';
import 'package:better_one/view_models/comment_viewmodel/comment_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModifyCommentCard extends StatefulWidget {
  const ModifyCommentCard(
      {super.key, required this.comment, this.onDelete, this.onEdit});
  final CommentModel comment;
  final Function(CommentModel comment)? onDelete;
  final VoidCallback? onEdit;

  @override
  State<ModifyCommentCard> createState() => _ModifyCommentCardState();
}

class _ModifyCommentCardState extends State<ModifyCommentCard>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  /// true if the comment is about to be edited
  bool isAboutToUpdate = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        BlocConsumer<CommentViewModel, CommentViewModelState>(
          listener: (context, state) {
            state.whenOrNull(
              updateCommentSuccess: (_) {
                _animationController?.stop();
                isAboutToUpdate = false;
              },
              notifyUpdateComment: (oldComment) {
                if (oldComment.id == widget.comment.id) {
                  isAboutToUpdate = true;
                }
              },
              deleteCommentSuccess: (_) {
                showSnackBar(context, message: "comment.comment_removed".tr());
              },
              reactOnCommentFailed: (failure) {
                isAboutToUpdate = false;
                showSnackBar(context, message: failure.message);
              },
              reactOnCommentSuccess: (_) {
                isAboutToUpdate = false;
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              updateCommentLoading: isAboutToUpdate
                  ? (updatedComment) {
                      _animationController = AnimationController(
                        vsync: this,
                        value: 0.3,
                        duration: const Duration(seconds: 1),
                        reverseDuration: const Duration(seconds: 1),
                      );
                      _animationController?.repeat(reverse: true);
                      return FadeTransition(
                        opacity: _animationController!.drive(
                          Tween(begin: 0.3, end: 1.0).chain(
                            CurveTween(curve: Curves.easeInOut),
                          ),
                        ),
                        child: CommentCard(
                          comment: updatedComment,
                        ),
                      );
                    }
                  : null,
              orElse: () {
                return Column(
                  children: [
                    CommentCard(
                      comment: widget.comment,
                    ),
                    Row(
                      children: [
                        Builder(
                          builder: (context) {
                            ReactionStatus reactionStatus =
                                widget.comment.usersReactions[
                                        inject<LocaleUserInfo>()
                                            .getUserData()!
                                            .id] ??
                                    ReactionStatus.none;

                            return TextButton(
                              onPressed: () {
                                isAboutToUpdate = true;
                                ReactionStatus toogleReaction =
                                    reactionStatus == ReactionStatus.like
                                        ? ReactionStatus.none
                                        : ReactionStatus.like;

                                context.read<CommentViewModel>().reactOnComment(
                                    widget.comment, toogleReaction);
                              },
                              child: reactionStatus.icon,
                            );
                          },
                        ),
                        // likes count
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            border: BorderDirectional(
                              start: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          child: state.maybeWhen(
                            reactOnCommentLoading: isAboutToUpdate
                                ? () {
                                    return CircleAvatar(
                                      radius: 8.r,
                                      backgroundColor: Colors.transparent,
                                      child: const CircularProgressIndicator(),
                                    );
                                  }
                                : null,
                            orElse: () {
                              var likes = widget.comment.usersReactions.length;
                              return Text(
                                likes == 0 ? "" : likes.toString(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
        if (isAboutToUpdate == false &&
            widget.comment.senderId ==
                inject<LocaleUserInfo>().getUserData()!.id)
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(
              onPressed: () {
                showSheet(
                  context,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              widget.onEdit?.call();
                              isAboutToUpdate = true;
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                            label: Text(
                              "comment.edit_comment".tr(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              showDeleteCommentDialog(
                                context,
                                onConfirm: () {
                                  widget.onDelete?.call(widget.comment);
                                },
                              );
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                            label: Text(
                              "comment.delete_comment".tr(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ),
        if (isAboutToUpdate)
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: FilledButton(
              onPressed: () {
                isAboutToUpdate = false;
                context.read<CommentViewModel>().cancelUpdate();
              },
              child: Text(
                "core.cancel".tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
      ],
    );
  }
}
