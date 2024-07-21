import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/view/widgets/input_field/task_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteTaskArea extends StatefulWidget {
  const WriteTaskArea({
    super.key,
    required this.titleController,
    required this.descriptionController,
    this.onChanged,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final dynamic Function(String)? onChanged;

  @override
  State<WriteTaskArea> createState() => _WriteTaskAreaState();
}

class _WriteTaskAreaState extends State<WriteTaskArea> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppMetrices.verticalGap.h,
            horizontal: AppMetrices.horizontalGap2.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TaskField(
                controller: widget.titleController,
                onChanged: widget.onChanged,
                labelText: 'task.title'.tr(),
                textFieldHeight: 1.3,
                maxLines: 3,
                minLines: 1,
                prefixIcon: const Icon(Icons.task),
              ),
              Divider(
                indent: AppMetrices.horizontalGap2.w,
                endIndent: AppMetrices.horizontalGap2.w,
              ),
              SizedBox(height: AppMetrices.verticalGap.h),
              TaskField(
                controller: widget.descriptionController,
                onChanged: widget.onChanged,
                labelText: 'task.description'.tr(),
                textFieldHeight: 2,
                maxLines: 12,
                minLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
