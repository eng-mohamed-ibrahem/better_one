import 'package:better_one/config/navigation/app_navigation.dart';
import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/model/settings_item_model/setting_item_model.dart';
import 'package:better_one/view/widgets/setting_widgets/language_setting_widget.dart';
import 'package:better_one/view/widgets/setting_widgets/setting_item_widget.dart';
import 'package:better_one/view/widgets/setting_widgets/theme_setting_widget.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/theme_viewmodel/theme_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    AppNavigation.activeRoute = Routes.settings.path;
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
      body: BlocBuilder<SettingViewmodel, SettingViewmodelState>(
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
                              ? BlocProvider.value(
                                  value: inject<SettingViewmodel>(),
                                  child: const LanguageSetting(),
                                )
                              : context
                                      .read<ThemeViewModel>()
                                      .state
                                      .isGetThemeLoading
                                  ? const Skeletonizer(
                                      child: ThemeSetting(),
                                    )
                                  : const ThemeSetting(),
                        );
                      } else {
                        context.goNamed(settingItems[index].path!);
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
              indent: 20,
              endIndent: 20,
            ),
          );
        },
      ),
    );
  }
}
