import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';

class TaskField extends StatelessWidget {
  const TaskField({
    super.key,
    required this.controller,
    this.minLines,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.textFieldHeight,
    this.prefixIcon,
    this.validator,
    this.onChanged,
  });
  final TextEditingController controller;
  final int? minLines;
  final int? maxLines;
  final String? hintText;
  final String? labelText;
  final double? textFieldHeight;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppMetrices.horizontalGap2.w,
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          iconColor: Theme.of(context).iconTheme.color,
          icon: prefixIcon,
        ),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              height: textFieldHeight,
            ),
      ),
    );
  }
}
