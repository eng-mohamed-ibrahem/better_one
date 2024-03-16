import 'dart:async';
import 'dart:ui' as ui;

import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/dialog/helper_dialog.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/core/utils/shared_widgets/task_field.dart';
import 'package:better_one/core/utils/snack_bar/snack_bar.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';

///* Task Screen
///
/// This screen is used to write task and edit task
/// display estimate time for task
/// display quote
/// control task status and save task
/// update estimated time of task and add this time to total time
///*
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with RouteAware, TickerProviderStateMixin {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TaskModel? task;
  String? taskId;
  bool isTaskModified = false;
  Duration runningTime = Duration.zero;
  Timer? timer;

  @override
  void didPopNext() {
    GenerateRouter.activeRoute = GenerateRouter.taskScreen;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    taskId = ModalRoute.of(context)!.settings.arguments as String?;
    if (taskId != null) {
      HomeViewmodel.get(context).getTaskById(taskId!);
    }
    QuoteViewmode.get(context).getRandomQuote();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    timer?.cancel();
    super.dispose();
  }

  /// save the estimated time on navigate back
  /// if navigate back while the task is inprogress then pause the task
  @override
  void deactivate() {
    task != null
        ? HomeViewmodel.get(context).updateTaskAndTotalEstimatedTime(
            task!,
            task!.status == TaskStatus.inprogress
                ? TaskStatus.paused
                : task!.status,
            runningTime,
          )
        : null;
    HomeViewmodel.get(context).release();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    var settingState = SettingViewModel.get(context).state;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: true,
        left: false,
        right: false,
        child: BlocConsumer<HomeViewmodel, HomeViewmodelState>(
          listenWhen: (previous, current) {
            if (current.isGetTaskByIdCompleted ||
                current.isTaskUpdateCompleted ||
                current.isTaskAddCompleted ||
                current.isTaskRemoveCompleted) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state.isGetTaskByIdCompleted) {
              task = state.taskById;
              titleController.text = task!.title;
              descriptionController.text = task!.body;
            }
            if (state.isTaskUpdateCompleted) {
              task = state.updatedTask;
              if (isTaskModified) {
                settingState.isNotificationOnUpdate
                    ? localNotification.display(
                        notification: NotificationModel(
                          id: DateTime.now().microsecond,
                          title: 'task.motive_update'.tr(),
                          body: task!.title,
                          payload: task!.id,
                        ),
                      )
                    : null;
                isTaskModified = false;
              }
              if (task!.status == TaskStatus.done) {
                showCompleteTaskDialog(
                  context,
                  AnimationController(
                    vsync: this,
                    duration: const Duration(seconds: 3, milliseconds: 500),
                  )..forward(),
                );
                settingState.isNotificationOnComplete
                    ? localNotification.display(
                        notification: NotificationModel(
                          id: DateTime.now().microsecond,
                          title: 'task.motive_complete'.tr(),
                          body: task!.title,
                          payload: task!.id,
                        ),
                      )
                    : null;
              }
            }
            if (state.isTaskAddCompleted) {
              task = state.addedTask;
              isTaskModified = false;
              settingState.isNotificationOnAdd
                  ? localNotification.display(
                      notification: NotificationModel(
                        id: DateTime.now().microsecond,
                        title: 'task.motive_add'.tr(),
                        body: task!.title,
                        payload: task!.id,
                      ),
                    )
                  : null;
            }
            timer?.cancel();
            timer = Timer.periodic(
              const Duration(seconds: 1),
              (timer) {
                task!.status == TaskStatus.inprogress
                    ? setState(
                        () {
                          runningTime = Duration(seconds: timer.tick);
                        },
                      )
                    : timer.cancel();
              },
            );
          },
          builder: (context, state) {
            if (state.isGetTaskByIdLoading) {
              return const Center(
                child: LottieIndicator(
                  statusAssets: LottieAssets.searchForTask,
                ),
              );
            }
            if (state.isGetTaskByIdFailed) {
              return Center(
                child: Failed(
                  failedAsset: LottieAssets.searchForTaskFailed,
                  errorMessage: state.errorMessage,
                  retry: () {
                    HomeViewmodel.get(context).getTaskById(taskId!);
                  },
                ),
              );
            }
            return Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SizedBox(height: AppMetrices.heightSpace.h),
                SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: AppMetrices.heightSpace3.h),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.only(top: 5.h, end: 15.w),
                          child: DurationTime(
                            duration: runningTime +
                                (task == null
                                    ? Duration.zero
                                    : task!.elapsedTime),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        BlocBuilder<QuoteViewmode, QuoteViewmodelState>(
                          builder: (context, state) {
                            if (state.quote == null) {
                              return const SizedBox();
                            }
                            return AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                color: AppColors.secondColor,
                                padding: EdgeInsets.all(10.w),
                                width: double.infinity,
                                // set direction from left to right
                                child: Directionality(
                                  textDirection: ui.TextDirection.ltr,
                                  child: Text(
                                    state.quote!.content!,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: AppMetrices.heightSpace2.h),
                        Card(
                          color: AppColors.secondColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            AppMetrices.borderRadius1,
                          )),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: AppMetrices.heightSpace.h),
                            child: Column(
                              children: [
                                TaskField(
                                  controller: titleController,
                                  onChanged: (value) {
                                    isTaskModified
                                        ? null
                                        : setState(() {
                                            isTaskModified = true;
                                          });
                                  },
                                  labelText: 'task.title'.tr(),
                                  textFieldHeight: 1.3,
                                  maxLines: 3,
                                  minLines: 1,
                                  prefixIcon: const Icon(Icons.task),
                                ),
                                Divider(
                                  color: AppColors.white,
                                  thickness: 1,
                                  height: 10,
                                  indent: AppMetrices.widthSpace2.w,
                                  endIndent: AppMetrices.widthSpace2.w,
                                ),
                                SizedBox(height: AppMetrices.heightSpace.h),
                                TaskField(
                                  controller: descriptionController,
                                  onChanged: (value) {
                                    isTaskModified
                                        ? null
                                        : setState(() {
                                            isTaskModified = true;
                                          });
                                  },
                                  labelText: 'task.description'.tr(),
                                  textFieldHeight: 2,
                                  maxLines: 12,
                                  minLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// if task is [null] this mean the first time create the task
                        /// if else update task
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            task == null
                                ? FilledButton(
                                    onPressed: () {
                                      if (titleController.text.isNotEmpty &&
                                          descriptionController
                                              .text.isNotEmpty) {
                                        var newTask = TaskModel(
                                          id: DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString(),
                                          title: titleController.text,
                                          body: descriptionController.text,
                                          createdAt: DateTime.now(),
                                        );
                                        HomeViewmodel.get(context)
                                            .addTask(newTask);
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
                                      'task.add'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  )
                                : isTaskModified
                                    ? FilledButton(
                                        onPressed: () {
                                          if (titleController.text.isNotEmpty &&
                                              descriptionController
                                                  .text.isNotEmpty) {
                                            var newTask = task!.copyWith(
                                              title: titleController.text,
                                              body: descriptionController.text,
                                              updatedAt: DateTime.now(),
                                              elapsedTime: runningTime +
                                                  task!.elapsedTime,
                                              status: task!.status ==
                                                      TaskStatus.done
                                                  ? TaskStatus.paused
                                                  : task!.status,
                                            );
                                            HomeViewmodel.get(context)
                                                .updateTask(task!, newTask);
                                            HomeViewmodel.get(context)
                                                .updateTotalEstimatedTime(
                                                    runningTime);
                                            runningTime = Duration.zero;
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
                            SizedBox(width: AppMetrices.widthSpace2.w),
                            task != null && task!.status != TaskStatus.done
                                ? task!.status == TaskStatus.inprogress
                                    ? FilledButton.icon(
                                        label: Text('task.pause'.tr()),
                                        onPressed: () {
                                          HomeViewmodel.get(context)
                                              .updateTaskAndTotalEstimatedTime(
                                            task!,
                                            TaskStatus.paused,
                                            runningTime,
                                          );
                                          // 2: reset running time
                                          runningTime = Duration.zero;
                                        },
                                        icon: const Icon(
                                          Icons.pause_circle_outline,
                                        ),
                                      )
                                    : FilledButton.icon(
                                        label: Text('task.start'.tr()),
                                        onPressed: () {
                                          HomeViewmodel.get(context)
                                              .updateTaskAndTotalEstimatedTime(
                                            task!,
                                            TaskStatus.inprogress,
                                            runningTime,
                                          );
                                          // 2: reset running time
                                          runningTime = Duration.zero;
                                        },
                                        icon: const Icon(
                                          Icons.play_circle_outlined,
                                        ),
                                      )
                                : const SizedBox(),
                          ],
                        ),
                        SizedBox(height: AppMetrices.heightSpace.h),
                        if (task != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ChoiceChip(
                                label: Text('task.status.done'.tr()),
                                selected: task?.status == TaskStatus.done,
                                onSelected: (value) {
                                  HomeViewmodel.get(context).updateTask(
                                    task!,
                                    task!.copyWith(
                                      status: value
                                          ? TaskStatus.done
                                          : TaskStatus.paused,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: AppMetrices.widthSpace2.w),
                              FilledButton.icon(
                                onPressed: () {
                                  showDeleteTaskDialog(
                                    context,
                                    message: task!.title,
                                    onConfirm: () {
                                      HomeViewmodel.get(context)
                                          .removeTask(task!);
                                      showSnackBar(
                                        context,
                                        message: 'task.remove'.tr(),
                                      );
                                      Navigator.pop(context);
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
                      ],
                    ),
                  ),
                ),
                const BackButtonLl10n()
              ],
            );
          },
        ),
      ),
    );
  }
}
