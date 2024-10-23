import 'package:flutter/material.dart';

class CommentInputField extends StatelessWidget {
  const CommentInputField(
      {super.key, required this.commentController, required this.onSend});
  final TextEditingController commentController;
  final Function(String comment) onSend;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
