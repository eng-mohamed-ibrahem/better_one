import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/model/settings_item_model/setting_item_model.dart';
import 'package:better_one/view/widgets/setting_widgets/language_widget.dart';
import 'package:better_one/view/widgets/setting_widgets/notification_widget.dart';
import 'package:better_one/view/widgets/setting_widgets/search_settings_widget.dart';
import 'package:better_one/view/widgets/setting_widgets/setting_item_widget.dart';
import 'package:better_one/view/widgets/setting_widgets/theme_widget.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/constants.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        SettingViewModel.get(context).setCurrentTappedItemIndex(-1);
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
          child: Hero(
            tag: 'app_settings',
            transitionOnUserGestures: true,
            child: AppBar(
              centerTitle: true,
              elevation: 0,
              titleTextStyle: Theme.of(context).textTheme.titleMedium,
              leading: const FittedBox(
                fit: BoxFit.scaleDown,
                child: BackButtonLl10n(),
              ),
              title: Text('setting.name'.tr()),
            ),
          ),
        ),
        body: BlocBuilder<SettingViewModel, SettingViewModelState>(
          builder: (context, state) {
            List<SettingItemModel> settingItems = generateSettingItems();
            return ListView.separated(
              padding: const EdgeInsets.all(AppMetrices.widthSpace),
              itemCount: settingItems.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SettingItem(
                      title: settingItems[index].title,
                      subTitle: settingItems[index].subTitle,
                      onTap: () {
                        SettingViewModel.get(context).setCurrentTappedItemIndex(
                            state.currentTappedItemIndex == index ? -1 : index);
                      },
                      leadingIcon: settingItems[index].leadingIcon,
                    ),
                    const SizedBox(height: AppMetrices.heightSpace),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 400),
                      child: state.currentTappedItemIndex == 0 && index == 0
                          ? const LanguageWidget()
                          : state.currentTappedItemIndex == 1 && index == 1
                              ? const ThemeWidget()
                              : state.currentTappedItemIndex == 2 && index == 2
                                  ? const NotificationWidget()
                                  : state.currentTappedItemIndex == 3 &&
                                          index == 3
                                      ? const SearchSettingWidget()
                                      : const SizedBox(),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 2,
                color: AppColors.secondColor,
                height: 10,
                indent: 20,
                endIndent: 20,
              ),
            );
          },
        ),
      ),
    );
  }

  generateSettingItems() {
    return [
      SettingItemModel(
        title: 'setting.language.title'.tr(),
        subTitle: 'setting.language.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.language,
        ),
      ),
      SettingItemModel(
        title: 'setting.theme.title'.tr(),
        subTitle: 'setting.theme.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.brightness_6,
        ),
      ),
      SettingItemModel(
        title: 'setting.notification.title'.tr(),
        subTitle: 'setting.notification.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.notifications,
        ),
      ),
      SettingItemModel(
        title: 'setting.search.title'.tr(),
        subTitle: 'setting.search.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.search,
        ),
      ),
      SettingItemModel(
        title: 'setting.account.title'.tr(),
        subTitle: 'setting.account.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.person,
        ),
      ),
    ];
  }
}
