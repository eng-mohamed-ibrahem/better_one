import 'package:better_one/model/comment_model/comment_model.dart';
import 'package:better_one/view/widgets/switch_date_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  const CommentCard(
      {super.key, required this.comment, this.isSkeleton = false});

  factory CommentCard.skeleton() => CommentCard(
        comment: CommentModel(
          id: "id",
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
      child: Container(
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
            if (!isSkeleton) SwitchDateTime(dateTime: comment.createdAt),
          ],
        ),
      ),
    );
  }
}
