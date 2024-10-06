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

class SearchSettingScreen extends StatelessWidget {
  const SearchSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setting.search.title'.tr()),
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
              getSearchSettingsLoading: () {
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
                      enabled: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      title: Text('setting.search.on.title'.tr()),
                      contentPadding: EdgeInsets.zero,
                      value: inject<SettingViewmodel>()
                          .searchSetting
                          .searchByTitle,
                      onChanged: (isSelected) {
                        context
                            .read<SettingViewmodel>()
                            .searchBy(title: isSelected);
                      },
                    ),
                    CheckboxListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      title: Text('setting.search.on.body'.tr()),
                      contentPadding: EdgeInsets.zero,
                      value:
                          inject<SettingViewmodel>().searchSetting.searchByBody,
                      onChanged: (isSelected) {
                        context
                            .read<SettingViewmodel>()
                            .searchBy(body: isSelected);
                      },
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
}
