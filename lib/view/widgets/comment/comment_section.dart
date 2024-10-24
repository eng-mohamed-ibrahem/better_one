import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/comment_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/in_memory/in_memory.dart';
import 'package:better_one/view/widgets/comment/comment_card.dart';
import 'package:better_one/view/widgets/comment/comment_input_header_delegete.dart';
import 'package:better_one/view/widgets/input_field/comment_input_field.dart';
import 'package:better_one/view_models/comment_viewmodel/comment_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key, required this.taskId});
  final String taskId;
  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _commentController = TextEditingController();
  bool hasMore = false;
  @override
  void initState() {
    context.read<CommentViewModel>().getComments(widget.taskId);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(() {
        hasMore = InMemory().getData<bool>(CommentConstants.hasMore);
        if (hasMore &&
            _scrollController.offset >=
                _scrollController.position.maxScrollExtent) {
          context
              .read<CommentViewModel>()
              .getComments(widget.taskId, loadMore: hasMore);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _commentController.dispose();
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
                  _commentController.clear();
                  _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
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
                  var comments = context.read<CommentViewModel>().comments;
                  return comments.isEmpty
                      ? Center(
                          child: Text(
                            "comment.empty".tr(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      : CustomScrollView(
                          shrinkWrap: true,
                          controller: _scrollController,
                          slivers: [
                            SliverPersistentHeader(
                              // pinned: true,
                              floating: true,
                              delegate: CommentInputHeaderDelegate(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: CommentInputField(
                                    commentController: _commentController,
                                    onSend: (comment) {
                                      context
                                          .read<CommentViewModel>()
                                          .addComment(
                                            comment: comment,
                                            taskId: widget.taskId,
                                          );
                                    },
                                  ),
                                ),
                                maxHeight: 60.h,
                                minHeight: 40.h,
                              ),
                            ),
                            SliverList.separated(
                              itemBuilder: (context, index) {
                                if (index == comments.length) {
                                  return Center(
                                    child: SizedBox(
                                      width: 15.w,
                                      height: 15.h,
                                      child: const CircularProgressIndicator(),
                                    ),
                                  );
                                }
                                return CommentCard(
                                  comment: comments[index],
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

          // comment input
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: EdgeInsets.only(
          //       bottom: MediaQuery.of(context).viewInsets.bottom,
          //     ),
          //     child: CommentInputField(
          //       commentController: _commentController,
          //       onSend: (comment) {
          //         context.read<CommentViewModel>().addComment(
          //               comment: comment,
          //               taskId: widget.taskId,
          //             );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
