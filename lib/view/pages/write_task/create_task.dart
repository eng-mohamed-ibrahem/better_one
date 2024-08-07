import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/ui_dimentions.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/write_task_area.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<SubTask> subTasks = [];

  @override
  Widget build(BuildContext context) {
    var settingState = inject<SettingViewModel>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text('task.create'.tr()),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        leading: const FittedBox(
          fit: BoxFit.scaleDown,
          child: BackButtonl10n(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            WriteTaskArea(
              titleController: titleController,
              descriptionController: descriptionController,
              subTasks: subTasks,
            ),
            SizedBox(height: 150.h),
            BlocConsumer<TaskViewmodel, TaskViewmodelState>(
              listener: (context, state) {
                state.whenOrNull(
                  createTaskCompleted: (createdTask) {
                    settingState.isNotificationOnAdd
                        ? localNotification.display(
                            notification: NotificationModel(
                              id: DateTime.now().microsecond,
                              title: 'task.motive_add'.tr(),
                              body: createdTask.title,
                              payload: createdTask.id,
                            ),
                          )
                        : null;
                    context.goNamed(
                      Routes.taskDetail.name,
                      queryParameters: {
                        'id': createdTask.id,
                      },
                    );
                  },
                  createTaskFailed: (failure) {
                    showSnackBar(
                      context,
                      message: failure,
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  createTaskLoading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  orElse: () {
                    return FilledButton.icon(
                      onPressed: () {
                        if (titleController.text.isNotEmpty &&
                            subTasks.isNotEmpty) {
                          var newTask = TaskModel(
                            id: const Uuid().v4(),
                            title: titleController.text,
                            subTasks: subTasks,
                            createdAt: DateTime.now(),
                          );
                          context.read<TaskViewmodel>().createTask(newTask);
                        } else {
                          showSnackBar(
                            context,
                            message: 'task.title_and_description_required'.tr(),
                          );
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: Text('task.add'.tr()),
                    );
                  },
                );
              },
            ),
            SizedBox(height: AppMetrices.verticalGap3.h),
          ],
        ),
      ),
    );
  }
}
