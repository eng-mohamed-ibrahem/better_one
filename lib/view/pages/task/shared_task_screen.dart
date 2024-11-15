import 'package:better_one/core/constants/comment_constants.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/in_memory/in_memory.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/comment/comment_input_handler.dart';
import 'package:better_one/view/widgets/comment/comment_section.dart';
import 'package:better_one/view/widgets/task/shared_task_area.dart';
import 'package:better_one/view_models/comment_viewmodel/comment_viewmodel.dart';
import 'package:better_one/view_models/notification_viewmodel/notification_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../widgets/task/write_task_area.dart';

class SharedTaskScreen extends StatefulWidget {
  const SharedTaskScreen({super.key, required this.payload});
  final Map<String, dynamic> payload;

  @override
  State<SharedTaskScreen> createState() => _SharedTaskScreenState();
}

class _SharedTaskScreenState extends State<SharedTaskScreen> {
  late String taskId;
  late String senderId;

  /// [_commentController] is the comment controller for comment input
  final TextEditingController _commentController = TextEditingController();

  /// [_commentFocusNode] is the focus node for comment input
  final FocusNode _commentFocusNode = FocusNode();

  /// [task] is the task model that is shared
  late TaskModel task;

  @override
  void initState() {
    taskId = widget.payload[NotificationConstants.taskId];
    senderId = widget.payload[NotificationConstants.senderId];
    context
        .read<NotificationViewmodel>()
        .getTaskFromNotification(taskId: taskId, senderId: senderId);
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
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
          state.whenOrNull(getTaskFromNotificationSuccess: (task) {
            this.task = task;
          });
        },
        builder: (context, state) {
          return state.maybeWhen(
            getTaskFromNotificationLoading: () {
              return Skeletonizer(
                child: WriteTaskArea.skelton(),
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
            orElse: () {
              return NotificationListener<Notification>(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification) {
                    var hasMore =
                        InMemory().getData<bool?>(CommentConstants.hasMore) ??
                            false;
                    if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent &&
                        hasMore) {
                      context
                          .read<CommentViewModel>()
                          .getComments(taskId, loadMore: hasMore);
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<NotificationViewmodel>()
                        .getTaskFromNotification(
                            taskId: taskId, senderId: senderId);
                    context.read<CommentViewModel>().getComments(taskId);
                  },
                  color: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  child: ListView(
                    children: [
                      SharedTaskArea(
                        task: task,
                      ),
                      CommentSection(
                        taskId: taskId,
                        commentController: _commentController,
                        focusNode: _commentFocusNode,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: CommentInputHandler(
        commentController: _commentController,
        commentFocusNode: _commentFocusNode,
        taskId: taskId,
      ),
    );
  }
}
