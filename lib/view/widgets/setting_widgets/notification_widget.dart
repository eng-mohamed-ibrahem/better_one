import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  void initState() {
    // to check if notification is on or not
    localNotification.getPendingNotificationsIds().then(
      (list) {
        if (!list.contains(NotificaitonConstants.scheduleNotificationId)) {
          SettingViewModel.get(context).setNotificationSettings(
            isNotificationOnReminder: false,
            reminderDateTime: null,
            repeatReminder: false,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.07,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocBuilder<SettingViewModel, SettingViewModelState>(
        builder: (context, state) {
          if (state.isNotificationSettingsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            shrinkWrap: true,
            primary: true,
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
                value: state.isNotificationOnAdd,
                onChanged: (isSelected) {
                  SettingViewModel.get(context)
                      .setNotificationSettings(isNotificationOnAdd: isSelected);
                },
              ),
              CheckboxListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                title: Text('setting.notification.on.update'.tr()),
                contentPadding: EdgeInsets.zero,
                value: state.isNotificationOnUpdate,
                onChanged: (isSelected) {
                  SettingViewModel.get(context).setNotificationSettings(
                      isNotificationOnUpdate: isSelected);
                },
              ),
              CheckboxListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                title: Text('setting.notification.on.complete'.tr()),
                contentPadding: EdgeInsets.zero,
                value: state.isNotificationOnComplete,
                onChanged: (isSelected) {
                  SettingViewModel.get(context).setNotificationSettings(
                      isNotificationOnComplete: isSelected);
                },
              ),
              Divider(
                thickness: 1.5,
                color: AppColors.secondColor,
                height: 20.h,
              ),
              TextButton(
                onPressed: () async {
                  await showDatePicker(
                    context: context,
                    currentDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then(
                    (pickedDateTime) async {
                      if (pickedDateTime != null) {
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then(
                          (pickedTime) {
                            SettingViewModel.get(context)
                                .setNotificationSettings(
                              isNotificationOnReminder:
                                  pickedTime != null ? true : false,
                              reminderDateTime: pickedTime != null
                                  ? pickedDateTime.add(
                                      Duration(
                                        hours: pickedTime.hour,
                                        minutes: pickedTime.minute,
                                      ),
                                    )
                                  : null,
                            );
                          },
                        );
                      } else {
                        SettingViewModel.get(context).setNotificationSettings(
                          isNotificationOnReminder: false,
                          reminderDateTime: pickedDateTime,
                        );
                      }
                    },
                  );
                },
                child: Text('setting.notification.on.reminder'.tr()),
              ),
              if (state.isNotificationOnReminder &&
                  state.reminderDateTime != null) ...[
                Text(
                  DateFormat('EEEE, MMMM d, yyyy,  hh:mm a',
                          state.currentLanguage!.languageCode)
                      .format(state.reminderDateTime!),
                ),
                SizedBox(height: 10.h),
                ChoiceChip(
                  label: Text('setting.notification.on.repeat_reminder'.tr()),
                  selected: state.repeatReminder,
                  onSelected: (isSelected) {
                    SettingViewModel.get(context)
                        .setNotificationSettings(repeatReminder: isSelected);
                  },
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
