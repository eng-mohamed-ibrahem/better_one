import 'package:better_one/config/app_thems.dart';
import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/theme_viewmodel/theme_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootApp extends StatelessWidget {
  const RootApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'lib/l10n/translation',
      saveLocale: true,
      fallbackLocale: const Locale('en'),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (context, child) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeViewmodel(taskRepoInterface: taskRepo)
                ..getTasks()
                ..getTotalEstimatedTime(),
            ),
            BlocProvider(
              create: (context) => QuoteViewmode(quoteRepo: quoteRepo),
            ),
            BlocProvider(
              create: (context) => SettingViewModel(settingsRepo: settingRepo)
                ..getLanguage()
                ..getSearchSettings()
                ..getNotificationSettings(),
            ),
            BlocProvider(
              create: (context) =>
                  ThemeViewModel(settingsRepo: settingRepo)..getTheme(),
            )
          ],
          child: BlocBuilder<ThemeViewModel, ThemeViewModelState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Better One',
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: const TextScaler.linear(1)),
                    child: child!,
                  );
                },
                debugShowCheckedModeBanner: false,
                initialRoute: GenerateRouter.splash,
                onGenerateRoute: GenerateRouter.routeGenerator,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                navigatorObservers: [routeObserver],
                themeMode: state.currentThemeMode,
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
              );
            },
          ),
        ),
      ),
    );
  }
}
