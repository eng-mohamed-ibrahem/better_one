import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view/widgets/overlay_widget.dart';
import 'package:better_one/view/widgets/sliver_header.dart';
import 'package:better_one/view/widgets/task/card_task.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  final PageStorageKey listKey = const PageStorageKey('list_view');

  @override
  void initState() {
    _handleNotification();
    context.read<TaskViewmodel>().getTasks();
    super.initState();
  }

  @override
  didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  void _handleNotification() {
    localNotification.getNotificationAppLaunchDetails;
    localNotification.onTapNotificationStream.listen(
      (payload) {
        if (payload!.isNotEmpty) {
          context.goNamed(Routes.taskDetail.name,
              queryParameters: {'id': payload});
          kDebugPrint(
              "location of ${Routes.taskDetail.name}: ${GoRouterState.of(context).namedLocation(Routes.taskDetail.name)}");
        }
      },
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var taskViewmodel = context.read<TaskViewmodel>();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, bottom: 5.h),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            BlocConsumer<TaskViewmodel, TaskViewmodelState>(
              listener: (context, state) {
                state.whenOrNull(
                  filterTasksFailed: (message) {
                    showSnackBar(message: message, context);
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  allTasksLoading: () {
                    return const Center(
                      child: LottieIndicator(
                        statusAssets: LottieAssets.loadingFromToDatabase,
                      ),
                    );
                  },
                  allTasksFailed: (message) {
                    return Center(
                      child: Failed(
                        failedAsset: LottieAssets.error,
                        errorMessage: message,
                        retry: () {
                          context.read<TaskViewmodel>().getTasks();
                        },
                      ),
                    );
                  },
                  filterTasksLoading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  filterTasksCompleted: (filteredTasks) {
                    return displayTasks(
                        filteredTasks, context, state, taskViewmodel);
                  },
                  orElse: () {
                    var allTasks = taskViewmodel.tasks.values.toList();
                    return displayTasks(
                        allTasks, context, state, taskViewmodel);
                  },
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).systemGestureInsets.right),
                child: Row(
                  children: [
                    settingIcons(context),
                    Hero(
                      tag: 'app_notification',
                      child: IconButton(
                        onPressed: () {
                          context.goNamed(Routes.notification.name);
                        },
                        icon: const Icon(FontAwesomeIcons.bell),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(15.r),
                        bottomStart: Radius.circular(15.r),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.goNamed(Routes.task.name);
                  },
                  icon: const Icon(Icons.add),
                  label: Text(
                    'task.create'.tr(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropIcons settingIcons(BuildContext context) {
    return DropIcons(
      button: const Icon(Icons.segment_outlined),
      iconsText: const [
        Hero(
          tag: 'app_settings',
          child: Icon(Icons.settings_outlined),
        ),
        Icon(Icons.tune_rounded),
        Icon(Icons.search),
      ],
      onSelectIcon: (index) {
        if (index == 0) {
          context.goNamed(Routes.settings.name);
        }
        if (index == 1) {
          Set<TaskStatus> selectedStatus = {};
          // show filters as modal bottom sheet
          showSheet(
            context,
            content: StatefulBuilder(
              builder: (_, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<TaskViewmodel>().getTasks();
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              gradient: LinearGradient(
                                colors: TaskStatus.values
                                    .map(
                                      (status) => status.color,
                                    )
                                    .toList(),
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Text(
                              'task.filter.all'.tr(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        ...() {
                          return TaskStatus.values.map(
                            (status) => ChoiceChip(
                              selected: selectedStatus.contains(status),
                              label: Text(
                                'task.status.${status.name}'.tr(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              color: WidgetStatePropertyAll(status.color),
                              selectedColor: status.color,
                              backgroundColor: status.color,
                              onSelected: (value) {
                                setState(
                                  () {
                                    if (value) {
                                      selectedStatus.add(status);
                                    } else {
                                      selectedStatus.remove(status);
                                    }
                                    context
                                        .read<TaskViewmodel>()
                                        .filterWithStatuses(selectedStatus);
                                  },
                                );
                              },
                            ),
                          );
                        }()
                      ],
                    ),
                    SizedBox(height: 10.h),
                  ],
                );
              },
            ),
          );
        }
        if (index == 2) {
          context.goNamed(Routes.search.name);
        }
      },
      borderRadius: BorderRadius.circular(15.r),
    );
  }

  Widget displayTasks(List<TaskModel> allTasks, BuildContext context,
      TaskViewmodelState state, TaskViewmodel taskViewmodel) {
    return allTasks.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LottieIndicator(
                  statusAssets: LottieAssets.noDataFound,
                ),
                Text('task.empty'.tr()),
              ],
            ),
          )
        : CustomScrollView(
            physics: const BouncingScrollPhysics(),
            key: listKey,
            controller: context.read<TaskViewmodel>().scrollController,
            slivers: [
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: SliverHeaderDelegate(
                  maxHeight: MediaQuery.of(context).size.height * 0.1,
                  minHeight: MediaQuery.of(context).size.height * 0.1,
                  child: state.maybeWhen(
                    getTotalEstimatedTimeLoading: () {
                      return const SizedBox();
                    },
                    orElse: () {
                      return FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Material(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppMetrices.borderRadius1.w,
                            ),
                          ),
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: DurationTime(
                              duration: taskViewmodel.totalEstimatedTime,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: allTasks.length,
                itemBuilder: (context, index) {
                  return CardTask(
                    key: ValueKey(allTasks[index].id),
                    task: allTasks[index],
                  );
                },
              ),
            ],
          );
  }
}
