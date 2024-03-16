import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

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
              CheckboxListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                title: Text('setting.notification.on.reminder'.tr()),
                contentPadding: EdgeInsets.zero,
                value: state.isNotificationOnReminder,
                onChanged: (isSelected) async {
                  await showDatePicker(
                    context: context,
                    currentDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then(
                    (dateTimePicked) async {
                      if (dateTimePicked != null) {
                        await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(dateTimePicked))
                            .then(
                          (timePicked) {
                            SettingViewModel.get(context)
                                .setNotificationSettings(
                              isNotificationOnReminder:
                                  timePicked != null ? true : false,
                              reminderDateTime: timePicked != null
                                  ? dateTimePicked.add(
                                      Duration(
                                        hours: timePicked.hour,
                                        minutes: timePicked.minute,
                                      ),
                                    )
                                  : null,
                            );
                          },
                        );
                      } else {
                        SettingViewModel.get(context).setNotificationSettings(
                          isNotificationOnReminder:
                              dateTimePicked != null ? true : false,
                          reminderDateTime: dateTimePicked,
                        );
                      }
                    },
                  );
                },
              ),
              if (state.isNotificationOnReminder &&
                  state.reminderDateTime != null)
                Text(
                  DateFormat('EEEE, MMMM d, yyyy,  hh:mm a',
                          state.currentLanguage!.languageCode)
                      .format(state.reminderDateTime!),
                )
            ],
          );
        },
      ),
    );
  }
}
