import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';

abstract class LocaleSettingsInterface {
  /// toggle theme light or dark
  Future<ResultHandler<String, Failure>> toggleTheme();

  /// get current theme
  Future<ResultHandler<String, Failure>> getTheme();

  /// change language in app
  Future<ResultHandler<String, Failure>> changeLanguage(String languageCode);

  /// get current language
  Future<ResultHandler<String, Failure>> getLanguage();

  // set search settings
  Future<ResultHandler<bool, Failure>> setSearchSettings({
    bool? isSearchByTitle,
    bool? isSearchByBody,
    bool? isSearchByDate,
    bool? isSearchByStatus,
  });

  // get search settings
  Future<ResultHandler<Map<String, bool>, Failure>> getSearchSettings();

  // get notification settings
  Future<ResultHandler<Map<String, dynamic>, Failure>>
      getNotificationSettings();

  // set notification settings
  Future<ResultHandler<bool, Failure>> setNotificationSettings({
    bool? isNotificationOnAdd,
    bool? isNotificationOnUpdate,
    bool? isNotificationOnComplete,
    bool? isNotificationOnReminder,
    int? reminderDateTime,
    bool? repeatReminder,
  });

  // set onborading seen
  Future<ResultHandler<void, Failure>> setOnBoardingSeen(bool seen);

  // get onborading seen
  Future<ResultHandler<bool, Failure>> getOnBoardingSeen();
}
