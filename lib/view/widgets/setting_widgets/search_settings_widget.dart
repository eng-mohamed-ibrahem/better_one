import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSettingWidget extends StatelessWidget {
  const SearchSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocBuilder<SettingViewModel, SettingViewModelState>(
        builder: (context, state) {
          return GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              childAspectRatio: 3 / 1,
              crossAxisSpacing: 10,
            ),
            children: [
              ChoiceChip(
                label: Text('setting.search.on.title'.tr()),
                selected: state.isSearchByTitle,
                onSelected: (isSelected) {
                  SettingViewModel.get(context)
                      .searchOn(isSearchByTitle: isSelected);
                },
              ),
              ChoiceChip(
                label: Text('setting.search.on.body'.tr()),
                selected: state.isSearchByBody,
                onSelected: (isSelected) {
                  SettingViewModel.get(context)
                      .searchOn(isSearchByBody: isSelected);
                },
              ),
              ChoiceChip(
                label: Text('setting.search.on.date'.tr()),
                selected: state.isSearchByDate,
                onSelected: (isSelected) {
                  SettingViewModel.get(context)
                      .searchOn(isSearchByDate: isSelected);
                },
              ),
              ChoiceChip(
                label: Text('setting.search.on.status'.tr()),
                selected: state.isSearchByStatus,
                onSelected: (isSelected) {
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
