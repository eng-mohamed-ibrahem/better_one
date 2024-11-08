import 'package:better_one/core/constants/ui_dimentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedTaskArea extends StatelessWidget {
  const SharedTaskArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppMetrices.verticalGap.h,
            horizontal: AppMetrices.horizontalGap2.w),
        child: Column(
          children: const [
            // title of task
            // subtasks of task and its related data as it is completed and title
            Text("Shared Task"),
          ],
        ),
      ),
    );
  }
}
