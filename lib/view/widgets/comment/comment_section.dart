import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/comment_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/in_memory/in_memory.dart';
import 'package:better_one/view/widgets/comment/comment_card.dart';
import 'package:better_one/view/widgets/comment/modify_comment_card.dart';
import 'package:better_one/view_models/comment_viewmodel/comment_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({
    super.key,
    required this.taskId,
    required this.commentController,
    required this.focusNode,
  });
  final String taskId;
  final TextEditingController commentController;
  final FocusNode focusNode;
  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  late final ScrollController _scrollController;
  bool hasMore = false;
  @override
  void initState() {
    context.read<CommentViewModel>().getComments(widget.taskId);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'comment.title'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          BlocConsumer<CommentViewModel, CommentViewModelState>(
            listener: (context, state) {
              state.whenOrNull(
                addCommentSuccess: (comment) {
                  _scrollController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                getCommentsLoading: () {
                  return Skeletonizer(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CommentCard.skeleton(),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                      itemCount: 7,
                    ),
                  );
                },
                getCommentsFailed: (failure) {
                  if (failure is NoUserLogedInFailure) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          failure.message,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).secondaryHeaderColor,
                          ),
                          onPressed: () {
                            context.goNamed(Routes.login.name);
                          },
                          child: Text(
                            'auth.login'.tr(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(failure.message,
                          style: Theme.of(context).textTheme.bodyMedium),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<CommentViewModel>().getComments(
                                widget.taskId,
                              );
                        },
                        label: Text("comment.retry".tr()),
                        icon: const Icon(Icons.refresh),
                      )
                    ],
                  );
                },
                orElse: () {
                  hasMore =
                      InMemory().getData<bool?>(CommentConstants.hasMore) ??
                          false;
                  var comments = context.read<CommentViewModel>().comments;
                  return Column(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(bottom: 10.h),
                      //   padding: EdgeInsets.all(10.r),
                      //   decoration: BoxDecoration(
                      //     color: Theme.of(context).secondaryHeaderColor,
                      //     borderRadius: BorderRadius.circular(10.r),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       TextButton(
                      //         child: Text("comment.react".tr()),
                      //         onPressed: () {},
                      //       ),
                      //       TextButton(
                      //         child: Text("comment.add".tr()),
                      //         onPressed: () => widget.focusNode.requestFocus(),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      comments.isEmpty
                          ? Center(
                              child: Text(
                                "comment.empty".tr(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              controller: _scrollController,
                              itemBuilder: (context, index) {
                                if (index == comments.length) {
                                  return Skeletonizer(
                                    child: CommentCard.skeleton(),
                                  );
                                }
                                return ModifyCommentCard(
                                  key: ValueKey(comments[index].id),
                                  comment: comments[index],
                                  onDelete: (comment) {
                                    context
                                        .read<CommentViewModel>()
                                        .deleteComment(comment, widget.taskId);
                                  },
                                  onEdit: () {
                                    context
                                        .read<CommentViewModel>()
                                        .notifyOfUpdate(
                                          oldComment: comments[index],
                                        );
                                  },
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10.h),
                              itemCount: comments.length + (hasMore ? 1 : 0),
                            ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
