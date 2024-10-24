import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentInputField extends StatelessWidget {
  const CommentInputField(
      {super.key, required this.commentController, required this.onSend});
  final TextEditingController commentController;
  final Function(String comment) onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: 'comment.placeholder'.tr(),
                filled: true,
                fillColor: Theme.of(context).primaryColorLight,
                contentPadding: EdgeInsets.all(10.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: onSend,
            ),
          ),
          IconButton(
            onPressed: () {
              if (commentController.text.isEmpty) {
                return;
              }
              onSend(commentController.text);
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
