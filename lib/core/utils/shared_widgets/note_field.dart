import 'package:better_one/core/constants/app_metrices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteField extends StatelessWidget {
  const NoteField({
    super.key,
    required this.controller,
    this.minLines,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.textFieldHeight,
    this.prefixIcon,
    this.validator,
  });
  final TextEditingController controller;
  final int? minLines;
  final int? maxLines;
  final String? hintText;
  final String? labelText;
  final double? textFieldHeight;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppMetrices.widthSpace2.w,
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon,
        ),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              height: textFieldHeight,
            ),
      ),
    );
  }
}
