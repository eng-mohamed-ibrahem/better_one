import 'package:better_one/core/utils/notification_service/notification_interface.dart';
import 'package:better_one/core/utils/remote_service/api_consumer/api_consumer.dart';
import 'package:better_one/core/utils/remote_service/api_consumer/dio_consumer.dart';
import 'package:better_one/core/utils/remote_service/supabase_service/supabase_service.dart';
import 'package:better_one/data_source/quote_data_source/quote_source_interface.dart';
import 'package:better_one/data_source/quote_data_source/remote_quote_data_source.dart';
import 'package:better_one/data_source/settings_data_source/local_settings_data_source.dart';
import 'package:better_one/data_source/settings_data_source/settings_source_interface.dart';
import 'package:better_one/data_source/task_data_source/local_task_data_source.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/data_source/user_data_source/hive_locale_user_source.dart';
import 'package:better_one/data_source/user_data_source/supabase_remote_user_source.dart';
import 'package:better_one/repositories/quote_repo/quote_repo.dart';
import 'package:better_one/repositories/quote_repo/quote_repo_interface.dart';
import 'package:better_one/repositories/task_repo/task_repo_impl.dart';
import 'package:better_one/repositories/task_repo/task_repo_interface.dart';
import 'package:better_one/repositories/user_repo/user_repo_impl.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/setting_repo/setting_repo.dart';
import '../../../repositories/setting_repo/settings_repo_interface.dart';
import '../cache_service/cache_service.dart';
import '../notification_service/flutter_local_notification.dart';

GetIt _getIt = GetIt.instance;

Future<void> initDependency() async {
  routeObserver = _getIt.registerSingleton<RouteObserver<ModalRoute>>(
    RouteObserver(),
  );
  await userAccountDependency();
  await notificationDependency();
  await cacheInitDependency();
  taskDependency();
  quoteDependency();
  settingsDependency();
  userDependency();

  /// inject cubits
  // registerCubits();
}

void registerCubits() {
  _getIt.registerSingleton(
    TaskViewmodel(taskRepo: taskRepo, userRepo: kUserRepo),
  );
  _getIt.registerSingleton<SettingViewModel>(
    SettingViewModel(settingsRepo: settingRepo),
  );
}

Future<void> userAccountDependency() async {
  client = _getIt.registerSingleton<SupabaseService>(
    SupabaseService(),
  );
  await _getIt<SupabaseService>().init();
}

void userDependency() {
  userLocaleDatabase = _getIt.registerSingleton<LocaleUserInfo>(
    HiveLocaleUserInfo(
      initHive: _getIt<HiveInit>(),
    ),
  );
  kUserRepo = _getIt.registerSingleton<UserRepoInterface>(
    UserRepoImpl(
      localeUserSource: HiveLocaleUser(),
      remoteUserSource: SupabaseRemoteUser(),
    ),
  );
}

Future<void> cacheInitDependency() async {
  /// init cache service [Hive || SQLite]
  _getIt.registerSingleton<HiveInit>(
    HiveInit(),
  );
  await _getIt<HiveInit>().init();
}

Future<void> notificationDependency() async {
  localNotification = _getIt.registerSingleton<NotificationRepoInterface>(
    FlutterLocalNotification(),
  );
  await localNotification.init();
}

void taskDependency() {
  /// task cache [Hive || SQLite]
  var taskCache = _getIt.registerSingleton<LocaleTaskInterface>(
    HiveLocaleTask(
      initHive: _getIt<HiveInit>(),
    ),
  );

  /// [Task] data source, Options [remote || local]
  taskSource = _getIt.registerSingleton<TaskSource>(
    LocalTaskDataSource(cache: taskCache),
  );

  /// [Task] repository
  taskRepo = _getIt.registerSingleton<TaskRepoInterface>(
    TaskRepoImpl(dataSource: taskSource),
  );
}

void settingsDependency() {
  /// setting cache [Hive || SQLite]
  var settingCache = _getIt.registerSingleton<LocaleSettingsInterface>(
    HiveLocaleSettings(
      initHive: _getIt<HiveInit>(),
    ),
  );

  /// [setting] data source, Options [remote || local]
  settingSource = _getIt.registerSingleton<SettingsSource>(
    LocalSettingsDataSource(
      settingsCache: settingCache,
    ),
  );
  settingRepo = _getIt.registerSingleton<SettingsRepoInterface>(
    SettingRepo(
      settingsSource: settingSource,
    ),
  );
}

void quoteDependency() {
  /// remote method i used in my app [DioConsumer || HttpConsumer]
  apiConsumer = _getIt.registerSingleton<ApiConsumer>(
    DioConsumer(),
  );

  /// [Quote] data source, Options [remote || local]
  quoteSource = _getIt.registerSingleton<QuoteSource>(
    RemoteQuoteDataSource(apiConsumer: apiConsumer),
  );

  /// [Quote] repository
  quoteRepo = _getIt.registerSingleton<QuoteRepoInterface>(
    QuoteRepo(quoteSource: quoteSource),
  );
}

late NotificationRepoInterface localNotification;
late ApiConsumer apiConsumer;
late TaskRepoInterface taskRepo;
late TaskSource taskSource;
late SettingsSource settingSource;
late SettingsRepoInterface settingRepo;
late QuoteSource quoteSource;
late QuoteRepoInterface quoteRepo;
late RouteObserver<ModalRoute> routeObserver;
late LocaleUserInfo userLocaleDatabase;
late SupabaseService client;
late UserRepoInterface kUserRepo;
