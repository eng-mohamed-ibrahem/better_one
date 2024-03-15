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
          horizontal: MediaQuery.of(context).size.width * 0.07, vertical: 5),
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
                vertical: 5),
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
                      .searchOn(isSearchByTitle: isSelected);
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
                  SettingViewModel.get(context)
                      .searchOn(isSearchByBody: isSelected);
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
                  SettingViewModel.get(context)
                      .searchOn(isSearchByStatus: isSelected);
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
                onChanged: (isSelected) {
                  SettingViewModel.get(context)
                      .searchOn(isSearchByStatus: isSelected);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
