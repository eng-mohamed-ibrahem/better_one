import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSettingWidget extends StatelessWidget {
  const SearchSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              CheckboxListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                title: Text('setting.search.on.date'.tr()),
                contentPadding: EdgeInsets.zero,
                value: state.isSearchByDate,
                onChanged: (isSelected) {
                  SettingViewModel.get(context)
                      .searchOn(isSearchByDate: isSelected);
                },
              ),
              CheckboxListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                title: Text('setting.search.on.status'.tr()),
                contentPadding: EdgeInsets.zero,
                value: state.isSearchByStatus,
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
