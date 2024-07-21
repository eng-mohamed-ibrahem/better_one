import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/write_task_area.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var settingState = SettingViewModel.get(context).state;
    return Scaffold(
      appBar: AppBar(
        title: Text('task.create'.tr()),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        leading: const FittedBox(
          fit: BoxFit.scaleDown,
          child: BackButtonl10n(),
        ),
      ),
      body: WriteTaskArea(
        titleController: titleController,
        descriptionController: descriptionController,
      ),
      floatingActionButton: BlocConsumer<HomeViewmodel, HomeViewmodelState>(
        listener: (context, state) {
          if (state.isTaskAddCompleted) {
            settingState.isNotificationOnAdd
                ? localNotification.display(
                    notification: NotificationModel(
                      id: DateTime.now().microsecond,
                      title: 'task.motive_add'.tr(),
                      body: state.addedTask!.title,
                      payload: state.addedTask!.id,
                    ),
                  )
                : null;
            context.goNamed(
              Routes.taskDetail.name,
              pathParameters: {
                'task_id': state.addedTask!.id,
              },
            );
          }
          if (state.isTaskAddFailed) {
            showSnackBar(
              context,
              message: state.errorMessage!,
            );
          }
        },
        builder: (context, state) {
          if (state.isTaskAddLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return FloatingActionButton.extended(
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  descriptionController.text.isNotEmpty) {
                var newTask = TaskModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleController.text,
                  body: descriptionController.text,
                  createdAt: DateTime.now(),
                );
                context.read<UserViewmodel>().createTask(newTask);
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
      ),
    );
  }
}
