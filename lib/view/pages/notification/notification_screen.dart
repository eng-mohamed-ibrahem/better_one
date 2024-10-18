import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/lottie_assets.dart';
import 'package:better_one/core/constants/notification_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/utils/encryption/encryption_handler.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
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

  @override
  void initState() {
    context.read<NotificationViewmodel>().getNotifications();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(
        () {
          if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent) {
            context.read<NotificationViewmodel>().getNotifications();
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
            getNewNotificationFailed: (message) {
              showSnackBar(context, message: message);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            getNotificationloading: () {
              return Skeletonizer(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CardNotification.skeleton();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 15);
                  },
                ),
              );
            },
            getNotificationFailed: (failure, message) {
              if (failure is NoUserLogedInFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(message,
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
                  errorMessage: message,
                  retry: () {
                    context.read<NotificationViewmodel>().getNotifications();
                  },
                ),
              );
            },
            orElse: () {
              var notifications = context.read<NotificationViewmodel>().list;
              return notifications.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsets.only(top: 10.h),
                      physics: const AlwaysScrollableScrollPhysics(),
                      restorationId: 'notification_list_view',
                      controller: _scrollController,
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        var notification = NotificationModel.fromJson(
                            notifications[index].data()
                                as Map<String, dynamic>);
                        return InkWell(
                          onTap: () async {
                            var encryptedSenderId = await EncryptionHandler()
                                .encrypt(notification.senderId);
                            if (context.mounted) {
                              context.pushNamed(
                                Routes.sharedTask.name,
                                pathParameters: {"id": notification.payload!},
                                queryParameters: {
                                  NotificaitonConstants.senderId:
                                      encryptedSenderId,
                                },
                              );
                            }
                          },
                          borderRadius: BorderRadius.circular(10.r),
                          child: CardNotification(
                            notification: notification,
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
