import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';

abstract class SettingsCacheInterface {
  /// toggle theme light or dark
  Future<ResultHandler<String, CacheFailure>> toggleTheme();

  /// get current theme
  Future<ResultHandler<String, CacheFailure>> getTheme();

  /// change language in app
  Future<ResultHandler<String, CacheFailure>> changeLanguage(
      String languageCode);

  /// get current language
  Future<ResultHandler<String, CacheFailure>> getLanguage();

  // set search settings
  Future<ResultHandler<bool, CacheFailure>> setSearchSettings({
    bool? isSearchByTitle,
    bool? isSearchByBody,
    bool? isSearchByDate,
    bool? isSearchByStatus,
  });

  // get search settings
  Future<ResultHandler<Map<String, bool>, CacheFailure>> getSearchSettings();

  // get notification settings
  Future<ResultHandler<Map<String, dynamic>, CacheFailure>>
      getNotificationSettings();

  // set notification settings
  Future<ResultHandler<bool, CacheFailure>> setNotificationSettings({
    bool? isNotificationOnAdd,
    bool? isNotificationOnUpdate,
    bool? isNotificationOnComplete,
    bool? isNotificationOnReminder,
    int? reminderDateTime,
    bool? repeatReminder,
  });

  // set onborading seen
  Future<ResultHandler<void, CacheFailure>> setOnBoardingSeen(bool seen);

  // get onborading seen
  Future<ResultHandler<bool, CacheFailure>> getOnBoardingSeen();
}
