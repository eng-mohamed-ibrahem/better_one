import 'package:better_one/model/comment_model/comment_model.dart';
import 'package:better_one/view/widgets/switch_date_time_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.comment,
    this.isSkeleton = false,
  });

  factory CommentCard.skeleton() => CommentCard(
        comment: CommentModel(
          id: "id",
          senderId: "senderId",
          taskId: "taskId",
          userName: "userName",
          userImageUrl: "userImageUrl",
          comment: "comment",
          createdAt: DateTime.now(),
        ),
        isSkeleton: true,
      );
  final CommentModel comment;
  final bool isSkeleton;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    () {
                      if (isSkeleton) {
                        return CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Colors.grey.shade200,
                        );
                      } else {
                        return CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: comment.userImageUrl != null
                              ? NetworkImage(comment.userImageUrl!)
                              : null,
                          child: comment.userImageUrl == null
                              ? Icon(
                                  Icons.person,
                                  size: 30.r,
                                )
                              : null,
                        );
                      }
                    }(),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(comment.userName,
                              style: Theme.of(context).textTheme.bodyLarge),
                          SizedBox(height: 10.h),
                          Text(comment.comment,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                if (isSkeleton) const Text("createdAt"),
                if (isSkeleton == false)
                  SwitchDateTime(dateTime: comment.createdAt),
              ],
            ),
          ),
          if (isSkeleton == false)
            () {
              // like button
              return Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("comment.like".tr()),
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
                    child: const Text("32"),
                  ),
                ],
              );
            }()
        ],
      ),
    );
  }
}
