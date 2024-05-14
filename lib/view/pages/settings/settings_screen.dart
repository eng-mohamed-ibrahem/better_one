import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/loading_data.dart';
import 'package:better_one/core/utils/shared_widgets/show_bottom_sheet.dart';
import 'package:better_one/model/settings_item_model/setting_item_model.dart';
import 'package:better_one/view/widgets/setting_widgets/language_setting_widget.dart';
import 'package:better_one/view/widgets/setting_widgets/setting_item_widget.dart';
import 'package:better_one/view/widgets/setting_widgets/theme_setting_widget.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/constants.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with RouteAware {
  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    GenerateRouter.activeRoute = GenerateRouter.settingScreen;
    super.didPop();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

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
            elevation: 0,
            leading: const FittedBox(
              fit: BoxFit.scaleDown,
              child: BackButtonl10n(),
            ),
            title: Text('setting.name'.tr()),
          ),
        ),
      ),
      body: BlocBuilder<SettingViewModel, SettingViewModelState>(
        builder: (context, state) {
          List<SettingItemModel> settingItems = generateSettingItems();
          return ListView.separated(
            padding: const EdgeInsets.all(AppMetrices.horizontalGap),
            itemCount: settingItems.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SettingItem(
                    title: settingItems[index].title,
                    subTitle: settingItems[index].subTitle,
                    onTap: () {
                      if (index == 0 || index == 1) {
                        showSheet(
                          context,
                          content: index == 0
                              ? state.isGetLanguageLoading
                                  ? const LoadingDataShimmer()
                                  : const LanguageSetting()
                              : const ThemeSetting(),
                        );
                      } else if (index == 4) {
                        showFeedback(context);
                      } else {
                        Navigator.pushNamed(
                          context,
                          settingItems[index].path!,
                          arguments: settingItems[index].title,
                        );
                      }
                    },
                    leadingIcon: settingItems[index].leadingIcon,
                  ),
                  const SizedBox(height: AppMetrices.verticalGap),
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
    );
  }

  void showFeedback(BuildContext context) {
    BetterFeedback.of(context).show((userFeedback) {
      // todo check if he has account or not
      // if not, show dialog for register

      ///#things to upload
      /// 1: screenshots
      /// 2: text
      /// 3: device info
      /// 4: package info
      debugPrint(userFeedback.text);
    });
  }

  List<SettingItemModel> generateSettingItems() {
    return [
      SettingItemModel(
        title: 'setting.language.title'.tr(),
        subTitle: 'setting.language.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.language,
        ),
        path: GenerateRouter.languageSettingScreen,
      ),
      SettingItemModel(
        title: 'setting.theme.title'.tr(),
        subTitle: 'setting.theme.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.brightness_6,
        ),
        path: GenerateRouter.themeSettingScreen,
      ),
      SettingItemModel(
        title: 'setting.notification.title'.tr(),
        subTitle: 'setting.notification.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.notifications,
        ),
        path: GenerateRouter.notificationSettingScreen,
      ),
      SettingItemModel(
        title: 'setting.search.title'.tr(),
        subTitle: 'setting.search.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.search,
        ),
        path: GenerateRouter.searchSettingScreen,
      ),
      SettingItemModel(
        title: 'setting.feedback.title'.tr(),
        subTitle: 'setting.feedback.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.feedback,
        ),
      ),
      SettingItemModel(
        title: 'setting.account.title'.tr(),
        subTitle: 'setting.account.subtitle'.tr(),
        leadingIcon: const Icon(
          Icons.person,
        ),
        path: GenerateRouter.accountSettingScreen,
      ),
    ];
  }
}
