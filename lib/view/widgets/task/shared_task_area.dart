import 'package:better_one/core/constants/ui_dimentions.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedTaskArea extends StatelessWidget {
  const SharedTaskArea({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    // Separate the tasks by completion status
    final completedTasks =
        task.subTasks.where((task) => task.completed).toList();
    final incompleteTasks =
        task.subTasks.where((task) => !task.completed).toList();

    return Card(
      elevation: 3,
      color: Theme.of(context).secondaryHeaderColor,
      shadowColor: Theme.of(context).shadowColor,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppMetrices.verticalGap.h,
          horizontal: AppMetrices.horizontalGap.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displaying Task Title and Estimated Time
            Center(
              child: Column(
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    _formatDuration(task.elapsedTime),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                          fontStyle: FontStyle.italic,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Divider(
              indent: AppMetrices.horizontalGap2.w,
              endIndent: AppMetrices.horizontalGap2.w,
            ),
            SizedBox(height: AppMetrices.verticalGap.h),

            // Displaying Incomplete Subtasks
            ...incompleteTasks.map(
              (subTask) => _buildSubTaskTile(
                subTask,
                context,
              ),
            ),

            // Displaying Completed Subtasks
            if (completedTasks.isNotEmpty) ...[
              Divider(
                height: 20.h,
                color: Theme.of(context).dividerColor,
              ),
              Text(
                'Completed Tasks',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              ...completedTasks.map(
                (subTask) => _buildSubTaskTile(
                  subTask,
                  context,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Helper method to build a subtask tile
  Widget _buildSubTaskTile(SubTask subTask, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          subTask.completed ? Icons.check_box : Icons.check_box_outline_blank,
          color:
              subTask.completed ? Colors.green : Theme.of(context).primaryColor,
        ),
        title: Text(
          subTask.title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontStyle:
                    subTask.completed ? FontStyle.italic : FontStyle.normal,
              ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    String formatted = '';

    if (hours > 0) {
      formatted += '$hours ${tr("time.hours")} ';
    }
    if (minutes > 0 || hours > 0) {
      // Include minutes if hours are non-zero
      formatted += '$minutes ${tr("time.minutes")} ';
    }
    formatted += '$seconds ${tr("time.seconds")}'; // Always include seconds

    return formatted.trim(); // Remove any trailing whitespace
  }
}
