import 'dart:async';

import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/core/utils/shared_widgets/task_field.dart';
import 'package:better_one/core/utils/snack_bar/snack_bar.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel.dart';
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

class _TaskScreenState extends State<TaskScreen> with RouteAware {
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
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: true,
        left: false,
        right: false,
        child: BlocConsumer<HomeViewmodel, HomeViewmodelState>(
          listener: (context, state) {
            if (state.isGetTaskByIdCompleted) {
              task = state.taskById;
              titleController.text = task!.title;
              descriptionController.text = task!.body;
            }

            if (state.isTaskUpdateCompleted) {
              task = state.updatedTask;
              if (isTaskModified) {
                showSnackBar(
                  context,
                  message: 'task.updated'.tr(),
                );
              }
            }
            if (state.isTaskAddCompleted) {
              task = state.addedTask;
              localNotification.display(
                notification: NotificationModel(
                  id: DateTime.now().microsecond,
                  title: 'task.motive'.tr(),
                  body: titleController.text,
                  payload: task!.id,
                ),
              );
            }
            timer?.cancel();
            timer = Timer.periodic(const Duration(seconds: 1), (timer) {
              // 1: update the running time
              task!.status == TaskStatus.inprogress
                  ? setState(
                      () {
                        runningTime = Duration(seconds: timer.tick);
                      },
                    )
                  : timer.cancel();
            });
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
              alignment: Alignment.topLeft,
              children: [
                SizedBox(height: AppMetrices.heightSpace.h),
                SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: AppMetrices.heightSpace3.h),
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
                            );
                          },
                        ),
                        SizedBox(height: AppMetrices.heightSpace2.h),
                        TaskField(
                          controller: titleController,
                          onChanged: (p0) => isTaskModified = true,
                          labelText: 'task.title'.tr(),
                          textFieldHeight: 1,
                          maxLines: null,
                          minLines: 1,
                          prefixIcon: const Icon(Icons.task),
                        ),
                        SizedBox(height: AppMetrices.heightSpace.h),
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
                          onChanged: (p0) => isTaskModified = true,
                          labelText: 'task.description'.tr(),
                          textFieldHeight: 2,
                          maxLines: null,
                          minLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_double_arrow_left_rounded,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 5.h, end: 15.w),
                      child: DurationTime(
                        duration: runningTime +
                            (task == null ? Duration.zero : task!.elapsedTime),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder<HomeViewmodel, HomeViewmodelState>(
        builder: (context, state) {
          if (state.isGetTaskByIdLoading || state.isGetTaskByIdFailed) {
            return const SizedBox();
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// if task is [null] this mean the first time create the task
              /// else this mean update task
              task == null
                  ? FilledButton(
                      onPressed: () {
                        if (titleController.text.isNotEmpty &&
                            descriptionController.text.isNotEmpty) {
                          var newTask = TaskModel(
                            id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            title: titleController.text,
                            body: descriptionController.text,
                            createdAt: DateTime.now(),
                          );
                          HomeViewmodel.get(context).addTask(newTask);
                          isTaskModified = false;
                        } else {
                          showSnackBar(
                            context,
                            message: 'task.title_and_description_required'.tr(),
                          );
                        }
                      },
                      child: Text(
                        'task.add'.tr(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  : isTaskModified
                      ? FilledButton(
                          onPressed: () {
                            if (titleController.text.isNotEmpty &&
                                descriptionController.text.isNotEmpty) {
                              var newTask = task!.copyWith(
                                title: titleController.text,
                                body: descriptionController.text,
                                updatedAt: DateTime.now(),
                                elapsedTime: runningTime + task!.elapsedTime,
                                status: task!.status,
                              );
                              HomeViewmodel.get(context)
                                  .updateTask(task!, newTask);
                              isTaskModified = false;
                            } else {
                              showSnackBar(
                                context,
                                message:
                                    'task.title_and_description_required'.tr(),
                              );
                            }
                          },
                          child: Text(
                            'task.update'.tr(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        )
                      : const SizedBox(),
              SizedBox(width: AppMetrices.widthSpace.h),
              task != null
                  ? task!.status == TaskStatus.none ||
                          task!.status == TaskStatus.paused
                      ? IconButton(
                          iconSize: 25,
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
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
                      : IconButton(
                          iconSize: 25,
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
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
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
