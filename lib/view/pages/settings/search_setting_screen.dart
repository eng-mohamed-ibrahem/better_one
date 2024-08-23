import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: BlocBuilder<SettingViewModel, SettingViewModelState>(
          builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
                vertical: 5,
              ),
              children: [
                CheckboxListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  title: Text('setting.search.on.title'.tr()),
                  contentPadding: EdgeInsets.zero,
                  value: state.isSearchByTitle,
                  onChanged: (isSelected) {
                    SettingViewModel.get(context)
                        .searchOn(isSearchByTitle: isSelected);
                  },
                ),
                CheckboxListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  title: Text('setting.search.on.body'.tr()),
                  contentPadding: EdgeInsets.zero,
                  value: state.isSearchByBody,
                  onChanged: (isSelected) {
                    SettingViewModel.get(context)
                        .searchOn(isSearchByBody: isSelected);
                  },
                ),
                // CheckboxListTile(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(15.r),
                //   ),
                //   title: Text('setting.search.on.date'.tr()),
                //   contentPadding: EdgeInsets.zero,
                //   value: state.isSearchByDate,
                //   onChanged: (isSelected) {
                //     SettingViewModel.get(context)
                //         .searchOn(isSearchByDate: isSelected);
                //   },
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
