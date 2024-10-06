import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/notification_service/flutter_local_notification.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/model/event_calendar_model/event_calendar_model.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
        child: BlocConsumer<SettingViewmodel, SettingViewmodelState>(
          listener: (context, state) {
            state.whenOrNull(
              createEventLoading: () {
                showLoadingDialog(context);
              },
              createEventFailed: (message, failure) {
                showSnackBar(context, message: message);
                context.pop(context);
              },
              createEventCompleted: (event) {
                context.pop(context);
                inject<FlutterLocalNotification>().display(
                  // this is special for display locale notification
                  notification: NotificationModel(
                    senderId: inject<LocaleUserInfo>().getUserData()!.id,
                    userName: "setting.notification.event_added".tr(),
                    comment: event.title,
                    createdAt: DateTime.now(),
                  ),
                );
              },
            );
          },
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
                    SwitchListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppMetrices.borderRadius1.r),
                      ),
                      title: Text('setting.notification.on.add'.tr()),
                      contentPadding: EdgeInsets.zero,
                      value: inject<SettingViewmodel>()
                          .notificationSetting
                          .sendOnAdd,
                      onChanged: (isSelected) {
                        context
                            .read<SettingViewmodel>()
                            .setNotificationSettings(sendOnAdd: isSelected);
                      },
                    ),
                    SwitchListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      title: Text('setting.notification.on.update'.tr()),
                      contentPadding: EdgeInsets.zero,
                      value: inject<SettingViewmodel>()
                          .notificationSetting
                          .sendOnUpdate,
                      onChanged: (isSelected) {
                        context
                            .read<SettingViewmodel>()
                            .setNotificationSettings(sendOnUpdate: isSelected);
                      },
                    ),
                    SwitchListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      title: Text('setting.notification.on.complete'.tr()),
                      contentPadding: EdgeInsets.zero,
                      value: inject<SettingViewmodel>()
                          .notificationSetting
                          .sendOnComplete,
                      onChanged: (isSelected) {
                        context
                            .read<SettingViewmodel>()
                            .setNotificationSettings(
                                sendOnComplete: isSelected);
                      },
                    ),
                    // Divider(
                    //   thickness: 1.5,
                    //   color: AppColors.secondColor,
                    //   height: 20.h,
                    // ),
                    TextButton(
                      onPressed: () {
                        createEvent(context);
                      },
                      child: Text('setting.notification.event.add_event'.tr()),
                    ),
                    // todo mute notifications incomming
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
    List<DateTime?> selectedDates = [
      DateTime.now(),
      DateTime.now().add(const Duration(days: 1)),
    ];
    showDialog(
      context: context,
      builder: (context) {
        String? title, description;
        return Dialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppMetrices.borderRadius1.r),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    calendarType: CalendarDatePicker2Type.range,
                    selectedMonthTextStyle:
                        Theme.of(context).textTheme.bodySmall,
                    selectedYearTextStyle:
                        Theme.of(context).textTheme.bodySmall,
                    dayTextStyle: Theme.of(context).textTheme.bodySmall,
                    monthTextStyle: Theme.of(context).textTheme.bodySmall,
                    yearTextStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                  value: selectedDates,
                  onValueChanged: (dates) => selectedDates = dates,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    hintText: 'setting.notification.event.title_hint'.tr(),
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    hintText: 'setting.notification.event.note_hint'.tr(),
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  onChanged: (value) {
                    description = value;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.sizeOf(context).width * .5, 40.h),
                    textStyle: Theme.of(context).textTheme.titleSmall,
                  ),
                  onPressed: () {
                    if (title == null) {
                      showSnackBar(context,
                          message:
                              'setting.notification.event.required.title'.tr());
                      return;
                    }
                    inject<SettingViewmodel>().createEvent(
                      event: EventCalendarModel(
                        title: title!,
                        description: description,
                        startDate: selectedDates.first!,
                        endDate: selectedDates.last!,
                      ),
                      userRepo: kUserRepo,
                    );
                    context.pop();
                  },
                  child: Text('setting.notification.event.create'.tr()),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
