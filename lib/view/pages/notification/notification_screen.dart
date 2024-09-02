import 'package:better_one/core/constants/lottie_assets.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/view/widgets/card_notification.dart';
import 'package:better_one/view_models/notification_viewmodel/notification_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(
        () {
          if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent) {
            context.read<NotificationViewmodel>().getNotification();
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "notification.loading".tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            },
            getNotificationFailed: (failure, message) {
              return Center(
                child: Failed(
                  failedAsset: failure is NoInternetFailure
                      ? LottieAssets.noInternet
                      : LottieAssets.error,
                  errorMessage: message,
                  retry: () {
                    context.read<NotificationViewmodel>().getNotification();
                  },
                ),
              );
            },
            orElse: () {
              var notifications = context.read<NotificationViewmodel>().list;
              return notifications.isNotEmpty
                  ? ListView.builder(
                      restorationId: 'notification_list_view',
                      controller: _scrollController,
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        return CardNotification(
                          notification: NotificationModel.fromJson(
                              notifications[index].data()
                                  as Map<String, dynamic>),
                        );
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
