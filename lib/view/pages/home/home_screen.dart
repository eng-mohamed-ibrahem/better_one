import 'package:better_one/config/generate_router.dart';
import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view/widgets/task/card_task.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view/widgets/sliver_header.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      settingRepo.setOnBoardingSeen(true);
    });
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
              pathParameters: {'task_id': payload});
        }
      },
    );
  }

  @override
  void didPopNext() {
    // to rebuild [home screen] after pop from [setting screen] to reflect changes as [language, theme, ... etc]
    if (GenerateRouter.activeRoute == GenerateRouter.settingScreen) {
      setState(() {});
    }
    GenerateRouter.activeRoute = GenerateRouter.home;
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35.h, bottom: 5.h),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            BlocBuilder<HomeViewmodel, HomeViewmodelState>(
              builder: (context, state) {
                if (state.isGetAllTasksLoading) {
                  return const Center(
                    child: LottieIndicator(
                      statusAssets: LottieAssets.loadingFromToDatabase,
                    ),
                  );
                } else if (state.isGetAllTasksFailed) {
                  return Center(
                    child: Failed(
                      failedAsset: LottieAssets.error,
                      errorMessage: state.errorMessage,
                      retry: () {
                        context.read<HomeViewmodel>().getTasks();
                      },
                    ),
                  );
                } else {
                  return state.allTasks.isEmpty
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
                          controller: state.scrollController,
                          slivers: [
                            SliverPersistentHeader(
                              floating: true,
                              pinned: true,
                              delegate: SliverHeaderDelegate(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.1,
                                minHeight:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: state.isGetTotalEstimatedTimeCompleted ||
                                        state
                                            .isUpdateTotalEstimatedTimeCompleted
                                    ? FittedBox(
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
                                              duration:
                                                  state.totalEstimatedTime,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: state.allTasks.length,
                                (context, index) {
                                  return CardTask(
                                    key: ValueKey(state.allTasks[index].id),
                                    task: state.allTasks[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                }
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
