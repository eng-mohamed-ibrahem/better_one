import 'dart:async';
import 'dart:ui' as ui;

import 'package:better_one/config/navigation/app_navigation.dart';
import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view/widgets/write_task_area.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.taskId});
  final String taskId;

  @override
  State<TaskDetailsScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskDetailsScreen>
    with RouteAware, TickerProviderStateMixin {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late TaskModel task;
  bool isTaskModified = false;
  Duration runningTime = Duration.zero;
  Timer? timer;

  @override
  void didPopNext() {
    AppNavigation.activeRoute = Routes.taskDetail.path;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<UserViewmodel>().getTaskById(widget.taskId);
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
    context.read<UserViewmodel>().updateTask(
          task,
          task.copyWith(
            status: TaskStatus.paused,
            elapsedTime: runningTime + task.elapsedTime,
          ),
        );
    // HomeViewmodel.get(context).release();
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
                current.isTaskRemoveCompleted) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state.isGetTaskByIdCompleted) {
              task = state.taskById!;
              titleController.text = task.title;
              descriptionController.text = task.body;
            }
            if (state.isTaskUpdateCompleted) {
              task = state.updatedTask!;
              if (isTaskModified) {
                settingState.isNotificationOnUpdate
                    ? localNotification.display(
                        notification: NotificationModel(
                          id: DateTime.now().microsecond,
                          title: 'task.motive_update'.tr(),
                          body: task.title,
                          payload: task.id,
                        ),
                      )
                    : null;
                isTaskModified = false;
              }
              if (task.status == TaskStatus.done) {
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
                          body: task.title,
                          payload: task.id,
                        ),
                      )
                    : null;
              }
            }
            timer?.cancel();
            timer = null;
            timer = Timer.periodic(
              const Duration(seconds: 1),
              (timer) {
                task.status == TaskStatus.inprogress
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
                    context.read<UserViewmodel>().getTaskById(widget.taskId);
                  },
                ),
              );
            }
            return Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SizedBox(height: AppMetrices.verticalGap.h),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: AppMetrices.verticalGap3.h),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(top: 5.h, end: 15.w),
                        child: DurationTime(
                          duration: runningTime + task.elapsedTime,
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
                      WriteTaskArea(
                        titleController: titleController,
                        descriptionController: descriptionController,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isTaskModified
                              ? FilledButton(
                                  onPressed: () {
                                    if (titleController.text.isNotEmpty &&
                                        descriptionController.text.isNotEmpty) {
                                      // create new task and change the status to paused
                                      var newTask = task.copyWith(
                                        title: titleController.text,
                                        body: descriptionController.text,
                                        updatedAt: DateTime.now(),
                                        elapsedTime:
                                            runningTime + task.elapsedTime,
                                        status: task.status == TaskStatus.done
                                            ? TaskStatus.paused
                                            : task.status,
                                      );

                                      context
                                          .read<UserViewmodel>()
                                          .updateTask(task, newTask);

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
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(width: AppMetrices.horizontalGap2.w),
                          task.status != TaskStatus.done
                              ? task.status == TaskStatus.inprogress
                                  ? FilledButton.icon(
                                      label: Text('task.pause'.tr()),
                                      onPressed: () {
                                        context
                                            .read<UserViewmodel>()
                                            .updateTask(
                                              task,
                                              task.copyWith(
                                                status: TaskStatus.paused,
                                                elapsedTime: runningTime +
                                                    task.elapsedTime,
                                              ),
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
                                        context
                                            .read<UserViewmodel>()
                                            .updateTask(
                                              task,
                                              task.copyWith(
                                                status: TaskStatus.inprogress,
                                                elapsedTime: runningTime +
                                                    task.elapsedTime,
                                              ),
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
                      SizedBox(height: AppMetrices.verticalGap.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChoiceChip(
                            label: Text('task.status.done'.tr()),
                            selected: task.status == TaskStatus.done,
                            onSelected: (value) {
                              context.read<UserViewmodel>().updateTask(
                                    task,
                                    task.copyWith(
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
                                message: task.title,
                                onConfirm: () {
                                  context
                                      .read<UserViewmodel>()
                                      .deleteTask(task);
                                  showSnackBar(
                                    context,
                                    message: 'task.remove'.tr(),
                                  );
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
                const BackButtonl10n()
              ],
            );
          },
        ),
      ),
    );
  }
}
