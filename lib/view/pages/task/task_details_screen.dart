import 'dart:async';

import 'package:better_one/core/constants/comment_constants.dart';
import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/core/in_memory/in_memory.dart';
import 'package:better_one/core/timer/timer_action.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/notification_repo/notification_repo_interface.dart';
import 'package:better_one/view/widgets/comment/comment_input_handler.dart';
import 'package:better_one/view/widgets/comment/comment_section.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view/widgets/task/write_task_area.dart';
import 'package:better_one/view_models/comment_viewmodel/comment_viewmodel.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/constants/constants.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.taskId});
  final String taskId;

  @override
  State<TaskDetailsScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskDetailsScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final TextEditingController titleController = TextEditingController();

  /// [task] is the corresponding task to id
  TaskModel? task;

  /// [isTaskModified] to check if the task is modified or not
  bool isTaskModified = false;

  /// [periodicActionManager] is the timer of action to update the running time
  late PeriodicActionManager periodicActionManager;

  /// [streamController] is the stream controller to update the running time
  StreamController<Duration> streamController =
      StreamController<Duration>.broadcast();

  /// [isTaskDeleted] to indicate if the task is deleted or not
  /// before pop the screen
  bool isTaskDeleted = false;

  /// [_commentController] is the comment controller for comment input
  final TextEditingController _commentController = TextEditingController();

  final FocusNode _commentFocusNode = FocusNode();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<TaskViewmodel>().getTaskById(widget.taskId);
    QuoteViewmodel.get(context).getRandomQuote();
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _updateTaskTime(context);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void deactivate() {
    if (task != null && !isTaskDeleted) {
      context.read<TaskViewmodel>().updateTask(
            task!,
            task!.copyWith(
              elapsedTime: periodicActionManager.elapsed + task!.elapsedTime,
            ),
          );
    }
    super.deactivate();
  }

  @override
  void dispose() {
    task != null ? periodicActionManager.stop() : null;
    streamController.close();
    WidgetsBinding.instance.removeObserver(this);
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TaskViewmodel, TaskViewmodelState>(
        listener: (context, state) {
          state.whenOrNull(
            getTaskByIdCompleted: (taskById) {
              task = taskById;
              titleController.text = task!.title;

              /// initialize the timer action and assign action
              periodicActionManager = PeriodicActionManager(
                periodicDuration: const Duration(seconds: 1),
                action: () {
                  if (!streamController.isClosed) {
                    streamController
                        .add(periodicActionManager.elapsed + task!.elapsedTime);
                  }
                },
              );
              if (taskById.status == TaskStatus.inprogress) {
                periodicActionManager.start();
              }
            },
            updateTaskCompleted: (updatedTask) {
              task = updatedTask;
              if (task!.status == TaskStatus.done) {
                periodicActionManager.stop();
                showCompleteTaskDialog(
                  context,
                  AnimationController(
                    vsync: this,
                    duration: const Duration(seconds: 3, milliseconds: 500),
                  )..forward(),
                );
                inject<FirebaseAnalytics>().logEvent(
                  name: 'complete_task',
                  parameters: {'task_id': task!.id},
                );
              }
              _handleSendingNotification();
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            getTaskByIdLoading: () {
              return SafeArea(
                child: Skeletonizer(
                  child: WriteTaskArea(
                    titleController: titleController,
                    subTasks: List.filled(
                      5,
                      const SubTask(title: ""),
                    ),
                  ),
                ),
              );
            },
            getTaskByIdFailed: (message) {
              return Center(
                child: Failed(
                  failedAsset: LottieAssets.searchForTaskFailed,
                  errorMessage: message,
                  retry: () {
                    context.read<TaskViewmodel>().getTaskById(widget.taskId);
                  },
                ),
              );
            },
            orElse: () {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  leading: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: BackButtonl10n(),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(40.h),
                    child: StreamBuilder<Duration>(
                      stream: streamController.stream,
                      initialData: task!.elapsedTime,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: EdgeInsetsDirectional.only(
                              bottom: 5.h, end: 15.w),
                          child: DurationTime(
                            duration: snapshot.data!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                body: NotificationListener<Notification>(
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
                            .getComments(widget.taskId, loadMore: hasMore);
                      }
                    }
                    return true;
                  },
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // update task time
                      _updateTaskTime(context);
                      context.read<TaskViewmodel>().getTaskById(widget.taskId);
                      context
                          .read<CommentViewModel>()
                          .getComments(widget.taskId);
                    },
                    color: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    child: ListView(
                      children: [
                        /// task section
                        WriteTaskArea(
                          titleController: titleController,
                          subTasks: task!.subTasks,
                          onChanged: (value) {
                            isTaskModified
                                ? null
                                : setState(
                                    () {
                                      isTaskModified = true;
                                    },
                                  );
                          },
                        ),
                        SizedBox(height: AppMetrices.verticalGap2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isTaskModified
                                ? FilledButton(
                                    onPressed: () {
                                      if (titleController.text.isNotEmpty &&
                                          task!.subTasks.isNotEmpty) {
                                        // create new task and change the status to paused
                                        var newTask = task!.copyWith(
                                          title: titleController.text,
                                          updatedAt: DateTime.now(),
                                          // elapsedTime:
                                          //     periodicActionManager.elapsed + task!.elapsedTime,
                                          status:
                                              task!.status == TaskStatus.done
                                                  ? TaskStatus.paused
                                                  : task!.status,
                                        );

                                        context
                                            .read<TaskViewmodel>()
                                            .updateTask(task!, newTask);
                                      } else {
                                        showSnackBar(
                                          context,
                                          message:
                                              'task.title_and_description_required'
                                                  .tr(),
                                        );
                                      }
                                    },
                                    child: Text(
                                      'task.update'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  )
                                : const SizedBox(),
                            SizedBox(width: AppMetrices.horizontalGap2.w),
                            task!.status != TaskStatus.done
                                ? task!.status == TaskStatus.inprogress
                                    ? FilledButton.icon(
                                        label: Text('task.pause'.tr()),
                                        onPressed: () {
                                          context
                                              .read<TaskViewmodel>()
                                              .updateTask(
                                                task!,
                                                task!.copyWith(
                                                  status: TaskStatus.paused,
                                                ),
                                              );
                                          periodicActionManager.stop();
                                        },
                                        icon: const Icon(
                                          Icons.pause_circle_outline,
                                        ),
                                      )
                                    : FilledButton.icon(
                                        label: Text('task.start'.tr()),
                                        onPressed: () {
                                          context
                                              .read<TaskViewmodel>()
                                              .updateTask(
                                                task!,
                                                task!.copyWith(
                                                  status: TaskStatus.inprogress,
                                                ),
                                              );
                                          periodicActionManager.start();
                                        },
                                        icon: const Icon(
                                          Icons.play_circle_outlined,
                                        ),
                                      )
                                : const SizedBox(),
                          ],
                        ),
                        SizedBox(height: AppMetrices.verticalGap.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ChoiceChip(
                              label: Text('task.status.done'.tr()),
                              selected: task!.status == TaskStatus.done,
                              onSelected: (value) {
                                if (value) {
                                  for (int i = 0;
                                      i < task!.subTasks.length;
                                      i++) {
                                    task!.subTasks[i] = task!.subTasks[i]
                                        .copyWith(completed: true);
                                  }
                                }
                                context.read<TaskViewmodel>().updateTask(
                                      task!,
                                      task!.copyWith(
                                        status: value
                                            ? TaskStatus.done
                                            : TaskStatus.paused,
                                      ),
                                    );
                              },
                            ),
                            SizedBox(width: AppMetrices.horizontalGap2.w),
                            FilledButton.icon(
                              onPressed: () {
                                showDeleteTaskDialog(
                                  context,
                                  message: task!.title,
                                  onConfirm: () {
                                    context
                                        .read<TaskViewmodel>()
                                        .deleteTask(task!);
                                    showSnackBar(
                                      context,
                                      message: 'task.remove'.tr(),
                                    );
                                    isTaskDeleted = true;
                                    // todo delete notification by id
                                    context.pop();
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.delete_forever,
                                color: AppColors.hightlightColor,
                              ),
                              label: Text(
                                'core.delete'.tr(),
                              ),
                            ),
                          ],
                        ),

                        /// comments section
                        SizedBox(height: AppMetrices.verticalGap.h),
                        CommentSection(
                          taskId: widget.taskId,
                          commentController: _commentController,
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: CommentInputHandler(
                  commentController: _commentController,
                  commentFocusNode: _commentFocusNode,
                  taskId: widget.taskId,
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _updateTaskTime(BuildContext context) {
    if (task != null) {
      context.read<TaskViewmodel>().updateTask(
            task!,
            task!.copyWith(
              elapsedTime: periodicActionManager.elapsed + task!.elapsedTime,
            ),
          );
      periodicActionManager.reset();
    }
  }

  bool isAboutToUpdate = false;
  void _handleSendingNotification() {
    task!.status == TaskStatus.done &&
            inject<SettingViewmodel>().notificationSetting.sendOnComplete
        ? () {
            var user = inject<LocaleUserInfo>().getUserData();
            inject<NotificationRepoInterface>().sendNotification(
              NotificationModel(
                userName: user!.name,
                senderId: user.id,
                userImageUrl: user.photoUrl,
                comment:
                    "${'task.task_notification_action.complete'.tr()} \"${task!.title}\"",
                payload: task!.id,
                createdAt: DateTime.now(),
              ),
            );
          }()
        : null;
    isTaskModified &&
            inject<SettingViewmodel>().notificationSetting.sendOnUpdate
        ? () {
            var user = inject<LocaleUserInfo>().getUserData();
            inject<NotificationRepoInterface>().sendNotification(
              NotificationModel(
                userName: user!.name,
                senderId: user.id,
                userImageUrl: user.photoUrl,
                comment:
                    "${'task.task_notification_action.update'.tr()} \"${task!.title}\"",
                payload: task!.id,
                createdAt: DateTime.now(),
              ),
            );
            isTaskModified = false;
          }()
        : null;
  }
}
