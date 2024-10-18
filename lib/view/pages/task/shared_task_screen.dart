import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/view_models/notification_viewmodel/notification_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SharedTaskScreen extends StatefulWidget {
  const SharedTaskScreen({super.key, required this.payload});
  final Map<String, dynamic> payload;

  @override
  State<SharedTaskScreen> createState() => _SharedTaskScreenState();
}

class _SharedTaskScreenState extends State<SharedTaskScreen> {
  late String taskId;
  late String senderId;

  @override
  void initState() {
    taskId = widget.payload[NotificaitonConstants.taskId];
    senderId = widget.payload[NotificaitonConstants.senderId];
    context
        .read<NotificationViewmodel>()
        .getTaskFromNotification(taskId: taskId, senderId: senderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: AppBar(
          elevation: 0,
          leading: const FittedBox(
            fit: BoxFit.scaleDown,
            child: BackButtonl10n(),
          ),
        ),
      ),
      body: BlocConsumer<NotificationViewmodel, NotificationViewmodelState>(
        listener: (context, state) {
          state.whenOrNull(
            getTaskFromNotificationSuccess: (task) {
              kDebugPrint("task from notification: $task");
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            getTaskFromNotificationLoading: () {
              return const Skeletonizer(
                child: Column(
                  children: [],
                ),
              );
            },
            getTaskFromNotificationFailed: (failure) {
              return Center(
                child: Failed(
                  failedAsset: failure is NoInternetFailure
                      ? LottieAssets.noInternet
                      : LottieAssets.error,
                  retry: () {
                    context
                        .read<NotificationViewmodel>()
                        .getTaskFromNotification(
                          taskId: taskId,
                          senderId: senderId,
                        );
                  },
                  errorMessage: failure.message,
                ),
              );
            },
            getTaskFromNotificationSuccess: (task) {
              return Center(
                child: Column(
                  children: [
                    Text(task.title),
                    Text(task.subTasks.toString()),
                  ],
                ),
              );
            },
            orElse: () {
              return Column(
                children: [
                  const Divider(
                    thickness: 1,
                    height: 1,
                    color: Colors.grey,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Share"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
