import 'package:better_one/core/constants/app_colors.dart';
import 'package:better_one/core/constants/app_metrices.dart';
import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * .4,
            padding: EdgeInsets.all(5.r),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppMetrices.borderRadius1),
                topLeft: Radius.circular(AppMetrices.borderRadius1),
              ),
              color: AppColors.secondColor,
            ),
            child: Text(
              task.title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppMetrices.borderRadius1),
                bottomRight: Radius.circular(AppMetrices.borderRadius1),
              ),
              border: Border.all(
                width: 2,
                color: AppColors.secondColor,
              ),
              color: AppColors.primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.body,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.fade,
                  maxLines: 5,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Divider(
                  height: 10,
                  thickness: 1,
                  color: AppColors.hightlightColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  DateFormat('EEEE, MMMM d, yyyy,  hh:mm a',
                          context.locale.languageCode)
                      .format(task.createdAt),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      "task.status.${task.status.name}".tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    task.status == TaskStatus.done
                        ? const Icon(
                            Icons.celebration_rounded,
                            color: AppColors.hightlightColor,
                          )
                        : task.status == TaskStatus.inprogress ||
                                task.status == TaskStatus.paused
                            ? const Icon(
                                Icons.monitor_heart_outlined,
                              )
                            : const Icon(
                                Icons.not_interested_rounded,
                              ),
                    const Spacer(),
                    DurationTime(duration: task.elapsedTime),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
