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
  bool isEditing = false;
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
              },
              notifyUpdateComment: (oldComment) {
                if (oldComment.id == widget.comment.id) {
                  isEditing = true;
                } else {
                  isEditing = false;
                }
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              updateCommentLoading: (updatedComment) {
                if (isEditing) {
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
                return CommentCard(
                  comment: widget.comment,
                );
              },
              orElse: () {
                return CommentCard(
                  comment: widget.comment,
                );
              },
            );
          },
        ),
        if (widget.comment.senderId ==
            inject<LocaleUserInfo>().getUserData()!.id)
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(
              onPressed: () {
                showSheet(
                  context,
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          widget.onEdit?.call();
                        },
                        icon: const Icon(Icons.edit, color: Colors.white),
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
                );
              },
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ),
      ],
    );
  }
}
