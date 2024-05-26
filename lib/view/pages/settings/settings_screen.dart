import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/loading_data.dart';
import 'package:better_one/core/utils/shared_widgets/show_bottom_sheet.dart';
import 'package:better_one/model/settings_item_model/setting_item_model.dart';
import 'package:better_one/view/widgets/setting_widgets/language_setting_widget.dart';
import 'package:better_one/view/widgets/setting_widgets/setting_item_widget.dart';
import 'package:better_one/view/widgets/setting_widgets/theme_setting_widget.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/theme_viewmodel/theme_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
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
                              : context
                                      .read<ThemeViewModel>()
                                      .state
                                      .isGetThemeLoading
                                  ? const LoadingDataShimmer()
                                  : const ThemeSetting(),
                        );
                      } else if (index == 4) {
                        userLocaleDatabase.getUserIdFromLocale() != null
                            ? showFeedback(context)
                            : showSnackBar(context,
                                message: 'core.login_req'.tr());
                      } else if (index == 5) {
                        userLocaleDatabase.getUserIdFromLocale() != null
                            ? Navigator.pushNamed(
                                context,
                                GenerateRouter.accountSettingScreen,
                              )
                            : Navigator.pushNamed(
                                context, GenerateRouter.login);
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
}
