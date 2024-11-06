import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/lottie_assets.dart';
import 'package:better_one/core/constants/notification_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/in_memory/in_memory.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/view/widgets/notification_card.dart';
import 'package:better_one/view_models/notification_viewmodel/notification_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _scrollController = ScrollController();

  bool hasMore = false;
  @override
  void initState() {
    context.read<NotificationViewmodel>().getNotifications();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(
        () {
          hasMore = InMemory().getData<bool>(NotificationConstants.hasMore);
          if (_scrollController.offset >=
                  _scrollController.position.maxScrollExtent &&
              hasMore) {
            context
                .read<NotificationViewmodel>()
                .getNotifications(loadMore: hasMore);
          }
        },
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: Hero(
          tag: 'app_notification',
          child: AppBar(
            title: Text('notification.title'.tr()),
            leading: const FittedBox(
              fit: BoxFit.scaleDown,
              child: BackButtonl10n(),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.pushNamed(Routes.notificationSetting.name);
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
        ),
      ),
      body: BlocConsumer<NotificationViewmodel, NotificationViewmodelState>(
        listener: (context, state) {
          state.whenOrNull(
            getNewNotificationsFailed: (failure) {
              showSnackBar(context, message: failure.message);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            getNotificationsLoading: () {
              return Skeletonizer(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return NotificationCard.skeleton();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 15);
                  },
                ),
              );
            },
            getNotificationsFailed: (failure) {
              if (failure is NoUserLogedInFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(failure.message,
                          style: Theme.of(context).textTheme.bodyMedium),
                      MaterialButton(
                        onPressed: () {
                          context.goNamed(Routes.login.name);
                        },
                        child: Text(
                          'auth.login'.tr(),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: Failed(
                  failedAsset: failure is NoInternetFailure
                      ? LottieAssets.noInternet
                      : LottieAssets.error,
                  errorMessage: failure.message,
                  retry: () {
                    context.read<NotificationViewmodel>().getNotifications();
                  },
                ),
              );
            },
            orElse: () {
              hasMore =
                  InMemory().getData<bool?>(NotificationConstants.hasMore) ??
                      false;
              var notifications = context.read<NotificationViewmodel>().list;
              return notifications.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsets.only(top: 10.h),
                      physics: const AlwaysScrollableScrollPhysics(),
                      restorationId: 'notification_list_view',
                      controller: _scrollController,
                      itemCount: notifications.length + (hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == notifications.length) {
                          return Skeletonizer(
                            child: NotificationCard.skeleton(),
                          );
                        }
                        return InkWell(
                          // for web
                          mouseCursor: SystemMouseCursors.click,
                          onTap: () {
                            if (context.mounted) {
                              context.pushNamed(
                                Routes.sharedTask.name,
                                pathParameters: {
                                  "id": notifications[index].payload!
                                },
                                queryParameters: {
                                  NotificationConstants.senderId:
                                      notifications[index].senderId,
                                },
                              );
                            }
                          },
                          borderRadius: BorderRadius.circular(10.r),
                          child: NotificationCard(
                            key: ValueKey(notifications[index].payload),
                            notification: notifications[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 15);
                      },
                    )
                  : Center(
                      child: Text(
                        'notification.init'.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
            },
          );
        },
      ),
    );
  }
}
