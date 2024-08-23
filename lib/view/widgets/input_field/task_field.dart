import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';

class TaskField extends StatelessWidget {
  const TaskField({
    super.key,
    this.controller,
    this.minLines,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.textFieldHeight,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.style,
    this.textAlign,
    this.focusNode,
    this.autofocus = false,
  });
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final String? hintText;
  final String? labelText;
  final double? textFieldHeight;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Function(String text)? onChanged;
  final String? initialValue;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppMetrices.horizontalGap2.w,
      ),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
        focusNode: focusNode,
        autofocus: autofocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          iconColor: Theme.of(context).iconTheme.color,
          icon: prefixIcon,
        ),
        textAlign: textAlign ?? TextAlign.start,
        style: style ?? Theme.of(context).textTheme.titleMedium!.copyWith(),
      ),
    );
  }
}
