import 'package:better_one/config/navigation/app_navigation.dart';
import 'package:better_one/config/themes/app_thems.dart';
import 'package:better_one/core/utils/background_service/tasks_background_service.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/cache_service/hive_method/hive_init.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:better_one/view_models/theme_viewmodel/theme_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootApp extends StatefulWidget {
  const RootApp({
    super.key,
  });

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  void initState() {
    reactWithBackgroundService();
    super.initState();
  }

  void reactWithBackgroundService() {
    TasksBackgroundService.serviceStream.listen((event) async {
      await inject<HiveCache>().registerWithNewBox();
      kDebugPrint("download: ${inject<LocaleUserInfo>().isDownloadedTasks()}");
      if (event != null && event == true) {
        inject<TaskViewmodel>().getTasks();
      }
    });

    /// if something go wrong while download tasks
    if (inject<LocaleUserInfo>().getUserData() != null) {
      var download = inject<LocaleUserInfo>().isDownloadedTasks();
      download == null || download == false
          ? TasksBackgroundService.downloadTasks(
              ServicesBinding.rootIsolateToken)
          : null;

      /// if something go wrong while uploading tasks
      var upload = inject<LocaleUserInfo>().isUploadedTasks();
      upload == null || upload == false
          ? TasksBackgroundService.uploadTasks(ServicesBinding.rootIsolateToken)
          : null;
    }
  }

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
              return MaterialApp.router(
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
              );
            },
          );
        },
      ),
    );
  }
}
