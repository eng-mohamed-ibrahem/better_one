import 'dart:developer';

import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view/widgets/modify_card_task.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

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
    super.initState();
  }

  @override
  didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!);

    super.didChangeDependencies();
  }

  void _handleNotification() {
    localNotification.getNotificationAppLaunchDetails;
    localNotification.onTapNotificationStream.listen((payload) {
      /// 1: chech if in the same route of [task screen]
      /// 2: if yes, pushReplacement
      /// 3: if not, pushNamedTR
      log(GenerateRouter.activeRoute);
      Logger().i('payload: $payload');
      GenerateRouter.activeRoute == GenerateRouter.taskScreen
          ? Navigator.pushReplacementNamed(
              context,
              GenerateRouter.taskScreen,
              arguments: payload!,
            )
          : Navigator.pushNamed(
              context,
              GenerateRouter.taskScreen,
              arguments: payload!,
            );
    });
  }

  @override
  void didPopNext() {
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
        padding: EdgeInsets.only(top: 25.h, bottom: 5.h),
        child: Stack(
          alignment: Alignment.bottomCenter,
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
                        HomeViewmodel.get(context).getTasks();
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
                      : Column(
                          children: [
                            SizedBox(height: AppMetrices.heightSpace2.h),
                            state.isGetTotalEstimatedTimeCompleted ||
                                    state.isUpdateTotalEstimatedTimeCompleted
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppMetrices.widthSpace2.w),
                                    child: DurationTime(
                                      duration: state.totalEstimatedTime,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  )
                                : const SizedBox(),
                            Expanded(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                controller: state.scrollController,
                                itemCount: state.allTasks.length,
                                itemBuilder: (context, index) {
                                  return ModifiyCardTask(
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
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        bottomLeft: Radius.circular(15.r),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      GenerateRouter.taskScreen,
                    );
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
