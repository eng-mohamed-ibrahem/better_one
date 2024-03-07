import 'package:better_one/model/settings_item_model/setting_item_model.dart';
import 'package:better_one/view/widgets/setting_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            leading: IconButton(
              icon: const Icon(
                Icons.keyboard_double_arrow_left_rounded,
                size: 25,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text('App Settings'),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppMetrices.widthSpace),
        itemCount: settingItems.length,
        itemBuilder: (context, index) {
          return SettingItem(
            title: settingItems[index].title,
            subTitle: settingItems[index].subTitle,
            onTap: () {},
            leadingIcon: settingItems[index].leadingIcon,
          );
        },
        separatorBuilder: (context, index) => const Divider(
          thickness: 2,
          color: AppColors.secondColor,
          height: 10,
          indent: 20,
          endIndent: 20,
        ),
      ),
    );
  }
}

final List<SettingItemModel> settingItems = [
  SettingItemModel(
    title: 'Language',
    subTitle: 'Change your app language',
    leadingIcon: const Icon(
      Icons.language,
      color: AppColors.hightlightColor,
    ),
  ),
  SettingItemModel(
    title: 'Theme',
    subTitle: 'Toggle between light and dark theme',
    leadingIcon: const Icon(
      Icons.brightness_6,
      color: AppColors.hightlightColor,
    ),
  ),
  SettingItemModel(
    title: 'Notification',
    subTitle: 'Manage notification preferences',
    leadingIcon: const Icon(
      Icons.notifications,
      color: AppColors.hightlightColor,
    ),
  ),
  SettingItemModel(
    title: 'Search',
    subTitle: 'Determine how search will be on',
    leadingIcon: const Icon(
      Icons.search,
      color: AppColors.hightlightColor,
    ),
  ),
  SettingItemModel(
    title: 'Account',
    subTitle: 'Manage your account',
    leadingIcon: const Icon(
      Icons.person,
      color: AppColors.hightlightColor,
    ),
  ),
];
