import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/shared_widgets/task_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteTaskArea extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: AppMetrices.heightSpace.h),
        child: Column(
          children: [
            TaskField(
              controller: titleController,
              onChanged: onChanged,
              labelText: 'task.title'.tr(),
              textFieldHeight: 1.3,
              maxLines: 3,
              minLines: 1,
              prefixIcon: const Icon(Icons.task),
            ),
            Divider(
              indent: AppMetrices.widthSpace2.w,
              endIndent: AppMetrices.widthSpace2.w,
            ),
            SizedBox(height: AppMetrices.heightSpace.h),
            TaskField(
              controller: descriptionController,
              onChanged: onChanged,
              labelText: 'task.description'.tr(),
              textFieldHeight: 2,
              maxLines: 12,
              minLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
