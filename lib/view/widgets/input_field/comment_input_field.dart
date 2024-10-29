import 'package:better_one/view_models/comment_viewmodel/comment_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool isEmpty = true;
  @override
  void initState() {
    widget.commentController.addListener(() {
      widget.commentController.text.isNotEmpty && isEmpty
          ? setState(() {
              isEmpty = false;
            })
          : null;
      if (widget.commentController.text.isEmpty) {
        setState(() {
          isEmpty = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              controller: widget.commentController,
              decoration: InputDecoration(
                hintText: 'comment.hint'.tr(),
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).disabledColor,
                    ),
                filled: true,
                fillColor: Theme.of(context).primaryColor,
                contentPadding: EdgeInsets.all(10.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
              minLines: 1,
              maxLines: 5,
              textInputAction: TextInputAction.send,
              onSubmitted: (text) {
                isEmpty ? null : _sendComment(text);
              },
            ),
          ),
          if (!isEmpty)
            BlocBuilder<CommentViewModel, CommentViewModelState>(
              builder: (context, state) {
                return state.maybeWhen(
                  addCommentLoading: () => CircleAvatar(
                    radius: 12.r,
                    backgroundColor: Colors.transparent,
                    child: const CircularProgressIndicator(),
                  ),
                  orElse: () {
                    return IconButton(
                      onPressed: () {
                        _sendComment(widget.commentController.text);
                      },
                      icon: const Icon(Icons.send),
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }

  void _sendComment(String text) {
    if (widget.commentController.text.isEmpty) {
      return;
    }
    widget.onSend(text);
  }
}
