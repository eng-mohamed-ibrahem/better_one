import 'dart:developer';

import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view/widgets/modify_card_note.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/snack_bar/snack_bar.dart';

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
      /// 1: chech if in the same route of [note screen]
      /// 2: if yes, pushReplacement
      /// 3: if not, pushNamedTR
      log(GenerateRouter.activeRoute);
      Logger().i('payload: $payload');
      GenerateRouter.activeRoute == GenerateRouter.noteScreen
          ? Navigator.pushReplacementNamed(
              context,
              GenerateRouter.noteScreen,
              arguments: payload!,
            )
          : Navigator.pushNamed(
              context,
              GenerateRouter.noteScreen,
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
                if (state.isGetAllNotesLoading) {
                  return const Center(
                    child: LottieIndicator(
                      statusAssets: LottieAssets.loadingFromToDatabase,
                    ),
                  );
                } else if (state.isGetAllNotesFailed) {
                  return Center(
                    child: Failed(
                      failedAsset: LottieAssets.error,
                      errorMessage: state.errorMessage,
                      retry: () {
                        HomeViewmodel.get(context).getNotes();
                      },
                    ),
                  );
                } else {
                  return state.allNotes.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const LottieIndicator(
                                statusAssets: LottieAssets.noDataFound,
                              ),
                              Text('no_task'.tr()),
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
                                        duration: state.totalEstimatedTime),
                                  )
                                : const SizedBox(),
                            Expanded(
                              child: ListView.builder(
                                key: listKey,
                                itemCount: state.allNotes.length,
                                itemBuilder: (context, index) {
                                  Logger().i(state.allNotes[index]);
                                  return ModifiyCardNote(
                                    key: ValueKey(state.allNotes[index].id),
                                    onRemove: () {
                                      HomeViewmodel.get(context)
                                          .removeNote(state.allNotes[index]);
                                      showSnackBar(
                                        context,
                                        message: 'note_deleted'.tr(),
                                      );
                                    },
                                    note: state.allNotes[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                }
              },
            ),
            FilledButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  GenerateRouter.noteScreen,
                );
              },
              icon: const Icon(Icons.add),
              label: Text(
                'create_task'.tr(),
                textAlign: TextAlign.center,
                // style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
