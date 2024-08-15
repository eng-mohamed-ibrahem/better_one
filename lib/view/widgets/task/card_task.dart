import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/constants.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .goNamed(Routes.taskDetail.name, queryParameters: {'id': task.id});
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: Theme.of(context).secondaryHeaderColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppMetrices.borderRadius1),
                      topLeft: Radius.circular(AppMetrices.borderRadius1),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * .4,
                    padding: EdgeInsets.all(5.r),
                    child: Text(
                      task.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),

                /// task status
                DecoratedSliver(
                  decoration: BoxDecoration(
                    color: task.status.color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  sliver: Text(
                    "task.status.${task.status.name}".tr(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppMetrices.borderRadius1),
                  bottomRight: Radius.circular(AppMetrices.borderRadius1),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...() {
                      return List.generate(
                        task.subTasks.length,
                        (index) => Text(
                          task.subTasks[index].title,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      );
                    }(),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(),
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
                        // Text(
                        //   "task.status.${task.status.name}".tr(),
                        //   style: Theme.of(context).textTheme.bodySmall,
                        // ),
                        const Spacer(),
                        DurationTime(duration: task.elapsedTime),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
