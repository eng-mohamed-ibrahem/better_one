import 'package:better_one/core/utils/api_consumer/api_consumer.dart';
import 'package:better_one/core/utils/api_consumer/dio_consumer.dart';
import 'package:better_one/core/utils/cache_service/cache_interface.dart';
import 'package:better_one/core/utils/cache_service/hive_cache.dart';
import 'package:better_one/core/utils/notification_service/notification_interface.dart';
import 'package:better_one/data_source/quote_data_source/quote_source_interface.dart';
import 'package:better_one/data_source/quote_data_source/remote_quote_data_source.dart';
import 'package:better_one/data_source/task_data_source/local_task_data_source.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/repositories/quote_repo/quote_interface.dart';
import 'package:better_one/repositories/quote_repo/quote_repo.dart';
import 'package:better_one/repositories/task_repo/task_repo_impl.dart';
import 'package:better_one/repositories/task_repo/task_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../notification_service/flutter_local_notification.dart';

GetIt _getIt = GetIt.instance;

Future<void> initDependency() async {
  /// route observer
  routeObserver = _getIt.registerSingleton<RouteObserver<ModalRoute>>(
    RouteObserver(),
  );

  localNotification = _getIt.registerSingleton<NotificationRepoInterface>(
    FlutterLocalNotification(),
  );
  await localNotification.init();

  /// cache method i used in my app [SharedPreferenceImpl || HiveImpl]
  storageCache = _getIt.registerSingleton<CacheMethodInterface>(
    HiveImpl(),
  );
  await storageCache.init();

  /// [Task] data source, Options [remote || local]
  taskSource = _getIt.registerSingleton<TaskSource>(
    LocalTaskDataSource(storageCache),
  );

  /// remote method i used in my app [DioConsumer || HttpConsumer]
  apiConsumer = _getIt.registerSingleton<ApiConsumer>(
    DioConsumer(),
  );

  /// [Task] repository
  taskRepo = _getIt.registerSingleton<TaskRepoInterface>(
    TaskRepoImpl(taskSource),
  );

  /// [Quote] data source, Options [remote || local]
  quoteSource = _getIt.registerSingleton<QuoteSource>(
    RemoteQuoteDataSource(apiConsumer),
  );

  /// [Quote] repository
  quoteRepo = _getIt.registerSingleton<QuoteInterface>(
    QuoteRepo(quoteSource),
  );
}

late NotificationRepoInterface localNotification;
late CacheMethodInterface storageCache;
late ApiConsumer apiConsumer;
late TaskRepoInterface taskRepo;
late TaskSource taskSource;
late QuoteSource quoteSource;
late QuoteInterface quoteRepo;
late RouteObserver<ModalRoute> routeObserver;
