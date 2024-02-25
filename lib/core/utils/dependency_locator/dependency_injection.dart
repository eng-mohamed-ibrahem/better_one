import 'package:better_one/core/utils/api_consumer/api_consumer.dart';
import 'package:better_one/core/utils/api_consumer/dio_consumer.dart';
import 'package:better_one/core/utils/cache_service/cache_interface.dart';
import 'package:better_one/core/utils/cache_service/hive_cache.dart';
import 'package:better_one/core/utils/notification_service/notification_repo_interface.dart';
import 'package:better_one/data_source/note_data_source/local_note_data_source.dart';
import 'package:better_one/data_source/note_data_source/note_source_interface.dart';
import 'package:better_one/data_source/quote_data_source/quote_source_interface.dart';
import 'package:better_one/data_source/quote_data_source/remote_quote_data_source.dart';
import 'package:better_one/repositories/note_repo/note_repo_impl.dart';
import 'package:better_one/repositories/note_repo/note_repo_interface.dart';
import 'package:better_one/repositories/quote_repo/quote_interface.dart';
import 'package:better_one/repositories/quote_repo/quote_repo.dart';
import 'package:get_it/get_it.dart';

import '../notification_service/flutter_local_notification_repo.dart';

GetIt _getIt = GetIt.instance;

Future<void> initDependency() async {
  localNotification = _getIt.registerSingleton<NotificationRepoInterface>(
    FlutterLocalNotificationRepo(),
  );
  await localNotification.init();

  /// cache method i used in my app [SharedPreferenceImpl || HiveImpl]
  storageCache = _getIt.registerSingleton<CacheMethodInterface>(
    HiveImpl(),
  );
  await storageCache.init();

  /// [Note] data source, Options [remote || local]
  noteSource = _getIt.registerSingleton<NoteSource>(
    LocalNoteDataSource(storageCache),
  );

  /// remote method i used in my app [DioConsumer || HttpConsumer]
  apiConsumer = _getIt.registerSingleton<ApiConsumer>(
    DioConsumer(),
  );

  /// [Note] repository
  noteRepo = _getIt.registerSingleton<NoteRepoInterface>(
    NoteRepoImpl(noteSource),
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
late NoteRepoInterface noteRepo;
late NoteSource noteSource;
late QuoteSource quoteSource;
late QuoteInterface quoteRepo;
