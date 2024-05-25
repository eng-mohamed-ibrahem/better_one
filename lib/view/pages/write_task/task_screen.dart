import 'dart:async';
import 'dart:ui' as ui;

import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view/widgets/input_field/task_field.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

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
      context.read<UserViewmodel>().getTaskById(taskId!);
    }
    QuoteViewmode.get(context).getRandomQuote();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    timer?.cancel();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  /// save the estimated time on navigate back
  /// if navigate back while the task is inprogress then pause the task
  @override
  void deactivate() {
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
        child: BlocConsumer<UserViewmodel, UserViewmodelState>(
          listenWhen: (previous, current) {
            if (current.isGetTaskByIdCompleted ||
                current.isUpdateTaskSuccess ||
                current.isCreateTaskSuccess ||
                current.isDeleteTaskSuccess) {
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
            if (state.isUpdateTaskSuccess) {
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
            if (state.isCreateTaskSuccess) {
              task = state.createdTask;
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
                    context.read<UserViewmodel>().getTaskById(taskId!);
                  },
                ),
              );
            }
            return Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SizedBox(height: AppMetrices.verticalGap.h),
                SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: AppMetrices.verticalGap3.h),
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
                                color: Theme.of(context).secondaryHeaderColor,
                                padding: EdgeInsets.all(10.w),
                                width: double.infinity,
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
                        SizedBox(height: AppMetrices.verticalGap2.h),
                        Card(
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: AppMetrices.verticalGap.h),
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
                                  indent: AppMetrices.horizontalGap2.w,
                                  endIndent: AppMetrices.horizontalGap2.w,
                                ),
                                SizedBox(height: AppMetrices.verticalGap.h),
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
                                          id: const Uuid().v4(),
                                          title: titleController.text,
                                          body: descriptionController.text,
                                          createdAt: DateTime.now(),
                                        );
                                        context
                                            .read<UserViewmodel>()
                                            .createTask(newTask);
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
                                            context
                                                .read<UserViewmodel>()
                                                .updateTask(task!, newTask);

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
                            SizedBox(width: AppMetrices.horizontalGap2.w),
                            task != null && task!.status != TaskStatus.done
                                ? task!.status == TaskStatus.inprogress
                                    ? FilledButton.icon(
                                        label: Text('task.pause'.tr()),
                                        onPressed: () {
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
                        SizedBox(height: AppMetrices.verticalGap.h),
                        if (task != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ChoiceChip(
                                label: Text('task.status.done'.tr()),
                                selected: task?.status == TaskStatus.done,
                                onSelected: (value) {
                                  context.read<UserViewmodel>().updateTask(
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
                                          .read<UserViewmodel>()
                                          .deleteTask(task!);

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
                const BackButtonl10n()
              ],
            );
          },
        ),
      ),
    );
  }
}
