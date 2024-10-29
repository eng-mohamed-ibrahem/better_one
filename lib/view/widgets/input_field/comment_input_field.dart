import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentInputField extends StatefulWidget {
  const CommentInputField(
      {super.key, required this.commentController, required this.onSend});
  final TextEditingController commentController;
  final Function(String comment) onSend;

  @override
  State<CommentInputField> createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  bool isTyped = false;
  @override
  void initState() {
    widget.commentController.addListener(() {
      isTyped
          ? null
          : setState(() {
              isTyped = true;
            });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.commentController,
              decoration: InputDecoration(
                hintText: 'comment.hint'.tr(),
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).disabledColor,
                    ),
                filled: true,
                fillColor: Theme.of(context).primaryColorLight,
                contentPadding: EdgeInsets.all(10.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (text) {
                isTyped
                    ? () {
                        if (widget.commentController.text.isEmpty) {
                          return;
                        }
                        widget.onSend(text);
                      }()
                    : null;
              },
            ),
          ),
          IconButton(
            onPressed: isTyped
                ? () {
                    if (widget.commentController.text.isEmpty) {
                      return;
                    }
                    widget.onSend(widget.commentController.text);
                  }
                : null,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
