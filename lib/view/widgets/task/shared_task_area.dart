import 'package:better_one/core/constants/ui_dimentions.dart';
import 'package:better_one/model/task_model/task_model.dart';
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
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(width: 0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppMetrices.verticalGap.h,
          horizontal: AppMetrices.horizontalGap2.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displaying Task Title
            Center(
              child: Text(
                task.title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              indent: AppMetrices.horizontalGap2.w,
              endIndent: AppMetrices.horizontalGap2.w,
            ),
            SizedBox(height: AppMetrices.verticalGap.h),

            // Displaying Incomplete Subtasks
            ...incompleteTasks.map((subTask) => _buildSubTaskTile(
                  subTask,
                  context,
                )),

            // Displaying Completed Subtasks
            if (completedTasks.isNotEmpty) ...[
              Divider(
                height: 20.h,
                color: Theme.of(context).dividerColor,
              ),
              Text(
                'Completed Tasks',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
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
        color: subTask.completed ? Colors.grey[200] : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(vertical: 4.h),
      child: ListTile(
        leading: Icon(
          subTask.completed ? Icons.check_box : Icons.check_box_outline_blank,
          color:
              subTask.completed ? Colors.green : Theme.of(context).primaryColor,
        ),
        title: Text(
          subTask.title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: subTask.completed ? Colors.grey[600] : Colors.black,
                decoration:
                    subTask.completed ? TextDecoration.lineThrough : null,
                fontStyle:
                    subTask.completed ? FontStyle.italic : FontStyle.normal,
              ),
        ),
      ),
    );
  }
}
