import 'dart:developer';

import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view/widgets/modify_card_note.dart';
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
                      //* TODO change failed assets with failed assets from internet
                      failedAsset: LottieAssets.searchForNoteFailed,
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
                      : ListView.builder(
                          key: listKey,
                          itemCount: state.allNotes.length,
                          itemBuilder: (context, index) {
                            return ModifiyCardNote(
                              key: ValueKey(state.allNotes[index].id),
                              onRemove: () {
                                HomeViewmodel.get(context)
                                    .removeNote(state.allNotes[index]);
                              },
                              note: state.allNotes[index],
                            );
                          },
                        );
                }
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  GenerateRouter.noteScreen,
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
              label: Text(
                'create_task'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
