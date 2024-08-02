import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view/widgets/sliver_header.dart';
import 'package:better_one/view/widgets/task/card_task.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.only(top: 35.h, bottom: 5.h),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            BlocBuilder<TaskViewmodel, TaskViewmodelState>(
              builder: (context, state) {
                return state.maybeWhen(
                  allTasksLoading: () {
                    kDebugPrint("allTasksLoading");
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
                  orElse: () {
                    var allTasks = taskViewmodel.allTasks;
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
                            controller:
                                context.read<TaskViewmodel>().scrollController,
                            slivers: [
                              SliverPersistentHeader(
                                floating: true,
                                pinned: true,
                                delegate: SliverHeaderDelegate(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.1,
                                  minHeight:
                                      MediaQuery.of(context).size.height * 0.1,
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
                                              duration: taskViewmodel
                                                  .totalEstimatedTime,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  childCount: allTasks.length,
                                  (context, index) {
                                    return CardTask(
                                      key: ValueKey(allTasks[index].id),
                                      task: allTasks[index],
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                  },
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Hero(
                tag: 'app_settings',
                child: IconButton(
                  onPressed: () {
                    context.goNamed(Routes.settings.name);
                  },
                  icon: const Icon(Icons.settings_outlined),
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
}
