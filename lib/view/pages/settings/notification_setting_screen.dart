import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setting.notification.title'.tr()),
        leading: const FittedBox(
          fit: BoxFit.scaleDown,
          child: BackButtonl10n(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppMetrices.padding,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: BlocBuilder<SettingViewmodel, SettingViewmodelState>(
          builder: (context, state) {
            return state.maybeWhen(
              getNotificationSettingsLoading: () {
                return Skeletonizer(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07,
                      vertical: 5,
                    ),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const CheckboxListTile(
                        title: Text('setting.notification.on.add'),
                        value: false,
                        onChanged: null,
                      );
                    },
                  ),
                );
              },
              getNotificationSettingsFailed: (message, failure) {
                return Center(
                  child: Failed(
                    failedAsset: LottieAssets.error,
                    retry: () {
                      context
                          .read<SettingViewmodel>()
                          .getNotificationSettings();
                    },
                    errorMessage: message,
                  ),
                );
              },
              orElse: () {
                return ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.07,
                    vertical: 5,
                  ),
                  children: [
                    CheckboxListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppMetrices.borderRadius1.r),
                      ),
                      title: Text('setting.notification.on.add'.tr()),
                      contentPadding: EdgeInsets.zero,
                      value: inject<SettingViewmodel>()
                          .notificationSetting
                          ?.sendOnAdd,
                      onChanged: (isSelected) {
                        context
                            .read<SettingViewmodel>()
                            .setNotificationSettings(sendOnAdd: isSelected);
                      },
                    ),
                    CheckboxListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      title: Text('setting.notification.on.update'.tr()),
                      contentPadding: EdgeInsets.zero,
                      value: inject<SettingViewmodel>()
                          .notificationSetting
                          ?.sendOnUpdate,
                      onChanged: (isSelected) {
                        context
                            .read<SettingViewmodel>()
                            .setNotificationSettings(sendOnUpdate: isSelected);
                      },
                    ),
                    CheckboxListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      title: Text('setting.notification.on.complete'.tr()),
                      contentPadding: EdgeInsets.zero,
                      value: inject<SettingViewmodel>()
                          .notificationSetting
                          ?.sendOnComplete,
                      onChanged: (isSelected) {
                        context
                            .read<SettingViewmodel>()
                            .setNotificationSettings(
                                sendOnComplete: isSelected);
                      },
                    ),
                    Divider(
                      thickness: 1.5,
                      color: AppColors.secondColor,
                      height: 20.h,
                    ),
                    TextButton(
                      onPressed: () async {
                        await createEvent(context);
                      },
                      child: Text('setting.notification.event'.tr()),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> createEvent(BuildContext context) async {
    await showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then(
      (pickedDateTime) async {
        if (pickedDateTime != null && context.mounted) {
          await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          ).then(
            (pickedTime) {
              // todo add event to calendar
            },
          );
        } else {
          // todo
        }
      },
    );
  }
}
