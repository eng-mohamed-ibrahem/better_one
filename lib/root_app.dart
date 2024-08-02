import 'package:better_one/config/navigation/app_navigation.dart';
import 'package:better_one/config/themes/app_thems.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/view_models/theme_viewmodel/theme_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootApp extends StatelessWidget {
  const RootApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ThemeViewModel(settingsRepo: settingRepo)..getTheme(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return BlocBuilder<ThemeViewModel, ThemeViewModelState>(
            builder: (context, state) {
              return BetterFeedback(
                mode: FeedbackMode.navigate,
                localeOverride: context.locale,
                localizationsDelegates: context.localizationDelegates,
                themeMode: state.currentThemeMode,
                theme: FeedbackThemeData(
                  feedbackSheetColor: AppColors.lightPrimaryColor,
                  dragHandleColor: AppColors.primaryColor,
                  bottomSheetDescriptionStyle: const TextStyle(
                    color: AppColors.lightWhite,
                    fontSize: 14,
                  ),
                  bottomSheetTextInputStyle: const TextStyle(
                    color: AppColors.lightWhite,
                    fontSize: 16,
                  ),
                ),
                darkTheme: FeedbackThemeData(
                  dragHandleColor: AppColors.lightPrimaryColor,
                  feedbackSheetColor: AppColors.primaryColor,
                  bottomSheetDescriptionStyle: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                  bottomSheetTextInputStyle: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
                child: MaterialApp.router(
                  routerConfig: AppNavigation.config,
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: const TextScaler.linear(1)),
                      child: child!,
                    );
                  },
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  themeMode: state.currentThemeMode,
                  theme: AppThemes.lightTheme,
                  darkTheme: AppThemes.darkTheme,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
